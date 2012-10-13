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

public partial class SendMess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.ToString().Contains("login"))
            {
                if (Membership.GetUser(Request.QueryString["login"].ToString()) != null)
                { lbLogin.Text = string.Format("Сообщение для <b>{0}</b>", Request.QueryString["login"].ToString()); }
                else { Session.Contents["result"] = "prof"; Response.Redirect("profRes.aspx", true); }
            }
            else { Session.Contents["result"] = "prof"; Response.Redirect("profRes.aspx", true); }

            if (Page.User.Identity.IsAuthenticated)
            { tbEmail.Text = Membership.GetUser(Page.User.Identity.Name).Email; }
            Body.Attributes.Add("onload", "charLeft(document.getElementById('tbText'), 'charLeftSpan')");
            btnClose.Attributes.Add("onclick", "javascript:window.close(); return false;");
            tbAntiBot.Attributes.Add("onfocus", "javascript:document.getElementById('lbAntiBot').style.display = 'none';");
            tbText.Attributes.Add("onkeydown", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan')");
            tbText.Attributes.Add("onkeypress", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan');");
            tbText.Attributes.Add("onkeyup", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan');");
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (tbAntiBot.Text == Session.Contents["AntiBotMess"].ToString())
        {
            if (lbLogin.Text != string.Empty)
            {
                DBAccesser.InsertPrivMess(Request.QueryString["login"].ToString(), tbEmail.Text, tbText.Text);
                Changer.SendPrivMess(Request.QueryString["login"].ToString(), tbEmail.Text, tbText.Text);
                Session.Contents["result"] = "prof"; Response.Redirect("profRes.aspx?type=send", true);
            }
        }
        else
        {
            tbAntiBot.Text = string.Empty;
            lbAntiBot.Text = "<br />Неверный анти-бот код";
            lbAntiBot.Visible = true;
        } 
    }
}
