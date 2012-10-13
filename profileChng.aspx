<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/office.master" CodeFile="profileChng.aspx.cs" Inherits="profileChng" %>

<asp:Content ID="ProfileChngForm" runat="server" ContentPlaceHolderID="cphOffice">
<div style="margin: 8px 8px 8px 8px; font-size:10pt">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="center" colspan="2" style="font-size:11pt; font-weight:bold;">
Изменение личной информации
</td>
</tr>
<tr>
<td valign="top" style="width:100px">
<div style="margin: 5px 5px 2px 5px">
<div style="text-align:center">
<asp:Image ID="imgPhoto" runat="server" ImageUrl="~/Images/avatar.jpg" />
</div>
<asp:LinkButton ID="btnDelete" runat="server" OnClick="btnDelete_Click"
 ForeColor="Black" Text="Удалить<br />аватар" />
 </div>
</td>
<td valign="top" align="right">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="right" style="width:20%">
<div style="margin: 15px 3px 3px 3px">
Фамилия:
</div>
</td>
<td align="left" style="width:80%">
<div style="margin: 15px 3px 3px 3px">
<asp:TextBox ID="tbLastName" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
</div>
</td>
</tr>
<tr>
<td align="right" style="width:20%">
<div style="margin: 5px 3px 3px 3px">
Имя:
</div>
</td>
<td align="left" style="width:80%">
<div style="margin: 5px 3px 3px 3px">
<asp:TextBox ID="tbFirstName" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
</div>
</td>
</tr>
<tr>
<td align="right" style="width:20%">
<div style="margin: 5px 3px 3px 3px">
Телефон:
</div>
</td>
<td align="left" style="width:80%">
<div style="margin: 5px 3px 3px 3px">
<asp:TextBox ID="tbTelephone" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
</div>
</td>
</tr>
<tr>
<td align="right" style="width:20%">
<div style="margin: 5px 3px 3px 3px">
ICQ:
</div>
</td>
<td align="left" style="width:80%">
<div style="margin: 5px 3px 3px 3px">
<asp:TextBox ID="tbIcq" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
</div>
</td>
</tr>
<tr>
<td align="right" valign="top" style="width:20%">
<div style="margin: 5px 3px 3px 3px">
Аватар:
</div>
</td>
<td align="left" style="width:80%">
<div style="margin: 5px 3px 3px 3px">
<asp:FileUpload ID="fuPhoto" runat="server" Width="90%"
 BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" /> 
<asp:Label ID="lbPhoto" runat="server" ForeColor="Red" Visible="False"></asp:Label>
</div>
</td>
</tr>
<tr>
<td align="right" style="width:20%">
<div style="margin: 5px 3px 3px 3px">
<asp:CheckBox ID="cbEmail" runat="server" />
</div>
</td>
<td align="left" style="width:80%">
<div style="margin: 5px 3px 3px 3px">
<label for="ctl00_ctl00_cphMain_cphOffice_cbEmail">Сообщить об окончании срока публикации</label>
</div>
</td>
</tr>
<tr>
<td align="right" style="width:20%">
</td>
<td align="left" style="width:80%">
<div style="margin: 15px 3px 15px 3px">
<asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click"
 ForeColor="Black" Text="Сохранить изменения" />
<span style="margin-left:10px">
<asp:HyperLink ID="hlBack" runat="server" NavigateUrl="office.aspx" ForeColor="Black">Обратно</asp:HyperLink>
</span>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</asp:Content> 
