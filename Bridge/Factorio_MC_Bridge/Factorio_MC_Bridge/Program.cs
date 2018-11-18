using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Xml;
using System.IO;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using System.Net;
using CoreRCON;
using CoreRCON.Parsers.Standard;
using Newtonsoft.Json;

namespace Factorio_MC_Bridge
{
	class Program
	{
		static void Main(string[] args)
		{
            /*
                I'm really not sure whether the servers close properly when the bridge closes,
                so these lines are here to make sure nothing weird happens.
            */ 
            String Previous_Factorio_Server_PID = File.ReadAllText("Factorio_Server_PID.txt");
            String Previous_Minecraft_Server_PID = File.ReadAllText("Minecraft_Server_PID.txt");
            if (Previous_Factorio_Server_PID != "")
            {
                KillPreviousServer(Int32.Parse(Previous_Factorio_Server_PID));
                File.WriteAllText("Factorio_Server_PID.txt", string.Empty);
            }
            if (Previous_Minecraft_Server_PID != "")
            {
                KillPreviousServer(Int32.Parse(Previous_Minecraft_Server_PID));
                File.WriteAllText("Minecraft_Server_PID.txt", string.Empty);
            }

            /*
				Input and checking for settings file.
				This should probably not immedantly check but prompt the user with the current settings and if they would like to change them
			*/
            Console.ForegroundColor = ConsoleColor.Cyan;
            BridgeConsoleWriteLine("Starting Up!");
			BridgeConsoleWriteLine("To change settings, enter 1, otherwise press any key other to continue.");
			string choice = Console.ReadLine();
			Settings settings = new Settings();
			string startupDoc = Path.Combine(Environment.CurrentDirectory, "settings.json");
            //if (!File.Exists(startupDoc))
            if (!File.Exists(startupDoc) || choice.Equals("1"))
            {
                FileStream fs = new FileStream(startupDoc, FileMode.OpenOrCreate, FileAccess.Write, FileShare.ReadWrite);
				StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                BridgeConsoleWriteLine("Please enter the item mappings file name (default \"item_mappings.txt\"");
                settings.setItemMappingsFile(Console.ReadLine());
                BridgeConsoleWriteLine("Please enter Minecraft Type (0=Forge,1=Vanilla 18w46a): ");
                settings.setMcType(Int32.Parse(Console.ReadLine()));
                BridgeConsoleWriteLine("Use experimental IO? (true/false): ");
                settings.setExperimentalIO(bool.Parse(Console.ReadLine()));
                BridgeConsoleWriteLine("Please enter Minecraft Location (Root of the Directory): ");
				settings.setMcPath(Console.ReadLine());
                BridgeConsoleWriteLine("Please enter the IP Address of the Minecraft Server (only necessary for vanilla): ");
                settings.setMcIpAddress(Console.ReadLine());
                BridgeConsoleWriteLine("Please enter Minecraft RCON Port Number (only necessary for vanilla): ");
                settings.setMcPort(Int32.Parse(Console.ReadLine()));
                BridgeConsoleWriteLine("Please enter Minecraft RCON password (only necessary for vanilla): ");
                settings.setMcRconPass(Console.ReadLine());
                BridgeConsoleWriteLine("Please enter Factorio Server Path (Root of the Directory): ");
				settings.setFacotrioPath(Console.ReadLine());
				BridgeConsoleWriteLine("Please enter the IP Address of the Factorio Server: ");
				settings.setFactorioIpAddress(Console.ReadLine());
				BridgeConsoleWriteLine("Please enter Factorio RCON Port Number: ");
				settings.setFactorioPort(Int32.Parse(Console.ReadLine()));
				BridgeConsoleWriteLine("Please enter Factorio RCON password: ");
				settings.setFactorioRconPass(Console.ReadLine());
				string output = JsonConvert.SerializeObject(settings);
				sw.WriteLine(output);
				sw.Close();
			}
			else
			{
				FileStream fs = new FileStream(startupDoc, FileMode.OpenOrCreate, FileAccess.Read, FileShare.ReadWrite);
				StreamReader sr = new StreamReader(fs, Encoding.Default);
				string input = "";
				while (!sr.EndOfStream) {
					input += sr.ReadLine();
				}
				settings = JsonConvert.DeserializeObject<Settings>(input);
			}

			/*
				Load in the item mappings file.  
			*/
			DualDictionary<String, String> itemMappings = new DualDictionary<String, String>();
			Dictionary<String, double> minecraftRatios = new Dictionary<String, double>();
			Dictionary<String, double> factorioRatios = new Dictionary<String, double>();

			//Open up the file stream for the item mappings
			string itemMappingsPath = Path.Combine(Environment.CurrentDirectory, settings.getItemMappingsFile());
			FileStream fileStream = new FileStream(itemMappingsPath, FileMode.OpenOrCreate, FileAccess.Read, FileShare.Read);
			StreamReader streamReader = new StreamReader(fileStream, Encoding.Default);

			//This loops needs to do a couple of things. 
			//The first is it needs to read in the mappings into the DualDictionary for better translation of names.
			//The second it needs to bind the item ratios to their respective lists.
			while (!streamReader.EndOfStream) {
				//Item Name Mappings first
				String readString = streamReader.ReadLine();
				if (readString.Contains("#") || readString.Equals("") || readString.Equals("\n")) {
					continue;
				}
				String[] split = readString.Split('=');
				itemMappings.Add(split[0], split[1]);
				//Split the string again to get the ratios
				if (split.Length > 2) {
					String[] ratios = split[2].Split(':');
					minecraftRatios.Add(split[0], Double.Parse(ratios[0]));
					factorioRatios.Add(split[1], Double.Parse(ratios[1]));
				}
			}
			streamReader.Close();
			fileStream.Close();
			
			/*
				Open RCON Connection to factorio server
				Parse the files and send the data to the approiate game.
			*/
			//var rcon = new RCON(IPAddress.Parse(settings.getFactorioIPAddress()), (ushort)settings.getFactorioPort(), settings.getFactorioRconPass() );
            if (settings.getMcType() == 0)
            {
                BridgeConsoleWriteLine("Found settings. Beginning transfer.");
                var rcon = new RCON(IPAddress.Parse(settings.getFactorioIPAddress()), (ushort)settings.getFactorioPort(), settings.getFactorioRconPass());
                while (true)
                {
                    try
                    {
                        List<ItemPair> factorioItems = parseFactorio(settings, itemMappings, factorioRatios);
                        List<ItemPair> minecraftItems = parseMinecraft(settings, itemMappings, minecraftRatios);
                        sendToFactorioRCON(minecraftItems, rcon);
                        sendToMinecraft(factorioItems, settings);
                        Thread.Sleep(1000);
                    }
                    catch (Exception e)
                    {
                        BridgeConsoleWriteLine("Something went wrong. Moving past error.");
                        BridgeConsoleWriteLine(e.Message);
                        continue;
                    }
                }
            }
            else
            {
                if (settings.getExperimentalIO() == true)
                {
                    BridgeConsoleWriteLine("Found settings.");
                    BridgeConsoleWriteLine("Starting Factorio server...");
                    Process FactorioServer = new Process();
                    /*
                        These two lines are the parameters for the Factorio server
                    */
                    FactorioServer.StartInfo.FileName = "F:\\SteamLibrary\\steamapps\\common\\Factorio\\bin\\x64\\factorio.exe";
                    FactorioServer.StartInfo.Arguments = "--start-server C:\\Users\\zero318\\AppData\\Roaming\\Factorio\\saves\\Minecraft_Bridge_Tests\\Minecraft_Bridge_Test_1 --bind 127.0.0.1:30000 --rcon-port 25525 --rcon-password test --no-log-rotation";
                    FactorioServer.StartInfo.CreateNoWindow = false;
                    FactorioServer.StartInfo.WorkingDirectory = "C:\\Users\\zero318\\My Minecraft\\Local Server";
                    FactorioServer.StartInfo.ErrorDialog = false;
                    FactorioServer.StartInfo.UseShellExecute = false;
                    FactorioServer.StartInfo.RedirectStandardError = true;
                    FactorioServer.StartInfo.RedirectStandardOutput = true;
                    FactorioServer.StartInfo.RedirectStandardInput = true;
                    String FactorioServerLog = "";
                    FactorioServer.OutputDataReceived += new DataReceivedEventHandler
                    (
                        (sender, args2) =>
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("[Factorio Server] "+args2.Data);
                            FactorioServerLog = args2.Data;
                        }
                    );
                    FactorioServer.ErrorDataReceived += new DataReceivedEventHandler
                    (
                        (sender, args2) =>
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("[Factorio Server] "+args2.Data);
                            FactorioServerLog = args2.Data;
                        }
                    );
                    FactorioServer.Start();
                    StreamWriter FactorioInputWriter = FactorioServer.StandardInput;
                    FactorioServer.BeginOutputReadLine();
                    FactorioServer.BeginErrorReadLine();
                    File.WriteAllText("Factorio_Server_PID.txt", FactorioServer.Id.ToString());
                    bool FactorioServerLoading = true;
                    while (FactorioServerLoading)
                    {
                        if (FactorioServerLog.Contains("Starting RCON interface at port " + settings.getFactorioPort()))
                        {
                            FactorioServerLoading = false;
                        }
                    }
                    var rcon = new RCON(IPAddress.Parse(settings.getFactorioIPAddress()), (ushort)settings.getFactorioPort(), settings.getFactorioRconPass());
                    BridgeConsoleWriteLine("Factorio server loaded!");

                    BridgeConsoleWriteLine("Starting Minecraft server...");
                    Process MinecraftServer = new Process();
                    /*
                        These two lines are the parameters for the Minecraft server
                    */
                    MinecraftServer.StartInfo.FileName = "java";
                    MinecraftServer.StartInfo.Arguments = "-d64 -server -XX:+UseConcMarkSweepGC -XX:+DisableExplicitGC -XX:+UseAdaptiveGCBoundary -XX:MaxGCPauseMillis=500 -XX:-UseGCOverheadLimit -XX:SurvivorRatio=12 -XX:NewRatio=4 -Xnoclassgc -XX:UseSSE=3 -Xmx2G -Xms1G -jar \"C:\\Users\\zero318\\My Minecraft\\Local Server\\minecraft_server.18w46a.jar\" nogui";
                    MinecraftServer.StartInfo.CreateNoWindow = false;
                    MinecraftServer.StartInfo.WorkingDirectory = "C:\\Users\\zero318\\My Minecraft\\Local Server";
                    MinecraftServer.StartInfo.ErrorDialog = false;
                    MinecraftServer.StartInfo.UseShellExecute = false;
                    MinecraftServer.StartInfo.RedirectStandardError = true;
                    MinecraftServer.StartInfo.RedirectStandardOutput = true;
                    MinecraftServer.StartInfo.RedirectStandardInput = true;
                    String MinecraftServerLog = "";
                    MinecraftServer.OutputDataReceived += new DataReceivedEventHandler
                    (
                        (sender, args2) =>
                        {
                            Console.ForegroundColor = ConsoleColor.Green;
                            Console.WriteLine("[Minecraft Server] "+args2.Data);
                            MinecraftServerLog = args2.Data;
                        }
                    );
                    MinecraftServer.ErrorDataReceived += new DataReceivedEventHandler
                    (
                        (sender, args2) =>
                        {
                            Console.ForegroundColor = ConsoleColor.Green;
                            Console.WriteLine("[Minecraft Server] "+args2.Data);
                            MinecraftServerLog = args2.Data;
                        }
                    );
                    MinecraftServer.Start();
                    //MinecraftServer.EnableRaisingEvents = true;
                    StreamWriter MinecraftInputWriter = MinecraftServer.StandardInput;
                    MinecraftServer.BeginOutputReadLine();
                    MinecraftServer.BeginErrorReadLine();
                    File.WriteAllText("Minecraft_Server_PID.txt", MinecraftServer.Id.ToString());
                    bool MinecraftServerLoading = true;
                    while (MinecraftServerLoading)
                    {
                        if (MinecraftServerLog.Contains("RCON running on " + settings.getMcIPAddress() + ":" + settings.getMcPort()))
                        {
                            MinecraftServerLoading = false;
                        }
                    }
                    var rcon2 = new RCON(IPAddress.Parse(settings.getMcIPAddress()), (ushort)settings.getMcPort(), settings.getMcRconPass());
                    BridgeConsoleWriteLine("Minecraft server loaded!");
                    BridgeConsoleWriteLine("Beginning transfer.");
                    while (true)
                    {
                        try
                        {
                            List<ItemPair> factorioItems = parseFactorio(settings, itemMappings, factorioRatios);
                            List<ItemPair> minecraftItems = parseVanillaMinecraft(settings, itemMappings, minecraftRatios, rcon2).Result;
                            sendToFactorioExperimentalIO(minecraftItems, FactorioInputWriter);
                            sendToVanillaExperimentalIO(factorioItems, settings, MinecraftInputWriter);
                            Thread.Sleep(1000);
                        }
                        catch (Exception e)
                        {
                            BridgeConsoleWriteLine(e.InnerException.ToString());
                            BridgeConsoleWriteLine("Something went wrong. Moving past error.");
                            BridgeConsoleWriteLine(e.Message);
                            continue;
                        }
                    }
                }
                else
                {
                    BridgeConsoleWriteLine("Found settings. Beginning transfer.");
                    var rcon = new RCON(IPAddress.Parse(settings.getFactorioIPAddress()), (ushort)settings.getFactorioPort(), settings.getFactorioRconPass());
                    var rcon2 = new RCON(IPAddress.Parse(settings.getMcIPAddress()), (ushort)settings.getMcPort(), settings.getMcRconPass());
                    while (true)
                    {
                        try
                        {
                            List<ItemPair> factorioItems = parseFactorio(settings, itemMappings, factorioRatios);
                            List<ItemPair> minecraftItems = parseVanillaMinecraft(settings, itemMappings, minecraftRatios, rcon2).Result;
                            sendToFactorioRCON(minecraftItems, rcon);
                            sendToVanillaRCON(factorioItems, settings, rcon2);
                            Thread.Sleep(1000);
                        }
                        catch (Exception e)
                        {
                            BridgeConsoleWriteLine(e.InnerException.ToString());
                            BridgeConsoleWriteLine("Something went wrong. Moving past error.");
                            BridgeConsoleWriteLine(e.Message);
                            continue;
                        }
                    }
                }
            }
		}

        public static void KillPreviousServer(int ProcessID)
        {
            try
            {
                Process Server_Process = Process.GetProcessById(ProcessID);
                Server_Process.Kill();
            }
            catch (Exception e)
            {

            }
        }

        /// FACTORIO
        /// Reading and parsing for factorio 
        /// FACTORIO
        public static async void sendToFactorioRCON(List<ItemPair> items, RCON rcon) {
			if (items.Count > 0) {
				for (int i = 0; i < items.Count; i++) {
					StringBuilder str = new StringBuilder();
					String cmd = "";
					if (items[i].count > 100) {
						while (items[i].count > 100) {
							str.Append(@"/silent-command remote.call(""receiveItems"",""inputItems"",");
							str.Append(@"""");
							str.Append(items[i].name);
							str.Append(@""",");
							str.Append(100);
							str.Append(")");
							cmd = await rcon.SendCommandAsync(str.ToString());
							items[i].count -= 100;
							str.Clear();
						}
					}
					str.Append(@"/silent-command remote.call(""receiveItems"",""inputItems"",");
					str.Append(@"""");
					str.Append(items[i].name);
					str.Append(@""",");
					str.Append(items[i].count.ToString());
					str.Append(")");
					cmd = await rcon.SendCommandAsync(str.ToString());
					str.Clear();
				}
			}
		}

        public static void sendToFactorioExperimentalIO(List<ItemPair> items, StreamWriter FactorioInput)
        {
            if (items.Count > 0)
            {
                for (int i = 0; i < items.Count; i++)
                {
                    StringBuilder str = new StringBuilder();
                    //String cmd = "";
                    if (items[i].count > 100)
                    {
                        while (items[i].count > 100)
                        {
                            str.Append(@"/silent-command remote.call(""receiveItems"",""inputItems"",");
                            str.Append(@"""");
                            str.Append(items[i].name);
                            str.Append(@""",");
                            str.Append(100);
                            str.Append(")");
                            FactorioInput.WriteLine(str.ToString());
                            //cmd = await rcon.SendCommandAsync(str.ToString());
                            items[i].count -= 100;
                            str.Clear();
                        }
                    }
                    str.Append(@"/silent-command remote.call(""receiveItems"",""inputItems"",");
                    str.Append(@"""");
                    str.Append(items[i].name);
                    str.Append(@""",");
                    str.Append(items[i].count.ToString());
                    str.Append(")");
                    FactorioInput.WriteLine(str.ToString());
                    //cmd = await rcon.SendCommandAsync(str.ToString());
                    str.Clear();
                }
            }
        }

        public static void BridgeConsoleWriteLine(String Line)
        {
            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine("[Bridge] "+Line);
        }

		public static List<ItemPair> parseFactorio(Settings settings, DualDictionary<String, String> mappings, Dictionary<String, double> ratios)
		{
			List<ItemPair> items = new List<ItemPair>();
			String fullPath = Path.Combine(settings.getFactorioPath(), "script-output\\toMC.dat");
			FileStream fs = new FileStream(fullPath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
			StreamReader sr = new StreamReader(fs, Encoding.Default);
			while (!sr.EndOfStream){
				string proc = sr.ReadLine();
				string[] temp = proc.Split(':');
				int count = 0;
				if (ratios.Count > 0) {
					double readNum = Double.Parse(temp[1]) * ratios[temp[0]]; ;
					count = (int)Math.Round(readNum, MidpointRounding.AwayFromZero);
				}
				else {
					count = (int)Double.Parse(temp[1]);
				}
				int containsTest = pairContains(items, temp[0]);

				if (containsTest != -1){
					if (items[containsTest].count < 64) {
						int remainder = 64 - items[containsTest].count;
						if (remainder > 0) {
							items[containsTest].count += remainder;
							count -= remainder;
						}
					}
					if ((64 - count) < 0) {
						items.Add(new ItemPair(temp[0], 64));
						int remain = Math.Abs(64 - count);
						while (remain > 0) {
							if (remain > 64) {
								items.Add(new ItemPair(temp[0], 64));
								remain -= 64;
							}
							else {
								items.Add(new ItemPair(temp[0], remain));
								remain -= 64;
							}
						}
					}
					else {
						items.Add(new ItemPair(temp[0], Int32.Parse(temp[1])));
					}
				}
				else
				{
					if ((64 - count) < 0) {
						items.Add(new ItemPair(temp[0], 64));
						int remain = Math.Abs(64 - count);
						while (remain > 0) {
							if (remain > 64) {
								items.Add(new ItemPair(temp[0], 64));
								remain -= 64;
							}
							else {
								items.Add(new ItemPair(temp[0], remain));
								remain -= 64;
							}
						}
					}
					else {
						items.Add(new ItemPair(temp[0], Int32.Parse(temp[1])));
					}
					//items.Add(new ItemPair(temp[0], Int32.Parse(temp[1])));
				}
				StreamWriter sw = new StreamWriter(fs);
				sw.WriteLine("");
			}


			//Remap Items to the opposing item
			for (int i = 0; i < items.Count; i++)
			{
				items[i].name = mappings.facotrio[items[i].name];
			}
			return items;
		}

        /// MINECRAFT
        /// Reading and Parsing for minecraft 
        /// MINECRAFT

        public static List<ItemPair> parseMinecraft(Settings settings, DualDictionary<String, String> mappings, Dictionary<String, double> ratios)
        {
            List<ItemPair> items = new List<ItemPair>();
            String fullPath = Path.Combine(settings.getMcPath(), "toFactorio.dat");
            while (true)
            {
                try
                {
                    using (FileStream Fs = new FileStream(fullPath, FileMode.Open, FileAccess.ReadWrite, FileShare.None, 100))
                    {
                        break;
                    }
                }
                catch (IOException)
                {
                    Thread.Sleep(100);
                }
            }
            FileStream fs = new FileStream(fullPath, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
            StreamReader sr = new StreamReader(fs, Encoding.Default);
            while (!sr.EndOfStream)
            {
                string proc = sr.ReadLine();
                string[] temp = proc.Split('~');
                int count = 0;
                if (ratios.Count > 0)
                {
                    double readNum = Double.Parse(temp[1]) * ratios[temp[0]]; ;
                    count = (int)Math.Round(readNum, MidpointRounding.AwayFromZero);
                }
                else
                {
                    count = (int)Double.Parse(temp[1]);
                }
                items.Add(new ItemPair(temp[0], count));
            }
            sr.Close();
            File.WriteAllText(fullPath, string.Empty);

            //Remap Items to the opposing item
            for (int i = 0; i < items.Count; i++)
            {
                try
                {
                    items[i].name = mappings.minecraft[items[i].name];
                }
                catch (Exception e)
                {
                    BridgeConsoleWriteLine(e.InnerException.ToString());
                    BridgeConsoleWriteLine("Something went wrong. Moving past error.");
                    BridgeConsoleWriteLine(e.Message);
                    continue;
                }
            }
            return items;
        }

        public static async System.Threading.Tasks.Task<List<ItemPair>> parseVanillaMinecraft(Settings settings, DualDictionary<String,String> mappings, Dictionary<String, double> ratios, RCON rcon)
		{
            String RCON_Output = await rcon.SendCommandAsync("execute as @e[tag=SendChest] at @s store result entity @s ArmorItems[3].tag.ClearItems int 1 run data get block ~ ~ ~ Items");
            ///
            ///This section of regex is mostly trial and error.
            ///It seems to break if too much is thrown at it at once however.
            ///
            String toFactorioString = "";
            if (RCON_Output != "")
            {
                var regex = new Regex(@"^.*?(?<=has the following block data: \[)|(?=\]-?[0-9]*, -?[0-9]*, -?[0-9]* has the following block data: \[).*?(?<=has the following block data: \[)|\]$", RegexOptions.Compiled);
                var regex2 = new Regex(@"{([^{}]+|(?<Level>{)|(?<-Level>}))+(?(Level)(?!))}", RegexOptions.Compiled);
                //var regex3 = new Regex(@",(?![^[]]*\))",RegexOptions.Compiled); <-- This regex wouldn't cooperate
                String[] SplitOutput = regex.Split(RCON_Output);
                String[][][] ParsedOutput = new String[SplitOutput.Length - 2][][];
                for (int i = 0; i < (SplitOutput.Length - 2); i++)
                {
                    String MatchString = SplitOutput[i + 1];
                    MatchCollection MatchOutput2 = regex2.Matches(MatchString);
                    ParsedOutput[i] = new String[MatchOutput2.Count][];
                    for (int j = 0; j < MatchOutput2.Count; j++)
                    {
                        String MatchString3 = MatchOutput2[j].ToString();
                        String[] SplitOutput3 = MatchString3.Split(new[] { ',' }, 4);
                        //String[] SplitOutput3 = regex3.Split(MatchString3.Substring(1,MatchString3.Length-2));
                        ParsedOutput[i][j] = new String[SplitOutput3.Length];
                        for (int k = 0; k < (SplitOutput3.Length); k++)
                        {
                            ParsedOutput[i][j][k] = SplitOutput3[k].Trim();
                        }
                    }
                }
                StringBuilder str = new StringBuilder();
                for (int i = 0; i < ParsedOutput.Length; i++)
                {
                    for (int j = 0; j < ParsedOutput[i].Length; j++)
                    {
                        if (ParsedOutput[i][j].Length == 3)
                        {
                            str.Append(ParsedOutput[i][j][1].Remove(0, 5).TrimEnd('"') + "~" + ParsedOutput[i][j][2].Remove(0, 7).TrimEnd('}').TrimEnd('b'));
                        }
                        else
                        {
                            str.Append(ParsedOutput[i][j][1].Remove(0, 5).TrimEnd('"') + ParsedOutput[i][j][3].Remove(ParsedOutput[i][j][3].Length - 1, 1).Remove(0, 5) + "~" + ParsedOutput[i][j][2].Remove(0, 7).TrimEnd('b'));
                        }
                        str.AppendLine();
                    }
                }
                toFactorioString = str.ToString().TrimEnd(Environment.NewLine.ToCharArray());
            }
            List<ItemPair> items = new List<ItemPair>();
            String[] temp7 = toFactorioString.Split(Environment.NewLine.ToCharArray());
            foreach (String stringy3 in temp7)
            {
                if (string.IsNullOrWhiteSpace(stringy3) == false)
                {
                    string[] temp = stringy3.Split('~');
                    int count = 0;
                    if (ratios.Count > 0)
                    {
                        double readNum = Double.Parse(temp[1]) * ratios[temp[0]]; ;
                        count = (int)Math.Round(readNum, MidpointRounding.AwayFromZero);
                    }
                    else
                    {
                        count = (int)Double.Parse(temp[1]);
                    }
                    items.Add(new ItemPair(temp[0], count));
                }
            }

			//Remap Items to the opposing item
			for (int i = 0; i < items.Count; i++) {
                try
                {
                    items[i].name = mappings.minecraft[items[i].name];
                }
				catch (Exception e)
                {
                    BridgeConsoleWriteLine(e.InnerException.ToString());
                    BridgeConsoleWriteLine("Something went wrong. Moving past error.");
                    BridgeConsoleWriteLine(e.Message);
                    continue;
                }
			}
			return items;
		}

        public static void sendToMinecraft(List<ItemPair> items, Settings settings)
        {
            String fullPath = Path.Combine(settings.getMcPath(), "fromFactorio.dat");

            while (true)
            {
                try
                {
                    using (FileStream Fs = new FileStream(fullPath, FileMode.Open, FileAccess.ReadWrite, FileShare.None, 100))
                    {
                        break;
                    }
                }
                catch (IOException)
                {
                    Thread.Sleep(100);
                }
            }
            StreamWriter sw = new StreamWriter(fullPath, true);
            for (int i = 0; i < items.Count; i++)
            {
                String itemToSend = items[i].name + "~" + items[i].count;
                sw.WriteLine(itemToSend);
            }
            sw.Close();
        }

        public static String[] sendToVanillaMinecraft(List<ItemPair> items, Settings settings, int MaxBoxSize) //, StreamWriter MinecraftInput)
        {
            //String RCON_Output = await rcon.SendCommandAsync("execute as @e[tag=ReceiveChest] at @s store result entity @s ArmorItems[3].tag.ClearItems int 1 run data get block ~ ~ ~ Items");
            /////
            /////This section of regex is mostly trial and error.
            /////It seems to break if too much is thrown at it at once however.
            /////
            //var regex = new Regex(@"^.*?(?<=has the following block data: \[)|(?=\]-?[0-9]*, -?[0-9]*, -?[0-9]* has the following block data: \[).*?(?<=has the following block data: \[)|\]$", RegexOptions.Compiled);
            //var regex2 = new Regex(@"{([^{}]+|(?<Level>{)|(?<-Level>}))+(?(Level)(?!))}", RegexOptions.Compiled);
            //var regex3 = new Regex(@",(?![^[]]*\))", RegexOptions.Compiled);
            //String[] SplitOutput = regex.Split(RCON_Output);
            //String[][][] ParsedOutput = new String[SplitOutput.Length - 2][][];
            //for (int i = 0; i < (SplitOutput.Length - 2); i++)
            //{
            //    String MatchString = SplitOutput[i + 1];
            //    MatchCollection MatchOutput2 = regex2.Matches(MatchString);
            //    ParsedOutput[i] = new String[MatchOutput2.Count][];
            //    for (int j = 0; j < MatchOutput2.Count; j++)
            //    {
            //        String MatchString3 = MatchOutput2[j].ToString();
            //        String[] SplitOutput3 = regex3.Split(MatchString3.Substring(1, MatchString3.Length - 2));
            //        ParsedOutput[i][j] = new String[SplitOutput3.Length];
            //        for (int k = 0; k < (SplitOutput3.Length); k++)
            //        {
            //            ParsedOutput[i][j][k] = SplitOutput3[k].Trim();
            //        }
            //    }
            //}
            String[][] InputItems = new String[items.Count][];
            String[] TempSplit = { "" };
            Char[] Splitter = { '{' };
            for (int i = 0; i < InputItems.Length; i++)
            {
                TempSplit = items[i].name.Split(Splitter, 2);
                InputItems[i] = new String[3];
                InputItems[i][0] = TempSplit[0];
                try
                {
                    InputItems[i][1] = TempSplit[1];
                }
                catch (Exception)
                {
                    InputItems[i][1] = "";
                }
                InputItems[i][2] = items[i].count.ToString();
            }
            /*
                This section will break if more than 27 items are given at once since that maxes out a shulker box.
                I'll get around to fixing that soon.
                UPDATE: Added code to support multiple chests, but it still doesn't work for some reason.
                UPDATE2: Turns out it isn't exactly a problem with my code. It's actually trying to shove too much crap through RCON at once, thus giving it a heart attack.
                UPDATE3: I've attempted to redirect the IO of this program directly to the Minecraft server instead of using RCON. Idk how well that will work though.
            */
            int ShulkerBoxSize = MaxBoxSize; //I wish this didn't have to be here, but I don't have any better ideas for how to avoid choking RCON.
            int ShulkerBoxCount = ((InputItems.Length - 1) / ShulkerBoxSize);
            int ShulkerBoxOverflow = (InputItems.Length % ShulkerBoxSize);
            String[][] ItemStrings = new String[(ShulkerBoxCount + 1)][];
            if (ShulkerBoxOverflow != 0)
            {
                for (int i = 0; i < (ItemStrings.Length - 1); i++)
                {
                    ItemStrings[i] = new String[ShulkerBoxSize];
                }
                ItemStrings[(ItemStrings.Length - 1)] = new String[ShulkerBoxOverflow];
            }
            else
            {
                for (int i = 0; i < ItemStrings.Length; i++)
                {
                    ItemStrings[i] = new String[ShulkerBoxSize];
                }
            }
            int ItemIndex = 0;
            String[] ShulkerBoxStrings = new String[ItemStrings.Length];
            for (int i = 0; i < ItemStrings.Length; i++)
            {
                ShulkerBoxStrings[i] = "[";
                for (int j = 0; j < ItemStrings[i].Length; j++)
                {
                    ItemIndex = ((ShulkerBoxSize * i) + j);
                    if (InputItems[ItemIndex][1] != "")
                    {
                        ItemStrings[i][j] = "{Slot:" + j + "b,id:\"" + InputItems[ItemIndex][0] + "\",Count:" + InputItems[ItemIndex][2] + "b,tag:{" + InputItems[ItemIndex][1] + "}";
                    }
                    else
                    {
                        ItemStrings[i][j] = "{Slot:" + j + "b,id:\"" + InputItems[ItemIndex][0] + "\",Count:" + InputItems[ItemIndex][2] + "b}";
                    }
                    ShulkerBoxStrings[i] += ItemStrings[i][j];
                    if (j != (ItemStrings[i].Length - 1))
                    {
                        ShulkerBoxStrings[i] += ",";
                    }
                }
                ShulkerBoxStrings[i] += "]";
            }
            //String Command = "";
            //String RCON_Output2 = "";
            //for (int i = 0; i < ShulkerBoxStrings.Length; i++)
            //{
            //RCON_Output2 = await rcon.SendCommandAsync("execute as @e[tag=ReceiveChest,tag=!ReceiveFull,limit=1,sort=arbitrary,nbt={ArmorItems:[{tag:{CollectItems:0}}]}] run say hi");
            //Command = "execute as @e[tag=ReceiveChest,tag=!ReceiveFull,limit=1,sort=arbitrary,nbt={ArmorItems:[{tag:{CollectItems:0}}]}] store result entity @s ArmorItems[3].tag.CollectItems int 1 at @s run setblock ~ 0 ~ minecraft:shulker_box{Items:"+ShulkerBoxStrings[i]+"}";
            //Command = "/execute as @p run say Test";
            //MinecraftInput.WriteLine(Command);
            //Command = "execute as @e[tag=ReceiveChest,tag=!ReceiveFull,limit=1,sort=arbitrary,nbt={ArmorItems:[{tag:{CollectItems:0}}]}] store result entity @s ArmorItems[3].tag.CollectItems int 1 at @s run setblock ~ 0 ~ minecraft:shulker_box{Items:" + ShulkerBoxStrings[i] + "}";
            //RCON_Output2 = WindowHook.SendCommand(Command).ToString();
            //Process
            //RCON_Output2 = await rcon.SendCommandAsync(Command);
            //Console.WriteLine(Command);
            //}
            return ShulkerBoxStrings;
        }
        public static void sendToVanillaExperimentalIO(List<ItemPair> items, Settings settings, StreamWriter MinecraftInput)
        {
            if (items.Count > 0)
            {
                String[] StringsToSend = sendToVanillaMinecraft(items, settings, 27);
                String Command = "";
                for (int i = 0; i < StringsToSend.Length; i++)
                {
                    Command = "execute as @e[tag=ReceiveChest,tag=!ReceiveFull,limit=1,sort=arbitrary,nbt={ArmorItems:[{tag:{CollectItems:0}}]}] store result entity @s ArmorItems[3].tag.CollectItems int 1 at @s run setblock ~ 0 ~ minecraft:shulker_box{Items:" + StringsToSend[i] + "}";
                    MinecraftInput.WriteLine(Command);
                }
            }
        }
        public static async void sendToVanillaRCON(List<ItemPair> items, Settings settings, RCON rcon)
        {
            if (items.Count > 0)
            {
                String[] StringsToSend = sendToVanillaMinecraft(items, settings, 9);
                String Command = "";
                for (int i = 0; i < StringsToSend.Length; i++)
                {
                    Command = "execute as @e[tag=ReceiveChest,tag=!ReceiveFull,limit=1,sort=arbitrary,nbt={ArmorItems:[{tag:{CollectItems:0}}]}] store result entity @s ArmorItems[3].tag.CollectItems int 1 at @s run setblock ~ 0 ~ minecraft:shulker_box{Items:" + StringsToSend[i] + "}";
                    await rcon.SendCommandAsync(Command);
                }
            }
        }

		/// 
		/// The Pair Contains function used for parsing
		/// 
		public static int pairContains(List<ItemPair> list, string itemName) {
			for (int i = 0; i < list.Count(); i++) {
				if (list[i].name.Equals(itemName)) {
					return i;
				}
			}
			return -1;
		}
	}
}


