<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.master" CodeFile="newsDetal.aspx.cs" Inherits="newsDetal" %>

<asp:Content ID="DetalNewsForm" runat="server" ContentPlaceHolderID="cphMain">
<div style="margin:10px 10px 10px 10px">
<asp:Label ID="lbTitle" runat="server" Font-Size="11pt" />
<asp:Label runat="server" ID="lbDate" Font-Size="9pt" />   
<asp:Label runat="server" ID="lbText" Font-Size="10pt" />
<br /><br />
<asp:HyperLink ID="hlBack" runat="server" Font-Size="10pt"
Text="Обратно" ForeColor="Black" NavigateUrl="~/news.aspx" />      
</div>
</asp:Content>
