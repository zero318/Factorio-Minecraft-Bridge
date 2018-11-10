using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factorio_MC_Bridge {
	class Settings {
        public int mcType = 0;
		public String mcPath = "";
        public String mcIpAddress = "";
        public int mcPortNumber = 0;
        public String mcRconPass = "";
		public String factorioPath = "";
		public String factorioIpAddress = "";
		public int factorioPortNumber = 0;
		public String factorioRconPass = "";

		public Settings() {
		}

        public int getMcType()
        {
            return mcType;
        }

        public String getMcPath() {
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

        public String getFactorioPath() {
			return factorioPath;
		}

		public String getFactorioIPAddress() {
			return factorioIpAddress;
		}

		public int getFactorioPort() {
			return factorioPortNumber;
		}

		public String getFactorioRconPass() {
			return factorioRconPass;
		}


        public void setMcType(int x)
        {
            mcType = x;
        }
        public void setMcPath(String s) {
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
        public void setFacotrioPath(String s) {
			factorioPath = s;
		}
		public void setFactorioIpAddress(String s) {
			factorioIpAddress = s;
		}
		public void setFactorioPort(int x) {
			factorioPortNumber = x;
		}
		public void setFactorioRconPass(String s) {
			factorioRconPass = s;
		}
	}
}
