<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarHijo.aspx.cs" Inherits="Ut_Kid.Padre.RegistrarNino" %>

<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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

                                    </div>

                                    <div class="form-group">
                                        <label>Apellido Paterno: </label>
                                        <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Apellido Materno: </label>
                                        <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Edad: </label>
                                        <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control input-xl">
                                        </asp:TextBox>
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
                </div>
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

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="80%" DataSourceID="SqlDataSource1" AllowPaging="True" >
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                                            DeleteImageUrl="~/Imagenes/Iconos/IconEliminar.png" 
                                            EditImageUrl="~/Imagenes/Iconos/IconEditar.png"
                                            ShowEditButton="True" UpdateImageUrl="~/Imagenes/Iconos/IconGuardar.png"  
                                            CancelImageUrl="~/Imagenes/Iconos/IconCancelar.png"  
                                            ShowDeleteButton="True" />
                        <asp:BoundField DataField="id" HeaderText="Id"  SortExpression="id" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre"  SortExpression="strNombre" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="Descripción"  SortExpression="strDescripcion" />
                    </Columns>
                   <HeaderStyle BackColor="#ffcc00" ForeColor="White" Font-Size="18px" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ut_kidsConnectionString %>" 
                    SelectCommand="SELECT id, strNombre, strDescripcion FROM TblTaller WHERE (strStatus = 1)"
                    UpdateCommand="UPDATE TblTaller SET strNombre = @strNombre, strDescripcion = @strDescripcion WHERE (id = @id)"
                    DeleteCommand="UPDATE TblTaller SET strStatus = 0 WHERE (id = @id)">
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


                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1">
                    <Columns>
                        <asp:BoundField DataField="strNombre" HeaderText="strNombre" ReadOnly="True" SortExpression="strNombre" />
                        <asp:BoundField DataField="strApellidoP" HeaderText="strApellidoP" ReadOnly="True" SortExpression="strApellidoP" />
                        <asp:BoundField DataField="strApellidoM" HeaderText="strApellidoM" ReadOnly="True" SortExpression="strApellidoM" />
                        <asp:BoundField DataField="intEdad" HeaderText="intEdad" ReadOnly="True" SortExpression="intEdad" />
                        <asp:BoundField DataField="strSexo" HeaderText="strSexo" ReadOnly="True" SortExpression="strSexo" />
                        <asp:BoundField DataField="strAlergia" HeaderText="strAlergia" ReadOnly="True" SortExpression="strAlergia" />
                        <asp:BoundField DataField="idPadre" HeaderText="idPadre" ReadOnly="True" SortExpression="idPadre" />
                    </Columns>
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Modelo.UtBaseDatoDataContext" EntityTypeName="" 
                    Select="new (strNombre, strApellidoP, strApellidoM, intEdad, strSexo, strAlergia, idPadre)" TableName="TblNino">
                </asp:LinqDataSource>


            </div>
        </div>
    </div>
</asp:Content>
