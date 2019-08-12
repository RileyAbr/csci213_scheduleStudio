using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //delete email
    protected void Button2_Click(object sender, EventArgs e)
    {
        using(CommunicationEntities dbcon = new CommunicationEntities())
        {

            if (GridView1.SelectedDataKey.Value != null) //if there is one selected
            {
                int email = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString()); //first convert to integer

                AppointmentTable msg = (from x in dbcon.EmailTables
                                        where x.ID == email
                                        select x).First();

                //delete row from the table
                dbcon.EmailTables.Remove(msg);
                dbcon.SaveChanges();
            }

        }

        GridView1.DataBind();
    }
}