using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Xml;
using System.IO;
using System.ComponentModel;
using System.Diagnostics;
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
				Input and checking for settings file.
				This should probably not immedantly check but prompt the user with the current settings and if they would like to change them
			*/
			Console.WriteLine("Starting Up!");
			Console.WriteLine("To change settings, enter 1, otherwise press any key other to continue.");
			string choice = Console.ReadLine();
			Settings settings = new Settings();
			string startupDoc = Path.Combine(Environment.CurrentDirectory, "settings.json");
			if (!File.Exists(startupDoc) || choice.Equals("1"))
			{
				FileStream fs = new FileStream(startupDoc, FileMode.OpenOrCreate, FileAccess.Write, FileShare.ReadWrite);
				StreamWriter sw = new StreamWriter(fs, Encoding.Default);
                Console.WriteLine("Please enter Minecraft Type (0=Forge,1=Vanilla 18w45a) ");
                settings.setMcPath(Console.ReadLine());
                Console.WriteLine("Please enter Minecraft Location (Root of the Directory): ");
				settings.setMcPath(Console.ReadLine());
                Console.WriteLine("Please enter the IP Address of the Minecraft Server (only necessary for vanilla): ");
                settings.setMcIpAddress(Console.ReadLine());
                Console.WriteLine("Please enter Minecraft RCON Port Number (only necessary for vanilla): ");
                settings.setMcPort(Int32.Parse(Console.ReadLine()));
                Console.WriteLine("Please enter Minecraft RCON password (only necessary for vanilla): ");
                settings.setMcRconPass(Console.ReadLine());
                Console.WriteLine("Please enter Factorio Server Path (Root of the Directory): ");
				settings.setFacotrioPath(Console.ReadLine());
				Console.WriteLine("Please enter the IP Address of the Factorio Server: ");
				settings.setFactorioIpAddress(Console.ReadLine());
				Console.WriteLine("Please enter Factorio RCON Port Number: ");
				settings.setFactorioPort(Int32.Parse(Console.ReadLine()));
				Console.WriteLine("Please enter Factorio RCON password: ");
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
			string itemMappingsPath = Path.Combine(Environment.CurrentDirectory, "item_mappings.txt");
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
			Console.WriteLine("Found settings. Beginning transfer.");
			var rcon = new RCON(IPAddress.Parse(settings.getFactorioIPAddress()), (ushort)settings.getFactorioPort(), settings.getFactorioRconPass() );
            if (settings.getMcType() == 0)
            {
                while (true)
                {
                    try
                    {
                        List<ItemPair> factorioItems = parseFactrio(settings, itemMappings, factorioRatios);
                        List<ItemPair> minecraftItems = parseMinecraft(settings, itemMappings, minecraftRatios);
                        sendToFactorio(minecraftItems, rcon);
                        sendToMinecraft(factorioItems, settings);
                        Thread.Sleep(1000);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Something went wrong. Moving past error.");
                        Console.WriteLine(e.Message);
                        continue;
                    }
                }
            } else
            {
                var rcon2 = new RCON(IPAddress.Parse(settings.getMcIPAddress()), (ushort)settings.getMcPort(), settings.getMcRconPass());
                while (true)
                {
                    try
                    {
                        List<ItemPair> factorioItems = parseFactrio(settings, itemMappings, factorioRatios);
                        List<ItemPair> minecraftItems = parseVanillaMinecraft(settings, itemMappings, minecraftRatios, rcon2).Result;
                        sendToFactorio(minecraftItems, rcon);
                        sendToVanillaMinecraft(factorioItems, settings, rcon2);
                        Thread.Sleep(1000);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.InnerException);
                        Console.WriteLine("Something went wrong. Moving past error.");
                        Console.WriteLine(e.Message);
                        continue;
                    }
                }
            }
		}

		/// FACTORIO
		/// Reading and parsing for factorio 
		/// FACTORIO
		public static async void sendToFactorio(List<ItemPair> items, RCON rcon) {
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

		public static List<ItemPair> parseFactrio(Settings settings, DualDictionary<String, String> mappings, Dictionary<String, double> ratios)
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
                items[i].name = mappings.minecraft[items[i].name];
            }
            return items;
        }

        public static async System.Threading.Tasks.Task<List<ItemPair>> parseVanillaMinecraft(Settings settings, DualDictionary<String,String> mappings, Dictionary<String, double> ratios, RCON rcon)
		{
            ///
            ///Sorry for the dumb variable names, I'm not very good about making them descriptive.
            ///
            StringBuilder str = new StringBuilder();
            String RCON_Output = await rcon.SendCommandAsync("/execute at @e[tag=SendChest] run data get block ~ ~ ~ Items");
            Char[] delim1 = { '{' };
            Char[] delim2 = { ',' }; //None of the syntax I tried ended up working when including the remove empty entires flag.
            Char[] delim3 = { '}', 'b' };
            Char[] delim4 = { ']' };
            String[] RCON_Output_List = RCON_Output.Split(delim1, StringSplitOptions.RemoveEmptyEntries);
            String[] NBT_Output = { "" };
            String[] temp5 = { "" };
            String toFactorioString = "";
            foreach (String stringy in RCON_Output_List)
            {
                if (string.IsNullOrWhiteSpace(stringy) == false)
                {
                    NBT_Output = stringy.Split(delim2, StringSplitOptions.RemoveEmptyEntries);
                    foreach (String stringy2 in NBT_Output)
                    {
                        if (string.IsNullOrWhiteSpace(stringy2) == false)
                        {
                            if (stringy2.Contains("id:") == true)
                            {
                                str.Append(stringy2.Remove(0, 6).TrimEnd('"'));
                            }
                            if (stringy2.Contains("Count:") == true)
                            {
                                str.Append("~");
                                temp5 = stringy2.Remove(0, 8).Split(delim4, StringSplitOptions.RemoveEmptyEntries);
                                str.Append(temp5[0].TrimEnd(delim3));
                                str.AppendLine();
                            }
                        }
                    }
                }
            }
            toFactorioString = str.ToString().TrimEnd(Environment.NewLine.ToCharArray());
            await rcon.SendCommandAsync("/execute at @e[tag=SendChest] run data remove block ~ ~ ~ Items");
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
				items[i].name = mappings.minecraft[items[i].name];
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

        public static async void sendToVanillaMinecraft(List<ItemPair> items, Settings settings, RCON rcon) {
            if (items.Count > 0)
            {
                String[] temp = { "" };
                String RCON_Output = "";
                String RCON_Output2 = "";
                String temp4 = "";
                Boolean FullFlag = false;
                for (int i = 0; i < items.Count; i++)
                {
                    temp = items[i].name.Split(':'); //Currently only blocks work. I'm planning on adding loot tables for items later.
                    for (int j = 0; j < items[i].count; j++)
                    {
                        FullFlag = false;
                        while (!FullFlag)
                        {
                            //The new /loot command seems to be the only way to get chests to fill without having to specify each individual slot.
                            RCON_Output = await rcon.SendCommandAsync("/execute at @e[tag=ReceiveChest,limit=1,sort=arbitrary,tag=!ReceiveFull] run loot insert ~ ~ ~ loot minecraft:blocks/" + temp[1]);
                            temp4 = RCON_Output.Remove(0, 8);
                            if (RCON_Output.StartsWith("0")) //This never returns 0 because of what seems to be a bug in 18w45a
                            {
                                await rcon.SendCommandAsync("/tag @e[tag=ReceiveChest,limit=1,sort=arbitrary,tag=!RecieveFull] add ReceiveFull");
                                RCON_Output2 = await rcon.SendCommandAsync("/execute if entity @e[tag=ReceiveChest,limit=1,sort=arbitrary,tag=!ReceiveFull]");
                                if (RCON_Output2 == "Test failed")
                                {
                                    FullFlag = true;
                                }
                            } else
                            {
                                FullFlag = true;
                            }
                        }
                        FullFlag = false;
                    }
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
