<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Actividad.aspx.cs" Inherits="Ut_Kid.Profe.Actividad"  %>
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
                    <li><a href="#" style="color: white">Actividades</a></li>
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
    <h3 class="text-info">Control de las actividades por taller</h3>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div ID="divEditar" runat="server">
        
        Taller<asp:DropDownList ID="ddlActualizarTaller" runat="server" CssClass="form-control"></asp:DropDownList>
        Actividad<asp:TextBox ID="txtActualizarNombre" runat="server" CssClass="form-control"></asp:TextBox><br/>
        Desripción<asp:TextBox ID="txtActualizarDescripcion" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <br />
        <asp:Button ID="Button2" runat="server" onClick="Button2_Click" Text="Actualizar" CssClass="btn btn-primary btn-success" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Cancelar" CssClass="btn btn-primary btn-success" />
        <br />
    </div>
    <div id="divCrear" runat="server">
        Taller<asp:DropDownList ID="ddlTalleres" OnSelectedIndexChanged="ddlTalleres_SelectedIndexChanged" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
        Actividad<asp:TextBox ID="txtActividad" runat="server" CssClass="form-control"></asp:TextBox><br/>
        Desripción<asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <asp:Label ID="lblMensaje" Text="" runat="server" />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" CssClass="btn btn-primary btn-success" /><br/>
    </div>
    <div ID="divEliminar" runat="server">
        Taller<asp:Label ID="lblEliminarTaller" Text="" runat="server" CssClass="help-block" />
        Actividad<asp:Label ID="lblEliminarNombre" Text="" runat="server" CssClass="help-block" />
        Desripción<asp:Label ID="lblEliminarDescripcion" Text="" runat="server" CssClass="help-block" />
        <asp:Label ID="lblEliminarMensage" Text="¿Eliminar Registro?" runat="server" ForeColor="#CC0000" />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click"  Text="Eliminar" CssClass="btn btn-primary btn-success" /><br/><br />
        <asp:Button ID="Button5" runat="server"  OnClick="Button5_Click" Text="Cancelar" CssClass="btn btn-primary btn-success" /><br/>
    </div>
    <div ID="divGrid" runat="server">
        <asp:Label ID="lblmsgGeneral" Text="" runat="server" />
        <asp:GridView ID="gvActividades" AutoGenerateColumns="False" runat="server" OnRowDeleted="gvActividades_RowDeleted" OnRowDeleting="gvActividades_RowDeleting" CssClass="table color-table table-striped table-responsive " OnSelectedIndexChanged="gvActividades_SelectedIndexChanged" >
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" /> 
                <asp:BoundField DataField="idTaller" HeaderText="idTaller" /> 
                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hidId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem,"id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hidIdTaller" runat="server" Value='<%#DataBinder.Eval(Container.DataItem,"idTaller") %>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="strNombre" HeaderText="Taller" />  
                <asp:BoundField DataField="strvalor" HeaderText="Actividad" />  
                <asp:BoundField DataField="strdescripcion" HeaderText="Descripcion" />  
                <asp:CommandField ShowSelectButton="true" SelectText="Editar" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
            </asp:GridView>
    </div>
    
</asp:Content>
