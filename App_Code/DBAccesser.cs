using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Class for accessing DB
/// </summary>
public class DBAccesser
{
    private static SqlConnection _cn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnTrade"].ConnectionString);
    private static SqlCommand _cmd = new SqlCommand("", _cn);

    public static Hashtable UserName(string UserName)
    {
        Hashtable ht = new Hashtable();
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;   
        _cmd.CommandText = "GetNames";
        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = UserName; 

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            ht.Add("FirstName", reader["FirstName"]);
            ht.Add("LastName", reader["LastName"]);
        }
        _cn.Close();   
         
        return ht;
    }

    public static void InsertNames(string name, string frst, string last, string email)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;   
        _cmd.CommandText = "InsertNames";

        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;
        _cmd.Parameters.Add("FirstName", SqlDbType.NVarChar).Value = frst;
        _cmd.Parameters.Add("LastName", SqlDbType.NVarChar).Value = last;
        _cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = email;

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static void Delete(string id, string usr, bool admin, string path)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;   
        _cmd.CommandText = "ExistID";
        string s = string.Empty;

        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = usr;
        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id;        

        _cn.Open();
        object res = _cmd.ExecuteScalar();
        if (res != null) { s = res.ToString(); }
        _cn.Close();

        if (s == id | admin == true)
        {
            _cmd.Parameters.Clear();
            _cmd.CommandText = "DeleteAdver";
            _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id;
            
            _cn.Open();
            _cmd.ExecuteNonQuery();
            _cn.Close(); 
        }

        if (!NotNullID(id))
        {
            System.IO.FileInfo f = new System.IO.FileInfo(path + id + ".jpg");
            f.Delete();
        }
    }

    public static void Regions(DropDownList ddl)
    {        
        string id, name;         

        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;   
        _cmd.CommandText = "GetRegions";        

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            id = reader["regionID"].ToString();
            name = reader["regionName"].ToString();

            if (Convert.ToInt32(id) > 1 & Convert.ToInt32(id) < 13)
            { ddl.Items.Add(new ListItem("> " + name, id)); }
            else { ddl.Items.Add(new ListItem(name, id)); }
        }
        _cn.Close();
    }

    public static string InsertAdver(string cat, string reg, string title, string name, string email, string text,
        string tel, string type, string price, bool photo, bool inform, string time, string pwd, string money)
    {
        string s = string.Empty;

        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;   
        _cmd.CommandText = "InsertAdver";

        _cmd.Parameters.Add("categoryID", SqlDbType.SmallInt).Value = cat;
        _cmd.Parameters.Add("regionID", SqlDbType.SmallInt).Value = reg;
        _cmd.Parameters.Add("title", SqlDbType.NVarChar).Value = title;
        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;
        _cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = email;
        _cmd.Parameters.Add("adverText", SqlDbType.NVarChar).Value = text;
        _cmd.Parameters.Add("telephone", SqlDbType.NVarChar).Value = tel;
        _cmd.Parameters.Add("type", SqlDbType.NVarChar).Value = type;        
        _cmd.Parameters.Add("photo", SqlDbType.Bit).Value = photo;
        _cmd.Parameters.Add("inform", SqlDbType.Bit).Value = inform;
        _cmd.Parameters.Add("startDate", SqlDbType.DateTime).Value = DateTime.Now;
        _cmd.Parameters.Add("endDate", SqlDbType.DateTime).Value = DateTime.Now.AddDays(Convert.ToDouble(time));        
        _cmd.Parameters.Add("pwd", SqlDbType.NVarChar).Value = pwd;

        bool valid = true;
        try { int i = Convert.ToInt32(price); }
        catch { valid = false; }
        if (valid & price != string.Empty)
        {
            _cmd.Parameters.Add("price", SqlDbType.Int);
            _cmd.Parameters["price"].Value = price;
            _cmd.Parameters.Add("moneyType", SqlDbType.NVarChar);
            _cmd.Parameters["moneyType"].Value = money;
        }

        _cn.Open();
        s = _cmd.ExecuteScalar().ToString();
        _cn.Close();

        return s;
    }

    public static string GetName(string id)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;   
        _cmd.CommandText = "GetName";
        string s = string.Empty;

        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id; ;

        _cn.Open();
        object res = _cmd.ExecuteScalar();
        if (res != null) { s = res.ToString(); }
        _cn.Close();

        return s;
    }

    public static string GetTitle(string id)
    {   
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure; 
        _cmd.CommandText = "GetAdverTitle";
        string s = string.Empty;

        _cmd.Parameters.Add("AdverID", SqlDbType.Int);
        _cmd.Parameters["AdverID"].Value = id; ;

        _cn.Open();
        object res = _cmd.ExecuteScalar();
        if (res != null) { s = res.ToString(); }
        _cn.Close();

        return s;
    }

    public static string GetPwd(string id)
    {        
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "GetPwd";
        string s = string.Empty;

        _cmd.Parameters.Add("AdverID", SqlDbType.Int);
        _cmd.Parameters["AdverID"].Value = id; ;

        _cn.Open();
        object res = _cmd.ExecuteScalar();
        if (res != null) { s = res.ToString(); }
        _cn.Close();

        return s;
    }

    public static void UpdateAdver(string id, string cat, string reg, string title, string name, string text,
        string tel, string type, string price, bool photo, bool inform, string time, string money)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "UpdateAdver";

        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id;
        _cmd.Parameters.Add("categoryID", SqlDbType.SmallInt).Value = cat;
        _cmd.Parameters.Add("regionID", SqlDbType.SmallInt).Value = reg;
        _cmd.Parameters.Add("title", SqlDbType.NVarChar).Value = title;
        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;        
        _cmd.Parameters.Add("adverText", SqlDbType.NVarChar).Value = text;
        _cmd.Parameters.Add("telephone", SqlDbType.NVarChar).Value = tel;
        _cmd.Parameters.Add("type", SqlDbType.NVarChar).Value = type;
        _cmd.Parameters.Add("price", SqlDbType.Int).Value = price;
        _cmd.Parameters.Add("moneyType", SqlDbType.NVarChar).Value = money;
        _cmd.Parameters.Add("photo", SqlDbType.Bit).Value = photo;
        _cmd.Parameters.Add("inform", SqlDbType.Bit).Value = inform;
        _cmd.Parameters.Add("startDate", SqlDbType.DateTime).Value = DateTime.Now;
        _cmd.Parameters.Add("endDate", SqlDbType.DateTime).Value = DateTime.Now.AddDays(Convert.ToDouble(time));

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static void GetAdver(string id, DropDownList type, DropDownList region, 
        DropDownList cat, TextBox title, TextBox text, Image photo, TextBox price,
        TextBox telephone, DropDownList money)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "GetAdverToEdit";
        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id;

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            type.SelectedValue = reader["type"].ToString();
            region.SelectedValue = reader["regionID"].ToString();
            cat.SelectedValue = reader["categoryID"].ToString();
            money.SelectedValue = reader["moneyType"].ToString();
            title.Text = reader["title"].ToString();
            text.Text = reader["adverText"].ToString();
            price.Text = reader["price"].ToString();
            telephone.Text = reader["telephone"].ToString();            

            if (Convert.ToBoolean(reader["photo"]))
            {
                photo.ImageUrl = string.Format("Images/adver/{0}.jpg", id);
                photo.Visible = true;
            }            
        }
        _cn.Close();
    }

    public static void InsertMessage(string id, string sender, string email, string telephone,
        string message, string usr)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "InsertMessage";

        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id;
        _cmd.Parameters.Add("sender", SqlDbType.NVarChar).Value = sender;
        _cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = email;
        _cmd.Parameters.Add("telephone", SqlDbType.NVarChar).Value = telephone;
        _cmd.Parameters.Add("message", SqlDbType.NVarChar).Value = message;
        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = usr;
        _cmd.Parameters.Add("sendDate", SqlDbType.DateTime).Value = DateTime.Now; 

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static Hashtable AdverForSending(string id)
    {
        Hashtable ht = new Hashtable();
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "GetAdverForSending";
        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id; ;

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            ht.Add("title", reader["title"]);
            ht.Add("adverText", reader["adverText"]);
            ht.Add("Email", reader["Email"]);
        }
        _cn.Close();

        return ht;
    }

    public static bool NotNullID(string id)
    {
        bool exist = false;
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "NotNullID";
        _cmd.Parameters.Add("AdverID", SqlDbType.Int).Value = id; ;

        _cn.Open();
        if (_cmd.ExecuteScalar() != null)
        { exist = true; }
        _cn.Close();

        return exist;
    }

    public static Hashtable GetAdverDetailed(string id)
    {
        Hashtable ht = new Hashtable();
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "GetAdverDetailed";
        _cmd.Parameters.Add("AdverID", SqlDbType.NVarChar).Value = id;

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            ht.Add("title", reader["title"]);
            ht.Add("adverText", reader["adverText"]);
            ht.Add("photo", reader["photo"]);
            ht.Add("price", reader["price"]);
            ht.Add("money", reader["moneyType"]);
            ht.Add("telephone", reader["telephone"]);
        }
        _cn.Close();

        return ht;
    }

    public static Hashtable EmailPhoto(string s)
    {
        Hashtable ht = new Hashtable();
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "EmailPhoto";
        _cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = s;

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            ht.Add("showEmail", reader["showEmail"]);
            ht.Add("hasPhoto", reader["hasPhoto"]);
        }
        _cn.Close();

        return ht;
    }

    public static void InsertPrivMess(string name, string email, string text)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "InsertPrivMess";

        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;
        _cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = email;
        _cmd.Parameters.Add("messText", SqlDbType.NVarChar).Value = text;
        _cmd.Parameters.Add("sendDate", SqlDbType.DateTime).Value = DateTime.Now;

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static Hashtable GetProfile(string name)
    {
        Hashtable ht = new Hashtable();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.Parameters.Clear();
        _cmd.CommandText = "GetProfile";
        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            ht.Add("FirstName", reader["FirstName"]);
            ht.Add("LastName", reader["LastName"]);
            ht.Add("showEmail", reader["showEmail"]);
        }
        _cn.Close();

        return ht;
    }

    public static void UpdatePhoto(string name, bool hasPhoto)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "UpdatePhoto";

        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;
        _cmd.Parameters.Add("hasPhoto", SqlDbType.Bit).Value = hasPhoto;        

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static void UpdateProfile(string name, string lst, string frst, bool hasPhoto, bool showEmail)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "UpdateProfile";

        _cmd.Parameters.Add("UserName", SqlDbType.NVarChar).Value = name;
        _cmd.Parameters.Add("lastName", SqlDbType.NVarChar).Value = lst;
        _cmd.Parameters.Add("FirstName", SqlDbType.NVarChar).Value = frst;
        _cmd.Parameters.Add("hasPhoto", SqlDbType.Bit).Value = hasPhoto;
        _cmd.Parameters.Add("showEmail", SqlDbType.Bit).Value = hasPhoto;

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static void ChangeEmail(string oldEmail, string newEmail, string lowEmail)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "ChangeEmail";

        _cmd.Parameters.Add("oldEmail", SqlDbType.NVarChar).Value = oldEmail;
        _cmd.Parameters.Add("newEmail", SqlDbType.NVarChar).Value = newEmail;
        _cmd.Parameters.Add("newLowEmail", SqlDbType.NVarChar).Value = lowEmail;

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static void DeleteMess(ArrayList pm, ArrayList mess)
    {
        if (pm.Count > 0)
        {
            _cmd.Parameters.Clear();
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.CommandText = "DeletePM";

            _cmd.Parameters.Add("pmID", SqlDbType.Int);

            _cn.Open();
            for (int i = 0; i < pm.Count; i++)
            {
                _cmd.Parameters["pmID"].Value = pm[0].ToString();
                _cmd.ExecuteNonQuery();
            }
            _cn.Close();
        }

        if (mess.Count > 0)
        {
            _cmd.Parameters.Clear();
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.CommandText = "DeleteMess";

            _cmd.Parameters.Add("MessageID", SqlDbType.Int);

            _cn.Open();
            for (int i = 0; i < mess.Count; i++)
            {
                _cmd.Parameters["MessageID"].Value = mess[0].ToString();
                _cmd.ExecuteNonQuery();
            }
            _cn.Close();
        }
    }

    public static void InsertNews(string title, string shortText, string text)
    {
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "InsertNews";

        _cmd.Parameters.Add("newsTitle", SqlDbType.NVarChar).Value = title;
        _cmd.Parameters.Add("newsText", SqlDbType.NVarChar).Value = shortText;
        _cmd.Parameters.Add("newsShortText", SqlDbType.NVarChar).Value = text;
        _cmd.Parameters.Add("newsDate", SqlDbType.DateTime).Value = DateTime.Now;

        _cn.Open();
        _cmd.ExecuteNonQuery();
        _cn.Close();
    }

    public static Hashtable GetDetalNews(string id)
    {
        Hashtable ht = new Hashtable();
        _cmd.Parameters.Clear();
        _cmd.CommandType = CommandType.StoredProcedure;
        _cmd.CommandText = "GetDetalNews";

        _cmd.Parameters.Add("newsID", SqlDbType.Int).Value = id;

        _cn.Open();
        SqlDataReader reader = _cmd.ExecuteReader();
        while (reader.Read())
        {
            ht.Add("newsTitle", reader["newsTitle"]);
            ht.Add("newsText", reader["newsText"]);
            ht.Add("newsDate", reader["newsDate"]);
        }
        _cn.Close();

        return ht; 
    }
}
