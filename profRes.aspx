<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profRes.aspx.cs" Inherits="profRes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ошибка</title>
</head>
<body id="Body" runat="server">
    <form id="ResultForm" runat="server">
    <div style="text-align:center">
    <table id="table" style="height:280px; border-color:#E6E2D8; border-style:solid; border-width:1px; background-color:White;"
     border="0" cellpadding="0" cellspacing="0" width="500px">
    <tr>
    <td align="center" valign="top" style="font-weight:bold; color:white; background-color:#0093dd">
    <div id="div" style="margin-top:100px">
    <asp:Label ID="lbResult" runat="server" Text="Извините, данного пользователя не существует"></asp:Label>
    <br /><br />
    <asp:Button ID="btnClose" runat="server" BackColor="White" BorderColor="#0093DD"
     BorderStyle="Solid" BorderWidth="1px" Font-Names="Arial"
     Font-Size="9pt" ForeColor="#0093DD" Text="Закрыть" />
    </div>
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
