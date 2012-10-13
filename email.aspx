<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/office.master" CodeFile="email.aspx.cs" Inherits="email" %>

<asp:Content ID="ChngEmail" runat="server" ContentPlaceHolderID="cphOffice">    
    <div class="algnCntr">    
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
     <tr>
      <td>
       <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
         <td align="center" colspan="2" class="officeTitle">
          Смена e-mail'а
         </td>
        </tr>
        <tr>
         <td align="right" class="cell50">
          <div class="mrg15-5">
           <asp:Label ID="NewEmailLabel" runat="server" CssClass="ftnSize10">Новый e-mail:</asp:Label>
          </div>
         </td>
         <td align="left" class="emailTD">
          <div class="mrg15-5">
           <asp:TextBox ID="NewEmail" runat="server" CssClass="ftnSize9"></asp:TextBox>
           <asp:RequiredFieldValidator ID="NewEmailRequired" runat="server" ControlToValidate="NewEmail"
            CssClass="rfv">Введите новый e-mail</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="NewEmail" CssClass="rfv">Введите правильный e-mail</asp:RegularExpressionValidator>
          </div>
         </td>
        </tr>
        <tr>
         <td align="right" class="cell50">
          <div class="mrg5">
           <asp:Label ID="ConfirmNewEmailLabel" runat="server" CssClass="ftnSize10">Потвердите новый e-mail:</asp:Label>
          </div>
         </td>                                       
         <td align="left" class="emailTD">
          <div class="mrg5">
           <asp:TextBox ID="ConfirmNewEmail" runat="server" CssClass="ftnSize9"></asp:TextBox>
           <asp:RequiredFieldValidator ID="ConfirmNewEmailRequired" runat="server" ControlToValidate="ConfirmNewEmail"                                            
            CssClass="rfv">Потвердите новый e-mail</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="revConfirmEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="ConfirmNewEmail" CssClass="rfv">Введите правильный e-mail</asp:RegularExpressionValidator>
          </div>
         </td>
        </tr>
        <tr>
         <td align="right" class="cell50">
          <div class="mrg5">
           <asp:Label ID="lbPwd" runat="server" CssClass="ftnSize10">Пароль:</asp:Label>
          </div>
         </td>                                       
         <td align="left" class="emailTD">
          <div class="mrg5">
           <asp:TextBox ID="tbPwd" runat="server" CssClass="ftnSize9" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="tbPwd">Введите пароль</asp:RequiredFieldValidator>                                        
          </div>
         </td>
        </tr>
        <tr>
         <td align="center" colspan="2">
          <div class="mrg5">
           <asp:Label ID="lbPwdError" runat="server" CssClass="lbError" Text="Неверный пароль" Visible="False" />
           <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewEmail" CssClass="ftnSize9"
            ControlToValidate="ConfirmNewEmail" Display="Static">E-mail'ы не совпадают</asp:CompareValidator>
          </div>
         </td>
        </tr>
        <tr>
         <td align="center" colspan="2">   
          <div class="mrg5-15-5">
           <asp:LinkButton ID="btnChange" runat="server" Text="Поменять e-mail" OnClick="btnChange_Click" CssClass="lnkBtn"  />
           <span class="mrgLft10">
            <asp:LinkButton ID="btnCancel" runat="server" OnClick="btnCancel_Click"
             CausesValidation="False" CssClass="lnkBtn" Text="Отмена" />
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