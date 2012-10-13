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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Master.Page.Title = "prostopoisk.uz";
            if (Request.QueryString.ToString().Contains("cat") & Master.FindControl("tvNavigation") != null)
            {
                if (Request.QueryString["cat"].ToString() != string.Empty)
                {
                    Changer.TreeViewExpand(((TreeView)Master.FindControl("tvNavigation")),
                    Request.QueryString["cat"].ToString());
                }
            }            
        }

        if (Request.QueryString.ToString().Contains("delete") &
                Request.QueryString.ToString().Contains("cat"))
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                DBAccesser.Delete(Request.QueryString["delete"].ToString(),
                    Page.User.Identity.Name,
                    Page.User.IsInRole("admin"),
                    Server.MapPath("Images/adver/"));
            }

            if (Request.QueryString["cat"].ToString() != string.Empty)
            {
                Response.Redirect(string.Format("Default.aspx?cat={0}",
                   Request.QueryString["cat"].ToString()));
            }
            else { Response.Redirect("Default.aspx", true); }
        }

        if (Request.QueryString.ToString().Contains("search"))
        {
            if (!IsPostBack)
            {
                sell.Visible = false;
                buy.Visible = false;
                work.Visible = false;
                serv.Visible = false;
                rent.Visible = false;
                chng.Visible = false;
                rest.Visible = false;
                search.Visible = true;

                string cmd = SelectCommandText(Request.QueryString["search"].ToString());
                ((TextBox)Master.FindControl("tbSearch")).Text = Request.QueryString["search"].ToString();
                bool addParam = false;
                if (Request.QueryString.ToString().Contains("type"))
                {
                    cmd += " AND (type = " + Request.QueryString["type"].ToString() + ")";
                    ((DropDownList)Master.FindControl("ddlType")).SelectedValue = Request.QueryString["type"].ToString();
                    addParam = true;
                }
                if (Request.QueryString.ToString().Contains("region"))
                {
                    cmd += " AND (adver.regionID = " + Request.QueryString["region"].ToString() + ")";
                    ((DropDownList)Master.FindControl("ddlRegion")).SelectedValue = Request.QueryString["region"].ToString();
                    addParam = true;
                }
                if (Request.QueryString.ToString().Contains("cat"))
                {
                    cmd += " AND (categoryID = " + Request.QueryString["cat"].ToString() + ")";
                    ((DropDownList)Master.FindControl("ddlCat")).SelectedValue = Request.QueryString["cat"].ToString();
                    addParam = true;
                }
                if (Request.QueryString.ToString().Contains("stPrice"))
                {
                    cmd += " AND (price > " + Request.QueryString["stPrice"].ToString() + ")";
                    ((TextBox)Master.FindControl("tbStartPrice")).Text = Request.QueryString["stPrice"].ToString();
                    addParam = true;
                }
                if (Request.QueryString.ToString().Contains("endPrice"))
                {
                    cmd += " AND (price < " + Request.QueryString["endPrice"].ToString() + ")";
                    ((TextBox)Master.FindControl("tbEndPrice")).Text = Request.QueryString["endPrice"].ToString();
                    addParam = true;
                }
                if (Request.QueryString.ToString().Contains("money"))
                {
                    cmd += " AND (moneyType = " + Request.QueryString["money"].ToString() + ")";
                    ((DropDownList)Master.FindControl("ddlMoney")).SelectedValue = Request.QueryString["money"].ToString();
                    addParam = true;
                }

                if (Request.QueryString["search"].ToString() == string.Empty & Request.QueryString.Count > 1)
                { cmd = cmd.Remove(cmd.IndexOf("WHERE") + 5, 5); }
                else if (Request.QueryString["search"].ToString() == string.Empty & Request.QueryString.Count == 1)
                { Response.Redirect("Default.aspx", true); }
                sdsSearch.SelectCommandType = SqlDataSourceCommandType.Text;
                sdsSearch.SelectCommand = cmd;

                if (addParam)
                { ((HtmlTableRow)Master.FindControl("searchPanel")).Style.Add("display", "block"); }
            }
        }
    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.FindControl("lbAdverID") != null & e.Row.FindControl("lbTitle") != null &
            e.Row.FindControl("lbLogin") != null & e.Row.FindControl("lbText") != null &
            e.Row.FindControl("lbTelephone") != null & e.Row.FindControl("lbPrice") != null &
            e.Row.FindControl("lbPhoto") != null & e.Row.FindControl("lbMainText") != null &
            e.Row.FindControl("lbMoney") != null)
        {
            Hashtable ht = new Hashtable();
            ht.Add("ID", ((Label)e.Row.FindControl("lbAdverID")).Text);
            ht.Add("Title", ((Label)e.Row.FindControl("lbTitle")).Text);
            ht.Add("Login", ((Label)e.Row.FindControl("lbLogin")).Text);
            ht.Add("Text", ((Label)e.Row.FindControl("lbText")).Text);
            ht.Add("Tel", ((Label)e.Row.FindControl("lbTelephone")).Text);
            ht.Add("Price", ((Label)e.Row.FindControl("lbPrice")).Text);
            ht.Add("Photo", ((Label)e.Row.FindControl("lbPhoto")).Text);
            ht.Add("Money", ((Label)e.Row.FindControl("lbMoney")).Text);
            if (Page.User.Identity.IsAuthenticated)
            {
                ht.Add("UserName", Page.User.Identity.Name);
                ht.Add("admin", Page.User.IsInRole("admin"));
            }
            else
            {
                ht.Add("UserName", string.Empty);
                ht.Add("admin", false);
            }

            if (Request.QueryString.ToString().Contains("cat"))
            { ht.Add("cat", Request.QueryString["cat"]); }
            else { ht.Add("cat", string.Empty); }

            ((Label)e.Row.FindControl("lbMainText")).Text = Changer.AdverText(ht);

            ((Label)e.Row.FindControl("lbAdverID")).Visible = false;
            ((Label)e.Row.FindControl("lbTitle")).Visible = false;
            ((Label)e.Row.FindControl("lbLogin")).Visible = false;
            ((Label)e.Row.FindControl("lbText")).Visible = false;
            ((Label)e.Row.FindControl("lbTelephone")).Visible = false;
            ((Label)e.Row.FindControl("lbPrice")).Visible = false;
            ((Label)e.Row.FindControl("lbPhoto")).Visible = false;
            ((Label)e.Row.FindControl("lbMoney")).Visible = false;
        }

        if (e.Row.FindControl("lbDate") != null)
        {
            ((Label)e.Row.FindControl("lbDate")).Text = Changer.FormatDate(Convert.ToDateTime(((Label)e.Row.FindControl("lbDate")).Text));
        }
    }

    protected void GridView_PageIndexChanged(object sender, EventArgs e)
    {
        ArrayList arr = new ArrayList();
        arr.Add(sell);
        arr.Add(buy);
        arr.Add(work);
        arr.Add(serv);
        arr.Add(rent);
        arr.Add(chng);
        arr.Add(rest);
        Changer.VisibleGV(((GridView)sender).ID, arr);
    }

    private string SelectCommandText(string search)
    {
        string cmd = string.Empty;
        string StrResult = string.Empty;
        string text = search;
        text = text.Replace("&", " ");
        foreach (string str in (string[])text.Split())
        {            
            if (str.Length > 1) { StrResult += " (title LIKE N'%" + str + "%') OR" +
                " (adverText LIKE N'%" + str + "%') OR"; }
            string str2 = string.Empty;
            if (str.Length > 3)
            {
                str2 = str.Remove(0, 1);
                str2 = str2.Remove(str2.Length - 1, 1);
                StrResult += " (title LIKE N'%" + str2 + "%') OR (adverText LIKE N'%" + str2 + "%') OR";
            }
        }
        if (StrResult != string.Empty)
        {
            StrResult = StrResult.Remove(0, 1);
            StrResult = StrResult.Remove(StrResult.Length - 3);
        }

        cmd = "SELECT adver.startDate, adver.AdverID, adver.title, adver.UserName, adver.adverText," +
            " adver.telephone, adver.price, adver.moneyType, adver.photo, Regions.regionName FROM adver " + 
            "INNER JOIN Regions ON adver.regionID = Regions.regionID WHERE ";

        cmd += StrResult;

        return cmd;
    }

    //string StrResult = string.Empty;
    //string text = Request.QueryString["search"].ToString();
    //text = text.Replace("&", " ");
    //foreach (string str in (string[])text.Split())
    //{ if (str.Length > 2) { StrResult = StrResult + " FORMSOF(INFLECTIONAL, " + str + ") OR"; } }
    //StrResult = StrResult.Remove(0, 1);
    //StrResult = StrResult.Remove(StrResult.Length - 3);
    //StrResult = "\'" + StrResult + "\'"; 

    protected void SqlDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        { lbError.Visible = false; }
        if (e.AffectedRows == 0 & ((SqlDataSourceView)sender).SelectCommandType == SqlDataSourceCommandType.Text)
        {
            lbError.Visible = true;
            lbError.Text = "Извините, не найдено ни одного объявления";
        }
    }
}