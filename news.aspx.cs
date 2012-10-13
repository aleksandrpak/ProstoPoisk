using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.IsInRole("admin"))
        { hlAdd.Visible = true; }
        Master.Page.Title = "Новости";
    }

    protected void gvNews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("hlDetal") != null)
        {
            ((HyperLink)e.Row.FindControl("hlDetal")).NavigateUrl = 
                string.Format("newsDetal.aspx?id={0}", ((HyperLink)e.Row.FindControl("hlDetal")).NavigateUrl);
        }
        if (e.Row.FindControl("btnDelete") != null)
        {
            if (Page.User.IsInRole("admin"))
            { ((LinkButton)e.Row.FindControl("btnDelete")).Visible = true; }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        sdsNews.DeleteParameters.Add("newsID", 
            gvNews.DataKeys[((GridViewRow)((LinkButton)sender).Parent.Parent).RowIndex].Value.ToString());
        sdsNews.Delete();
    }
}
