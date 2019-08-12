using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdvisorManageAppointments : System.Web.UI.Page
{
    private string advisorName;
    private int advisorID;

    protected void Page_Load(object sender, EventArgs e)
    {
        advisorID = Convert.ToInt32(Session["AdvID"].ToString());
        //RefreshSession();
    }

    /* No longer needed
    private void RefreshSession()
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {

            if (Session.Count > 0)
            {
                advisorName = Session["User"].ToString();

                var advisorNameToId =
                    (from adv in dbcon.AdvisorTables
                     where adv.AdvisorUserName == advisorName
                     select adv).First();

                Session.Add("AdvID", advisorNameToId.AdvisorID);

                advisorID = Convert.ToInt32(Session["AdvID"].ToString());
            }

            //Add button
        }
    } */

    protected void addBtn_Click(object sender, EventArgs e)
    {
        using (ScheduleEntities dbcon = new ScheduleEntities())
        {
            AppointmentTable app = new AppointmentTable();


            app.AppointmentDate = Convert.ToDateTime(Calendar1.SelectedDate.ToString());
            app.AppointmentTime = TimeSpan.Parse(TextBox2.Text);
            app.AppointmentReason = TextBox3.Text;

            app.AdvisorID = advisorID;

            var advisorIDToStudentID =
                    (from apt in dbcon.AppointmentTables
                     where apt.AdvisorID == advisorID
                     select apt).First();

            app.StudentID = advisorIDToStudentID.StudentID;

            // add data to the table
            dbcon.AppointmentTables.Add(app);
            dbcon.SaveChanges();

            var StudentIDToName =
                (from x in dbcon.StudentTables
                where x.StudentID == advisorIDToStudentID.StudentID
                select x).First();

            string studentName = StudentIDToName.StudentFirstName + " " + StudentIDToName.StudentLastName;

            notifLb.Text = "Appointment has been created for " + Calendar1.SelectedDate.ToString() + " at " + TextBox2.Text + " with " + studentName;
        }

        // show data in the GridView
        GridView1.DataBind();
    }

    //Delete button
    protected void dltBtn_Click(object sender, EventArgs e)
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
 