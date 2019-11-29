using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Principal;

namespace QuadResProject
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmpId.Focus();
            string conString = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(conString);
            // con.ConnectionString = "Data Source=GOPAL RAO\\SQLEXPRESS;DataBase=gopal;Integrated Security=True";

            con.Open();

            Response.Write("Connection is" + " " + con.State + " " + "with Sql Connection");
            con.Close();
        }





        protected void Button_Click1(object sender, EventArgs e)
        {



            int userId = 0;
            using (SqlCommand cmd = new SqlCommand("Validate_User"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeId", txtEmpId.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Connection = con;
                con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();



            }
            switch (userId)
            {
                case 0:
                    string ins = string.Format("insert into EmployeeData(EmployeeId, FullName, Email, Mobile, EmpPassword, ConfirmPassword, Gender, JobRole) Values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", txtEmpId.Text, txtUserName.Text, txtEmail.Text, txtMobile.Text, txtPassword.Text, txtConfirmPassword.Text, txtGender.SelectedItem.Text, txtRole.SelectedItem.Text);
                    com = new SqlCommand(ins, con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                    Label4.Text = "Successfully Registered!!";

                    
                    Label5.Text = "";
                    break;
                default:
                    Label5.Text = "Already User Registered!!";
                    Label4.Text = "";
                    break;
            }

        }



    }
}