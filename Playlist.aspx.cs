using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Playlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGVSongs();
        }
    }
    public void FillGVSongs()
    {
        ClassUsers CU = (ClassUsers)Session["User"];
        string strPlaylistName = Request.QueryString["PlaylistName"].ToString();
        ClassSongsForUsers csfu = new ClassSongsForUsers();
        csfu.UserID = CU.UserID;
        csfu.PlaylistName = strPlaylistName;
        GridViewSongs.DataSource = csfu.GetPlaylist();
        GridViewSongs.DataBind();
    }
    protected void GridViewSongs_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClassUsers CU = (ClassUsers)Session["User"];
        string strPlaylistName = Request.QueryString["PlaylistName"].ToString();
        Label songid = (Label)GridViewSongs.Rows[e.RowIndex].FindControl("LabelSongID");
        ClassSongsForUsers playlist = new ClassSongsForUsers();
        playlist.UserID = CU.UserID;
        playlist.PlaylistName = strPlaylistName;
        playlist.SongID = songid.Text;
        string str = playlist.Delete();
        if (!str.Equals(string.Empty))
        {
            LabelError.Text = str;
        }
        else
        {
            Response.Redirect("Playlist.aspx?PlaylistName=" + Request.QueryString["PlaylistName"].ToString());
        }
    }
}