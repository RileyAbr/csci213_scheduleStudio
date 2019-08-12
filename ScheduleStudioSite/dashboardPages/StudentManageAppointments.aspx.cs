using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentManageAppointments : System.Web.UI.Page
{
    private string studentName;
    private int studentID;


    protected void Page_Load(object sender, EventArgs e)
    {
        studentID = Convert.ToInt32(Session["StdID"].ToString());
    }

    /* No longer needed
    private void RefreshSession()
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {

            if (Session.Count > 0)
            {
                studentName = Session["User"].ToString();

                var studentNameToId =
                    (from stu in dbcon.StudentTables
                     where stu.StudentUserName == studentName
                     select stu).First();

                Session.Add("StdID", studentNameToId.StudentID);

                studentID = Convert.ToInt32(Session["StdID"].ToString());
            }
        }
    } */

    //Add button
    protected void addBtn_Click(object sender, EventArgs e)
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {
            var studentIDToAdvisorID =
                (from apt in dbcon.AppointmentTables
                where apt.StudentID == studentID
                select apt).First();

            int advisorID = studentIDToAdvisorID.AdvisorID;

            var advisorDates =
                 (from date in dbcon.AdvisorTables
                  where date.AdvisorID == advisorID
                  select date).First();

            
            
            if (true /*Calendar1.SelectedDate.ToString() >= advisorDates.advisorStartDate &&
                Calendar1.SelectedDate.ToString() <= advisorDates.advisorEndDate*/) {
                AppointmentTable app = new AppointmentTable();

                app.StudentID = studentID;
                app.AdvisorID = advisorID;
                app.AppointmentDate = Convert.ToDateTime(Calendar1.SelectedDate.ToString());
                app.AppointmentTime = TimeSpan.Parse(TextBox2.Text);
                app.AppointmentReason = TextBox3.Text;

                // add data to the table
                dbcon.AppointmentTables.Add(app);
                dbcon.SaveChanges();
            }
            else { }

            
        }
        // show data in the GridView
        GridView1.DataBind();

    }

    //Delete Button
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {
            if (GridView1.SelectedDataKey.Value != null)
            {
                // add data to the dbcon

                // select the row
                int item = Convert.ToInt32(
                     GridView1.SelectedDataKey.Value.ToString());

                AppointmentTable app = (from x in dbcon.AppointmentTables
                                        where x.AppointmentID == item
                                        select x).First();

                //delete row from the table
                dbcon.AppointmentTables.Remove(app);
                dbcon.SaveChanges();
            }

        }
        GridView1.DataBind();

    }
}