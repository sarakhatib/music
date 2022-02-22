using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CertainMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillLabels();
        }
    }
    private void FillLabels()
    {
        string messageid = Request.QueryString["MessageID"];
        ClassMessages cm = ClassMessages.GetAllByMessageID(messageid);
        LabelTime.Text = cm.SentTime;
        ClassUsers cuto = ClassUsers.SelectUser(cm.ToUserID);
        LabelUserIDTo.Text = cuto.UserFN;
        cuto = ClassUsers.SelectUser(cm.FromUserID);
        LabelUserIDFrom.Text = cuto.UserFN;
        TextBoxMessage.Text = cm.Message;
        TextBoxSubject.Text = cm.Subject;
    }
    protected void ButtonResponse_Click(object sender, EventArgs e)
    {
        string messageid = Request.QueryString["MessageID"];
        ClassMessages cm = ClassMessages.GetAllByMessageID(messageid);
        ClassUsers cuto = ClassUsers.SelectUser(cm.FromUserID);
        Response.Redirect("WriteMessage.aspx?ToUserID="+cuto.UserID);
    }
    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        string messageid = Request.QueryString["MessageID"];
        ClassMessages cm = new ClassMessages();
        cm.MessageID = messageid;
        string str = cm.Delete();
        if (!str.Equals(string.Empty))
        {
            LabelError.Text = str;
        }
    }
}