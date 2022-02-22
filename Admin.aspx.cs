using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ValidUser"] == null || Session["ValidUser"].ToString().Equals("no"))
        {
            Response.Redirect("LogIn.aspx");
        }

    }
    protected void ButtonUsersEditor_Click(object sender, EventArgs e)
    {
        Response.Redirect("UsersEditor.aspx");
    }

    protected void ButtonNotes_Click(object sender, EventArgs e)
    {
        Response.Redirect("Notes.aspx");
    }
    protected void ButtonFiles_Click(object sender, EventArgs e)
    {
        Response.Redirect("FileEditor.aspx");
    }
    protected void ButtonSongEditor_Click(object sender, EventArgs e)
    {
        Response.Redirect("OurSongs.aspx");
    }
}