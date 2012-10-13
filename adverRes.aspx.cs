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

public partial class adverRes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Contents["result"] != null)
        {
            if (Request.QueryString.ToString().Contains("type"))
            {
                if (Request.QueryString["type"].ToString() == "error")
                {
                    Page.Title = "ќшибка";
                    lbResult.Text = "»звините, данного объ€влени€ не существует";
                }
            }

            btnClose.Attributes.Add("onclick", "javascript:window.close(); return false;");
            Session.Contents["result"] = null;
        }
        else { Response.Redirect("error.aspx", true); }
    }
}
