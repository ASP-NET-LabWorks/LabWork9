<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LabWork9._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="jumbotron">
    <h1>AJAX</h1>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Отправить" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
