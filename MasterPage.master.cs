using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ValidUser"] != null && Session["ValidUser"].ToString() == "yes")
        {
            RenameMenuItem("LogOut");
            RemoveMenuItem("SignUp");
            ClassUsers user = (ClassUsers)Session["User"];
            if (user.UserGroup != "Admin")
                RemoveMenuItem("Admin");
        }
        else
        {
            RemoveMenuItem("Favorite");
            RemoveMenuItem("Admin");
            RemoveMenuItem("Playlists");
            RemoveMenuItem("Profile");
        }


    }
    public void RenameMenuItem(string strtext)
    {
        MenuItem mi = Menu1.FindItem("LogIn");

        if (mi != null)
        {
            mi.Text = strtext; 
        }
    }
    private void RemoveMenuItem(string strValue)
    {
        MenuItem mi = Menu1.FindItem(strValue);
        if (mi != null)
        {
            Menu1.Items.Remove(mi);
        }
    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Value == "LogIn") 
        {
            if (e.Item.Text == "LogIn")
                Response.Redirect("LogIn.aspx");
            else
            {
                Session["ValidUser"] = "no";
                Response.Redirect("LogOut.aspx");
            } 
        }
   }

    protected void MyCalendar_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date.Month == 7 && e.Day.Date.Year == 2016 && e.Day.Date.Day >= 6 && e.Day.Date.Day <= 9)
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> الفطر عيد"));
            e.Cell.BackColor = Color.Black;
        }
        if (e.Day.Date.Month == 10 && e.Day.Date.Year == 2016 && e.Day.Date.Day >= 2 && e.Day.Date.Day <= 3)
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> راس السنة الهجرية"));
            e.Cell.BackColor = Color.Black;
        }
        if (e.Day.Date.Month == 9 && e.Day.Date.Year == 2016 && e.Day.Date.Day >= 12 && e.Day.Date.Day <= 16)
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> الاضحى عيد"));
            e.Cell.BackColor = Color.Black;
        }
        if (e.Day.Date.Month == 10  && e.Day.Date.Day == 7 )
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> Simon's BD"));
        }
        if (e.Day.Date.Month == 10 && e.Day.Date.Day == 21)
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> Kim's BD"));
        }
        if (e.Day.Date.Month == 4 && e.Day.Date.Day == 7)
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> Jacki Chan's BD"));
        }
        if (e.Day.Date.Month == 4 && e.Day.Date.Day == 15)
        {
            e.Cell.Controls.Add(new LiteralControl("<br/> Emma's BD"));
        }
    }
    protected void MyCalendar_SelectionChanged(object sender, EventArgs e)
    {
        LabelDaySelected.Text = "The Selected Date is:";
        LabelDaySelected.Text += MyCalendar.SelectedDate.ToString();
        
    }
}
