using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataList();
            //       SetLinkButtons();
        }
    }
    private void FillDataList()
    {
        ClassUsers cu = (ClassUsers)Session["User"];
        ClassMessages cm = new ClassMessages();
        cm.ToUserID = cu.UserID;
        ClassMessages[] acm = cm.GetallMessagesForUser();
        if (acm == null)
        {
            LabelError.Text = "You Don't Have Any Message.";
        }
        else
        {
            for (int i = 0; i < acm.Length; i++)
            {
                acm[i].FromUserID = ClassUsers.SelectUser(acm[i].FromUserID).UserFN;
            }
            DataListMessages.DataSource = acm;
            DataListMessages.DataBind();
            for (int j = 0; j < acm.Length; j++)
            {
                LinkButton lb = (LinkButton) DataListMessages.Items[j].FindControl("LinkButtonMarkAs");
                if (acm[j].HasRead.Equals("True"))
                {
                    lb.Text = "Mark As Unread";
                }
                else
                {
                    lb.Text = "Mark As Read";
                }
            }
        }
    }

    protected void DataListMessages_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "OpenMessage")
        {
            string mid = e.CommandArgument.ToString();
            Response.Redirect("CertainMessage.aspx?MessageID=" + mid);
        }
        if (e.CommandName == "Delete")
        {
            string mid = e.CommandArgument.ToString();
            ClassMessages cm = new ClassMessages();
            cm.MessageID = mid;
            LabelError.Text= cm.Delete(); 
        }
        if (e.CommandName == "MarkAs")
        {
            string mid = e.CommandArgument.ToString();
            ClassMessages cm = ClassMessages.GetAllByMessageID(mid);
            string str;
            if (cm.HasRead.Equals("True"))
            {
                cm.HasRead = "Flase";
                str = cm.MarkAs();
                FillDataList();
            }
            else
            {
                cm.HasRead = "True";
                str = cm.MarkAs();
                FillDataList();
            }
            if (!str.Equals(string.Empty))
            {
                LabelError.Text = str;
            }
        }
        
    }

    protected void DataListMessages_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //ClassUsers cu = (ClassUsers)Session["User"];
        //ClassMessages cm = new ClassMessages();
        //cm.ToUserID = cu.UserID;
        //ClassMessages[] acm = cm.GetallMessagesForUser();
        //for (int i = 0; i < acm.Length; i++)
        //{
        //    if (acm[i].HasRead == "True")
        //    {
        //        Button lb = (Button)e.Item.FindControl("ButtonMarkAs");
        //        lb.Text = "Mark As Unread";
        //    }
        //    else
        //    {

        //        Button lb = (Button)e.Item.FindControl("ButtonMarkAs");
        //        lb.Text = "Mark As Read";
        //    }

        //}
    }
    //protected void SetLinkButtons()
    // {
    //     ClassUsers cu = (ClassUsers)Session["User"];
    //     ClassMessages cm = new ClassMessages();
    //     cm.ToUserID = cu.UserID;
    //     ClassMessages[] acm = cm.GetallMessagesForUser();
    //     for (int i = 0; i < acm.Length; i++)
    //     {
    //         if (acm[i].HasRead == "True")
    //         {

    //             LinkButton lb = (LinkButton)DataListMessages.FindControl("LinkButtonMarkAs"); ;
    //             lb.Text = "Mark As Unread";
    //         }
    //         else
    //         {

    //             LinkButton lb = (LinkButton)DataListMessages.FindControl("LinkButtonMarkAs");
    //             lb.Text = "Mark As Read";
    //         }

    //     }
    // }

    protected void DataListMessages_DeleteCommand(object source, DataListCommandEventArgs e)
    {

    }
}