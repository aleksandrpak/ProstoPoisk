<%@ Page Language="C#" AutoEventWireup="true" CodeFile="passrecover.aspx.cs" Inherits="passrecover" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Восстановление пароля</title>
</head>
<body style="margin: 5px 5px 5px 5px">
    <form id="PassRecoverForm" runat="server">
    <div style="text-align:center">    
    <asp:PasswordRecovery ID="prMain" runat="server" AnswerLabelText="Ответ:"
     OnSendingMail="prMain_OnSendingMail"
        BackColor="White" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid"
        BorderWidth="1px" Font-Names="Arial" Font-Size="9pt" GeneralFailureText="Ваша попытка восстановить пароль была неудачна. Пожайлуста попытайтесь снова."
        QuestionFailureText="Неверный ответ. Попытайтесь снова."        
        UserNameFailureText="Неудачный доступ к вашей информации. Пожайлуста повторите попытку.">        
        <InstructionTextStyle Font-Italic="True" Font-Names="Arial" ForeColor="Black" />
        <SuccessTextStyle Font-Bold="True" Font-Names="Arial" ForeColor="#507CD1" />
        <ValidatorTextStyle Font-Names="Arial" />
        <TextBoxStyle Font-Names="Arial" Font-Size="9pt" />
        <LabelStyle Font-Names="Arial" />
        <TitleTextStyle BackColor="#0093DD" Font-Bold="True" Font-Names="Arial" Font-Size="11pt"
            ForeColor="White" />
        <HyperLinkStyle Font-Names="Arial" />
        <SubmitButtonStyle BackColor="#0093DD" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Arial" Font-Size="9pt" ForeColor="White" />
        <FailureTextStyle Font-Names="Arial" />        
        <UserNameTemplate>
            <table width="100%" border="0" cellpadding="4" cellspacing="0" style="width:280px; height:150px; border-collapse: collapse">
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" style="font-weight: bold; font-size: 11pt; color: white;
                                    font-family: Arial; background-color: #0093dd">
                                    Забыли пароль?</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: black; font-style: italic; font-family: Arial">
                                    Введите вашь логин чтобы получить пароль.</td>
                            </tr>
                            <tr>
                                <td align="right" style="width:30%; font-family: Arial">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label></td>
                                <td style="width:70%;" align="left">
                                    <asp:TextBox ID="UserName" runat="server" Font-Names="Arial" Font-Size="9pt" MaxLength="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="User Name is required." Font-Names="Arial" ToolTip="User Name is required."
                                        ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red; font-family: Arial">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <br /><asp:Button ID="SubmitButton" runat="server" BackColor="#0093DD" BorderColor="#507CD1"
                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Arial"
                                        Font-Size="9pt" ForeColor="White" Text="Дальше" ValidationGroup="PasswordRecovery1" />
                                    <asp:Button ID="CancelButton" runat="server" BackColor="#0093DD" BorderColor="#507CD1"
                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Arial"
                                        Font-Size="9pt" ForeColor="White" Text="Отмена" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </UserNameTemplate>
        <QuestionTemplate>
            <table border="0" cellpadding="4" cellspacing="0" style="width:280px; height:150px; border-collapse:collapse">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" style="font-weight:bold; font-size:11pt; color:white;
                                    background-color:#0093DD">
                                    Секретный вопрос</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:black; font-style:italic">
                                    Ответьте на вопрос для получения пароля.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Логин:</td>
                                <td align="left">
                                    <asp:Label ID="lbUserName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Вопрос:</td>
                                <td align="left">
                                    <asp:Literal ID="Question" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Ответ:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="Answer" runat="server" Font-Size="9pt"  MaxLength="120"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="Необходим ответ" ToolTip="Необходим ответ" ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <br /><asp:Button ID="SubmitButton" runat="server" BackColor="#0093DD" BorderColor="#507CD1"
                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Arial"
                                        Font-Size="9pt" ForeColor="White" Text="Выслать" ValidationGroup="PasswordRecovery1" />
                                    <asp:Button ID="CancelButton" runat="server" BackColor="#0093DD" BorderColor="#507CD1"
                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Arial"
                                        Font-Size="9pt" ForeColor="White" Text="Отмена" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </QuestionTemplate>
        <SuccessTemplate>
            <table border="0" cellpadding="4" cellspacing="0" style="width:280px; height:150px; background-color:#0093DD; border-collapse:collapse;">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" style="color:White; font-weight:bold;">
                                Ваш пароль был выслан Вам на e-mail<br /><br />
                                <asp:Button ID="CancelButton" runat="server" BackColor="White" BorderColor="#0093DD"
                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Arial"
                                        Font-Size="9pt" ForeColor="#0093DD" Text="Закрыть" />                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </SuccessTemplate>
    </asp:PasswordRecovery>    
    </div>
    </form>
</body>
</html>
