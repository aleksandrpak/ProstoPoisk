<%@ Page Language="C#" MasterPageFile="~/office.master" AutoEventWireup="true" CodeFile="office.aspx.cs" Inherits="office" %>

<asp:Content ID="OfficeForm" runat="server" ContentPlaceHolderID="cphOffice">
<div id="officeDiv" runat="server" style="margin: 5px 5px 5px 5px">
<div style="font-size:11pt; font-weight:bold; margin: 5px 5px 12px 150px">
Мой профиль
</div>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td style="width:100px" valign="top">
<div style="margin: 5px 5px 5px 5px; font-size:9pt">
<asp:Image ID="photo" runat="server" ImageUrl="~/Images/avatar.jpg"></asp:Image>
<br />
<asp:HyperLink ID="hlPhoto" runat="server" ForeColor="Black" NavigateUrl="profileChng.aspx" Text="Сменить<br />аватар"></asp:HyperLink>
</div>
</td>
<td valign="top">
<div style="font-size:10pt">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td style="width:30%" align="left">
<div style="margin: 10px 2px 3px 40px">
<asp:Label ID="lbLogin" runat="server" Text="Логин:" />
</div>
</td>
<td style="width:70%" align="left">
<div style="margin: 10px 2px 3px 2px">
<asp:Label ID="lbLoginText" runat="server" />
</div>
</td>
</tr>
<tr id="name">
<td style="width:30%" align="left">
<div style="margin: 5px 2px 3px 40px">
<asp:Label ID="lbName" runat="server" Text="Имя:" />
</div>
</td>
<td style="width:70%" align="left">
<div style="margin: 5px 2px 3px 2px">
<asp:Label ID="lbNameText" runat="server" />
</div>
</td>
</tr>
<tr id="tel">
<td style="width:30%" align="left">
<div style="margin: 5px 2px 3px 40px">
<asp:Label ID="lbTelephone" runat="server" Text="Телефон:" />
</div>
</td>
<td style="width:70%" align="left">
<div style="margin: 5px 2px 3px 2px">
<asp:Label ID="lbTelephoneText" runat="server" />
</div>
</td>
</tr>
<tr>
<td style="width:30%" align="left">
<div style="margin: 5px 2px 3px 40px">
<asp:Label ID="lbEmail" runat="server" Text="E-mail:" />
</div>
</td>
<td style="width:70%" align="left">
<div style="margin: 5px 2px 3px 2px">
<asp:Label ID="lbEmailText" runat="server" />
</div>
</td>
</tr>
<tr id="icq">
<td style="width:30%" align="left">
<div style="margin: 5px 2px 3px 40px">
<asp:Label ID="lbIcq" runat="server" Text="ICQ:" />
</div>
</td>
<td style="width:70%" align="left">
<div style="margin: 5px 2px 3px 2px">
<asp:Label ID="lbIcqText" runat="server" />
</div>
</td>
</tr>
<tr>
<td style="width:30%" align="left">
<div style="margin: 5px 2px 3px 40px">
<asp:Label ID="lbRegDate" runat="server" Text="Дата регистрации:" />
</div>
</td>
<td style="width:70%" align="left">
<div style="margin: 5px 2px 3px 2px">
<asp:Label ID="lbRegDateText" runat="server" />
</div>
</td>
</tr>
</table>
</div>
</td>
</tr>
</table>
</div>
</asp:Content>
