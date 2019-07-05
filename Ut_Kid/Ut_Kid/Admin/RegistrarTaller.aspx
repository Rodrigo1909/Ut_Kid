<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarTaller.aspx.cs" Inherits="Ut_Kid.Admin.RegistrarTaller" %>
<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" runat="server" href="./RegistroProfe.aspx" CssClass="btn btn-block btn-sm btn-success">Registrar Profesor</a>
                    <a class="navbar-brand" runat="server" href="../Login.aspx" CssClass="btn btn-block btn-sm btn-success">Registrar Taller</a>
                </div>
            </div>
       </div>
    <%-- Taller --%>
        <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Registro de un taller
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

                                <asp:Image ID="imgTaller" runat="server" ImageUrl="~/Imagenes/Iconos/IconTaller.png"
                                    CssClass="img-responsive img-rounded" />

                            </div>


                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                <br />
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="form-inline">

                                             <div class="form-group">
                                                <label>Nombre: </label>
                                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control input-sm">
                                                </asp:TextBox>
                                                  
                                            </div>


                                            <div class="form-group">
                                                <label>Descripción: </label>
                                                <asp:TextBox ID="txtDescipcion" runat="server" CssClass="form-control input-xl">
                                                </asp:TextBox>
                                                </div>

                                               
                                        </div>
                                        
                                        <br />

                                        <div class="form-group">
                                            <a href="~/InicioAdmin.aspx" class="nav-link" >
                                                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-block btn-sm btn-success" OnClick="btnRegistrarTaller_Click"   />
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