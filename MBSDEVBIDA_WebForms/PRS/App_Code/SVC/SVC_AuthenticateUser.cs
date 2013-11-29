using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DAL;

/// <summary>
/// Summary description for SVC_AuthenticateUser
/// </summary>
public class SVC_AuthenticateUser
{
        public bool AuthenticateLogon(string Logon)
        {
        //SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AXMbsDevEntities"].ConnectionString);
            SqlConnection dbConnection = new SqlConnection("data source=.;initial catalog=AXMbsDev;integrated security=True;");            
        dbConnection.Open();
        string userNameLookupSQLStatement = "select * from MBSWBWEBUSERCONTACT where WEBLOGON = '" + Logon + "'";
        SqlCommand checkUserName = new SqlCommand(userNameLookupSQLStatement, dbConnection);       
        var tempCheckUser = checkUserName.ExecuteScalar();

            if (tempCheckUser != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool AuthenticatePassword(string Password)
        {
            //SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AXMbsDevEntities"].ConnectionString);            
            SqlConnection dbConnection = new SqlConnection("data source=.;initial catalog=AXMbsDev;integrated security=True;");            
            dbConnection.Open();
            string userNameLookupSQLStatement = "select * from MBSWBWEBUSERCONTACT where WEBPASSWORD = '" + Password + "'";
            SqlCommand checkPassword = new SqlCommand(userNameLookupSQLStatement, dbConnection);
            var tempCheckPassword = checkPassword.ExecuteScalar();
            if (tempCheckPassword != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
	
}