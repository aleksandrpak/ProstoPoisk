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

public partial class myAdver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        { Response.Redirect("Default.aspx", true); }
        Master.Master.Page.Title = "Мои объявления";
        sdsMyAdver.SelectParameters.Add("UserName", Page.User.Identity.Name);

        if (Request.QueryString.ToString().Contains("delete"))
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                DBAccesser.Delete(Request.QueryString["delete"].ToString(),
                    Page.User.Identity.Name,
                    Page.User.IsInRole("admin"),
                    Server.MapPath("Images/adver/"));
                Response.Redirect("myAdver.aspx", true);
            }
        }
    }

    protected void gvMyAdver_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("lbAdverID") != null & e.Row.FindControl("lbTitle") != null &
            e.Row.FindControl("lbText") != null & e.Row.FindControl("lbMainText") != null &
            e.Row.FindControl("lbTelephone") != null & e.Row.FindControl("lbPrice") != null &
            e.Row.FindControl("lbPhoto") != null & e.Row.FindControl("lbMoney") != null)
        {
            Hashtable ht = new Hashtable();
            ht.Add("ID", ((Label)e.Row.FindControl("lbAdverID")).Text);
            ht.Add("Title", ((Label)e.Row.FindControl("lbTitle")).Text);            
            ht.Add("Text", ((Label)e.Row.FindControl("lbText")).Text);
            ht.Add("Tel", ((Label)e.Row.FindControl("lbTelephone")).Text);
            ht.Add("Price", ((Label)e.Row.FindControl("lbPrice")).Text);
            ht.Add("Photo", ((Label)e.Row.FindControl("lbPhoto")).Text);
            ht.Add("Money", ((Label)e.Row.FindControl("lbMoney")).Text);
            ht.Add("Login", Page.User.Identity.Name);
            ht.Add("cat", string.Empty);
            ht.Add("UserName", Page.User.Identity.Name);
            ht.Add("admin", Page.User.IsInRole("admin"));
            ht.Add("office", string.Empty);

            ((Label)e.Row.FindControl("lbMainText")).Text = Changer.AdverText(ht);

            ((Label)e.Row.FindControl("lbAdverID")).Visible = false;
            ((Label)e.Row.FindControl("lbTitle")).Visible = false;            
            ((Label)e.Row.FindControl("lbText")).Visible = false;
            ((Label)e.Row.FindControl("lbTelephone")).Visible = false;
            ((Label)e.Row.FindControl("lbPrice")).Visible = false;
            ((Label)e.Row.FindControl("lbPhoto")).Visible = false;
            ((Label)e.Row.FindControl("lbMoney")).Visible = false;
        }

        if (e.Row.FindControl("lbDate") != null)
        {
            ((Label)e.Row.FindControl("lbDate")).Text = Changer.FormatDate(Convert.ToDateTime(((Label)e.Row.FindControl("lbDate")).Text));
        } 
    }
}
