using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PRS.SVC;

namespace PRS.BUS
{
    public class BUS_Facade
    {
        private SVC_PerformAction svcPerformAction; 
        private SVC_AuthenticateUser svcAuthenticateUser;
        private Object lclObjectClass;
        private int lclActionType;

        private String logon, password;
        private bool foundLogon, foundPassword;

        public BUS_Facade(Object Object, int ActionType)
        {   
            this.lclObjectClass = Object;
            this.lclActionType = ActionType;
        }
        public BUS_Facade(string _Logon, string _Password = "")
        {
            this.logon = _Logon;
            this.password = _Password;
        }
        public void ProcessRequest()
        {
            svcPerformAction = new SVC_PerformAction();
            svcPerformAction.Action(lclObjectClass, lclActionType);
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
