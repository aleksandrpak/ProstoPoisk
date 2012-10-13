<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sendResult.aspx.cs" Inherits="sendResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Сообщение отправлено</title>
</head>
<body>
    <form id="SendResultForm" runat="server">
    <div style="text-align:center;">
    <table style="height:380px; border-color:#E6E2D8; border-style:solid; border-width:1px; background-color:White;"
     border="0" cellpadding="0" cellspacing="0" width="485px">
    <tr>
    <td align="center" valign="top" style="font-weight:bold; color:white; background-color:#0093dd">
    <div style="margin-top:100px">
    <asp:Label ID="lbResult" runat="server" Text="Сообщение отправлено"></asp:Label>
    <br /><br /><br />
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
