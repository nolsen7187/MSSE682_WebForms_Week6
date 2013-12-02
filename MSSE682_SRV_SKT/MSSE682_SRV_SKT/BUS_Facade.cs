using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MSSE682_SRV_SKT
{
    public class BUS_Facade
    {
        private SVC_AuthenticateUser svcAuthenticateUser;

        private String logon, password;
        private bool foundLogon, foundPassword, isSalesRep;

        public BUS_Facade(string _Logon, string _Password = "")
        {
            this.logon = _Logon;
            this.password = _Password;
        }

        public string ProcessAuthenticationRequest()
        {
            svcAuthenticateUser = new SVC_AuthenticateUser();
            foundLogon = svcAuthenticateUser.AuthenticateLogon(logon);
            foundPassword = svcAuthenticateUser.AuthenticatePassword(password);
            if (foundLogon && foundPassword)
            {
                return logon;
            }
            else
            {
                return "Invalid Password Entered";
            }
        }
        public bool ProcessCheckIfUserIsSalesRep()
        {
            isSalesRep = svcAuthenticateUser.IsSalesRep(logon);
            return isSalesRep;
        }
        public string ProcessLogonNameAuthenticity()
        {
            svcAuthenticateUser = new SVC_AuthenticateUser();
            foundLogon = svcAuthenticateUser.AuthenticateLogon(logon);

            if (foundLogon)
            {
                return logon;
            }
            else
            {
                return "Valid Username Entered.";
            }
        }
    }
}
