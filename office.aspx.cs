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

public partial class office : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        { Response.Redirect("Default.aspx", true); }

        if (!IsPostBack)
        {
            Master.Master.Page.Title = "Личный кабинет";
            string bodyAtt = string.Empty;
            Hashtable ht = DBAccesser.EmailPhoto(Membership.GetUser(Page.User.Identity.Name).Email);

            lbLoginText.Text = Membership.GetUserNameByEmail(Membership.GetUser(Page.User.Identity.Name).Email);
            lbEmailText.Text = Membership.GetUser(Page.User.Identity.Name).Email;
            lbRegDateText.Text = Membership.GetUser(Page.User.Identity.Name).CreationDate.ToString();

            if (Convert.ToBoolean(ht["hasPhoto"]))
            { photo.ImageUrl = "Images/avatar/" + Page.User.Identity.Name.ToLower() +".jpg"; }

            ht = DBAccesser.UserName(Page.User.Identity.Name);
            if (ht["LastName"].ToString() != string.Empty & ht["FirstName"].ToString() != string.Empty)
            { lbNameText.Text = ht["LastName"].ToString()+ " " + ht["FirstName"].ToString(); }
            else if (ht["LastName"].ToString() == string.Empty & ht["FirstName"].ToString() != string.Empty)
            { lbNameText.Text = ht["FirstName"].ToString(); }
            else
            { lbName.Visible = false; lbNameText.Visible = false; bodyAtt += "document.getElementById('name').style.display = 'none';"; }

            if (Profile.Telephone == string.Empty)
            { lbTelephone.Visible = false; lbTelephoneText.Visible = false; bodyAtt += "document.getElementById('tel').style.display = 'none';"; }
            else { lbTelephoneText.Text = Profile.Telephone; }

            if (Profile.ICQ == string.Empty)
            { lbIcq.Visible = false; lbIcqText.Visible = false; bodyAtt += "document.getElementById('icq').style.display = 'none';"; }
            else { lbIcqText.Text = Profile.ICQ; }

            if (bodyAtt != string.Empty)
            {
                bodyAtt = "javascript:" + bodyAtt;
                officeDiv.Attributes.Add("onload", bodyAtt);
            }
        }
    }
}
