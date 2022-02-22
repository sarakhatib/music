using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WriteMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDropDownList();
        }
    }
    protected void FillDropDownList()
    {
        ClassUsers[] cu = ClassUsers.GetAll();
        if (Request.QueryString["ToUserID"] != null)
        {
            string userid = Request.QueryString["ToUserID"].ToString();
            ClassUsers acu = ClassUsers.SelectUser(userid);
            DropDownListUsers.Items.Add(new ListItem(acu.UserFN, acu.UserID));
        }
        else
        {
            DropDownListUsers.Items.Add(new ListItem("Send the message to:", "-1"));
            for (int i = 0; i < cu.Length; i++)
            {
                DropDownListUsers.Items.Add(new ListItem(cu[i].UserFN, cu[i].UserID));
            }
        }
    }
    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        string strSubj = TextBoxSubject.Text;
        string strMess = TextBoxMessage.Text;
        string userid = DropDownListUsers.SelectedValue.ToString();
        DateTime sent = DateTime.Now;
        string hasread = "False";
        ClassUsers from = (ClassUsers)Session["User"];

        ClassMessages cm = new ClassMessages();
        cm.HasRead = hasread;
        cm.FromUserID = from.UserID;
        cm.SentTime = sent.ToString();
        cm.Subject = strSubj;
        cm.ToUserID = userid;
        cm.Message = strMess;

        string strERROR = cm.Insert();
        if (!strERROR.Equals(string.Empty))
        {
            LabelError.Text = strERROR;
        }
        else
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserProfile.aspx");
    }
}