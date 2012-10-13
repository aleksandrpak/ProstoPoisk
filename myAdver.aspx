<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/office.master" CodeFile="myAdver.aspx.cs" Inherits="myAdver" %>

<asp:Content ID="MyAdverForm" runat="server" ContentPlaceHolderID="cphOffice">  
<div style="text-align:center; margin:5px 5px 5px 5px;">
<div style="font-size:11pt; font-weight:bold; margin: 5px 5px 12px 5px">
Мои объявления
</div>
    <asp:GridView ID="gvMyAdver" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  DataSourceID="sdsMyAdver" PageSize="14" OnRowDataBound="gvMyAdver_RowDataBound" BorderWidth="0px">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Names="Arial" Font-Size="8pt" />
  <Columns>
   <asp:TemplateField HeaderText="Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle Font-Names="Arial" Font-Size="8pt" Width="80px" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="9pt" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="Текст объявления">
    <ItemStyle Font-Names="Arial" Font-Size="8pt" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="9pt" />
    <ItemTemplate>     
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' />       
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />      
    </ItemTemplate>       
   </asp:TemplateField>      
  </Columns>
 </asp:GridView>
 <div style="margin: 12px 5px 12px 5px">
 <asp:HyperLink ID="hlBack" runat="server" Font-Size="9pt" NavigateUrl="office.aspx" ForeColor="Black">Обратно</asp:HyperLink>
 </div>
 </div> 
 
  <asp:SqlDataSource ID="sdsMyAdver" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetMyAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet">            
        </asp:SqlDataSource>
        
    </asp:Content>