<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LabWork9._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        const pm = Sys.WebForms.PageRequestManager.getInstance()

        function endRequest(sender, args) {
            if (args.get_error())
                document.getElementById("error").innerText = "Ошибка обработана"
        }

        function pageLoad() {
            pm.add_endRequest(endRequest)
        }

        function abortPostBack() {
            if (pm.get_isInAsyncPostBack())
                pm.abortPostBack()
        }
    </script>

    <div class="jumbotron">
        <h1>AJAX</h1>
        <p class="lead">
            Время на момент загрузки страницы: 
        <asp:Label ID="LabelLoadTime" runat="server"></asp:Label>
        </p>
        <asp:Button ID="ButtonReloadAll" CssClass="btn btn-primary" runat="server" Text="Перезагрузить все UpdatePanel" />
        <div class="row my-3">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnLoad="UpdatePanel1_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label1" runat="server"></asp:Label>
                                <hr />
                                <asp:Button CssClass="btn btn-primary" runat="server" Text="↻" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" OnLoad="UpdatePanel2_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label2" runat="server"></asp:Label>
                                <hr />
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button CssClass="btn btn-primary" runat="server" Text="↻" />
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" OnLoad="UpdatePanel3_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label3" runat="server"></asp:Label>
                                <hr />
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                                    <asp:ListItem Value="A" Text="A"></asp:ListItem>
                                    <asp:ListItem Value="B" Text="B"></asp:ListItem>
                                    <asp:ListItem Value="C" Text="C"></asp:ListItem>
                                </asp:CheckBoxList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" OnLoad="UpdatePanel4_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label4" runat="server"></asp:Label>
                                <hr />
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                                    <asp:ListItem Value="1" Text="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                </asp:RadioButtonList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" OnLoad="UpdatePanel5_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label5" runat="server"></asp:Label>
                                <hr />
                                <div class="row">
                                    <div class="col">
                                        <asp:Button ID="ButtonError" OnClick="ButtonError_Click" CssClass="btn btn-danger" runat="server" Text="!" />
                                    </div>
                                    <div class="col-8 text-center">
                                        <p class="text-danger" id="error"></p>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" OnLoad="UpdatePanel6_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label6" runat="server"></asp:Label>
                                <hr />
                                <div class="row">
                                    <div class="col">
                                        <asp:Button ID="ButtonSleep" OnClick="ButtonSleep_Click" CssClass="btn btn-warning" runat="server" Text="⌚" />
                                    </div>
                                    <div class="col-8 text-center">
                                        <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel6">
                                            <ProgressTemplate>
                                                <button class="btn btn-primary" type="button" onclick="abortPostBack()">
                                                    <span class="spinner-border spinner-border-sm"></span>
                                                    <span>Отмена</span>
                                                </button>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" OnLoad="UpdatePanel7_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label7" runat="server"></asp:Label>
                                <hr />
                                <p>Я обновляюсь раз в секунду</p>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                                <asp:AsyncPostBackTrigger ControlID="Timer1" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server" OnLoad="UpdatePanel8_Load" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label CssClass="lead" ID="Label8" runat="server"></asp:Label>
                                <hr />
                                <p>Я обновляюсь раз в 2 секунды</p>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ButtonReloadAll" />
                                <asp:AsyncPostBackTrigger ControlID="Timer2" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:Timer Interval="1000" ID="Timer1" runat="server"></asp:Timer>
    <asp:Timer Interval="2000" ID="Timer2" runat="server"></asp:Timer>

</asp:Content>
