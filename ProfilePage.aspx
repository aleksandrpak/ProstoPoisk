<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfilePage.aspx.cs" Inherits="ProfilePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Профиль пользователя</title>
</head>
<body style="margin: 5px 5px 5px 5px; font-family:Arial; font-size:10pt;" id="Body" runat="server">
    <form id="AdverForm" runat="server">
    <div style="text-align:center; vertical-align:top;">
    <table style="height:300px; border-color:#E6E2D8; border-style:solid; border-width:1px; background-color:White;"
     border="0" cellpadding="0" cellspacing="0" width="500px">
    <tr valign="top">
    <td>
    <div style="margin: 2px 2px 2px 2px">
    <table style="height:300px;" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr style="height:20px"> 
    <td align="center" colspan="2" style="font-weight:bold; color:white; background-color:#0093dd">
    <asp:Label ID="lbTop" runat="server" Text="Профиль пользователя"></asp:Label>
    </td>
    </tr>
    <tr> 
    <td align="left" valign="top" style="width:376px">
    <div style="margin: 15px 5px 5px 5px; font-size:10pt">    
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td style="width:40%" align="right">
    <div style="margin: 10px 2px 3px 2px">
    <asp:Label ID="lbLogin" runat="server" Text="Логин:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 10px 2px 3px 2px">
    <asp:Label ID="lbLoginText" runat="server" />
    </div>
    </td>
    </tr>
    <tr id="name">
    <td style="width:40%" align="right">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbName" runat="server" Text="Имя:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbNameText" runat="server" />
    </div>
    </td>
    </tr>
    <tr id="tel">
    <td style="width:40%" align="right">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbTelephone" runat="server" Text="Телефон:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbTelephoneText" runat="server" />
    </div>
    </td>
    </tr>
    <tr id="email">
    <td style="width:40%" align="right">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbEmail" runat="server" Text="E-mail:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbEmailText" runat="server" />
    </div>
    </td>
    </tr>
    <tr id="icq">
    <td style="width:40%" align="right">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbIcq" runat="server" Text="ICQ:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbIcqText" runat="server" />
    </div>
    </td>
    </tr>
    <tr>
    <td style="width:40%" align="right">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbRegDate" runat="server" Text="Дата регистрации:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbRegDateText" runat="server" />
    </div>
    </td>
    </tr>
    <tr>
    <td style="width:40%" align="right">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbLast" runat="server" Text="Последний вход:" />
    </div>
    </td>
    <td style="width:60%" align="left">
    <div style="margin: 5px 2px 3px 2px">
    <asp:Label ID="lbLastText" runat="server" />
    </div>
    </td>
    </tr>
    </table>
    </div>
    </td>
    <td align="right" valign="top">
    <div style="margin:10px 10px 10px 10px">
    <asp:Image ID="photo" runat="server" ImageUrl="~/Images/avatar.jpg" />
    </div>
    </td>
    </tr>    
    <tr valign="bottom"> 
    <td align="center" colspan="2">
    <div style="margin: 15px 10px 10px 10px; font-size:9pt; text-align:center;">
    <asp:HyperLink ID="hlSend" runat="server" ForeColor="Black" Text="Отправить личное сообщение"></asp:HyperLink>    
    </div>      
    <div style="margin-top:10px; margin-bottom:20px">       
    <asp:Button ID="btnClose" runat="server" Text="Закрыть"
    BackColor="#0093DD" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
    Font-Names="Arial" Font-Size="9pt" ForeColor="White" />
    </div>
    </td>
    </tr>
    </table>
    </div>  
    </td>
    </tr>  
    </table>
    </div>  
    </form>
</body>
</html>
