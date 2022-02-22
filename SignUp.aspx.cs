using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillYearsDDL();
            FillMonthsDDL();
            FillDaysDDL();
            FillControls();
        }
    }
    public void FillMonthsDDL()
    {
        DropDownListMonth.Items.Clear();
        for (int i = 1; i <= 12; i++)
            DropDownListMonth.Items.Add(i.ToString());
    }
    public void FillYearsDDL()
    {
        DropDownListYear.Items.Clear();
        for (int i = 1965; i <= 2016; i++)
            DropDownListYear.Items.Add(i.ToString());
    }
    public void FillDaysDDL()
    {
        int month = int.Parse(DropDownListMonth.SelectedValue.ToString());
        int year = int.Parse(DropDownListYear.SelectedValue.ToString());
        int days = GetNumOfDays(month, year);
        DropDownListDay.Items.Clear();
        for (int i = 1; i <= days; i++)
            DropDownListDay.Items.Add(i.ToString());
    }
    public int GetNumOfDays(int month, int year)
    {
        switch (month)
        {
            case 1:
                return 31;
            case 2:
                if (LeapYear(year))
                    return 29;
                else return 28;
            case 3:
                return 31;
            case 4:
                return 30;
            case 5:
                return 31;
            case 6:
                return 31;
            case 7:
                return 30;
            case 8:
                return 31;
            case 9:
                return 30;
            case 10:
                return 31;
            case 11:
                return 30;
            case 12:
                return 31;


        }
        return 0;
    }
    public bool LeapYear(int year)
    {
        return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
    }
    protected void DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDaysDDL();
    }
    protected void FillControls()
    {
        if (Request.QueryString["UserID"] != null)
        {
            string userid = Request.QueryString["UserID"].ToString();
            ClassUsers cu = ClassUsers.SelectUser(userid);
            LabelID.Text = userid;
            LabelUser.Text = cu.UserFN;
            TextBoxEmail.Text = cu.Email;
            TextBoxFirstName.Text = cu.UserFN;
            TextBoxLastName.Text = cu.UserLN;
            TextBoxPassword.Text = cu.PassWord;
            TextBoxUserNickname.Text = cu.UserNickname;
        }
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("UsersEditor.aspx");
    }
    protected void Save_Click(object sender, EventArgs e)
    {

        ClassUsers obj = new ClassUsers();

        obj.UserNickname = TextBoxUserNickname.Text;
        obj.UserFN = TextBoxFirstName.Text;
        obj.UserLN = TextBoxLastName.Text;
        obj.DOB = DropDownListDay.SelectedItem.Text.ToString() + "/" +
            DropDownListMonth.SelectedItem.Text.ToString() + "/"
            + DropDownListYear.SelectedItem.Text.ToString(); ;
        obj.PassWord = TextBoxPassword.Text;
        obj.Email = TextBoxEmail.Text;
        if (Request.QueryString["UserID"] != null)
        {
            obj.UserID = Request.QueryString["UserID"].ToString();
            LabelErrors.Text += obj.Update();
            if (LabelErrors.Text == "")
            {
                Response.Redirect("Default.aspx");
            }
        }

        else
        {
            obj.UserGroup = "Guest";
            LabelErrors.Text += obj.Insert();
            if (LabelErrors.Text == "")
            {
                Session["ValidUser"] = "yes";
                Session["User"] = obj;
                Session["LogInTime"] = DateTime.Now;
                Response.Redirect("Welcome.aspx"); ;
            }
        }

    }

}