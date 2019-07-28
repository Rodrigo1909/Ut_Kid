<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Premiar.aspx.cs" Inherits="Ut_Kid.Profe.Premiar" %>
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
                    <li><a href="3" style="color: white">Premiar</a></li>
                    <li><a href="Actividad.aspx" style="color: white">Actividades</a></li>
                    <li><a href="Inicio.aspx" style="color: white">Inicio</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <br />
    <br />
        <h3 class="text-info">Agrega dinero a los niños que participaron en la actividad</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    
    <div>
            <%--Taller<asp:DropDownList ID="ddlTaller" runat="server" CssClass="form-control"></asp:DropDownList>
            Actividad<asp:DropDownList ID="ddlActividad" runat="server" CssClass="form-control"></asp:DropDownList>
            Niño<asp:DropDownList ID="ddlNiño" runat="server" CssClass="form-control"></asp:DropDownList>--%>
            Clave Niño
            <asp:TextBox ID="txtClave" runat="server" OnTextChanged="txtClave_TextChanged" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
            <asp:Label ID="lblCantidad" Text="$" runat="server" CssClass="text-info" />
            <br />
            <asp:Label ID="lblDatos" Text="" runat="server" CssClass="text-info" />
            <br />
            Cantidad<asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblMensaje" Text="" runat="server" CssClass="text-info"/>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" CssClass="btn btn-primary btn-success" />
        </div>
</asp:Content>
