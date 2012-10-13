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

public partial class mess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        { Response.Redirect("Default.aspx", true); }
        Master.Master.Page.Title = "Мои сообщения";
        sdsMyMess.SelectParameters.Add("UserName", Page.User.Identity.Name);
        sdsPM.SelectParameters.Add("UserName", Page.User.Identity.Name);        
    }

    protected void gvMyMess_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("lbMessageID") != null & e.Row.FindControl("lbTitle") != null &
            e.Row.FindControl("lbText") != null & e.Row.FindControl("lbMainText") != null &
            e.Row.FindControl("lbTelephone") != null & e.Row.FindControl("lbSender") != null &
            e.Row.FindControl("lbEmail") != null & e.Row.FindControl("lbUserName") != null)
        {
            Hashtable ht = new Hashtable();
            ht.Add("MessageID", ((Label)e.Row.FindControl("lbMessageID")).Text);
            ht.Add("Title", ((Label)e.Row.FindControl("lbTitle")).Text);
            ht.Add("Text", ((Label)e.Row.FindControl("lbText")).Text);
            ht.Add("Tel", ((Label)e.Row.FindControl("lbTelephone")).Text);
            ht.Add("Sender", ((Label)e.Row.FindControl("lbSender")).Text);
            ht.Add("Email", ((Label)e.Row.FindControl("lbEmail")).Text);
            ht.Add("UserName", ((Label)e.Row.FindControl("lbUserName")).Text);

            ((Label)e.Row.FindControl("lbMainText")).Text = Changer.GetMyMess(ht);

            ((Label)e.Row.FindControl("lbMessageID")).Visible = false;
            ((Label)e.Row.FindControl("lbTitle")).Visible = false;
            ((Label)e.Row.FindControl("lbText")).Visible = false;
            ((Label)e.Row.FindControl("lbTelephone")).Visible = false;            
            ((Label)e.Row.FindControl("lbSender")).Visible = false; 
            ((Label)e.Row.FindControl("lbEmail")).Visible = false;
            ((Label)e.Row.FindControl("lbUserName")).Visible = false;
        }

        if (e.Row.FindControl("lbDate") != null)
        {
            ((Label)e.Row.FindControl("lbDate")).Text = Changer.FormatDate(Convert.ToDateTime(((Label)e.Row.FindControl("lbDate")).Text));
        } 
    }

    protected void gvPM_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("lbPMID") != null & e.Row.FindControl("lbEmail") != null &
            e.Row.FindControl("lbText") != null & e.Row.FindControl("lbMainText") != null)
        {
            Hashtable ht = new Hashtable();
            ht.Add("pmID", ((Label)e.Row.FindControl("lbPMID")).Text);
            ht.Add("Text", ((Label)e.Row.FindControl("lbText")).Text);
            ht.Add("Email", ((Label)e.Row.FindControl("lbEmail")).Text);

            ((Label)e.Row.FindControl("lbMainText")).Text = Changer.GetPrivMess(ht);

            ((Label)e.Row.FindControl("lbPMID")).Visible = false;
            ((Label)e.Row.FindControl("lbText")).Visible = false;
            ((Label)e.Row.FindControl("lbEmail")).Visible = false;
        }

        if (e.Row.FindControl("lbDate") != null)
        {
            ((Label)e.Row.FindControl("lbDate")).Text = Changer.FormatDate(Convert.ToDateTime(((Label)e.Row.FindControl("lbDate")).Text));
        } 
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ArrayList arrPM = new ArrayList();
        ArrayList arrMess = new ArrayList();
        for (int i = 1; i < gvPM.Rows.Count + 1; i++)
        {
            if (((CheckBox)gvPM.Controls[0].Controls[i].Controls[0].Controls[1]).Checked)
            { arrPM.Add(gvPM.DataKeys[((GridViewRow)gvPM.Controls[0].Controls[i]).RowIndex].Value); }
        }
        for (int i = 1; i < gvMyMess.Rows.Count + 1; i++)
        {
            if (((CheckBox)gvMyMess.Controls[0].Controls[i].Controls[0].Controls[1]).Checked)
            { arrMess.Add(gvPM.DataKeys[((GridViewRow)gvMyMess.Controls[0].Controls[i]).RowIndex].Value); }
        }
        DBAccesser.DeleteMess(arrPM, arrMess);
        Response.Redirect("mess.aspx", true);
    }
}
