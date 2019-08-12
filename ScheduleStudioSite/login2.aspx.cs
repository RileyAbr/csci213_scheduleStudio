using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ToString());
        conn.Open();
        string checkuser = "select count(*) from UserTable where UserName= '" + TextBox1.Text + "and UserPassword = '" + TextBox2.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            Session["user"] = TextBox1.Text;
            Response.Redirect("CSC_213_ScheduleStudioSite/ScheduleStudioSite/ScheduleStudioSite/dashboardPages/Dashboard.aspx");
        }
        else
        {
            Response.Write("Login Failed");
        }
    }
}