using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SVC;

namespace SVCTest
{
    [TestClass]
    public class SVC_TST
    {
        [TestMethod]
        public void SVC_TST_VerifySeedUser()
        {
            SVC_AuthenticateUser svcLogon = new SVC_AuthenticateUser();
            bool IsAuthenticated = false ;
            IsAuthenticated = svcLogon.AuthenticateLogon("dbrees");
            Console.WriteLine("User Authenticated = {0} ", IsAuthenticated.ToString());
        }
        [TestMethod]
        public void SVC_TST_VerifySeedPassword()
        {
            SVC_AuthenticateUser svcPassword = new SVC_AuthenticateUser();
            bool IsAuthenticated = false;
            IsAuthenticated = svcPassword.AuthenticatePassword("dbrees");
            Console.WriteLine("User Authenticated = {0} ", IsAuthenticated.ToString());            
        }
    }
}
