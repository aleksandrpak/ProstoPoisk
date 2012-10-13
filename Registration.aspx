<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Регистрация</title>
</head>
<body style="margin: 5px 5px 5px 5px">
    <form id="RegistrationForm" runat="server">
    <div style="text-align:center">
        <asp:CreateUserWizard ID="cuwMain" runat="server" AnswerLabelText="Ответ:"
            AnswerRequiredErrorMessage="Введите ответ на секретный вопрос" BackColor="White"
            BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" CancelButtonText="Отмена"
            CompleteSuccessText="Ваш аккаунт был удачно создан" ConfirmPasswordCompareErrorMessage="Пароли не совпадают"
            ConfirmPasswordLabelText="Повторите пароль:" ConfirmPasswordRequiredErrorMessage="Пожайлуста введите пароль еще раз"
            ContinueButtonText="Закрыть" CreateUserButtonText="Зарегистрироваться" DisplayCancelButton="True"
            DuplicateEmailErrorMessage="Этот e-mail уже зарегистрирован, пожайлуста введите другой e-mail"
            DuplicateUserNameErrorMessage="Этот логин уже занят, пожайлуста введите другой логин."
            EmailRegularExpressionErrorMessage="Пожайлуста введите другой e-mail" EmailRequiredErrorMessage="Введите e-mail"
            Font-Names="Arial" Font-Size="9pt" Height="220px" InvalidAnswerErrorMessage="Пожайлуста введите другой ответ на секретный вопрос"
            InvalidEmailErrorMessage="Пожайлуста введите существующий e-mail" InvalidPasswordErrorMessage="Минимальная длина пароля 7 символов"
            InvalidQuestionErrorMessage="Пожайлуста введите другой секретный вопрос" LoginCreatedUser="False"
            PasswordLabelText="Пароль:" PasswordRegularExpressionErrorMessage="Пожайлуста введите другой пароль"
            PasswordRequiredErrorMessage="Введите пароль" QuestionLabelText="Секретный вопрос:"
            QuestionRequiredErrorMessage="Введите секретный вопрос" StartNextButtonText="Дальше"
            StepNextButtonText="Дальше" StepPreviousButtonText="Назад" UnknownErrorMessage="Ваш аккаунт не был создан. Пожайлуста попытайтесь снова"
            UserNameLabelText="Логин:" UserNameRequiredErrorMessage="Введите логин" Width="400px" OnCreatedUser="cuwMain_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="cuwsMain" runat="server">
                    <ContentTemplate>
                        <table border="0" style="font-size: 100%; width: 400px; font-family: Arial; height: 265px">
                            <tr style="height:20px"> 
                                <td align="center" colspan="2" style="font-weight:bold; color:white; background-color:#0093dd">
                                    Регистрация</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="UserName" runat="server" MaxLength="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="Введите логин" ToolTip="Введите логин" ValidationGroup="cuwMain">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbLastName" runat="server">Фамилия:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="tbLastName" runat="server" MaxLength="250"></asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbFirstName" runat="server">Имя:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="tbFirstName" runat="server" MaxLength="250"></asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="120"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="Введите пароль" ToolTip="Введите пароль" ValidationGroup="cuwMain">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Повторите пароль:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" MaxLength="120"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="Пожайлуста введите пароль еще раз" ToolTip="Пожайлуста введите пароль еще раз"
                                        ValidationGroup="cuwMain">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="Email" runat="server" MaxLength="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="Введите e-mail" ToolTip="Введите e-mail" ValidationGroup="cuwMain">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Секретный вопрос:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="Question" runat="server" MaxLength="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                        ErrorMessage="Введите секретный вопрос" ToolTip="Введите секретный вопрос" ValidationGroup="cuwMain">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Ответ:</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="Answer" runat="server" MaxLength="120"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="Введите ответ на секретный вопрос" ToolTip="Введите ответ на секретный вопрос"
                                        ValidationGroup="cuwMain">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Пароли не совпадают"
                                        ValidationGroup="cuwMain"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width: 100%; height: 100%;">
                            <tr align="right">
                                <td align="right" colspan="0">
                                    <asp:Button ID="StepNextButton" runat="server" BackColor="#0093DD" BorderColor="#CCCCCC"
                                        BorderStyle="Solid" BorderWidth="1px" CommandName="MoveNext" ForeColor="White"
                                        Text="Зарегистрироваться" ValidationGroup="cuwMain" />
                                </td>
                                <td align="right" colspan="0">
                                    <asp:Button ID="CancelButton" runat="server" BackColor="#0093DD" BorderColor="#CCCCCC"
                                        BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Cancel"
                                        ForeColor="White" Text="Отмена" ValidationGroup="cuwMain" />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="cwsMain" runat="server">
                    <ContentTemplate>
                        <table border="0" style="font-size: 100%; width: 400px; font-family: Arial; height: 220px">
                            <tr style="height: 20px">
                                <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #0093dd">
                                    Регистрация</td>
                            </tr>
                            <tr style="height: 160px">
                                <td align="center" style="font-size: 12pt">
                                    Ваш аккаунт был удачно создан</td>
                            </tr>
                            <tr style="height: 115px">
                                <td align="right" colspan="2">
                                    <div style="margin: 5px 20px 5px 5px">
                                        <asp:Button ID="ContinueButton" runat="server" BackColor="#0093DD" BorderColor="#CCCCCC"
                                            BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Continue"
                                            ForeColor="White" Text="Закрыть" ValidationGroup="cuwMain" /></div>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <TitleTextStyle BackColor="#0093DD" Font-Bold="True" ForeColor="White" />
            <NavigationButtonStyle BackColor="#0093DD" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" ForeColor="White" />
            <FinishCompleteButtonStyle BackColor="#0093DD" ForeColor="White" />
            <HeaderStyle BackColor="#0093DD" BorderStyle="Solid" Font-Bold="True" Font-Size="11pt"
                ForeColor="White" HorizontalAlign="Center" />
            <CreateUserButtonStyle BackColor="#0093DD" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" ForeColor="White" />
            <ContinueButtonStyle BackColor="#0093DD" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" ForeColor="White" />
            <StepStyle BorderWidth="0px" />
            <FinishPreviousButtonStyle BackColor="#0093DD" ForeColor="White" />
            <CancelButtonStyle BackColor="#0093DD" ForeColor="White" />
            <StartNavigationTemplate>
                <asp:Button ID="StartNextButton" runat="server" BackColor="#0093DD" BorderColor="#CCCCCC"
                    BorderStyle="Solid" BorderWidth="1px" CommandName="MoveNext" ForeColor="White"
                    Text="Дальше" />
            </StartNavigationTemplate>
        </asp:CreateUserWizard>
    
    </div>
    </form>
</body>
</html>
