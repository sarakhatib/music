using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MutualSongs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGV();
            FillLabelWithNames();
        }
    }
    protected void FillGV()
    {
        ClassUsers id2 = (ClassUsers)Session["Friend"];
        ClassUsers user = (ClassUsers)Session["User"];
        ClassSongsForUsers obj = new ClassSongsForUsers();
        obj.UserID = user.UserID;
        ClassSongs[] mutual = obj.GetMutualSongs(id2.UserID);
        mutual = DistinctSongs(mutual);
        GridViewMutualSongs.DataSource = mutual;
        GridViewMutualSongs.DataBind();
        if (mutual == null)
        {
            LabelError.Text = "No Songs In Common";
        }
    }
    protected ClassSongs[] RemoveNulls(ClassSongs[] mut)
    {
        int cnt = 0;
        for (int i = 0; i < mut.Length; i++)
        {
            if (mut[i] != null)
                cnt++;
        }
        ClassSongs[] mut2 = new ClassSongs[cnt];
        int j = 0;
        for (int i = 0; i < mut.Length; i++)
        {
            if (mut[i] != null)
            {
                mut2[j]=mut[i];
                j++;
            }
        }
        return mut2;
    }
    protected ClassSongs[] DistinctSongs(ClassSongs[] mut)
    {
        ClassSongs[] mut2 = RemoveNulls(mut);
        for (int i = 0; i < mut2.Length; i++)
        {
            for (int j = i; j < mut2.Length; j++)
            {
                if ((i != j) && (mut2[i].SongID == mut2[j].SongID))
                {
                    mut2[i].SongID = "-1"; 
                }
            }
        }
        for (int k = 0; k < mut2.Length; k++)
        {
            if (mut2[k].SongID.Equals("-1"))
            {
                mut2[k] = null;
            }
        }
        mut2 = RemoveNulls(mut2);
        return mut2;
    }
    protected void FillLabelWithNames()
    {
        ClassUsers user1 = (ClassUsers)Session["User"];
        ClassUsers user2 = (ClassUsers)Session["Friend"];
        LabelUserNames.Text = "Here Are The Songs That "+user1.UserFN +" And "+user2.UserFN +" Have In Common.";
    }


}