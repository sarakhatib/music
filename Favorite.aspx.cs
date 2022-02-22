using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Favorite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridView();
        }
    }
    private void FillGridView()
    {
        ClassUsers user = (ClassUsers)Session["User"];
        string userid = user.UserID;
        ClassSongs[] cs = ClassSongsForUsers.GetAllFavoriteSongsForUser(userid);
        GridViewFavorite.DataSource = cs;
        GridViewFavorite.DataBind();

    }

    protected void GridViewFavorite_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClassUsers user = (ClassUsers)Session["User"];
        string userid = user.UserID;
        Label song = (Label)GridViewFavorite.Rows[e.RowIndex].FindControl("LabelSongID");
        string songid = song.Text;
        string playlistname = "Favorite";
        ClassSongsForUsers cs = new ClassSongsForUsers();
        cs.UserID = userid;
        cs.SongID = songid;
        cs.PlaylistName = playlistname;
        LabelError.Text = cs.Delete();
        FillGridView();
    }
}