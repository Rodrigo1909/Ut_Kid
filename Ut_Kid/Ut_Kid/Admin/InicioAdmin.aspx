<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="Ut_Kid.Admin.InicioAdmin" %>
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
                    <li><a href="RegistroProfe.aspx" style="color: white">Registrar Profesor</a></li>
                    <li><a href="RegistrarTaller.aspx" style="color: white">Registrar Grupo</a></li>
                    <li><a href="AsignarProfesor.aspx" style="color: white">Asignar Grupo</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</asp:Content>
