using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButtonEditMyDetails_Click(object sender, EventArgs e)
    {
        ClassUsers cu = (ClassUsers)Session["User"];
        Response.Redirect("SignUp.aspx?UserID="+cu.UserID);
    }
}