<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="DefaultForm" runat="server" ContentPlaceHolderID="cphMain">
<asp:Label ID="lbError" runat="server" Text="Извините в данной категории нет ни одного объявления" CssClass="noAdver"></asp:Label>
<asp:GridView ID="search" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsSearch" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="Текст объявления">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="Регион">         
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>
 
 <asp:GridView ID="sell" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsSell" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="Текст объявления - Продам">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="Регион">         
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>

 <asp:GridView ID="buy" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsBuy" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="<br />Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />Текст объявления - Куплю">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="<br />Регион">          
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
            <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>
 
 <asp:GridView ID="work" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsWork" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="<br />Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />Текст объявления - Работа">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="<br />Регион">
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>
 
 <asp:GridView ID="serv" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsServ" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="<br />Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />Текст объявления - Услуги">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="<br />Регион">          
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView> 
 
 <asp:GridView ID="rent" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsRent" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="<br />Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />Текст объявления - Аренда">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="<br />Регион">          
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>
 
 <asp:GridView ID="chng" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsChng" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="<br />Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />Текст объявления - Обмен">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="<br />Регион">         
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>
 
 <asp:GridView ID="rest" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
  Width="100%" DataSourceID="sdsRest" PageSize="14" OnRowDataBound="GridView_RowDataBound" BorderWidth="0px"
  OnPageIndexChanged="GridView_PageIndexChanged">
  <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gvFnt" />
  <Columns>
   <asp:TemplateField HeaderText="<br />Дата">          
    <ControlStyle Width="80px" />
    <ItemStyle CssClass="gvFnt" Width="80px" />
    <HeaderStyle CssClass="gvHdr" Width="80px" />
     <ItemTemplate>
      <asp:Label ID="lbDate" runat="server" Text='<%# Eval("startDate") %>'></asp:Label>
     </ItemTemplate>
   </asp:TemplateField>
   <asp:TemplateField HeaderText="<br />Текст объявления - Разное">
    <ItemStyle CssClass="gvFnt" />
    <HeaderStyle CssClass="gvHdr" />
    <ItemTemplate>
     <asp:Label runat="server" ID="lbMainText" Text="" /> 
     <asp:Label runat="server" ID="lbAdverID" Text='<%# Eval("AdverID") %>' /> 
     <asp:Label runat="server" ID="lbTitle" Text='<%# Eval("title") %>' /> 
     <asp:Label runat="server" ID="lbLogin" Text='<%# Eval("UserName") %>' /> 
     <asp:Label runat="server" ID="lbText" Text='<%# Eval("adverText") %>' />  
     <asp:Label runat="server" ID="lbTelephone" Text='<%# Eval("telephone") %>' />      
     <asp:Label runat="server" ID="lbPrice" Text='<%# Eval("price") %>' />
     <asp:Label runat="server" ID="lbMoney" Text='<%# Eval("moneyType") %>' />
     <asp:Label runat="server" ID="lbPhoto" Text='<%# Eval("photo") %>' />     
    </ItemTemplate>       
   </asp:TemplateField>
      <asp:TemplateField HeaderText="<br />Регион">
          <ControlStyle Width="150px" />
          <ItemStyle CssClass="gvFnt" Width="150px" />
          <HeaderStyle CssClass="gvHdr" Width="150px" />
          <ItemTemplate>
           <asp:Label ID="lbRegion" runat="server" Text='<%# Eval("regionName") %>'></asp:Label>
          </ItemTemplate>
      </asp:TemplateField>
  </Columns>
 </asp:GridView>
    
 <asp:SqlDataSource ID="sdsSell" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"         
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="sell" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsBuy" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="buy" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsWork" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="work" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsServ" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="serv" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsRent" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="rent" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsChng" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="chng" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsRest" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetAdver"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet"
        OnSelected="SqlDataSource_Selected">
        <SelectParameters>
        <asp:Parameter Name="type" DefaultValue="rest" />
        <asp:QueryStringParameter QueryStringField="cat" Name="categoryID" DefaultValue="0" />
        </SelectParameters>               
        </asp:SqlDataSource>
        
 <asp:SqlDataSource ID="sdsSearch" runat="server" 
  ConnectionString="<%$ ConnectionStrings:cnTrade %>"             
        DataSourceMode="DataSet" OnSelected="SqlDataSource_Selected">
        <SelectParameters> 
        </SelectParameters>               
        </asp:SqlDataSource>
</asp:Content>
