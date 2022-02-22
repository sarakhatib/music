using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactUs.aspx");
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        try
        {


            ClassNotes obj = new ClassNotes();
            obj.Note = TextBoxNote.Text;
            obj.Subject = TextBoxSubject.Text;
            obj.Read = "False";
            if (!obj.Insert().Equals(string.Empty))
            {
                LabelERROR.Text = "There must be some kind of problem";
            }
            else Response.Redirect("Default.aspx");
        }
        catch (Exception ex)
        {
            LabelERROR.Text = ex.Message;
        }
    }
}