using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UsersEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ValidUser"] == null || Session["ValidUser"].ToString().Equals("no"))
        {
            Response.Redirect("LogIn.aspx");
        }
        if (!IsPostBack)
        {
            FillDataListUsers();
        }


    }
    private void FillDataListUsers()
    {
        ClassUsers[] CUA = ClassUsers.GetAll();
        DataListUsers.DataSource = CUA;
        DataListUsers.DataBind();

    }
    protected void DataListUsers_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        int editx = DataListUsers.EditItemIndex;
        Label UID = (Label)e.Item.FindControl("LabelUserIDEdit");
        TextBox UNN = (TextBox)e.Item.FindControl("TextBoxUserNickname");
        TextBox UPW = (TextBox)e.Item.FindControl("TextBoxPassWord");
        TextBox UFN = (TextBox)e.Item.FindControl("TextBoxUserFN");
        TextBox ULN = (TextBox)e.Item.FindControl("TextBoxUserLN");
        TextBox UDOB = (TextBox)e.Item.FindControl("TextBoxDOB");
        TextBox UEM = (TextBox)e.Item.FindControl("TextBoxEmail");
        TextBox UG = (TextBox)e.Item.FindControl("TextBoxUserGroup");

        ClassUsers obj = new ClassUsers();
        obj.UserID = UID.Text;
        obj.UserNickname = UNN.Text;
        obj.PassWord = UPW.Text;
        obj.UserFN = UFN.Text;
        obj.UserLN = ULN.Text;
        obj.DOB = UDOB.Text;
        obj.Email = UEM.Text;
        obj.UserGroup = UG.Text;

        if (obj.Update().ToString().Equals(string.Empty))
        {
            LabelError.Text = "Updated Successfully!";
            DataListUsers.EditItemIndex = -1;
            FillDataListUsers();
        }
        else
        {
            LabelError.Text = "There seems to be a problem.";
        }
    }
    protected void DataListUsers_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {

            TextBox UNN = (TextBox)e.Item.FindControl("TextBoxUserNicknameInsert");
            TextBox UPW = (TextBox)e.Item.FindControl("TextBoxPassWordInsert");
            TextBox UFN = (TextBox)e.Item.FindControl("TextBoxUserFNInsert");
            TextBox ULN = (TextBox)e.Item.FindControl("TextBoxUserLNInsert");
            TextBox UDOB = (TextBox)e.Item.FindControl("TextBoxDOBInsert");
            TextBox UEM = (TextBox)e.Item.FindControl("TextBoxEmailInsert");
            TextBox UG = (TextBox)e.Item.FindControl("TextBoxUserGroupInsert");

            ClassUsers obj = new ClassUsers();
            //obj.UserID = UID.Text;
            obj.UserNickname = UNN.Text;
            obj.PassWord = UPW.Text;
            obj.UserFN = UFN.Text;
            obj.UserLN = ULN.Text;
            obj.DOB = UDOB.Text;
            obj.Email = UEM.Text;
            obj.UserGroup = UG.Text;

            if (obj.Insert().ToString().Equals(string.Empty))
            {
                LabelError.Text = "Inserted Successfully!";
                FillDataListUsers();
            }
            else
            {
                LabelError.Text = "There seems to be a problem.";
            }
        }
    }
    protected void DataListUsers_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataListUsers.EditItemIndex = e.Item.ItemIndex;
        FillDataListUsers();
    }

    protected void DataListUsers_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        Label UID = (Label)e.Item.FindControl("LabelUserID");
        ClassUsers obj = new ClassUsers();
        obj.UserID = UID.Text;
        if (obj.Delete().ToString().Equals(string.Empty))
        {
            LabelError.Text = "Deleted Successfully!";
            FillDataListUsers();
        }
        else
        {
            LabelError.Text = "There seems to be a problem.";
        }
    }
    protected void DataListUsers_CancelCommand1(object source, DataListCommandEventArgs e)
    {
        DataListUsers.EditItemIndex = -1;
        FillDataListUsers();
    }
}
