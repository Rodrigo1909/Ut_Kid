﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="Ut_Kid.Admin.InicioAdmin" %>
<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" runat="server" href="~/Admin/RegistroProfe.aspx" CssClass="btn btn-block btn-sm btn-success">Registrar Profesor</a>
                    <a class="navbar-brand" runat="server" href="~/Admin/RegistrarTaller.aspx" CssClass="btn btn-block btn-sm btn-success">Registrar Grupo</a>
                    <a class="navbar-brand" runat="server" href="~/Admin/AsignarProfesor.aspx" CssClass="btn btn-block btn-sm btn-success">Asignar Grupo</a>
                    <a class="navbar-brand" runat="server" href="../Login.aspx" CssClass="btn btn-block btn-sm btn-success">Salir</a>
                </div>
            </div>
            </div>
</asp:Content>