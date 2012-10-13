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

public partial class Friend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.ToString().Contains("id"))
            {
                if (DBAccesser.NotNullID(Request.QueryString["id"].ToString()))
                { lbAdver.Text = string.Format("<b>{0}</b>", DBAccesser.GetTitle(Request.QueryString["id"].ToString())); }
                else { Session.Contents["result"] = "error"; Response.Redirect("sendResult.aspx?type=error", true); }
            }
            else { Session.Contents["result"] = "error"; Response.Redirect("sendResult.aspx?type=error", true); }

            if (Page.User.Identity.IsAuthenticated)
            { tbEmail.Text = Membership.GetUser(Page.User.Identity.Name).Email; }
            Body.Attributes.Add("onload", "charLeft(document.getElementById('tbText'), 'charLeftSpan', 600)");
            btnClose.Attributes.Add("onclick", "javascript:window.close(); return false;");
            tbAntiBot.Attributes.Add("onfocus", "javascript:document.getElementById('lbAntiBot').style.display = 'none';");
            tbText.Attributes.Add("onkeydown", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan', 600)");
            tbText.Attributes.Add("onkeypress", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan', 600);");
            tbText.Attributes.Add("onkeyup", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan', 600);");
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (tbAntiBot.Text == Session.Contents["AntiBotFrnd"].ToString())
        {            
            if (lbAdver.Text != string.Empty)
            {
                Changer.SendToFrnd(Request.QueryString["id"].ToString(), tbName.Text,
                    tbEmail.Text, tbFrndName.Text, tbFrndEmail.Text, tbText.Text);
                Session.Contents["result"] = "send"; Response.Redirect("sendResult.aspx", true);
            }
        }
        else
        {
            tbAntiBot.Text = string.Empty;
            lbAntiBot.Text = "Неверный анти-бот код";
            lbAntiBot.Visible = true;
        } 
    }
}
