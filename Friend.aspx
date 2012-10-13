<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Friend.aspx.cs" Inherits="Friend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Отправить другу</title>
    <script type="text/javascript" src="Images/script.js"></script>
    <link rel="stylesheet" type="text/css" href="Images/forms.css" />
</head>
<body class="bodyAdd" id="Body" runat="server">
    <form id="SendToFriendForm" runat="server">
    <div style="text-align:center">
    <table class="tableAdver" border="0" cellpadding="0" cellspacing="0" width="500px">
    <tr valign="top">
    <td>
    <div class="mrg2">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr class="hght20"> 
    <td align="center" colspan="2" class="titleAdd">
    <asp:Label ID="lbTitle" runat="server" Text="Отправка сообщения другу"></asp:Label></td>
    </tr>   
    <tr> 
    <td colspan="2" align="center" valign="middle">
    <div class="mrg15-2">
    <asp:Label ID="lbAdver" runat="server"></asp:Label>
    </div>
    </td>
    </tr> 
    <tr> 
    <td align="right" valign="middle" class="wdth30">
    <div class="mrg15-2"><span class="rfvs">*</span> Ваше имя:</div>
    </td>
    <td align="left" valign="middle" class="wdth70">
    <div class="mrg15-2">
    <asp:TextBox ID="tbName" runat="server" MaxLength="80" Width="40%">
    </asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName">Введите имя</asp:RequiredFieldValidator></div>
    </td>
    </tr>   
    <tr> 
    <td align="right" valign="middle" class="wdth30">
    <div class="mrg8-2"><span class="rfvs">*</span> Ваш e-mail:</div>
    </td>
    <td align="left" valign="middle" class="wdth70">
    <div class="mrg8-2">
    <asp:TextBox ID="tbEmail" runat="server" MaxLength="80" Width="40%">
    </asp:TextBox>
    <span class="mrg8-2">
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" CssClass="rfv">Введите e-mail</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail"
     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Введите правильный e-mail</asp:RegularExpressionValidator>    
    </span>
    </div>
    </td>
    </tr> 
    <tr> 
    <td align="right" valign="middle" class="wdth30">
    <div class="mrg8-2"><span class="rfvs">*</span> Имя друга:</div>
    </td>
    <td align="left" valign="middle" class="wdth70">
    <div class="mrg8-2">
    <asp:TextBox ID="tbFrndName" runat="server" MaxLength="80" Width="40%">
    </asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvFrndName" runat="server" ControlToValidate="tbFrndName">Введите имя друга</asp:RequiredFieldValidator></div>
    </td>
    </tr>   
    <tr> 
    <td align="right" valign="middle" class="wdth30">
    <div class="mrg8-2"><span class="rfvs">*</span> E-mail друга:</div>
    </td>
    <td align="left" valign="middle" class="wdth70">
    <div class="mrg8-2">
    <asp:TextBox ID="tbFrndEmail" runat="server" MaxLength="80" Width="40%">
    </asp:TextBox>
    <span class="mrg8-2">
    <asp:RequiredFieldValidator ID="rfvFrndEmail" runat="server" ControlToValidate="tbFrndEmail" CssClass="rfv">Введите e-mail друга</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revFrndEmail" runat="server" ControlToValidate="tbFrndEmail"
     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Введите правильный e-mail</asp:RegularExpressionValidator>    
    </span>
    </div>
    </td>
    </tr>      
    <tr> 
    <td align="right" valign="middle" class="wdth30">
    <div class="mrg8-2"><span class="rfvs">*</span> Сообщение:</div>
    </td>
    <td align="left" valign="middle" class="wdth70">
    <div class="mrg8-2">
    <asp:TextBox ID="tbText" runat="server" CssClass="brdAdd"
     TextMode="MultiLine" Width="72%" Rows="7"></asp:TextBox>
    <br />Осталось символов: <span id="charLeftSpan"></span>
    <span class="mrgLft10">
    <asp:RequiredFieldValidator ID="rfvText" runat="server" ControlToValidate="tbText">Введите сообщение</asp:RequiredFieldValidator>     
    </span>
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth30">
    <div class="mrg8-10-2">
    <asp:Image ID="img" runat="server" ImageUrl="~/img.aspx?type=frnd" />    
    </div>
    </td>
    <td align="left" valign="middle" class="wdth70">
    <div class="informAdd">
    <asp:TextBox ID="tbAntiBot" runat="server" MaxLength="7" Width="16%"></asp:TextBox>        
    <span class="rfvBot">    
    <span class="rfvLB">
    <asp:Label ID="lbAntiBot" runat="server" Visible="False" />
    </span>
    <asp:RequiredFieldValidator ID="rfvAntiBot" runat="server" ControlToValidate="tbAntiBot"><br />Введите код на картинке</asp:RequiredFieldValidator>
    </span>
    <span class="mrg2-5">Введите номер на картинке <span class="rfvs">*</span></span>            
    </div>
    </td>
    </tr>  
    <tr>
    <td align="center" colspan="2"> 
    <div class="mrg15-2-15-2">           
    <asp:Button ID="btnSend" runat="server" Text="Отправить сообщение" OnClick="btnSend_Click" CssClass="btnsAdd" />&nbsp;
    <asp:Button ID="btnClose" runat="server" Text="Закрыть" CssClass="btnsAdd" />    
    </div>        
    </td>    
    </tr>
    </table>   
    </div></td></tr></table>
    </div>
    </form>
</body>
</html>
