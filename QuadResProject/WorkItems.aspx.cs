using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace QuadResProject
{
    public partial class WorkItems : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string ConString = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = true;

        }
        protected void OnDataBound(object sender, EventArgs e)
        {
            con = new SqlConnection(ConString);
            con.Open();
            DropDownList DropDownList1 = GridView1.FooterRow.FindControl("DropDownList1") as DropDownList;
            DropDownList1.DataSource = GetData("SELECT DISTINCT FullName FROM EmployeeData");
            DropDownList1.DataTextField = "FullName";
            DropDownList1.DataValueField = "FullName";
            DropDownList1.DataBind();
            //DropDownList1.Items.Insert(0, new ListItem("Select member to assign", "0"));
            DropDownList DropDownList3 = GridView1.FooterRow.FindControl("DropDownList3") as DropDownList;
            DropDownList3.DataSource = GetData("SELECT DISTINCT TeamName, TeamId FROM TeamNewtbl");
            DropDownList3.DataTextField = "TeamName";
            DropDownList3.DataValueField = "TeamId";
            DropDownList3.DataBind();
        }
        private DataTable GetData(string query)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["constr1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
        protected void btnCreateWorkItem_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var a = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList3"));

                SqlDataSource1.InsertParameters["WorkItemId"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBox6")).Text;
                SqlDataSource1.InsertParameters["AssignedTo"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList1")).SelectedItem.Value;
                SqlDataSource1.InsertParameters["Title"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBox7")).Text;
                SqlDataSource1.InsertParameters["TaskDescription"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBox8")).Text;
                SqlDataSource1.InsertParameters["TaskStatus"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList2")).SelectedItem.Value;
                SqlDataSource1.InsertParameters["TeamNameId"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList3")).SelectedItem.Value;
                SqlDataSource1.InsertParameters["TeamName"].DefaultValue = a.SelectedItem.Text;//((DropDownList)GridView1.FooterRow.FindControl("DropDownList3")).SelectedItem.Text;
                //SqlDataSource1.InsertParameters["TeamNameId"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextBox9")).Text;
                SqlDataSource1.Insert();

            }
        }
    }
}