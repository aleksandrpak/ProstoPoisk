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

public partial class main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbDate.Text = Changer.Date;
            lbWeather.Text = Changer.Weather;
            lbDollar.Text = Changer.Dollar;
            lbEuro.Text = Changer.Euro;


            if (tvNavigation.SelectedNode != null)
            {
                string s = tvNavigation.SelectedNode.Text;
                if (tvNavigation.SelectedNode.Text.Contains("<br />"))
                {
                    s = s.Replace("<br />", " ");
                }
                Page.Title = string.Format("prostopoisk.uz: {0} / {1}",
                tvNavigation.SelectedNode.Parent.Text, s);
            }

            if (Page.User.Identity.IsAuthenticated)
            {
                Hashtable ht = DBAccesser.UserName(Page.User.Identity.Name);
                if (ht["LastName"].ToString() != string.Empty & ht["FirstName"].ToString() != string.Empty)
                {
                    ((Label)lvMain.Controls[0].Controls[1]).Text =
                        string.Format("Здравствуйте, {0} {1}!",
                        ht["LastName"].ToString(), ht["FirstName"].ToString());
                }
                else if (ht["LastName"].ToString() != string.Empty & ht["FirstName"].ToString() == string.Empty)
                {
                    ((Label)lvMain.Controls[0].Controls[1]).Text =
                        string.Format("Здравствуйте, {0}!", ht["LastName"].ToString());
                    hlOffice.NavigateUrl = "office.aspx";
                }
                else if (ht["LastName"].ToString() == string.Empty & ht["FirstName"].ToString() != string.Empty)
                {
                    ((Label)lvMain.Controls[0].Controls[1]).Text =
                        string.Format("Здравствуйте, {0}!", ht["FirstName"].ToString());
                    hlOffice.NavigateUrl = "office.aspx";
                }
                else
                {
                    ((Label)lvMain.Controls[0].Controls[1]).Text =
                 string.Format("Здравствуйте, {0}!", Membership.GetUserNameByEmail(Membership.GetUser(Request.QueryString["login"].ToString()).Email));
                }
                hlOffice.NavigateUrl = "office.aspx";
            }
            else
            {
                hlOffice.Attributes.Add("onclick", "javascript:document.getElementById('login').style.display = 'block'; document.getElementById('ctl00_searchPanel').style.display = 'none'");
                hlReg.Attributes.Add("onclick", "javascript:window.open('Registration.aspx', 'RegistrationWindow', 'height=330,width=410'); return false;");
            }

            ((Button)lgnMain.Controls[0].FindControl("CancelButton")).Attributes.Add("onclick", "javascript:document.getElementById('login').style.display = 'none'; return false;");
            hlSearch.Attributes.Add("onclick", "document.getElementById('ctl00_searchPanel').style.display = (document.getElementById('ctl00_searchPanel').style.display == 'none') ? '' : 'none'; document.getElementById('login').style.display = 'none'; return false;");
            DBAccesser.Regions(ddlRegion);
        }
    }

    protected void lgnMain_LoginError(object sender, EventArgs e)
    {
        Body.Attributes.Add("onload", "javascript:document.getElementById('login').style.display = 'block';");
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        string s = string.Empty;

        s += "search=" + tbSearch.Text;
        if (ddlType.SelectedValue != string.Empty)
        { s += "&type=" + ddlType.SelectedValue; }
        if (ddlRegion.SelectedValue != string.Empty)
        { s += "&region=" + ddlRegion.SelectedValue; }
        if (ddlCat.SelectedValue != string.Empty)
        { s += "&cat=" + ddlCat.SelectedValue; }
        if (tbStartPrice.Text != string.Empty)
        { s += "&stPrice=" + tbStartPrice.Text; }
        if (tbEndPrice.Text != string.Empty)
        { s += "&endPrice=" + tbEndPrice.Text; }
        if (ddlMoney.SelectedValue != string.Empty &
            (tbStartPrice.Text != string.Empty | tbEndPrice.Text != string.Empty))
        { s += "&money=" + ddlMoney.SelectedValue; }

        Response.Redirect("Default.aspx?" + s, true);
    }
}