<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.master" CodeFile="addNews.aspx.cs" Inherits="addNews" %>

<asp:Content ID="NewsForm" runat="server" ContentPlaceHolderID="cphMain">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td align="right" class="cell30">
    <div class="mrg15-5">
    Название новости:
    </div>
    </td>
    <td align="left" class="cell70">
    <div class="mrg15-5">
    <asp:TextBox ID="tbTitle" runat="server" Width="60%" />
    </div>
    </td>
    </tr>
    <tr>
    <td valign="top" align="right" class="cell30">
    <div class="mrg8-5">
    Краткое описание:
    </div>
    </td>
    <td align="left" class="cell70">
    <div class="mrg8-5">
    <asp:TextBox ID="tbShortText" runat="server" TextMode="MultiLine" Rows="5" Width="70%" />
    <br />Осталось символов: <span id="charLeftSpan"></span>
    </div>
    </td>
    </tr>
    <tr>
    <td valign="top" align="right" class="cell30">
    <div class="mrg8-5">
    Текст новости:
    </div>
    </td>
    <td align="left" class="cell70">
    <div class="mrg8-5">
    <asp:TextBox ID="tbText" runat="server" TextMode="MultiLine" Rows="10" Width="70%" />
    <br />Осталось символов: <span id="charLeftSpanText"></span>
    </div>
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center">
    <div class="mrg15-5">
    <asp:LinkButton ID="btnAdd" runat="server" Text="Добавить новость" OnClick="btnAdd_Click"
    Font-Names="Arial" Font-Size="12pt" ForeColor="Black" />
    </div>
    </td>
    </tr>
    </table>
    </asp:Content>
