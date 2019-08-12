using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboardPages_Dashboard : System.Web.UI.Page
{
    string userName;
    Boolean isStudent;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Add("User", "kabambora");

        userName = Session["User"].ToString();

        using (ScheduleEntities dbcon = new ScheduleEntities())
        {
            var userToRole =
                (from x in dbcon.UserTables
                 where x.UserName == userName
                 select x.UserRole).First();

            if (userToRole == "Student")
            {
                isStudent = true;

                var studentNameToId =
                        (from stu in dbcon.StudentTables
                         where stu.StudentUserName == userName
                         select stu).First();

                Session.Add("StdID", studentNameToId.StudentID);
            }
            else
            {
                isStudent = false;

                var advisorNameToId =
                (from adv in dbcon.AdvisorTables
                 where adv.AdvisorUserName == userName
                 select adv).First();

                Session.Add("AdvID", advisorNameToId.AdvisorID);
            }
        }
    }

    private void findStudentID()
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {
            var studentNameToId =
                        (from stu in dbcon.StudentTables
                         where stu.StudentUserName == userName
                         select stu).First();

            Session.Add("StdID", studentNameToId.StudentID);
        }
    }

    private void findAdvisorID()
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {
            var advisorNameToId =
                (from adv in dbcon.AdvisorTables
                 where adv.AdvisorUserName == userName
                 select adv).First();

            Session.Add("AdvID", 3);
        }
    }

    protected void appBtn_Click(object sender, EventArgs e)
    {
        if(isStudent)
        {
            Response.Redirect("StudentManageAppointments.aspx");
        }
        else
        {
            Response.Redirect("AdvisorManageAppointments.aspx");
        }
        
    }

    protected void msgBtn_Click(object sender, EventArgs e)
    {
        
    }
}