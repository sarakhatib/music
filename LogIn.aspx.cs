
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogIn.aspx");
    }
    protected void ButtonLogIn_Click(object sender, EventArgs e)
    {
        ClassUsers obj= new ClassUsers(TextBoxUserName.Text,TextBoxPassword.Text);
        string strRET = obj.Login();
       if(strRET.Equals(string.Empty))
        {
            Session["ValidUser"] = "yes";
            Session["User"] = obj;  
            Session["LogInTime"] = DateTime.Now;
            Response.Redirect("Welcome.aspx");
        }
        else
        {
            Label1.Text = strRET;
        }
    }

}