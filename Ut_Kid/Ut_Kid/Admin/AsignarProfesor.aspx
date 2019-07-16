<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AsignarProfesor.aspx.cs" Inherits="Ut_Kid.Admin.AsignarProfesor" %>

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

    
    <%-- Asignar profesor al curso --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Asigne el profesor que impartira el curso
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

                        <asp:Image ID="imgTaller" runat="server" ImageUrl="~/Imagenes/Iconos/IconProfesor.jpg"
                            CssClass="img-responsive img-rounded" />

                    </div>


                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-inline">
                                    <asp:Label ID="lbProfe" runat="server" Text="Seleccione el profesor a impartir el curso: " Visible="True"></asp:Label>
                                    <asp:DropDownList ID="ddlNombreProfesor" runat="server" AppendDataBoundItems="True" Height="100%" ></asp:DropDownList>
                                 </div>

                                <br />

                                <div class="form-inline">
                                    <asp:Label ID="lbTaller" runat="server" Text="Seleccione el grupo a impartir: " Visible="True"></asp:Label>
                                    <asp:DropDownList ID="ddlNombreTaller" runat="server" AppendDataBoundItems="True"  Height="100%" ></asp:DropDownList>      
                                </div>
                                 <br />

                                <div class="form-group">
                                    <a href="~/InicioAdmin.aspx" class="nav-link">
                                        <asp:Button ID="btnRegistrar" runat="server" Text="Asignar" CssClass="btn btn-block btn-sm btn-success" OnClick="btnAsignarTaller" Width="65%"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>