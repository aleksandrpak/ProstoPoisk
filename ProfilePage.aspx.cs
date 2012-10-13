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

public partial class ProfilePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.ToString().Contains("login"))
        {
            if (Membership.GetUser(Request.QueryString["login"].ToString()) != null)
            {
                string bodyAtt = string.Empty;
                Hashtable ht = DBAccesser.EmailPhoto(Membership.GetUser(Request.QueryString["login"].ToString()).Email);

                lbLoginText.Text = Membership.GetUserNameByEmail(Membership.GetUser(Request.QueryString["login"].ToString()).Email);
                lbRegDateText.Text = Membership.GetUser(Request.QueryString["login"].ToString()).CreationDate.ToString();
                lbLastText.Text = Membership.GetUser(Request.QueryString["login"].ToString()).LastActivityDate.ToString();
                hlSend.NavigateUrl = string.Format("SendMess.aspx?login={0}", Request.QueryString["login"].ToString());

                if (Convert.ToBoolean(ht["hasPhoto"]))
                { photo.ImageUrl = "Images/avatar/" + Request.QueryString["login"].ToString().ToLower() + ".jpg"; }
                if (Convert.ToBoolean(ht["showEmail"]))
                { lbEmailText.Text = Membership.GetUser(Request.QueryString["login"].ToString()).Email; }
                else
                {
                    lbEmail.Visible = false; lbEmailText.Visible = false;
                    bodyAtt += "document.getElementById('email').style.display = 'none';";
                }

                ht = DBAccesser.UserName(Request.QueryString["login"].ToString());
                if (ht["LastName"].ToString() != string.Empty & ht["FirstName"].ToString() != string.Empty)
                { lbNameText.Text = ht["LastName"].ToString() + ht["FirstName"].ToString(); }
                else if (ht["LastName"].ToString() == string.Empty & ht["FirstName"].ToString() != string.Empty)
                { lbNameText.Text = ht["FirstName"].ToString(); }
                else
                { lbName.Visible = false; lbNameText.Visible = false; bodyAtt += "document.getElementById('name').style.display = 'none';"; }

                if (Profile.GetProfile(Request.QueryString["login"].ToString()).Telephone == string.Empty)
                { lbTelephone.Visible = false; lbTelephoneText.Visible = false; bodyAtt += "document.getElementById('tel').style.display = 'none';"; }
                else { lbTelephoneText.Text = Profile.GetProfile(Request.QueryString["login"].ToString()).Telephone; }

                if (Profile.GetProfile(Request.QueryString["login"].ToString()).ICQ == string.Empty)
                { lbIcq.Visible = false; lbIcqText.Visible = false; bodyAtt += "document.getElementById('icq').style.display = 'none';"; }
                else { lbIcqText.Text = Profile.GetProfile(Request.QueryString["login"].ToString()).ICQ; }

                if (bodyAtt != string.Empty)
                {
                    bodyAtt = "javascript:" + bodyAtt;
                    Body.Attributes.Add("onload", bodyAtt);
                }

                btnClose.Attributes.Add("onclick", "javascript:window.close(); return false;");
            }
            else { Session.Contents["result"] = "prof"; Response.Redirect("profRes.aspx", true); }
        }
        else { Session.Contents["result"] = "prof"; Response.Redirect("profRes.aspx", true); }
    }
}
