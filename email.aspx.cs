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

public partial class email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        { Response.Redirect("Default.aspx", true); }
        Master.Master.Page.Title = "Смена e-mail'а";
        NewEmail.Attributes.Add("onfocus", "javascript:document.getElementById('ctl00_ctl00_cphMain_cphOffice_lbPwdError').style.display = 'none';");
        ConfirmNewEmail.Attributes.Add("onfocus", "javascript:document.getElementById('ctl00_ctl00_cphMain_cphOffice_lbPwdError').style.display = 'none';");
        tbPwd.Attributes.Add("onfocus", "javascript:document.getElementById('ctl00_ctl00_cphMain_cphOffice_lbPwdError').style.display = 'none';");
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            if (Membership.GetUser(Page.User.Identity.Name).ChangePassword(tbPwd.Text, tbPwd.Text))
            {
                if (Membership.FindUsersByEmail(NewEmail.Text).Count == 0)
                {
                    DBAccesser.ChangeEmail(Membership.GetUser(
                        Page.User.Identity.Name).Email, NewEmail.Text, NewEmail.Text.ToLower());
                    Response.Redirect("office.aspx", true);
                }
                else
                {
                    lbPwdError.Text = "Этот e-mail уже занят";
                    lbPwdError.Visible = true;
                }
            }
            else { lbPwdError.Visible = true; }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    { Response.Redirect("office.aspx", true); }
}
