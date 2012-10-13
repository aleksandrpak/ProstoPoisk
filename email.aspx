<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/office.master" CodeFile="email.aspx.cs" Inherits="email" %>

<asp:Content ID="ChngEmail" runat="server" ContentPlaceHolderID="cphOffice">    
    <div class="algnCntr">    
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
     <tr>
      <td>
       <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
         <td align="center" colspan="2" class="officeTitle">
          ����� e-mail'�
         </td>
        </tr>
        <tr>
         <td align="right" class="cell50">
          <div class="mrg15-5">
           <asp:Label ID="NewEmailLabel" runat="server" CssClass="ftnSize10">����� e-mail:</asp:Label>
          </div>
         </td>
         <td align="left" class="emailTD">
          <div class="mrg15-5">
           <asp:TextBox ID="NewEmail" runat="server" CssClass="ftnSize9"></asp:TextBox>
           <asp:RequiredFieldValidator ID="NewEmailRequired" runat="server" ControlToValidate="NewEmail"
            CssClass="rfv">������� ����� e-mail</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="NewEmail" CssClass="rfv">������� ���������� e-mail</asp:RegularExpressionValidator>
          </div>
         </td>
        </tr>
        <tr>
         <td align="right" class="cell50">
          <div class="mrg5">
           <asp:Label ID="ConfirmNewEmailLabel" runat="server" CssClass="ftnSize10">���������� ����� e-mail:</asp:Label>
          </div>
         </td>                                       
         <td align="left" class="emailTD">
          <div class="mrg5">
           <asp:TextBox ID="ConfirmNewEmail" runat="server" CssClass="ftnSize9"></asp:TextBox>
           <asp:RequiredFieldValidator ID="ConfirmNewEmailRequired" runat="server" ControlToValidate="ConfirmNewEmail"                                            
            CssClass="rfv">���������� ����� e-mail</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="revConfirmEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="ConfirmNewEmail" CssClass="rfv">������� ���������� e-mail</asp:RegularExpressionValidator>
          </div>
         </td>
        </tr>
        <tr>
         <td align="right" class="cell50">
          <div class="mrg5">
           <asp:Label ID="lbPwd" runat="server" CssClass="ftnSize10">������:</asp:Label>
          </div>
         </td>                                       
         <td align="left" class="emailTD">
          <div class="mrg5">
           <asp:TextBox ID="tbPwd" runat="server" CssClass="ftnSize9" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="tbPwd">������� ������</asp:RequiredFieldValidator>                                        
          </div>
         </td>
        </tr>
        <tr>
         <td align="center" colspan="2">
          <div class="mrg5">
           <asp:Label ID="lbPwdError" runat="server" CssClass="lbError" Text="�������� ������" Visible="False" />
           <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewEmail" CssClass="ftnSize9"
            ControlToValidate="ConfirmNewEmail" Display="Static">E-mail'� �� ���������</asp:CompareValidator>
          </div>
         </td>
        </tr>
        <tr>
         <td align="center" colspan="2">   
          <div class="mrg5-15-5">
           <asp:LinkButton ID="btnChange" runat="server" Text="�������� e-mail" OnClick="btnChange_Click" CssClass="lnkBtn"  />
           <span class="mrgLft10">
            <asp:LinkButton ID="btnCancel" runat="server" OnClick="btnCancel_Click"
             CausesValidation="False" CssClass="lnkBtn" Text="������" />
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