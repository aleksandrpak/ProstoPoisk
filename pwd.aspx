<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/office.master" CodeFile="pwd.aspx.cs" Inherits="pwd" %>

<asp:Content ID="ChngPwd" runat="server" ContentPlaceHolderID="cphOffice">
<div style="margin: 10px 10px 10px 10px; text-align:center">
        <asp:ChangePassword ID="cpMain" runat="server" Font-Names="Arial"
            Font-Size="9pt" CancelDestinationPageUrl="~/office.aspx" ChangePasswordFailureText="Неверный старый пароль или неправильный новый пароль. Минимальная длина пароля: {0}." ContinueDestinationPageUrl="~/office.aspx">
            <CancelButtonStyle BackColor="White" BorderColor="#B5C7DE" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Arial" Font-Size="9pt" ForeColor="#284775" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <PasswordHintStyle Font-Italic="True" ForeColor="#888888" />
            <ChangePasswordButtonStyle BackColor="White" BorderColor="#B5C7DE" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Arial" Font-Size="9pt" ForeColor="#284775" />
            <ContinueButtonStyle BackColor="White" BorderColor="#B5C7DE" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Arial" Font-Size="9pt" ForeColor="#284775" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="10pt" ForeColor="White" />
            <ChangePasswordTemplate>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="center" colspan="2" style="font-weight:bold; font-size:11pt;">
                                        Смена пароля</td>
                                </tr>
                                <tr>
                                    <td align="right">                                    
                                    <div style="margin:15px 5px 5px 5px">
                                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Старый пароль:</asp:Label>
                                    </div></td>                                    
                                    <td align="left">                                    
                                    <div style="margin:15px 5px 5px 5px">
                                        <asp:TextBox ID="CurrentPassword" runat="server" Font-Size="9pt" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                            ErrorMessage="Введите пароль" ToolTip="Введите пароль" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    <div style="margin:5px 5px 5px 5px">
                                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">Новый пароль:</asp:Label>
                                    </div></td>
                                    <td align="left">
                                    <div style="margin:5px 5px 5px 5px">
                                        <asp:TextBox ID="NewPassword" runat="server" Font-Size="9pt" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                            ErrorMessage="Введите новый пароль" ToolTip="Введите новый пароль"
                                            ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    <div style="margin:5px 5px 5px 5px">
                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Потвердите новый пароль:</asp:Label>
                                    </div></td>
                                    <td align="left">
                                    <div style="margin:5px 5px 5px 5px">
                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" Font-Size="9pt" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                            ErrorMessage="Потвердите новый пароль" ToolTip="Потвердите новый пароль"
                                            ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </div></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                            ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Пароли не совпадают"
                                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: red">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                    <br />
                                        <asp:LinkButton ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                                         Font-Names="Arial" Font-Size="9pt" ForeColor="Black" Text="Поменять пароль" 
                                         ValidationGroup="ChangePassword1" />
                                        <span style="margin-left:10px">
                                        <asp:LinkButton ID="CancelPushButton" runat="server"
                                         CausesValidation="False" CommandName="Cancel" Font-Names="Arial" 
                                         Font-Size="9pt" ForeColor="Black" Text="Отмена" />
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ChangePasswordTemplate>
            <TextBoxStyle Font-Size="9pt" />
            <SuccessTemplate>
                <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td>
                            <table width="150" border="0" cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2" style="font-weight:bold; font-size:11pt;">
                                        Смена пароля</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <br />Ваш пароль был изменен</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                    <br />
                                        <asp:LinkButton ID="ContinuePushButton" runat="server"
                                        CausesValidation="False" CommandName="Continue"
                                        Font-Names="Arial" Font-Size="9pt" ForeColor="Black" Text="Продолжить" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </SuccessTemplate>
        </asp:ChangePassword>
    </div>
</asp:Content>
