<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/office.master" CodeFile="mess.aspx.cs" Inherits="mess" %>

<asp:Content ID="MyAdverForm" runat="server" ContentPlaceHolderID="cphOffice">  
<div class="messDiv">
<div class="messTitle">
Мои сообщения
</div>
    <asp:GridView ID="gvMyMess" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MessageID" 
  DataSourceID="sdsMyMess" PageSize="14" OnRowDataBound="gvMyMess_RowDataBound" BorderWidth="0px">
  <PagerStyle CssClass="messPager" HorizontalAlign="Center" VerticalAlign="Bottom" Font-Names="Arial" Font-Size="8pt" />
  <Columns>  
  <asp:TemplateField>          
    <ControlStyle Width="20px" />
    <ItemStyle Font-Names="Arial" Font-Size="8pt" Width="20px" />    
     <ItemTemplate>
      <asp:CheckBox ID="cbDelete" runat="server"></asp:CheckBox>
     </ItemTemplate>
   </asp:TemplateField>
  <asp:TemplateField HeaderText="дата">          
    <ControlStyle Width="80px" />
    <ItemStyle Font-Names="Arial" Font-Size="8pt" Width="80px" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="10pt" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("sendDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="на объявления<br />">
    <ItemStyle Font-Names="Arial" Font-Size="8pt" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="10pt" />
    <ItemTemplate>     
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbMessageID" Text='<%# Eval("MessageID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' />       
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("message") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbSender" Text='<%# Eval("sender") %>' />
     <asp:Label runat="server" ID="lbEmail" Text='<%# Eval("Email") %>' />      
     <asp:Label runat="server" ID="lbUserName" Text='<%# Eval("UserName") %>' />
    </ItemTemplate>       
   </asp:TemplateField>      
  </Columns>
 </asp:GridView>
 
 <asp:GridView ID="gvPM" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="pmID" 
  DataSourceID="sdsPM" PageSize="14" OnRowDataBound="gvPM_RowDataBound" BorderWidth="0px">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" Font-Names="Arial" Font-Size="8pt" />
  <Columns>
  <asp:TemplateField>          
    <ControlStyle Width="20px" />
    <ItemStyle Font-Names="Arial" Font-Size="8pt" Width="20px" />    
     <ItemTemplate>
      <asp:CheckBox ID="cbDelete" runat="server"></asp:CheckBox>
     </ItemTemplate>
   </asp:TemplateField>
  <asp:TemplateField HeaderText="<br />дата">          
    <ControlStyle Width="80px" />
    <ItemStyle Font-Names="Arial" Font-Size="8pt" Width="80px" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="10pt" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("sendDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />личные<br />">
    <ItemStyle Font-Names="Arial" Font-Size="8pt" />
    <HeaderStyle Font-Bold="False" Font-Names="Arial" Font-Size="10pt" />
    <ItemTemplate>     
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbPMID" Text='<%# Eval("pmID") %>' />            
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("messText") %>' />  
     <asp:Label runat="server" ID="lbEmail" Text='<%# Eval("Email") %>' />
    </ItemTemplate>       
   </asp:TemplateField>      
  </Columns>
 </asp:GridView>
 <div style="margin: 12px 5px 12px 5px">
 <asp:LinkButton ID="btnDelete" runat="server" ForeColor="Black" Font-Size="9pt" Text="Удалить" OnClick="btnDelete_Click"></asp:LinkButton>
 <span style="margin-left:10px">
 <asp:HyperLink ID="hlBack" runat="server" Font-Size="9pt" NavigateUrl="office.aspx" ForeColor="Black">Обратно</asp:HyperLink> 
 </span>
 </div>
 </div> 
 
  <asp:SqlDataSource ID="sdsMyMess" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetMyMess"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet">            
        </asp:SqlDataSource>    
  <asp:SqlDataSource ID="sdsPM" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetPrivMess"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet">            
        </asp:SqlDataSource>    
    </asp:Content>
