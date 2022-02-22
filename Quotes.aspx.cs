using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Quotes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataList(0);
        }
    }
    public void FillDataList(int i)
    {
        if (i == 0)
        {
            localhost.WSQuote q = new localhost.WSQuote();
            DataListQuotes.DataSource = q.NowQuote();
            DataListQuotes.DataBind();

        }
        else
        {
            localhost.WSQuote q = new localhost.WSQuote();
            DataListQuotes.DataSource = q.GetAllQuotes();
            DataListQuotes.DataBind();

        }
    }
    protected void LinkButtonGetAllQuotes_Click(object sender, EventArgs e)
    {
        FillDataList(1);
    }
}