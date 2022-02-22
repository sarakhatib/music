using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ValidUser"] != null && Session["ValidUser"].ToString() == "yes")
        {
            AddNotes();
            SetCheckBoxesAndLinkButtons();
        }
        else Response.Redirect("LogIn.aspx");
    }
    protected void AddNotes()
    {
        try
        {
            ClassNotes[] A = ClassNotes.GetAll();
            GridViewNotes.DataSource = A;
            GridViewNotes.DataBind();
        }
        catch (Exception ex)
        {
            LabelERROR.Text = ex.Message;
        }

    }

    protected void GridViewNotes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "MarkAs")
        {
            string noteid = e.CommandArgument.ToString();
            ClassNotes cn = ClassNotes.ByNoteID(noteid);
            string str;
            if (cn.Read.Equals("True"))
            {
                cn.Read = "False";
                str = cn.UpdateRead();
            }
            else
            {
                cn.Read = "True";
                str = cn.UpdateRead();
            }
            if (!str.Equals(string.Empty))
            {
                LabelERROR.Text = str;
            }

        }
        AddNotes();
        SetCheckBoxesAndLinkButtons();
    }
    protected void SetCheckBoxesAndLinkButtons()
    {
        ClassNotes[] A = ClassNotes.GetAll();
        for (int i = 0; i < A.Length; i++)
        {
            if (A[i].Read == "True")
            {
                CheckBox cb = (CheckBox)GridViewNotes.Rows[i].FindControl("CheckBoxRead");
                cb.Checked = true;
                LinkButton lb = (LinkButton)GridViewNotes.Rows[i].FindControl("LinkButtonMarkAs");
                lb.Text = "Mark As Unread";
            }
            else
            {
                CheckBox cb = (CheckBox)GridViewNotes.Rows[i].FindControl("CheckBoxRead");
                cb.Checked = false;
                LinkButton lb = (LinkButton)GridViewNotes.Rows[i].FindControl("LinkButtonMarkAs");
                lb.Text = "Mark As Read";
            }

        }
    }
    protected void GridViewNotes_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label noteid = (Label)GridViewNotes.Rows[e.RowIndex].FindControl("LabelNoteID");
        ClassNotes cn = new ClassNotes();
        cn.NoteID = noteid.Text;
        string str = cn.Delete();
        if (!str.Equals(string.Empty))
        {
            LabelERROR.Text = str;
        }
        AddNotes();
    }
}