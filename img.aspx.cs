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
using System.Drawing;
using System.IO;

public partial class img : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random rnd = new Random();
        string code = string.Empty;
        Session.Contents["anti-bot"] = string.Empty;
        System.Drawing.Image img = new Bitmap(120, 40);
        Graphics g = Graphics.FromImage(img);
        g.FillRectangle(new SolidBrush(Color.Silver), 0, 0, 120, 40);
        int t = 0;
        int p = 20;
        for (int i = 0; i < 6; i++)
        {
            g.DrawLine(new Pen(Color.White), rnd.Next(t, p), 0, rnd.Next(t, p), 40);
            t = t + 20;
            p = p + 20;
        }
        g.DrawRectangle(new Pen(Color.Black), 0, 0, 119, 39);        

        int j = rnd.Next(-3, 3);
        int k = 5;
        int h, n;
        Color clr = new Color();
        for (int i = 0; i < 7; i++)
        {
            n = rnd.Next(1, 9);
            h = rnd.Next(0, 9);
            if (n == 1)
            { clr = Color.Gold; }
            else if (n == 2)
            { clr = Color.SteelBlue; }
            else if (n == 3)
            { clr = Color.SandyBrown; }
            else if (n == 4)
            { clr = Color.DeepPink; }
            else if (n == 5)
            { clr = Color.DarkRed; }
            else if (n == 6)
            { clr = Color.HotPink; }
            else if (n == 7)
            { clr = Color.Black; }
            else if (n == 8)
            { clr = Color.RosyBrown; }
            else if (n == 9)
            { clr = Color.DarkOrange; }
            g.RotateTransform(j);
            g.DrawString(h.ToString(), new Font("Arial", rnd.Next(10, 14), FontStyle.Bold),
                new SolidBrush(clr), k, 15);
            code = code + h.ToString();
            k = k + 15;
            if (j > 0)
            { j = rnd.Next(-3, -1); }
            else { j = rnd.Next(1, 3); }
        }
        if (Request.QueryString["type"].ToString() == "add")
        { Session.Contents["AntiBotAdd"] = code; }
        else if (Request.QueryString["type"].ToString() == "mess")
        { Session.Contents["AntiBotMess"] = code; }
        else if (Request.QueryString["type"].ToString() == "frnd")
        { Session.Contents["AntiBotFrnd"] = code; }
        MemoryStream ms = new MemoryStream();
        string s = "b96b3caf-0728-11d3-9d7b-0000f81ef32e";
        Guid guid = new Guid(s);
        System.Drawing.Imaging.ImageFormat imgFrmt;
        imgFrmt = new System.Drawing.Imaging.ImageFormat(guid);
        img.Save(ms, imgFrmt);        
        Context.Response.ContentType = "image/jpg";
        Context.Response.BinaryWrite(ms.GetBuffer());        
        ms.Close();  
    }
}
