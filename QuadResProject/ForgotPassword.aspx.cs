using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace QuadResProject
{

    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection con;
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            string Name = "";
            string Password = "";
            string EmpId = "";
            //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-T6EI96J\SQLEXPRESS;Database=gopal;Integrated Security=True");
            string conString1 = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(conString1);
            SqlCommand cmd = new SqlCommand("select EmployeeId, FullName, EmpPassword from EmployeeData where Email=@Email", con);
            cmd.Parameters.AddWithValue("Email", txtEmail.Text);
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {

                if (sdr.Read())
                {
                    Name = sdr["FullName"].ToString();
                    Password = sdr["EmpPassword"].ToString();
                    EmpId = sdr["EmployeeId"].ToString();

                }

            }
            con.Close();

            if (!string.IsNullOrEmpty(Password))
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("Tempmail@gmail.com");
                msg.To.Add(txtEmail.Text);
                msg.Subject = " Recover your Password";
                msg.Body = ("Your Name is:" + Name + "<br/><br/>"+"Your User Id:"+ EmpId + "<br/><br/>" + "Your Password is:" + Password);
                msg.IsBodyHtml = true;

                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "Tempmail9595@gmail.com"; //Your Email ID  
                ntwd.Password = "Temp@1234"; // Your Password  
                smt.UseDefaultCredentials = true;//change it to false if it doesn't work
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                //smt.UseDefaultCredentials = false;

                smt.Send(msg);
                lbmsg.Text = "Username and Password Sent Successfully";
                lbmsg.ForeColor = System.Drawing.Color.ForestGreen;
            }
        }
    }
    
}