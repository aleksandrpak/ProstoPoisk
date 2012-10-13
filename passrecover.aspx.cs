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

public partial class passrecover : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ((Button)prMain.Controls[0].FindControl("CancelButton")).Attributes.Add("onclick", "javascript:window.close(); return false;");
            ((Button)prMain.Controls[1].FindControl("CancelButton")).Attributes.Add("onclick", "javascript:window.close(); return false;");
            ((Button)prMain.Controls[2].FindControl("CancelButton")).Attributes.Add("onclick", "javascript:window.close(); return false;");            
        }
        if (((TextBox)prMain.Controls[0].FindControl("UserName")).Text != string.Empty)
        { ((Label)prMain.Controls[1].FindControl("lbUserName")).Text = Membership.GetUserNameByEmail(Membership.GetUser(((TextBox)prMain.Controls[0].FindControl("UserName")).Text).Email); }
    }

    protected void prMain_OnSendingMail(object sender, MailMessageEventArgs e)
    {         
        string name = e.Message.Body.Remove(0, e.Message.Body.IndexOf("User Name:") + 11);
        name = name.Remove(name.IndexOf("Password:")-1);
        string pwd = e.Message.Body.Remove(0, e.Message.Body.IndexOf("Password:") + 10);
        pwd = pwd.Remove(pwd.Length - 2);
        string to = e.Message.To.ToString();
        e.Cancel = true;

        Changer.SendNewPwd(name, pwd, to);
    }
}
