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

public partial class profileChng : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        { Response.Redirect("Default.aspx", true); }
        if (!IsPostBack)
        {            
            Hashtable ht = DBAccesser.GetProfile(Page.User.Identity.Name);
            tbLastName.Text = ht["LastName"].ToString();
            tbFirstName.Text = ht["FirstName"].ToString();
            cbEmail.Checked = Convert.ToBoolean(ht["showEmail"]);
            ht = DBAccesser.EmailPhoto(Membership.GetUser(Page.User.Identity.Name).Email);
            if (Convert.ToBoolean(ht["hasPhoto"]))
            { imgPhoto.ImageUrl = "Images/avatar/" + Page.User.Identity.Name.ToLower() + ".jpg"; }
            tbTelephone.Text = Profile.Telephone;
            tbIcq.Text = Profile.ICQ;
            Master.Master.Page.Title = "Изменение личной информации";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool fileOK = false;
        if (fuPhoto.HasFile)
        {
            string fileExtension =
                System.IO.Path.GetExtension(fuPhoto.FileName).ToLower();
            string[] allowedExtensions = 
                { ".gif", ".png", ".jpeg", ".jpg", ".bmp", ".tiff", ".tif" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                { fileOK = true; }
            }
        }

        if (fileOK)
        {
            try
            {
                System.Drawing.Image img = new System.Drawing.Bitmap(fuPhoto.PostedFile.InputStream);
                if (img.Width > 90 | img.Height > 90)
                {
                    System.Drawing.Image img2 = new System.Drawing.Bitmap(90, 90);
                    System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(img2);
                    g.DrawImage(img, 0, 0, 90, 90);
                    img2.Save(Server.MapPath(
                        string.Format("Images/avatar/{0}.jpg", Page.User.Identity.Name.ToLower())), 
                        System.Drawing.Imaging.ImageFormat.Jpeg);
                }
                else
                {
                    img.Save(Server.MapPath(
                        string.Format("Images/avatar/{0}.jpg", Page.User.Identity.Name.ToLower())),
                        System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }
            catch
            {
                lbPhoto.Text = "<br />Ошибка загрузки файла";
                lbPhoto.Visible = true;
                fileOK = false;
            }
        }

        if (fuPhoto.HasFile & fileOK)
        {
            DBAccesser.UpdateProfile(Page.User.Identity.Name, 
                tbLastName.Text, tbFirstName.Text, true, cbEmail.Checked);
            if (tbTelephone.Text != string.Empty)
            { Profile.Telephone = tbTelephone.Text; }
            if (tbIcq.Text != string.Empty)
            { Profile.ICQ = tbIcq.Text; }
            Response.Redirect("profileChng.aspx", true);
        }
        else if (!fuPhoto.HasFile & !fileOK)
        {
            Hashtable ht = DBAccesser.EmailPhoto(Membership.GetUser(Page.User.Identity.Name).Email);
            DBAccesser.UpdateProfile(Page.User.Identity.Name, tbLastName.Text,
                tbFirstName.Text, Convert.ToBoolean(ht["hasPhoto"]), cbEmail.Checked);
            if (tbTelephone.Text != string.Empty)
            { Profile.Telephone = tbTelephone.Text; }
            if (tbIcq.Text != string.Empty)
            { Profile.ICQ = tbIcq.Text; }
        }
        else if (fuPhoto.HasFile & !fileOK & lbPhoto.Text.Length == 0)
        {
            lbPhoto.Text = "<br />Неверный тип файла";
            lbPhoto.Visible = true;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        DBAccesser.UpdatePhoto(Page.User.Identity.Name, false);
        System.IO.FileInfo f = new System.IO.FileInfo(Server.MapPath(
            string.Format("Images/avatar/{0}.jpg", Page.User.Identity.Name.ToLower())));
        f.Delete();
        Response.Redirect("profileChng.aspx", true);
    }
}
