<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adverRes.aspx.cs" Inherits="adverRes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ќбъ€вление успешно удалено</title>
    <link rel="stylesheet" type="text/css" href="Images/forms.css" />
</head>
<body>
    <form id="AdverForm" runat="server">
    <div class="algnCntr">
    <table class="tableAdverRes" border="0" cellpadding="0" cellspacing="0" width="380px">
    <tr>
    <td align="center" valign="top" class="tdAdverRes">
    <div class="mrgTop100">
    <asp:Label ID="lbResult" runat="server" Text="ќбъ€вление успешно удалено"></asp:Label>
    <br /><br /><br />
    <asp:Button ID="btnClose" runat="server" Text="«акрыть" CssClass="btnsResult" />
    </div>
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
