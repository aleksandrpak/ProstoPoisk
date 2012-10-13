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

public partial class newsDetal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.QueryString.ToString().Contains("id"))
        { Response.Redirect("news.aspx", true); }

        Hashtable ht = DBAccesser.GetDetalNews(Request.QueryString["id"].ToString());
        if (ht["newsTitle"] != null)
        {
            lbTitle.Text = ht["newsTitle"].ToString();
            lbText.Text = "<br /><br />" + ht["newsText"].ToString();
            lbDate.Text = "<br />" + ht["newsDate"].ToString();
            Master.Page.Title = string.Format("Новости / {0}", lbTitle.Text);
        }
        else { lbTitle.Text = "<b>Извините, данной новости не существует</b>"; }
    }
}
