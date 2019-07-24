<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarHijo.aspx.cs" Inherits="Ut_Kid.Padre.RegistrarNino" %>

<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 560px;
            height: 315px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
    <header>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: white" href="../Login.aspx">Salir</a>
            </div>
        </div>
    </nav>
</header>
</asp:Content>

<asp:Content ID="Header" ContentPlaceHolderID="MainContent" runat="server">
    <br />
<br />
<br />
<br />
    <%-- Insertar Hijo --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Registra tus hijos
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

                        <asp:Image ID="imgTaller" runat="server" ImageUrl="~/Imagenes/Iconos/IconHijo.png"
                            CssClass="img-responsive img-rounded" />

                    </div>


                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-inline">

                                    <div class="form-group">
                                        <label>Nombre: </label>
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control input-sm">
                                        </asp:TextBox>
                                        <asp:RegularExpressionValidator ID="validarNombre" runat="server" ControlToValidate="txtNombre"
                                          ErrorMessage="Ingrese solo letras" ForeColor="Red" ValidationExpression="[A-Za-z]*$">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Apellido Paterno: </label>
                                        <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                        <asp:RegularExpressionValidator ID="validarApellidoP" runat="server" ControlToValidate="txtApellidoP"
                                           ErrorMessage="Ingrese solo letras" ForeColor="Red" ValidationExpression="[A-Za-z]*$">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Apellido Materno: </label>
                                        <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                        <asp:RegularExpressionValidator ID="validarApellidoM" runat="server" ControlToValidate="txtApellidoM"
                                            ErrorMessage="Ingrese solo letras" ForeColor="Red" ValidationExpression="[A-Za-z]*$">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Edad: </label>
                                        <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                        <asp:RegularExpressionValidator ID="validarEdad" runat="server" ControlToValidate="txtEdad"
                                                    ErrorMessage="Ingrese solo numeros" ForeColor="Red" ValidationExpression="^[0-9]*">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group">
                                        <label>Sexo: </label>
                                        <asp:TextBox ID="txtSexo" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Especifique alergias: </label>
                                        <asp:TextBox ID="txtAlergia" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                    </div>

                                    <asp:Label ID="lbPadre" runat="server" Text="Label" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">

                                <div class="panel panel-body">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="panel-title">
                                                Usuario de su hijo
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-inline">

                                                <div class="form-group">
                                                    <label>Usuario de su hijo: </label>
                                                    <asp:TextBox ID="txtUsuario" runat="server"
                                                        placeholder="Ejemplo" required="required"
                                                        CssClass="form-control input-sm" ></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <label>Contraseña: </label>
                                                    <asp:TextBox ID="txtPass" runat="server"
                                                        placeholder="Contraseña: " required="required"
                                                        CssClass="form-control input-sm" TextMode="Password"></asp:TextBox>
                                                </div>
                                                  <hr />
                                                
                                            <a  href="../Login.aspx" class="nav-link" >
                                                
                                                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-block btn-sm btn-success" OnClick="btnRegistarHijo" />
                                            </a>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                                <center><img class="auto-style1" src="../Imagenes/RestaFacil.png" /></div></center>    
            </div>
        </div>
    </div>

    <%-- Editar o eliminar Hijo --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Estos son los niños que has registrado
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true" Width="100%" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                    </Columns>
                    <HeaderStyle BackColor="#ffcc00" ForeColor="White" Font-Size="18px" />
                </asp:GridView>     
            </div>
        </div>
    </div>
</asp:Content>
