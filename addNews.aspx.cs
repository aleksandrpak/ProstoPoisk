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

public partial class addNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated & !Page.User.IsInRole("admin"))
        { Response.Redirect("Default.aspx", true); }
        Master.Page.Title = "Добавление новости";
        ((HtmlControl)Master.FindControl("Body")).Attributes.Add("onload", "javascript:charLeft(document.getElementById('ctl00_cphMain_tbShortText'), 'charLeftSpan', 600);charLeft(document.getElementById('ctl00_cphMain_tbText'), 'charLeftSpanText', 3000)");        
        tbShortText.Attributes.Add("onkeydown", "javascript:charLeft(this, 'charLeftSpan', 600)");
        tbShortText.Attributes.Add("onkeypress", "javascript:charLeft(this, 'charLeftSpan', 600);");
        tbShortText.Attributes.Add("onkeyup", "javascript:charLeft(this, 'charLeftSpan', 600);");
        
        tbText.Attributes.Add("onkeydown", "javascript:charLeft(this, 'charLeftSpanText', 3000)");
        tbText.Attributes.Add("onkeypress", "javascript:charLeft(this, 'charLeftSpanText', 3000);");
        tbText.Attributes.Add("onkeyup", "javascript:charLeft(this, 'charLeftSpanText', 3000);");        
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DBAccesser.InsertNews(tbTitle.Text, tbShortText.Text, tbText.Text);
        Response.Redirect("news.aspx", true);
    }
}
