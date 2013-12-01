using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DAL;
using BUS;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (IsPostBack)
        {
            /*SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AXMbsDevEntities"].ConnectionString);          
            dbConnection.Open();
            string cmdStr = "Select count(*) from MBSWBWEBUSERCONTACT where WEBLOGON='" + TextBoxUserName.Text + "'";
            SqlCommand userExist = new SqlCommand(cmdStr, dbConnection);
            int temp = Convert.ToInt32(userExist.ExecuteScalar().ToString());
            dbConnection.Close();
            string userExist;
            BUS_Facade newFacade = new BUS_Facade(TextBoxUserName.Text);
            userExist = newFacade.ProcessLogonNameAuthenticity();

            if (userExist == TextBoxUserName.Text)
            {
                Response.Write("User Name Already Exist.<br/> Please Select another username.");
            }
        }*/
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MBSWBWEBUSERCONTACT uIWebUser = new MBSWBWEBUSERCONTACT();

        uIWebUser.ACCOUNTNUM = this.TextBoxAccountNum.Text;
        uIWebUser.CONTACTPERSONID = this.TextBoxContactPersonId.Text;
        uIWebUser.DATAAREAID = this.DropDownListCompany.SelectedItem.ToString();
        uIWebUser.EMAIL = this.TextEmail.Text;
        uIWebUser.NAME = this.TextBoxFullName.Text;
        uIWebUser.SALESREPID = this.TextBoxSalesRepId.Text;
        uIWebUser.WEBLOGON = this.TextBoxUserName.Text;
        uIWebUser.WEBPASSWORD = this.TextBoxPassword.Text;
        uIWebUser.RECID = 1000;

        object Class = uIWebUser;
        int ActionType = 1;

        BUS_Facade newFacade = new BUS_Facade(Class, ActionType);
        newFacade.ProcessRequest();

        try
        {
            Response.Redirect("Login.aspx");

        }
        catch (Exception)
        {
            Response.Write("<b>Could not create user.</b>");
        }

        
        if (Page.IsValid)
        {
            SuccessLabel.Text = "You have successfully registered on the FFR's website";
        }
        else
        {
            SuccessLabel.Text = "Failed to registers on FFR's website, please verify you have entered all necessary information.";
        }
        /*
        

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AXMbsDevEntities"].ConnectionString);
        con.Open();
        //string insCmd = "Insert into MBSWBWEBUSERCONTACT (ACCOUNTNUM, NAME, EMAIL, WEBLOGON, WEBPASSWORD, CONTACTPERSONID, SALESREPID, DATAAREAID) values (@UserName, @Password, @Email, @FullName, @Company)";
        string insCmd = "Insert into MBSWBWEBUSERCONTACT (ACCOUNTNUM, NAME, EMAIL, WEBLOGON, WEBPASSWORD, CONTACTPERSONID, SALESREPID, DATAAREAID) ";
        insCmd += "values (@ACCOUNTNUM, @NAME, @EMAIL, @WEBLOGON, @WEBPASSWORD, @CONTACTPERSONID, @SALESREPID, @DATAAREAID)";
        SqlCommand insertUser = new SqlCommand(insCmd, con);
        insertUser.Parameters.AddWithValue("@ACCOUNTNUM", TextBoxAccountNum.Text);
        insertUser.Parameters.AddWithValue("@NAME", TextBoxFullName.Text);
        insertUser.Parameters.AddWithValue("@EMAIL", TextEmail.Text);
        insertUser.Parameters.AddWithValue("@WEBLOGON", TextBoxUserName.Text);
        insertUser.Parameters.AddWithValue("@WEBPASSWORD", TextBoxPassword.Text);
        insertUser.Parameters.AddWithValue("@CONTACTPERSONID", TextBoxContactPersonId.Text);
        insertUser.Parameters.AddWithValue("@SALESREPID", TextBoxSalesRepId.Text);
        insertUser.Parameters.AddWithValue("@DATAAREAID", DropDownListCompany.SelectedItem.ToString());

        try
        {
            insertUser.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Login.aspx");

        }
        catch(Exception ex)
        {
            Response.Write("<b>Could not write to db for record being passed.</b>");
        }
        finally
        {
            //Any Special Action you want to add....

        }*/
    }
}