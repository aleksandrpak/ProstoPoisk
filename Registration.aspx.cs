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

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ((Button)cuwsMain.CustomNavigationTemplateContainer.FindControl("CancelButton")).Attributes.Add("onclick", "javascript:window.close(); return false;");
            ((Button)cuwMain.Controls[0].Controls[1].Controls[0].Controls[0].Controls[1].Controls[0].Controls[0].Controls[0].Controls[0].FindControl("ContinueButton")).Attributes.Add("onclick", "javascript:window.close(); return false;");
        }
    }
    protected void cuwMain_CreatedUser(object sender, EventArgs e)
    {
        DBAccesser.InsertNames(((TextBox)cuwMain.CreateUserStep.ContentTemplateContainer.Controls[0].Controls[0].Controls[0].FindControl("UserName")).Text, 
            ((TextBox)cuwMain.CreateUserStep.ContentTemplateContainer.Controls[0].Controls[0].Controls[0].FindControl("tbFirstName")).Text,
            ((TextBox)cuwMain.CreateUserStep.ContentTemplateContainer.Controls[0].Controls[0].Controls[0].FindControl("tbLastName")).Text,
            ((TextBox)cuwMain.CreateUserStep.ContentTemplateContainer.Controls[0].Controls[0].Controls[0].FindControl("Email")).Text);               
    }
}
