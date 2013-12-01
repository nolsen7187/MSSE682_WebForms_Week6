using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using DAL;
using BUS;
namespace BUSTest
{
    [TestClass]
    public class BUS_TST
    {
        [TestMethod]
        public void BUS_TST_FacadeAddUser()
        {
            MBSWBWEBUSERCONTACT uIWebUser = new MBSWBWEBUSERCONTACT();

            uIWebUser.ACCOUNTNUM = "123";
            uIWebUser.CONTACTPERSONID = "123";
            uIWebUser.DATAAREAID = "MBS";
            uIWebUser.EMAIL = "tommypenguin@hotmail.com";
            uIWebUser.NAME = "Nick";
            uIWebUser.SALESREPID = "123";
            uIWebUser.WEBLOGON = "tommypenguin";
            uIWebUser.WEBPASSWORD = "password";

            object Class = uIWebUser;
            int ActionType = 1;

            //Facade newFacade = new Facade(uICustomer, ActionType);
            BUS_Facade newFacade = new BUS_Facade(Class, ActionType);
            newFacade.ProcessRequest();
        }
        [TestMethod]
        public void BUS_TST_FacadeUserPassword()
        {
            BUS_Facade newFacade = new BUS_Facade("dbrees", "dbrees");
            newFacade.ProcessAuthenticationRequest();
        }
    }
}
