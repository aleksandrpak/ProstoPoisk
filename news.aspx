<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.master" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="NewsPage" runat="server" ContentPlaceHolderID="cphMain">
<asp:HyperLink ID="hlAdd" runat="server" Text="Добавить новость" ForeColor="Black" Font-Size="10pt"
NavigateUrl="~/addNews.aspx" Visible="False" />
<div style="margin:10px 10px 10px 10px">
<asp:GridView ID="gvNews" runat="server" AllowPaging="True" AutoGenerateColumns="False"  Width="100%"
  DataSourceID="sdsNews" PageSize="8" OnRowDataBound="gvNews_RowDataBound" BorderWidth="0px" DataKeyNames="newsID">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Names="Arial" Font-Size="9pt" />
  <Columns>
   <asp:TemplateField>
    <ItemStyle Font-Names="Arial" Font-Size="9pt" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="9pt" />
    <ItemTemplate>    
     <asp:Label runat="server" ID="lbTitle" Font-Size="11pt" Text='<%# Eval("newsTitle") %>' /> 
     <br />
     <asp:Label runat="server" ID="lbDate" Text='<%# Eval("newsDate") %>' />   
     <br />
     <br />    
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("newsShortText") %>' />
     <br />
     <br /> 
     <asp:HyperLink ID="hlDetal" runat="server" Text="Подробнее" ForeColor="Black" NavigateUrl='<%# Eval("newsID") %>' />     
     <asp:LinkButton ID="btnDelete" runat="server" ForeColor="Black"
      Text="<span style='margin-left:10px'>Удалить</span>" OnClick="btnDelete_Click" Visible="False"></asp:LinkButton>     
    </ItemTemplate>       
   </asp:TemplateField>      
  </Columns>
 </asp:GridView>
 </div>
 
  <asp:SqlDataSource ID="sdsNews" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetNews"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        DeleteCommand="DeleteNews"  
        DeleteCommandType="StoredProcedure"  >            
        </asp:SqlDataSource>
</asp:Content>
