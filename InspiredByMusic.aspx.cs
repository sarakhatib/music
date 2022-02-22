using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InspiredByMusic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataList();
        }
    }
    public void FillDataList()
    {
        try
        {
            DataTable dt = ClassInspiredByMusic.GetAll();
            DataListInspiredByMusic.DataSource = dt;
            DataListInspiredByMusic.DataBind();
        }
        catch (Exception ex)
        {
            LabelError.Text = ex.Message;
        }
    }
}