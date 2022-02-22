using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShareMusicWithFriends : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ValidUser"] == null || Session["ValidUser"].ToString().Equals("no"))
        {
            Response.Redirect("LogIn.aspx");
        }
    }
    protected void ButtonStartSharing_Click(object sender, EventArgs e)
    {
        ClassUsers friend = new ClassUsers();
        friend.PassWord = TextBoxPassword.Text;
        friend.UserNickname = TextBoxUserName.Text;
        string str = friend.Login();
        if (!str.Equals(string.Empty))
            LabelError.Text = str;
        else
        {
            Session["Friend"] = friend;
            Response.Redirect("MutualSongs.aspx");
        }
    }
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("");
    }
}