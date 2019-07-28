<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Ut_Kid.Profe.Inicio" %>
<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
<header>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: white" href="../Login.aspx">Salir</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Cobrar.aspx" style="color: white">Cobrar</a></li>
                    <li><a href="Premiar.aspx" style="color: white">Premiar</a></li>
                    <li><a href="Actividad.aspx" style="color: white">Actividades</a></li>
                    <li><a href="#" style="color: white">Inicio</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/>
    <br/>
    <h1>Bienvenido <asp:Label ID="lblUser" Text="User" runat="server" ForeColor="#003399" /></h1>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <label class="text-info">En la parte superior tienes tu menu de opciones</label>
</asp:Content>
