<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMess.aspx.cs" Inherits="SendMess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Отправить сообщение</title>
    <script type="text/javascript" src="Images/script.js"></script>
    <link rel="stylesheet" type="text/css" href="Images/forms.css" />
</head>
<body style="margin: 5px 5px 5px 5px; font-family:Arial; font-size:10pt;" id="Body" runat="server">
    <form id="SendForm" runat="server">
    <div style="text-align:center">
    <table style="height:300px; border-color:#E6E2D8; border-style:solid; border-width:1px; background-color:White;"
     border="0" cellpadding="0" cellspacing="0" width="500px">
    <tr valign="top">
    <td>
    <div style="margin: 2px 2px 2px 2px">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr style="height:20px"> 
    <td align="center" colspan="2" style="font-weight:bold; color:white; background-color:#0093dd">
    <asp:Label ID="lbTitle" runat="server" Text="Отправить сообщение"></asp:Label></td>
    </tr>   
    <tr> 
    <td colspan="2" align="center" valign="middle">
    <div style="margin: 15px 2px 2px 2px">
    <asp:Label ID="lbLogin" runat="server">Сообщение для <b>Login</b></asp:Label>
    </div>
    </td>
    </tr>       
    <tr> 
    <td align="right" valign="middle" style="width:30%">
    <div style="margin: 8px 2px 2px 2px"><span style="color:Red">*</span> Ваш e-mail:</div>
    </td>
    <td align="left" valign="middle" style="width:70%">
    <div style="margin: 8px 2px 2px 2px">
    <asp:TextBox ID="tbEmail" runat="server" MaxLength="80" Width="60%">
    </asp:TextBox>
    <span style="margin: 8px 2px 2px 2px;">
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" CssClass="rfv">Введите e-mail</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail"
     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="rfv">Введите<br />правильный e-mail</asp:RegularExpressionValidator>    
    </span>
    </div>
    </td>
    </tr>    
    <tr> 
    <td align="right" valign="middle" style="width:30%">
    <div style="margin: 12px 2px 2px 2px"><span style="color:Red">*</span> Сообщение:</div>
    </td>
    <td align="left" valign="middle" style="width:70%">
    <div style="margin: 12px 2px 2px 2px">
    <asp:TextBox ID="tbText" runat="server"
     BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
     TextMode="MultiLine" Width="72%" Rows="5"></asp:TextBox>
    <br />Осталось символов: <span id="charLeftSpan"></span>
    <span style="margin-left:10px">
    <asp:RequiredFieldValidator ID="rfvText" runat="server" ControlToValidate="tbText">Введите текст сообщения</asp:RequiredFieldValidator>     
    </span>
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" style="width:30%">
    <div style="margin: 8px 10px 2px 2px">
    <asp:Image ID="img" runat="server" ImageUrl="~/img.aspx?type=mess" />    
    </div>
    </td>
    <td align="left" valign="middle" style="width:70%">
    <div style="margin: 8px 2px 2px 2px; font-size:9pt">
    <asp:TextBox ID="tbAntiBot" runat="server" MaxLength="7" Width="16%"></asp:TextBox>    
    <span class="rfv" style="margin: 8px 2px 2px 5px"> 
    <asp:Label ID="lbAntiBot" runat="server" ForeColor="Red" Visible="False" />     
    <asp:RequiredFieldValidator ID="rfvAntiBot" runat="server" ControlToValidate="tbAntiBot"><br />Введите код на картинке</asp:RequiredFieldValidator>
    </span>    
    <span style="margin: 2px 2px 2px 5px">Введите номер на картинке <span style="color:Red">*</span></span>              
    </div>
    </td>
    </tr>  
    <tr>
    <td align="center" colspan="2"> 
    <div style="margin: 15px 2px 15px 2px">           
    <asp:Button ID="btnSend" runat="server" Text="Отправить личное сообщение" OnClick="btnSend_Click"
    BackColor="#0093DD" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
    Font-Names="Arial" Font-Size="9pt" ForeColor="White" />
    <asp:Button ID="btnClose" runat="server" Text="Закрыть"
    BackColor="#0093DD" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
    Font-Names="Arial" Font-Size="9pt" ForeColor="White" />    
    </div>        
    </td>    
    </tr>
    </table>   
    </div></td></tr></table>
    </div>
    </form>
</body>
</html>
