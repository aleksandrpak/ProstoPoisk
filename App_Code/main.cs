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
using System.Xml;
using Resources;

/// <summary>
/// Changes text
/// </summary>
public class Changer
{    
    private static System.Net.Mail.SmtpClient _client = new System.Net.Mail.SmtpClient("localhost", 25);

    public static string Date
    { get { return String.Format("{0} {1} {2} года", DateTime.Now.Day, Month(DateTime.Now.Month), DateTime.Now.Year); } }

    private static string Month(int i)
    {
        switch (i)
        {
            default:
            case 1: return "января";
            case 2: return "февраля";
            case 3: return "марта";
            case 4: return "апреля";
            case 5: return "мая";
            case 6: return "июня";
            case 7: return "июля";
            case 8: return "августа";
            case 9: return "сентября";
            case 10: return "октября";
            case 11: return "ноября";
            case 12: return "декабря";
        }
    }

    public static string Weather
    {
        get
        {
            string s = string.Empty;
            GlobalWeather gw = new GlobalWeather();

            try
            {
                string xmlstring = gw.GetWeather("Tashkent", "Uzbekistan");
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xmlstring);
                s = doc.ChildNodes.Item(1)["Temperature"].InnerText.Remove(0, s.IndexOf("(") + 1).Remove(s.Length - 1);
            }
            catch { s = "Не доступно"; }
            return s;
        }
    }

    public static string Dollar
    {
        get
        {
            string s;
            try
            {
                ExchangeRates er = new ExchangeRates();
                s = Convert.ToString(er.getCurrentExchangeRate("USD") / er.getCurrentExchangeRate("UZS")).Remove(7) + " сум";
            }
            catch { s = "Не доступно"; }
            return s;
        }
    }

    public static string Euro
    {
        get
        {
            string s;
            try
            {
                ExchangeRates er = new ExchangeRates();
                s = Convert.ToString(er.getCurrentExchangeRate("EUR") / er.getCurrentExchangeRate("UZS")).Remove(7) + " сум";
            }
            catch { s = "Не доступно"; }
            return s;
        }
    }

    public static void TreeViewExpand(TreeView tv, string cat)
    {                 
        TreeNode tn = null;
        for (int i = 0; i < tv.Nodes.Count; i++)
        {       
            for (int j = 0; j < tv.Nodes[i].ChildNodes.Count; j++)
            {
                if (tv.Nodes[i].ChildNodes[j].Value == cat)
                {
                    tn = tv.Nodes[i].ChildNodes[j];
                    j = tv.Nodes[i].ChildNodes.Count - 1;
                    i = tv.Nodes.Count - 1;
                }
            }
        }
        tn.Parent.Expand();
        tn.Selected = true;
    }

    public static string AdverText(Hashtable text)
    {
        string s = string.Empty;
        bool ph = Convert.ToBoolean(text["Photo"]);
        bool office = false;
        string lgn = text["Login"].ToString().ToLower();
        string usr = text["UserName"].ToString().ToLower();

        if (text["office"] != null)
        { office = true; }

        s += string.Format(Resource.offerBegin, text["ID"].ToString(), text["Title"].ToString());

        if (ph == true)
        { s += Resource.offerCellWithImg; }
        else { s += Resource.offerCellNoImg; }

        if (text["Price"].ToString() == string.Empty & text["Tel"].ToString() == string.Empty)
        { s += string.Format(Resource.offerEmpty, text["Title"].ToString(), text["Text"].ToString()); }
        else if (text["Price"].ToString() == string.Empty & text["Tel"].ToString() != string.Empty)
        { s += string.Format(Resource.offerTel, text["Title"].ToString(), text["Text"].ToString(), text["Tel"].ToString()); }
        else if (text["Price"].ToString() != string.Empty & text["Tel"].ToString() == string.Empty)
        { s += string.Format(Resource.offerPrice, text["Title"].ToString(), 
            text["Text"].ToString(), text["Price"].ToString(), text["Money"].ToString()); }
        else
        { s += string.Format(Resource.offerTelPrice,
          text["Title"].ToString(), text["Text"].ToString(), text["Price"].ToString(), 
          text["Tel"].ToString(), text["Money"].ToString()); }

        if (ph == true)
        { s += string.Format(Resource.offerImg, text["ID"].ToString()); }

        if ((lgn != string.Empty & ph == true & usr == string.Empty & Convert.ToBoolean(text["admin"]) == false) |
            (lgn != string.Empty & ph == true & usr != string.Empty & lgn != usr & Convert.ToBoolean(text["admin"]) == false))
        { s += string.Format(Resource.offerEndProfile, text["ID"].ToString(), text["Login"].ToString()); }

        else if ((lgn != string.Empty & ph == false & usr == string.Empty & Convert.ToBoolean(text["admin"]) == false) |
            (lgn != string.Empty & ph == false & usr != string.Empty & lgn != usr & Convert.ToBoolean(text["admin"]) == false))
        { s += string.Format(Resource.offerEndProfileNoImg, text["ID"].ToString(), text["Login"].ToString()); }

        else if (ph == true & office)
        { s += string.Format(Resource.officeEndEdit, text["ID"].ToString()); }

        else if (ph == false & office)
        { s += string.Format(Resource.officeEndEditNoImg, text["ID"].ToString()); } 

        else if ((lgn == usr & ph == true & 
            lgn != string.Empty & usr != string.Empty) | (Convert.ToBoolean(text["admin"]) == true)) 
        { s += string.Format(Resource.offerEndEdit, text["ID"].ToString(),  
            text["cat"].ToString()); }

        else if ((lgn == usr & ph == false & 
             lgn != string.Empty & usr != string.Empty) | (Convert.ToBoolean(text["admin"]) == true))
        { s += string.Format(Resource.offerEndEditNoImg, text["ID"].ToString(), 
          text["cat"].ToString()); }

        else if (lgn == string.Empty & ph == true)
        { s += string.Format(Resource.offerEndEmpty, text["ID"].ToString()); }

        else if (lgn == string.Empty & ph == false)
        { s += string.Format(Resource.offerEndEmptyNoImg, text["ID"].ToString()); }

        return s;
    }

    public static string GetMyMess(Hashtable text)
    {
        string s = string.Empty;                
        string usr = text["UserName"].ToString().ToLower();

        s += string.Format(Resource.adverMessBegin, 
            text["MessageID"].ToString(), text["Sender"].ToString());

        if (text["Tel"].ToString() != string.Empty)
        { s += string.Format(Resource.adverMessCellTelephone,
          text["Sender"].ToString(), text["Text"].ToString(), text["Email"].ToString(), 
          text["Tel"].ToString(), text["Title"].ToString());
        }
        else
        {
            s += string.Format(Resource.adverMessCellEmpty,
            text["Sender"].ToString(), text["Text"].ToString(),
            text["Email"].ToString(), text["Title"].ToString());
        }   

        if (usr != string.Empty)
        { s += string.Format(Resource.adverEndSend, usr); }
        else 
        { s += Resource.adverEndEmpty; }

        return s;
    }

    public static string GetPrivMess(Hashtable text)
    {
        string s = string.Empty;
        string usr = Membership.GetUserNameByEmail(text["Email"].ToString());

        if (usr != null)
        {
            s += string.Format(Resource.adverMessBegin,
                text["pmID"].ToString(), usr);
            s += string.Format(Resource.pmCellLogin, usr, 
                text["Text"].ToString(), text["Email"].ToString());
            s += string.Format(Resource.adverEndSend, usr);
        }
        else
        {
            s += string.Format(Resource.adverMessBegin,
                text["pmID"].ToString(), text["Email"].ToString());
            s += string.Format(Resource.pmCellEmpty,
                text["Text"].ToString(), text["Email"].ToString());
            s += Resource.adverEndEmpty;
        } 

        return s;
    }

    public static string FormatDate(DateTime dt)
    {
        string s = string.Empty;
        ArrayList date = new ArrayList();        
        date.Add(dt.Month.ToString());
        date.Add(dt.Day.ToString());
        date.Add(dt.Hour.ToString());
        date.Add(dt.Minute.ToString());

        for (int i = 0; i < date.Count; i++)
        {
            if (date[i].ToString().Length == 1)
            { date[i] = "0" + date[i].ToString(); }
        }

        if (dt.Year == DateTime.Now.Year & dt.Month == DateTime.Now.Month & dt.Day == DateTime.Now.Day)
        { s = string.Format("{0}:{1}", date[2], date[3]); }
        else { s = string.Format("{0}.{1}.{2}", date[1], date[0], dt.Year.ToString()); }
        
        return s;
    }

    public static void VisibleGV(string curr, ArrayList gv)
    {
        for (int i = 0; i < gv.Count; i++)
        {
            if (((GridView)gv[i]).ID != curr)
            { ((GridView)gv[i]).Visible = false; }
        }
    }

    public static void SendPwd(string id, string pwd, string to, string title, string text)
    {        
        string from = "info@prostopoisk.uz";
        string sub = "Пароль от Вашего объявления";
        string body = "Пароль от Вашего объявления на prostopoisk.uz\n\nПароль: {0}\n";
        body += "Пройдите по этой ссылке чтобы редактировать объявление:\n";
        body += "http://prostopoisk.uz/Add.aspx?id={3}&pwd={0}";
        body += "\n\nОбъявление:\n{1}\n\n{2}\n\n";
        body += "С уважением,\nАдминистрация сайта prostopoisk.uz";
        body = string.Format(body, pwd, title, text, id);

        System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(from, to, sub, body);
        _client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
        _client.Send(mm);       
    }

    public static void SendMessage(string id, string name, string email, string telephone, string text)
    {
        Hashtable adver = DBAccesser.AdverForSending(id);

        string from = email;
        string sub = string.Format("Ответ на Ваше объявление ({0})", adver["title"].ToString());
        string body;
        
        body = "\n\nВаше объявление:\n\n{2}\n\n{3}";       

        if (telephone != string.Empty)
        {
            body = "{0} ответил(а) на Ваше объявление:\n{1}\n\nТелефон: {4}" + body;
            body = string.Format(body, name, text, adver["title"].ToString(), adver["adverText"].ToString(), telephone);
            body += "\n\nС уважением,\nАдминистрация сайта prostopoisk.uz";
        }
        else 
        { 
            body = "{0} ответил(а) на Ваше объявление:\n{1}" + body;
            body = string.Format(body, name, text, adver["title"].ToString(), adver["adverText"].ToString());
            body += "\n\nС уважением,\nАдминистрация сайта prostopoisk.uz";
        }        

        System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(from, adver["Email"].ToString(), sub, body);
        _client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
        _client.Send(mm);
    }

    public static void SendToFrnd(string id, string name, string email, string frndName, string frndEmail, string text)
    {        
        Hashtable adver = DBAccesser.AdverForSending(id);
        string sub = "Объвление на prostopoisk.uz";
        string body = "Здравствуйте, {0}\n";
        body += "{1} отправил(а) Вам объявление для ознакомления:\n\n";
        body += "{2}\n\n{3}\n";
        body += "Вы можете просмотреть это объявление по адресу:\nhttp://prostopoisk.uz/Adver.aspx?id={4}\n\n";
        body += "Комментарии:\n{5}\n\n";
        body += "С уважением,\nАдминистрация сайта prostopoisk.uz";
        body = string.Format(body, frndName, name, adver["title"].ToString(), 
            adver["adverText"].ToString(), id, text);

        System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(email, frndEmail, sub, body);
        _client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
        _client.Send(mm);
    }

    public static void SendPrivMess(string name, string email, string text)
    {                
        string sub = "Личное сообщение с prostopoisk.uz";
        string body = string.Format("Здравствуйте, {0}\n", name);
        if (Membership.FindUsersByEmail(email).Count != 0)
        { body += string.Format("Вам пришло личное сообщение от {0}.\n\n{1}", Membership.GetUserNameByEmail(email), text); }
        else { body += string.Format("Вам пришло личное сообщение.\n\n{0}", text); }
        body += "\n\nС уважением,\nАдминистрация сайта prostopoisk.uz";       

        System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage(email, Membership.GetUser(name).Email, sub, body);
        _client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
        _client.Send(mm);
    }

    public static void SendNewPwd(string name, string pwd, string to)
    {
        string sub = "Пароль от Вашего аккаунта на prostopoisk.uz";
        string body = string.Format("Ваш новый пароль на prostopoisk.uz\n\nЛогин: {0}\nПароль: {1}", name, pwd);
        body += "\n\nС уважением,\nАдминистрация сайта prostopoisk.uz";

        System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage("info@prostopoisk.uz", to, sub, body);
        _client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
        _client.Send(mm);
    }
}