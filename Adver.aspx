<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adver.aspx.cs" Inherits="Adver" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Объявление</title>
    <link rel="stylesheet" type="text/css" href="Images/forms.css" />
</head>
<body class="bodyAdd" id="Body" runat="server">
    <form id="AdverForm" runat="server">
    <div class="frmDiv">
    <table class="tableAdver" border="0" cellpadding="0" cellspacing="0" width="400px">
    <tr valign="top">
    <td>
    <div class="mrg2">
    <table class="hght396" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr class="hght20"> 
    <td align="center" colspan="2" class="titleAdd">
    <asp:Label ID="lbTop" runat="server" Text="Объявление"></asp:Label>
    </td>
    </tr>
    <tr> 
    <td align="left" valign="bottom" class="wdth75">
    <div class="mrg15-5">
    <asp:Label ID="lbTitle" runat="server"></asp:Label>
    </div>
    </td>
    <td align="right" valign="top" class="wdth25">
    <div class="mrg15-5">
    <asp:Image ID="photo" runat="server" Visible="False" />
    </div>
    </td>
    </tr>
    <tr> 
    <td align="left" colspan="2">
    <div class="mrg15-5">
    <asp:Label ID="lbText" runat="server"></asp:Label>
    </div>
    </td>
    </tr>
    <tr valign="bottom"> 
    <td align="center" colspan="2">
    <div class="adverMenu">
    <asp:HyperLink ID="hlSend" runat="server" Text="Отправить сообщение"></asp:HyperLink> | 
    <asp:HyperLink ID="hlFrnd" runat="server" Text="Отправить другу"></asp:HyperLink>     
    <asp:Label ID="profile" runat="server" Text=" | "></asp:Label>    
    <asp:HyperLink ID="hlProfile" runat="server" Text="Профиль пользователя"></asp:HyperLink>         
    <div class="mrgTop10">
    <asp:HyperLink ID="hlEdit" runat="server" Text="Редактировать"></asp:HyperLink>    
    <asp:Label ID="delete" runat="server" Text="|"></asp:Label>    
    <asp:HyperLink ID="hlDelete" runat="server" Text="Удалить" />    
    </div>  
    <div class="mrgTop10">       
    <asp:Label ID="lbError" runat="server" ForeColor="Red" Text="У вас нет прав на удаление этой записи" Visible="False"></asp:Label>          
    </div>
    <div class="mrg10-20">       
    <asp:Button ID="btnClose" runat="server" Text="Закрыть" CssClass="btnsAdd" />
    </div>        
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
