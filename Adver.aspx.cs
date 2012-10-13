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

public partial class Adver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            if (Request.QueryString.ToString().Contains("id"))
            {
                if (!DBAccesser.NotNullID(Request.QueryString["id"].ToString()))
                { Session.Contents["result"] = "error"; Response.Redirect("adverRes.aspx?type=error", true); }
            }
            else { Session.Contents["result"] = "error"; Response.Redirect("adverRes.aspx?type=error", true); }

            Hashtable ht = new Hashtable();
            ht = DBAccesser.GetAdverDetailed(Request.QueryString["id"].ToString());
            lbTitle.Text = string.Format("<b>{0}</b>", ht["title"].ToString());
            lbText.Text = ht["adverText"].ToString();
            if (ht["telephone"].ToString() != string.Empty)
            { lbText.Text += "<br /><br />Телефон: " + ht["telephone"].ToString(); }
            if (ht["price"].ToString() != string.Empty)
            { lbText.Text += "<br /><br />Цена: " + 
                ht["price"].ToString() + " " + ht["money"].ToString(); }
            if (Convert.ToBoolean(ht["photo"]))
            {
                photo.ImageUrl = string.Format("~/Images/adver/{0}.jpg", Request.QueryString["id"].ToString());
                photo.Visible = true;
            }

            hlSend.NavigateUrl = string.Format("Message.aspx?id={0}", Request.QueryString["id"].ToString());
            hlSend.Attributes.Add("onclick", string.Format("javascript:window.open('Message.aspx?id={0}', 'SendWindow', 'height=423,width=508'); return false;",
                Request.QueryString["id"].ToString()));
            hlSend.NavigateUrl = string.Format("Friend.aspx?id={0}", Request.QueryString["id"].ToString());
            hlFrnd.Attributes.Add("onclick", string.Format("javascript:window.open('Friend.aspx?id={0}', 'SendWindow', 'height=458,width=508'); return false;",
                Request.QueryString["id"].ToString()));
            string s = string.Empty;
            s = DBAccesser.GetName(Request.QueryString["id"].ToString());
            if (s != string.Empty)
            {
                hlProfile.NavigateUrl = string.Format("Profile.aspx?id={0}", s);
                hlProfile.Attributes.Add("onclick",
                    string.Format("javascript:window.open('Profile.aspx?id={0}', 'ProfileWindow', 'height=600,width=600'); return false;", s));
            }
            else { hlProfile.Visible = false; profile.Visible = false; }
            hlEdit.NavigateUrl = "Add.aspx?id={0}";
            hlEdit.Attributes.Add("onclick", Request.QueryString["id"].ToString()); 
                string.Format("javascript:window.open('Add.aspx?id={0}', 'EditWindow', 'height=625,width=608'); return false;",
                Request.QueryString["id"].ToString());
            if (Page.User.Identity.IsAuthenticated)
            {
                if (s.ToLower() == Page.User.Identity.Name.ToLower() | Page.User.IsInRole("admin"))
                {
                    hlDelete.NavigateUrl = string.Format("Adver.aspx?id={0}&delete={0}",
                        Request.QueryString["id"].ToString());
                    hlDelete.Attributes.Add("onclick", "return confirm('Вы действительно хотите удалить это объявление?')");
                }
                else { hlDelete.Visible = false; delete.Visible = false; }
            }
            else { hlDelete.Visible = false; delete.Visible = false; }

            btnClose.Attributes.Add("onclick", "javascript:window.close(); return false;");
        }

        if (Page.User.Identity.IsAuthenticated)
        {
            if (Request.QueryString.ToString().Contains("delete"))
            {
                DBAccesser.Delete(Request.QueryString["delete"].ToString(),
                    Page.User.Identity.Name, Page.User.IsInRole("admin"),
                    Server.MapPath("Images/adver/"));
                if (!DBAccesser.NotNullID(Request.QueryString["delete"].ToString()))
                { Session.Contents["result"] = "adver"; Response.Redirect("adverRes.aspx", true); }
                else { lbError.Visible = true; }
            }
        }
    }
}
