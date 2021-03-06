﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factorio_MC_Bridge {
	class Settings {
        public String itemMappingsFile = "";
        public int mcType = 0;
        public bool experimentalIO = false;
		public String mcPath = "";
        public String mcIpAddress = "";
        public int mcPortNumber = 0;
        public String mcRconPass = "";
        public String mcServerJava = "";
        public String mcServerParams = "";
        public String mcServerDirectory = "";
		public String factorioPath = "";
		public String factorioIpAddress = "";
		public int factorioPortNumber = 0;
		public String factorioRconPass = "";
        public String factorioServerPath = "";
        public String factorioServerParams = "";

		public Settings() {
		}

        public String getItemMappingsFile()
        {
            return itemMappingsFile;
        }

        public int getMcType()
        {
            return mcType;
        }

        public bool getExperimentalIO()
        {
            return experimentalIO;
        }

        public String getMcPath()
        {
			return mcPath;
		}

        public String getMcIPAddress()
        {
            return mcIpAddress;
        }

        public int getMcPort()
        {
            return mcPortNumber;
        }

        public String getMcRconPass()
        {
            return mcRconPass;
        }

        public String getMcServerJava()
        {
            return mcServerJava;
        }

        public String getMcServerParams()
        {
            return mcServerParams;
        }

        public String getMcServerDirectory()
        {
            return mcServerDirectory;
        }

        public String getFactorioPath()
        {
			return factorioPath;
		}

		public String getFactorioIPAddress()
        {
			return factorioIpAddress;
		}

		public int getFactorioPort()
        {
			return factorioPortNumber;
		}

		public String getFactorioRconPass()
        {
			return factorioRconPass;
		}

        public String getFactorioServerPath()
        {
            return factorioServerPath;
        }

        public String getFactorioServerParams()
        {
            return factorioServerParams;
        }


        public void setItemMappingsFile(String s)
        {
            itemMappingsFile = s;
        }
        public void setMcType(int x)
        {
            mcType = x;
        }
        public void setExperimentalIO(bool b)
        {
            experimentalIO = b;
        }
        public void setMcPath(String s)
        {
			mcPath = s;
		}
        public void setMcIpAddress(String s)
        {
            mcIpAddress = s;
        }
        public void setMcPort(int x)
        {
            mcPortNumber = x;
        }
        public void setMcRconPass(String s)
        {
            mcRconPass = s;
        }
        public void setMcServerJava(String s)
        {
            mcServerJava = s;
        }
        public void setMcServerParams(String s)
        {
            mcServerParams = s;
        }
        public void setMcServerDirectory(String s)
        {
            mcServerDirectory = s;
        }
        public void setFacotrioPath(String s)
        {
			factorioPath = s;
		}
		public void setFactorioIpAddress(String s)
        {
			factorioIpAddress = s;
		}
		public void setFactorioPort(int x)
        {
			factorioPortNumber = x;
		}
		public void setFactorioRconPass(String s)
        {
			factorioRconPass = s;
		}
        public void setFactorioServerPath(String s)
        {
            factorioServerPath = s;
        }
        public void setFactorioServerParams(String s)
        {
            factorioServerParams = s;
        }
    }
}
