<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Добавление объявления</title>    
    <link rel="stylesheet" type="text/css" href="Images/forms.css" />
    <script type="text/javascript" src="Images/script.js"></script>
</head>
<body class="bodyAdd" id="Body" runat="server">
    <form id="AddForm" runat="server">
    <div style="text-align:center">
    <table class="tableAdd"
     border="0" cellpadding="0" cellspacing="0" width="600px">
    <tr valign="top">
    <td>
    <div class="mrg2">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr class="hght20"> 
    <td align="center" colspan="2" class="titleAdd">
    <asp:Label ID="lbTitle" runat="server" Text="Добавление объявления"></asp:Label></td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg15-2"><span class="rfvs">*</span> Тип:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg15-2">
    <asp:DropDownList ID="ddlType" runat="server" CssClass="ftnSize9">
    <asp:ListItem Selected="True" Value=""></asp:ListItem>
    <asp:ListItem Value="sell">Продажа</asp:ListItem>
    <asp:ListItem Value="buy">Покупка</asp:ListItem>
    <asp:ListItem Value="work">Работа</asp:ListItem>
    <asp:ListItem Value="serv">Услуги</asp:ListItem>
    <asp:ListItem Value="rent">Аренда</asp:ListItem>
    <asp:ListItem Value="chng">Обмен</asp:ListItem>
    <asp:ListItem Value="rest">Прочее</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlType">Выберите тип</asp:RequiredFieldValidator></div>
    </td>
    </tr>    
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2"><span class="rfvs">*</span> Регион:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:DropDownList ID="ddlRegion" runat="server" CssClass="ftnSize9">
    <asp:ListItem Selected="True" Value=""></asp:ListItem>    
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvRegion" runat="server" ControlToValidate="ddlRegion">Выберите регион</asp:RequiredFieldValidator>
    <span class="mrg8-2-30">
    <asp:RequiredFieldValidator ID="rfvCat" runat="server" ControlToValidate="ddlCat">Выберите категорию</asp:RequiredFieldValidator>
    </span>
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2"><span class="rfvs">*</span> Категория:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:DropDownList ID="ddlCat" runat="server" CssClass="ftnSize9" AppendDataBoundItems="True" 
    DataSourceID="sdsCat" DataTextField="categoryName" DataValueField="categoryID">          
    <asp:ListItem Value=""></asp:ListItem>        
    </asp:DropDownList>
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2"><span class="rfvs">*</span> Заголовок:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbTitle" runat="server" CssClass="brdAdd"
    Width="68%" MaxLength="50"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle">Введите заголовок</asp:RequiredFieldValidator>    
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2"><span class="rfvs">*</span> Текст:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbText" runat="server" CssClass="brdAdd"
     TextMode="MultiLine" Width="72%" Rows="7"></asp:TextBox>
    <br />Осталось символов: <span id="charLeftSpan"></span>
    <span class="mrgLft10">
    <asp:RequiredFieldValidator ID="rfvText" runat="server" ControlToValidate="tbText">Введите текст объявления</asp:RequiredFieldValidator>     
    </span>
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2">    
    Фотография:    
    </div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:FileUpload ID="fuPhoto" runat="server" Width="50%" CssClass="brdAdd" />
    <asp:Label ID="lbPhoto" runat="server" Visible="False" CssClass="lb"></asp:Label>
    <asp:Image CssClass="rfv" Visible="False" ID="photo" runat="server" />
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2">Цена:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbPrice" runat="server" CssClass="brdAdd"
    Width="15%" MaxLength="40"></asp:TextBox>
    <asp:DropDownList ID="ddlMoney" runat="server" CssClass="ftnSize9">
    <asp:ListItem Value="у.е." Text="у.е."></asp:ListItem>    
    <asp:ListItem Value="Сум" Text="Сум"></asp:ListItem>    
    </asp:DropDownList></div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2">Телефон:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbTelephone" runat="server" CssClass="brdAdd"
    Width="30%" MaxLength="40"></asp:TextBox>         
    </div>
    </td>
    </tr>
    <tr id="email"> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2"><span class="rfvs">*</span> E-mail:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbEmail" runat="server" CssClass="brdAdd"
    Width="30%" MaxLength="40"></asp:TextBox>    
    <span class="mrg8-2">
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" CssClass="rfv">Введите e-mail</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail"
     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="rfv">Введите правильный e-mail адрес</asp:RegularExpressionValidator>    
    </span>
    </div>
    </td>    
    </tr>
    <tr id="pwd"> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2"><span class="rfvs">*</span> Пароль:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbPwd" runat="server" TextMode="Password" CssClass="brdAdd"
    Width="20%" MaxLength="15"></asp:TextBox>
    <asp:Label ID="lbPwd" runat="server" Visible="False" CssClass="lb" Text="Неверный пароль"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="tbPwd">Введите пароль</asp:RequiredFieldValidator>         
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2">Срок публикации:</div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:DropDownList ID="ddlTime" runat="server" CssClass="ftnSize9">
    <asp:ListItem Value="28" Text="4 недели"></asp:ListItem>    
    <asp:ListItem Value="21" Text="3 недели"></asp:ListItem>    
    <asp:ListItem Value="14" Text="2 недели"></asp:ListItem> 
    <asp:ListItem Value="7" Text="1 неделя"></asp:ListItem>
    </asp:DropDownList></div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-2">
    <asp:CheckBox ID="cbInform" runat="server" Checked="True" />
    </div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="informAdd">
    <label for="cbInform">Сообщить об окончании срока публикации</label>
    </div>
    </td>
    </tr>
    <tr> 
    <td align="right" valign="middle" class="wdth25">
    <div class="mrg8-10-2">
    <asp:Image ID="img" runat="server" ImageUrl="~/img.aspx?type=add" />    
    </div>
    </td>
    <td align="left" valign="middle" class="wdth75">
    <div class="mrg8-2">
    <asp:TextBox ID="tbAntiBot" runat="server" MaxLength="7" Width="12%"></asp:TextBox>    
    <span class="antiBotText">Введите номер на картинке <span class="rfvs">*</span></span>    
    <span class="lbAntiBot">
    <asp:Label ID="lbAntiBot" runat="server" Visible="False" />
    </span>
    <asp:RequiredFieldValidator ID="rfvAntiBot" runat="server" ControlToValidate="tbAntiBot">Введите код на картинке</asp:RequiredFieldValidator>    
    </div>
    </td>
    </tr>    
    <tr>
    <td align="center" colspan="2"> 
    <div class="mrg8-2-15-2">       
    <asp:Button ID="btnAdd" runat="server" Text="Добавить объявление" OnClick="btnAdd_Click" CssClass="btnsAdd" />&nbsp;    
    <asp:Button ID="btnClose" runat="server" Text="Закрыть" CssClass="btnsAdd"  />    
    </div>        
    </td>    
    </tr>
    </table>       
    <asp:SqlDataSource ID="sdsCat" runat="server" 
     ConnectionString="<%$ ConnectionStrings:cnTrade %>"
        SelectCommand="GetCategories"  
        SelectCommandType="StoredProcedure"               
        DataSourceMode="DataSet">                      
        </asp:SqlDataSource>
    </div></td></tr></table>
    </div>
    </form>
</body>
</html>
