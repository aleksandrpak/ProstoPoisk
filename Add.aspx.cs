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

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            DBAccesser.Regions(ddlRegion);            
            if (Request.QueryString.ToString().Contains("id"))
            {
                if (!DBAccesser.NotNullID(Request.QueryString["id"].ToString()))
                { Session.Contents["result"] = "error"; Response.Redirect("result.aspx?type=error", true); }
                DBAccesser.GetAdver(Request.QueryString["id"].ToString(), ddlType, ddlRegion, ddlCat, tbTitle,
                    tbText, photo, tbPrice, tbTelephone, ddlMoney);                
                if (Page.User.Identity.IsAuthenticated)
                {
                    if (Page.User.Identity.Name.ToLower() == DBAccesser.GetName(Request.QueryString["id"].ToString()).ToLower() |
                    Page.User.IsInRole("admin"))
                    {
                        Page.Title = "–едактирование объ€влени€";
                        lbTitle.Text = "–едактирование объ€влени€";
                        btnAdd.Text = "–едактировать объ€вление";
                        tbPwd.Text = DBAccesser.GetPwd(Request.QueryString["id"].ToString());
                        tbEmail.Visible = false;
                        tbPwd.Visible = false;
                        rfvPwd.Visible = false;
                        Body.Attributes.Add("onload", "javascript:document.getElementById('pwd').style.display = 'none'; document.getElementById('email').style.display = 'none'; charLeft(document.getElementById('tbText'), 'charLeftSpan', 600)");
                    }
                }
                else
                {
                    if (Request.QueryString.ToString().Contains("pwd"))
                    {
                        if (Request.QueryString["pwd"].ToString() == DBAccesser.GetPwd(Request.QueryString["id"].ToString()))
                        {
                            tbPwd.Text = DBAccesser.GetPwd(Request.QueryString["id"].ToString());
                            tbPwd.Visible = false;
                            tbEmail.Visible = false;
                            rfvPwd.Visible = false;
                            Body.Attributes.Add("onload", "javascript:document.getElementById('pwd').style.display = 'none'; document.getElementById('email').style.display = 'none'; charLeft(document.getElementById('tbText'), 'charLeftSpan', 600)");
                        }
                        else { Body.Attributes.Add("onload", "charLeft(document.getElementById('tbText'), 'charLeftSpan', 600)"); }
                    }

                    Page.Title = "–едактирование объ€влени€";
                    lbTitle.Text = "–едактирование объ€влени€";
                    btnAdd.Text = "–едактировать объ€вление";
                }
            }
            else
            { Body.Attributes.Add("onload", "javascript:charLeft(document.getElementById('tbText'), 'charLeftSpan', 600)"); }

            if (Page.User.Identity.IsAuthenticated)
            {
                if (Profile.GetProfile(Page.User.Identity.Name).Telephone != string.Empty)
                { tbTelephone.Text = Profile.GetProfile(Page.User.Identity.Name).Telephone; }
                tbEmail.Text = Membership.GetUser(Page.User.Identity.Name).Email;
            }

            btnClose.Attributes.Add("onclick", "javascript:window.close(); return false;");
            tbText.Attributes.Add("onkeydown", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan', 600)");
            tbText.Attributes.Add("onkeypress", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan', 600);");
            tbText.Attributes.Add("onkeyup", "javascript: if (this.value.length >= 601) {return false;}; charLeft(this, 'charLeftSpan', 600);");
            tbPrice.Attributes.Add("onkeydown", "DigitsOnly(this)");
            tbPrice.Attributes.Add("onkeypress", "DigitsOnly(this)");
            tbPrice.Attributes.Add("onkeyup", "DigitsOnly(this)");
            tbPrice.Attributes.Add("onmouseup", "DigitsOnly(this)");
            tbPrice.Attributes.Add("onmousedown", "DigitsOnly(this)");
            tbAntiBot.Attributes.Add("onkeydown", "DigitsOnly(this)");
            tbAntiBot.Attributes.Add("onkeypress", "DigitsOnly(this)");
            tbAntiBot.Attributes.Add("onkeyup", "DigitsOnly(this)");
            tbAntiBot.Attributes.Add("onfocus", "javascript:document.getElementById('lbAntiBot').style.display = 'none';");
            tbTelephone.Attributes.Add("onkeydown", "Telephone(this)");
            tbTelephone.Attributes.Add("onkeypress", "Telephone(this)");
            tbTelephone.Attributes.Add("onkeyup", "Telephone(this)");
            tbPwd.Attributes.Add("onfocus", "javascript:document.getElementById('lbPwd').style.display = 'none';");
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (tbAntiBot.Text == Session.Contents["AntiBotAdd"].ToString())
        {            
            string price = string.Empty;
            string money = string.Empty;
            if (tbPrice.Text != string.Empty)
            {
                price = tbPrice.Text;
                money = ddlMoney.SelectedValue;
            }
            
            bool hasPhoto = false;
            if (photo.ImageUrl == string.Empty) { hasPhoto = false; } else { hasPhoto = true; }
            if (!fuPhoto.HasFile) { hasPhoto = false; } else { hasPhoto = true; }    
            
            bool fileOK = false;
            string path = Server.MapPath("~/Images/adver/");

            if (fuPhoto.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(fuPhoto.FileName).ToLower();
                string[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg", ".bmp", ".tiff", ".tif" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                { if (fileExtension == allowedExtensions[i]) { fileOK = true; break; } }
            }
            else 
            {
                string redirect = string.Empty;
                if (!Request.QueryString.ToString().Contains("id"))
                {
                    string pwd = tbPwd.Text;
                    string id = DBAccesser.InsertAdver(ddlCat.SelectedValue, ddlRegion.SelectedValue, tbTitle.Text, Page.User.Identity.Name,
                        tbEmail.Text, tbText.Text, tbTelephone.Text, ddlType.SelectedValue, price,
                        false, cbInform.Checked, ddlTime.SelectedValue, pwd, money);
                    Changer.SendPwd(id, pwd, tbEmail.Text, tbTitle.Text, tbText.Text);
                    redirect = "result.aspx";
                }
                else
                {
                    if (tbPwd.Text == DBAccesser.GetPwd(Request.QueryString["id"].ToString()))
                    {
                        DBAccesser.UpdateAdver(Request.QueryString["id"].ToString(), ddlCat.SelectedValue, ddlRegion.SelectedValue, 
                            tbTitle.Text, Page.User.Identity.Name, tbText.Text, tbTelephone.Text,
                            ddlType.SelectedValue, price, hasPhoto, cbInform.Checked, ddlTime.SelectedValue, money);
                        redirect = "result.aspx?type=edit";
                    }
                    else { lbPwd.Visible = true; }
                }

                if (redirect != string.Empty) { Session.Contents["result"] = "adver"; Response.Redirect(redirect, true); }
            }
            
            if (fileOK)
            {
                string redirect = string.Empty;

                try
                {
                    System.Drawing.Image img = new System.Drawing.Bitmap(fuPhoto.PostedFile.InputStream);
                    
                    if (!Request.QueryString.ToString().Contains("id"))
                    {
                        string pwd = tbPwd.Text;                       
                        string id = DBAccesser.InsertAdver(ddlCat.SelectedValue, ddlRegion.SelectedValue, tbTitle.Text, Page.User.Identity.Name,
                            tbEmail.Text, tbText.Text, tbTelephone.Text, ddlType.SelectedValue, price,
                            true, cbInform.Checked, ddlTime.SelectedValue, pwd, money);

                        SaveImage(path + id + ".jpg", img);
                        Changer.SendPwd(id, pwd, tbEmail.Text, tbTitle.Text, tbText.Text);
                        redirect = "result.aspx";
                    }
                    else 
                    {
                        if (tbPwd.Text == DBAccesser.GetPwd(Request.QueryString["id"].ToString()))
                        {
                            SaveImage(path + Request.QueryString["id"] + ".jpg", img);
                            DBAccesser.UpdateAdver(Request.QueryString["id"].ToString(), ddlCat.SelectedValue,
                                ddlRegion.SelectedValue, tbTitle.Text, Page.User.Identity.Name,
                                tbText.Text, tbTelephone.Text, ddlType.SelectedValue, price, hasPhoto,
                                cbInform.Checked, ddlTime.SelectedValue, money);
                            
                            redirect = "result.aspx?type=edit";
                        }
                        else { lbPwd.Visible = true; }
                    }
                }
                catch
                { 
                    lbPhoto.Text = "<br />ќшибка загрузки файла";
                    lbPhoto.Visible = true;
                    photo.Visible = false; 
                }

                if (redirect != string.Empty) { Session.Contents["result"] = "adver"; Response.Redirect(redirect, true); }
            }
            else
            { 
                lbPhoto.Text = "<br />Ќеверный тип файла";
                lbPhoto.Visible = true;
                photo.Visible = false; 
            }
        }
        else
        {
            tbAntiBot.Text = string.Empty;
            lbAntiBot.Text = "Ќеверный анти-бот код";
            lbAntiBot.Visible = true;
        }
    }

    private void SaveImage(string fileName, System.Drawing.Image SourceImage)
    {
        System.Drawing.Image img = null;

        if (SourceImage.Width > 90 || SourceImage.Height > 67)
        {
            int width = 0;
            int height = 0;

            if (SourceImage.Width > SourceImage.Height)
            { width = 90; height = 90 * SourceImage.Height / SourceImage.Width; }
            else { height = 67; width = 67 * SourceImage.Width / SourceImage.Height; }

            img = new System.Drawing.Bitmap(width, height);

            System.Drawing.Graphics.FromImage(img).DrawImage(SourceImage,
                new System.Drawing.Rectangle(0, 0, width, height),
                new System.Drawing.Rectangle(0, 0, SourceImage.Width, SourceImage.Height),
                System.Drawing.GraphicsUnit.Pixel);
        }
        else { img = SourceImage; }

        System.Drawing.Imaging.EncoderParameters parms = new System.Drawing.Imaging.EncoderParameters(1);
        parms.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 95L);

        System.Drawing.Imaging.ImageCodecInfo icf = null;
        System.Drawing.Imaging.ImageCodecInfo[] encoders = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
        foreach (System.Drawing.Imaging.ImageCodecInfo ic in encoders)
        { if (ic.FormatID == System.Drawing.Imaging.ImageFormat.Jpeg.Guid) { icf = ic; break; } }

        System.Drawing.Bitmap bmp = img as System.Drawing.Bitmap;
        bmp.SetResolution(1.0f, 1.0f);

        for (int i = 0; i < SourceImage.PropertyItems.Length; i++)
        { img.SetPropertyItem(SourceImage.PropertyItems[i]); }

        img.Save(fileName, icf, parms);
    }
}
