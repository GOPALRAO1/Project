using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Configuration;
namespace QuadResProject

{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection scon;
        SqlCommand cmd1, cmd2;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
        }
        protected void btnRegisterLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session["UserName"] = txtUserName.Text;
            Session["Password"] = txtPassword.Text;
            string connstr = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            scon = new SqlConnection(connstr);
            scon.Open();
            string IsAdmin = "Select IsAdmin from EmployeeData where EmployeeId='" + txtUserName.Text + "'and EmpPassword='" + txtPassword.Text + "'";
            string validUser = "Select Count(*) from EmployeeData where EmployeeId='" + txtUserName.Text + "'and EmpPassword='" + txtPassword.Text + "'";
            cmd1 = new SqlCommand(IsAdmin, scon);
            cmd2 = new SqlCommand(validUser, scon);
            int Count = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
            bool isadmin=false;
            if (Count == 1)
            {
                isadmin = Convert.ToBoolean(cmd1.ExecuteScalar().ToString());
            }
            scon.Close();
            if(Count==1 && isadmin==true)
            {
                Response.Redirect("QRTimeSheet.aspx");
               
            }
            if (Count == 1 && isadmin == false)
            {
                Response.Redirect("QRTimeSheet.aspx");
                //Response.Redirect("AdminTimeSheet.aspx");
            }
            else
            {
                Label1.Text = "Invalid Credentials";
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}