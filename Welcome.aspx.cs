using System;
using System.Data; 
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Name(); 
    }
    protected void Name()
    {
        ClassUsers user = (ClassUsers)Session["User"];
        string name = user.UserFN;
        LabelName.Text =  name + " ,Welcome!!"; 
    }
}