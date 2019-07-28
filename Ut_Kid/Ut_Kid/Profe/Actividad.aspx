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
        <asp:TextBox ID="txtActualizarId" runat="server" Visible="false" Enabled="false" />
        Taller<asp:DropDownList ID="ddlActualizarTaller" runat="server" CssClass="form-control"></asp:DropDownList>
        Actividad<asp:TextBox ID="txtActualizarNombre" runat="server" CssClass="form-control"></asp:TextBox><br/>
        Desripción<asp:TextBox ID="txtActualizarDescripcion" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <br />
        <asp:Button ID="btnActualizar" OnClick="btnActualizar_Click" runat="server" Text="Actualizar" CssClass="btn btn-primary btn-success" />
        <br />
        <br />
        <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-success" />
        <br />
    </div>
    <div id="divDdl" runat="server">
        Taller<asp:DropDownList ID="ddlTalleres" OnSelectedIndexChanged="ddlTalleres_SelectedIndexChanged" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>    
    </div>
    <div id="divCrear" runat="server">
        Actividad<asp:TextBox ID="txtActividad" runat="server" CssClass="form-control"></asp:TextBox><br/>
        Desripción<asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control"></asp:TextBox><br/>
        <br />
        <asp:Button ID="btnCrear" OnClick="btnCrear_Click1" runat="server" Text="Guardar" CssClass="btn btn-primary btn-success" /><br/>
        <br />
        <br />
        <asp:Button ID="btnCancelar3" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-success" />
        <br />
    </div>
    <div ID="divEliminar" runat="server">
        <asp:TextBox ID="txtEliminarId" runat="server" Visible="false" Enabled="false" />
        Taller<asp:Label ID="lblEliminarTaller" Text="" runat="server" CssClass="help-block" />
        Actividad<asp:Label ID="lblEliminarNombre" Text="" runat="server" CssClass="help-block" />
        Desripción<asp:Label ID="lblEliminarDescripcion" Text="" runat="server" CssClass="help-block" />
        <asp:Label ID="lblEliminarMensage" Text="¿Eliminar Registro?" runat="server" ForeColor="#CC0000" />
        <br />
        <asp:Button ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" Text="Eliminar" CssClass="btn btn-primary btn-success" /><br/><br />
        <asp:Button ID="btnCancelar2" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-success" /><br/>
    </div>
    <div ID="divGrid" runat="server">
        <asp:Button ID="btnNuevo" OnClick="btnNuevo_Click" Text="Nuevo" runat="server" CssClass="btn btn-primary btn-success" /><br />
        <asp:Label ID="lblmsgGeneral" Text="" runat="server" />
        <asp:GridView ID="gvActividades" AutoGenerateColumns="False" runat="server" CssClass="table color-table table-striped table-responsive " CellPadding="4" 
            ForeColor="#333333" GridLines="None" OnRowCommand="gvActividades_RowCommand"
             OnRowEditing="gvActividades_RowEditing"  OnRowDeleting="gvActividades_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" /> 
                <asp:BoundField DataField="idTaller" HeaderText="idTaller" /> 
                <asp:BoundField DataField="strNombre" HeaderText="Taller" />  
                <asp:BoundField DataField="strvalor" HeaderText="Actividad" />  
                <asp:BoundField DataField="strdescripcion" HeaderText="Descripcion" />
                <asp:CommandField ButtonType="Link" HeaderText="Acciones" ShowDeleteButton="true"  ShowEditButton="true" />
                <%--<asp:CommandField ShowSelectButton="true" SelectText="Editar" />
                <asp:CommandField ShowDeleteButton="true" />--%>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
    </div>
    
</asp:Content>
