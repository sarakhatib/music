using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AllPlaylists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillRepeater();
        }
    }
    private void FillRepeater()
    {
        ClassUsers cs = (ClassUsers)Session["User"];
        DataTable dt = ClassSongsForUsers.GetAllPlaylistsByUserID(cs.UserID);
        RepeaterPlaylists.DataSource = dt;
        RepeaterPlaylists.DataBind();
       
    }
    protected void RepeaterPlaylists_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "CallPlaylist")
        {
            string playlistname = e.CommandArgument.ToString();
            Response.Redirect("Playlist.aspx?PlaylistName="+playlistname);
        }
    }
}