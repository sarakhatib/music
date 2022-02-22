using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null && Session["LogInTime"] != null)
        {
            ClassUsers user = (ClassUsers)Session["User"];
            LabelLogOut.Text = "<center><font color=\"#990033\" Size=5>";
            LabelLogOut.Text += "Thank You, " + user.UserFN + ",For Loggin In." + "</br>";
            LabelLogOut.Text += "Your Log In Time Was: " + Session["LogInTime"].ToString() + "</br>";
            LabelLogOut.Text += "Your Log Out Time Is: " + DateTime.Now.ToString() + "</br> Hope You Enjoyed Your Visit!";
            LabelLogOut.Text += "</font></center>";
        }
    }
}