<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarTaller.aspx.cs" Inherits="Ut_Kid.Admin.RegistrarTaller" %>

<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                    <a class="navbar-brand" runat="server" href="~/Admin/RegistroProfe.aspx" CssClass="btn btn-block btn-sm btn-success">Registrar Profesor</a>
                    <a class="navbar-brand" runat="server" href="~/Admin/RegistrarTaller.aspx" CssClass="btn btn-block btn-sm btn-success">Registrar Taller</a>
                    <a class="navbar-brand" runat="server" href="~/Admin/AsignarProfesor.aspx" CssClass="btn btn-block btn-sm btn-success">Asignar Taller</a>
                    <a class="navbar-brand" runat="server" href="../Login.aspx" CssClass="btn btn-block btn-sm btn-success">Salir</a>
            </div>
        </div>
    </div>
    <%-- Insertar Taller --%>
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
                                    <a href="~/InicioAdmin.aspx" class="nav-link">
                                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-block btn-sm btn-success" Width="55%" OnClick="btnRegistrarTaller_Click" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Editar o eliminar Taller --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Consultar Talleres
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="80%" DataSourceID="SqlDataSource1" AllowPaging="True" >
                    <Columns>
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagenes/Iconos/IconEliminar.png" DeleteText="" 
                            EditImageUrl="~/Imagenes/Iconos/IconEditar.png" EditText="" InsertText="" NewText="" 
                            ShowEditButton="True" UpdateImageUrl="~/Imagenes/Iconos/IconGuardar.png" UpdateText="" 
                            CancelImageUrl="~/Imagenes/Iconos/IconCancelar.png" CancelText="" ShowDeleteButton="True" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre"  SortExpression="strNombre" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="Descripción"  SortExpression="strDescripcion" />
                    </Columns>
                   <HeaderStyle BackColor="#ffcc00" ForeColor="White" Font-Size="18px" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ut_kidsConnectionString %>" 
                    SelectCommand="SELECT strNombre, strDescripcion FROM TblTaller WHERE (strStatus = 1)"
                    UpdateCommand="UPDATE TblTaller SET strNombre = @strNombre, strDescripcion = @strDescripcion WHERE id = @id"
                    DeleteCommand="UPDATE TblTaller SET strStatus = 0 WHERE id = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                        <asp:Parameter Name="strStatus" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="strNombre" />
                        <asp:Parameter Name="strDescripcion" />
                        <asp:Parameter Name="id" />
                    </UpdateParameters>

                    
                </asp:SqlDataSource>


            </div>
        </div>
    </div>
</asp:Content>
