using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OurSongs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridView();
        }
    }
    protected void FillGridView()
    {
        DataTable dt = ClassSongs.GetAll();
        GridViewSongs.DataSource = dt;
        GridViewSongs.DataBind();
        if (Session["User"] != null)
        {
            ClassUsers user = (ClassUsers)Session["User"];
            string userid = user.UserID;
            ClassSongs[] cs = ClassSongsForUsers.GetAllFavoriteSongsForUser(userid);
            for (int i = 0; i < GridViewSongs.Rows.Count; i++)
            {
                for (int j = 0; j < cs.Length; j++)
                {
                    if (dt.Rows[i]["SongID"].ToString() == cs[j].SongID)
                    {
                        ImageButton ib = (ImageButton)GridViewSongs.Rows[i].FindControl("ImageButtonFavorite"); ;
                        ib.Enabled = false;
                    }

                }
            }
            if (user.UserGroup != "Admin")
            {
                GridViewSongs.ShowFooter = false;
                GridViewSongs.Columns[10].Visible = false;
                GridViewSongs.Columns[11].Visible = false;
                GridViewSongs.DataBind();
            }

        }

        else
        {
            for (int i = 0; i < GridViewSongs.Rows.Count; i++)
            {

                ImageButton ib = (ImageButton)GridViewSongs.Rows[i].FindControl("ImageButtonFavorite");
                ImageButton ib2 = (ImageButton)GridViewSongs.Rows[i].FindControl("ImageButtonLike");
                ImageButton ib3 = (ImageButton)GridViewSongs.Rows[i].FindControl("ImageButtonDislike");
                ib.Enabled = false;
                ib2.Enabled = false;
                ib3.Enabled = false;
            }
            GridViewSongs.ShowFooter = false;
            GridViewSongs.Columns[10].Visible = false;
            GridViewSongs.Columns[11].Visible = false;
            GridViewSongs.DataBind();
        }

    }
    protected void FillPlaylistGV()
    {
        ClassUsers cs = (ClassUsers)Session["User"];
        DataTable dt = ClassSongsForUsers.GetAllPlaylistsByUserID(cs.UserID);
        GridViewPlayList.DataSource = dt;
        GridViewPlayList.DataBind();
    }
    protected void GridViewSongs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "ButtonImage")
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("LogIn.aspx");
                }
                ClassUsers user = (ClassUsers)Session["User"];
                string userid = user.UserID;
                string songid = e.CommandArgument.ToString();
                ClassSongsForUsers csfu = new ClassSongsForUsers();
                csfu.PlaylistName = "Favorite";
                csfu.SongID = songid;
                csfu.UserID = userid;
                LabelError.Text = csfu.Insert();
            }
            else if (e.CommandName == "Insert")
            {
                TextBox name = (TextBox)GridViewSongs.FooterRow.FindControl("TextBoxInsertSong");
                TextBox artist = (TextBox)GridViewSongs.FooterRow.FindControl("TextBoxInsertArtist");
                TextBox link = (TextBox)GridViewSongs.FooterRow.FindControl("TextBoxInsertYouTubeLink");
                TextBox album = (TextBox)GridViewSongs.FooterRow.FindControl("TextBoxInsertAlbum");
                FileUpload FileUploadImageOfArtist = (FileUpload)GridViewSongs.FooterRow.FindControl("FileUploadImageOfArtist");
                string strRealPath = Request.PhysicalApplicationPath;
                string strPicPath = "";
                strRealPath += "Images\\";
                if (FileUploadImageOfArtist.HasFile)
                {
                    // هل المجلد الذي نريد حفظ الملفات فيه موجود؟
                    if (!System.IO.Directory.Exists(strRealPath))
                    {
                        LabelError.Text = "Images directory does not exist";
                        return;
                    }
                    else if (FileUploadImageOfArtist.PostedFile.ContentLength < 100000000)
                    {
                        // هل يوجد ملف بهذا الاسم في مجلد حفظ الملفات؟
                        if (System.IO.File.Exists(strRealPath + FileUploadImageOfArtist.FileName))
                        {
                            LabelError.Text = "A pic with this name already exists";
                            return;
                        }
                        else
                        {
                            FileUploadImageOfArtist.SaveAs(strRealPath + FileUploadImageOfArtist.FileName);
                            strPicPath = "Images/" + FileUploadImageOfArtist.FileName.ToString();
                        }
                    }
                    else
                    {
                        LabelError.Text = "Image too big to upload";
                        return;
                    }
                }
                else
                {
                    LabelError.Text = "Please Upload a Pic";
                }
                DropDownList rate = (DropDownList)GridViewSongs.FooterRow.FindControl("DropDownListRate");

                ClassSongs cs = new ClassSongs();
                cs.Album = album.Text;
                cs.ImageOfArtist = strPicPath;
                cs.SongArtist = artist.Text;
                cs.SongName = name.Text;
                cs.SongRate = rate.SelectedItem.Text;
                cs.YouTubeLink = link.Text;

                string str = cs.Insert();
                if (!str.Equals(string.Empty))
                {
                    LabelError.Text = str;
                }
                else
                {
                    FillGridView();
                }

            }
            else if (e.CommandName == "AddToPlaylist")
            {
                if (Session["User"] != null)
                {
                    ViewState["SongID"] = e.CommandArgument.ToString();
                    FillPlaylistGV();
                }

            }
            else if (e.CommandName == "Like")
            {
                ClassUsers user = (ClassUsers)Session["User"];
                string song = e.CommandArgument.ToString();
                ClassLikes cl = new ClassLikes();
                cl.SongID = song;
                cl.UserID = user.UserID;
                cl.IsLiked = "yes";
                string str;
                if (cl.RatedBefore())
                {
                    str = cl.Update();
                }
                else
                    str = cl.Insert();
                if (!str.Equals(string.Empty))
                {
                    LabelError.Text = str;
                }
            }
            else if (e.CommandName == "Dislike")
            {
                ClassUsers user = (ClassUsers)Session["User"];
                string song = e.CommandArgument.ToString();
                ClassLikes cl = new ClassLikes();
                cl.SongID = song;
                cl.UserID = user.UserID;
                cl.IsLiked = "no";
                string str;
                if (cl.RatedBefore())
                {
                    str = cl.Update();
                }
                else
                    str = cl.Insert();
                if (!str.Equals(string.Empty))
                {
                    LabelError.Text = str;
                }
            }
            else if (e.CommandName == "Delete")
            {
                string id = e.CommandArgument.ToString();
                ClassSongs cs = ClassSongs.GetByID(id);
                if (!cs.Delete().Equals(string.Empty))
                {
                    LabelError.Text = "There must be some kind of problem";
                }
                else
                {
                    string strPath = Request.PhysicalApplicationPath;
                    System.IO.File.Delete(strPath+cs.ImageOfArtist);
                }
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void GridViewSongs_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewSongs.EditIndex = e.NewEditIndex;
        FillGridView();
    }
    protected void GridViewSongs_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox SongName =(TextBox) GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("TextBoxEditSongName");
        Label SongID = (Label)GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("TextBoxSongID");
        TextBox SongArtist = (TextBox)GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("TextBoxEditSongArtist");
        TextBox YouTubeLink = (TextBox)GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("TextBoxEditYouTubeLink");
        DropDownList Rate = (DropDownList)GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("DropDowListEditRate");
        TextBox Album = (TextBox)GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("TextBoxEditAlbum");
        FileUpload Image = (FileUpload)GridViewSongs.Rows[GridViewSongs.EditIndex].FindControl("FileUploadEditImage");
        ClassSongs cs = new ClassSongs();
        cs.Album = Album.Text;
        cs.SongArtist = SongArtist.Text;
        cs.SongID = SongID.Text;
        cs.SongName = SongName.Text;
        cs.SongRate = Rate.SelectedItem.Text.ToString();
        cs.YouTubeLink = YouTubeLink.Text;
        string strRealPath = Request.PhysicalApplicationPath;
        string strPicPath = "";
        strRealPath += "Images\\";
        if (Image.HasFile)
        {
            // هل المجلد الذي نريد حفظ الملفات فيه موجود؟
            if (!System.IO.Directory.Exists(strRealPath))
            {
                LabelError.Text = "Images directory does not exist";
                return;
            }
            else if (Image.PostedFile.ContentLength < 100000000)
            {
                // هل يوجد ملف بهذا الاسم في مجلد حفظ الملفات؟
                if (System.IO.File.Exists(strRealPath + Image.FileName))
                {
                    LabelError.Text = "A pic with this name already exists";
                    return;
                }
                else
                {
                    Image.SaveAs(strRealPath + Image.FileName);
                    strPicPath = "Images/" + Image.FileName.ToString();
                }
            }
            else
            {
                LabelError.Text = "Image too big to upload";
                return;
            }
        }
        else
        {
            ClassSongs css = ClassSongs.GetByID(SongID.Text);
            cs.ImageOfArtist = css.ImageOfArtist;
        }
        if (!cs.Update().Equals(string.Empty))
        {
            LabelError.Text = "There Must be some kind of probelm";
        }

    }
    protected void GridViewSongs_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
    }

     //*****************************OtherGridView******************************//

    protected void GridViewPlayList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "InsertPlaylist")
            {
                ClassUsers CU = (ClassUsers)Session["User"];
                string songid = ViewState["SongID"].ToString();
                string playlistname = e.CommandArgument.ToString();
                ClassSongsForUsers playlist = new ClassSongsForUsers();
                playlist.UserID = CU.UserID;
                playlist.SongID = songid;
                playlist.PlaylistName = playlistname;
                string str = playlist.Insert();
                if (!str.Equals(string.Empty))
                    LabelError.Text = str;
                else Response.Redirect("OurSongs.aspx");
            }
            if (e.CommandName == "Insert")
            {
                ClassUsers CU = (ClassUsers)Session["User"];
                string songid = ViewState["SongID"].ToString();
                TextBox playlistname = (TextBox)GridViewPlayList.FooterRow.FindControl("TextBoxNewPlaylist");
                ClassSongsForUsers playlist = new ClassSongsForUsers();
                playlist.UserID = CU.UserID;
                playlist.SongID = songid;
                playlist.PlaylistName = playlistname.Text;
                string str = playlist.Insert();
                if (!str.Equals(string.Empty))
                    LabelError.Text = str;
                else Response.Redirect("OurSongs.aspx");
            }
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
        }
    }


    protected void GridViewSongs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewSongs.EditIndex = -1;
        FillGridView();
    }
}