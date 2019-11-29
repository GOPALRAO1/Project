using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;
using System.Net.Mail;

namespace QuadResProject
{
    public partial class AdminTimesheet : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd, cmd1, cmd2, cmd3;
        DataSet ds;
        SqlDataAdapter da;
        string ConString = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
        //  int Count=0;
        string IsAdmin;
        string validUser;
        bool isadmin = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            string ConString = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(ConString);
            //con.Open();
            //------------------------------------------------------------------------------------------------

            string connstr = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(connstr);
            con.Open();
            IsAdmin = "Select IsAdmin from EmployeeData where EmployeeId='" + Session["UserName"] + "'";
            validUser = "Select Count(*) from EmployeeData where EmployeeId='" + Session["UserName"] + "'";
            cmd1 = new SqlCommand(IsAdmin, con);
            cmd3 = new SqlCommand(validUser, con);
            int Count = Convert.ToInt32(cmd3.ExecuteScalar().ToString());

            if (Count == 1)
            {
                isadmin = Convert.ToBoolean(cmd1.ExecuteScalar().ToString());
            }
            if (Count == 1 && isadmin == false)
            {

                genTimeSheet.Visible = true;
                Button1.Visible = false;
                TextBox1.Attributes.Add("style", "display:none");
                TextBox2.Visible = false;
                ddlUsers.Visible = false;
                Label2.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;



            }
            if (Count == 1 && isadmin == true)
            {

                genTimeSheet.Visible = true;
                btnApproveSend.Visible = true;
                btnRejectSend.Visible = true;
                btnCommentSend.Visible = true;
                //please don't change this label id for god's sake
                labelUserTimesheet.Visible = false;



            }

            if (!IsPostBack)
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                Label3.Visible = false;
                lblSuccess.Visible = false;
                lblFail.Visible = false;
                panelVerify.Visible = false;
            }




        }


        protected void genTimeSheet_Click1(object sender, EventArgs e)
        {


            GridView1.Visible = true;
            Label3.Visible = true;
            GridView2.Visible = false;
            lblSuccess.Visible = false;
            lblFail.Visible = false;
            panelVerify.Visible = false;
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["Task"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txttask")).Text;
            SqlDataSource1.InsertParameters["TimeSpent"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txttimespent")).Text;
            SqlDataSource1.InsertParameters["Remarks"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtremarks")).Text;
            SqlDataSource1.InsertParameters["EmployeeID"].DefaultValue = Convert.ToString(Session["UserName"]);
            SqlDataSource1.InsertParameters["CreatedDate"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource1.Insert();
        }




        protected void DisplayEmpTimesheet_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            Label3.Visible = true;
            GridView2.Visible = true;
            panelVerify.Visible = true;
            if (Page.IsValid)
            {
                //string queryString1 = "select e.FullName, t.* from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId=t.EmployeeID where CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName='" + ddlUsers.SelectedItem.Text + "' order by CreatedDate";
                //string queryString1 = "select e.FullName, t.* from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId=t.EmployeeID where CreatedDate >=DATEADD(DAY,-7, '" + TextBox1.Text + "') and e.FullName='" + DropDownList2.SelectedItem.Text + "' order by CreatedDate";

                //string queryString1 = "select e.FullName, t.* from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where (CreatedDate >= DATEADD(DAY, -7, GETDATE()) or CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "') and e.FullName = '" + ddlUsers.SelectedItem.Text + "' order by CreatedDate";

                string queryString1 = "select e.FullName, t.* from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where e.FullName = '" + ddlUsers.SelectedItem.Text + "' order by CreatedDate";

                if (TextBox1.Text != "" && TextBox2.Text != "")
                {
                    if (TextBox1.Text == TextBox2.Text)
                    {

                        queryString1 = "select e.FullName, t.* from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where CreatedDate= '" + TextBox1.Text + "' and e.FullName = '" + ddlUsers.SelectedItem.Text + "'order by CreatedDate";
                    }
                    else
                    {
                        queryString1 = "select e.FullName, t.* from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName = '" + ddlUsers.SelectedItem.Text + "' order by CreatedDate";

                    }
                }

                cmd = new SqlCommand(queryString1, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.DataBind();
                con.Close();
            }
        }
        /// <summary>
        /// This is used for GridView control as it has not placed it in the form tag and runat="server"
        /// </summary>
        /// <param name="control"></param>       
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        protected void btnApproveSend_Click(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(connstr);
            con.Open();
            string User = "Select Email from EmployeeData where FullName='" + ddlUsers.SelectedItem.Text + "'";
            string name = "Select FullName from EmployeeData where EmployeeId='" + Session["UserName"].ToString() + "'";
            cmd = new SqlCommand(User, con);
            cmd2 = new SqlCommand(name, con);
            string email = cmd.ExecuteScalar().ToString();
            string Name = cmd2.ExecuteScalar().ToString();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView2.RenderControl(hw);
            MailMessage mm = new MailMessage("Tempmail9595@gmail.com", email);
            mm.Body = "<h1>TimeSheet Data</h1><hr/>" + sw.ToString() + "<hr/><br/> <h2>Additional Information:</h2>" + txtApproveFB.Text + "<br/><br/>With Regards<br/>" + Name;
            mm.IsBodyHtml = true;
            mm.Subject = "Your timesheet has been approved :) !";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            System.Net.NetworkCredential nc = new System.Net.NetworkCredential("Tempmail9595@gmail.com", "Temp@1234");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            try
            {
                smtp.Send(mm);
                lblSuccess.Visible = true;
                lblSuccess.Text = "Mail sent";
                Response.Write("<script>alert('Email Sent Successfully')</script>");


                string queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus='Approved' where CreatedDate in  (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where e.FullName = '" + ddlUsers.SelectedItem.Text + "'); ";
                if (TextBox1.Text != "" && TextBox2.Text != "")
                {
                    if (TextBox1.Text == TextBox2.Text)
                    {

                        queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Approved' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where CreatedDate= '" + TextBox1.Text + "' and e.FullName = '" + ddlUsers.SelectedItem.Text + "')";
                    }
                    else
                    {
                        queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Approved' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where t.CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName =  '" + ddlUsers.SelectedItem.Text + "')";
                    }
                }
                cmd = new SqlCommand(queryString1, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblFail.Visible = true;
                lblFail.Text = ex.ToString();
                Response.Write("<script>alert('Email did not sent')</script>");

            }
        }
        protected void btnRejectSend_Click(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(connstr);
            con.Open();
            string User = "Select Email from EmployeeData where FullName='" + ddlUsers.SelectedItem.Text + "'";
            string name = "Select FullName from EmployeeData where EmployeeId='" + Session["UserName"].ToString() + "'";
            cmd = new SqlCommand(User, con);
            cmd2 = new SqlCommand(name, con);
            string email = cmd.ExecuteScalar().ToString();
            string Name = cmd2.ExecuteScalar().ToString();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView2.RenderControl(hw);
            MailMessage mm = new MailMessage("Tempmail9595@gmail.com", email);
            mm.Body = "<h1>TimeSheet Data</h1><hr/>" + sw.ToString() + "<hr/><br/> <h2>Additional Information:</h2>" + txtRejectFB.Text + "<br/><br/>With Regards<br/>" + Name;
            mm.IsBodyHtml = true;
            mm.Subject = "Your timesheet has been rejected :( !";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            System.Net.NetworkCredential nc = new System.Net.NetworkCredential("Tempmail9595@gmail.com", "Temp@1234");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            try
            {
                smtp.Send(mm);
                lblSuccess.Visible = true;
                lblSuccess.Text = "Mail sent";
                Response.Write("<script>alert('Email Sent Successfully')</script>");

                string queryString1 = " update EmployeeTimeSheettbl set TimeSheetStatus='Rejected' where CreatedDate in  (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where e.FullName = '" + ddlUsers.SelectedItem.Text + "'); ";
                if (TextBox1.Text != "" && TextBox2.Text != "")
                {
                    if (TextBox1.Text == TextBox2.Text)
                    {

                        queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Rejected' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where CreatedDate= '" + TextBox1.Text + "' and e.FullName = '" + ddlUsers.SelectedItem.Text + "')";
                    }
                    else
                    {
                        queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Rejected' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where t.CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName = '" + ddlUsers.SelectedItem.Text + "')";
                    }
                    //queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Rejected' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where t.CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName = 'Pavan R')";
                }
                cmd = new SqlCommand(queryString1, con);
                cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                lblFail.Visible = true;
                lblFail.Text = ex.ToString();
                Response.Write("<script>alert('Email did not sent')</script>");
                con.Close();
            }
        }
        protected void btnCommentSend_Click(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            con = new SqlConnection(connstr);
            con.Open();
            string User = "Select Email from EmployeeData where FullName='" + ddlUsers.SelectedItem.Text + "'";
            string name = "Select FullName from EmployeeData where EmployeeId='" + Session["UserName"].ToString() + "'";
            cmd = new SqlCommand(User, con);
            cmd2 = new SqlCommand(name, con);
            string email = cmd.ExecuteScalar().ToString();
            string Name = cmd2.ExecuteScalar().ToString();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView2.RenderControl(hw);
            MailMessage mm = new MailMessage("Tempmail9595@gmail.com", email);
            mm.Body = "<h1>TimeSheet Data</h1><hr/>" + sw.ToString() + "<hr/><br/> <h2>Additional Information:</h2>" + txtCommentFB.Text + "<br/><br/>With Regards<br/>" + Name;
            mm.IsBodyHtml = true;
            mm.Subject = "You have recieved a comment on your timesheet !";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            System.Net.NetworkCredential nc = new System.Net.NetworkCredential("Tempmail9595@gmail.com", "Temp@1234");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            try
            {
                smtp.Send(mm);
                lblSuccess.Visible = true;
                lblSuccess.Text = "Mail sent";
                Response.Write("<script>alert('Email Sent Successfully')</script>");

                string queryString1 = " update EmployeeTimeSheettbl set TimeSheetStatus='Pending' where CreatedDate in  (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeId where e.FullName = '" + ddlUsers.SelectedItem.Text + "'); ";
                if (TextBox1.Text != "" && TextBox2.Text != "")
                {
                    if (TextBox1.Text == TextBox2.Text)
                    {

                        queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Pending' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where CreatedDate= '" + TextBox1.Text + "' and e.FullName = '" + ddlUsers.SelectedItem.Text + "')";
                    }
                    else
                    {
                        queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Pending' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeID where t.CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName = '"+ddlUsers.SelectedItem.Text+"')";
                    }
                    //queryString1 = "update EmployeeTimeSheettbl set TimeSheetStatus = 'Pending' where CreatedDate in (select t.CreatedDate from EmployeeTimeSheettbl t inner join EmployeeData e on e.EmployeeId = t.EmployeeId where t.CreatedDate between '" + TextBox1.Text + "' and '" + TextBox2.Text + "' and e.FullName = 'Pavan R')";
                }
                cmd = new SqlCommand(queryString1, con);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                lblFail.Visible = true;
                lblFail.Text = ex.ToString();
                Response.Write("<script>alert('Email did not sent')</script>");
            }
        }

        //}

    }
}