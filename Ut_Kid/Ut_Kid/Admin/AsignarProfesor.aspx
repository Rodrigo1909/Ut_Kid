<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AsignarProfesor.aspx.cs" Inherits="Ut_Kid.Admin.AsignarProfesor" %>

<asp:Content ID="head" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
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

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<br />
<br />
<br />
<br />    
     <div class="container">
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
                                    <asp:Label ID="lbProfe" runat="server" Text="Seleccione el profesor a impartir el curso: " Visible="True" Font-Size="16px"></asp:Label>
                                    <asp:DropDownList ID="ddlNombreProfesor" runat="server" AppendDataBoundItems="True" Height="100%" ></asp:DropDownList>
                                 </div>

                                <br />

                                <div class="form-inline">
                                    <asp:Label ID="lbTaller" runat="server" Text="Seleccione el grupo a impartir: " Visible="True" Font-Size="16px"></asp:Label>
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
   
    <%-- Consultar Grupos asignados --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Consultar Grupos
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="80%">
                    <Columns>
                        <asp:BoundField DataField="Nombre del Profesor" HeaderText="Nombre del Profesor" ReadOnly="True" SortExpression="Nombre del Profesor" />
                        <asp:BoundField DataField="Nombre del Grupo asignado" HeaderText="Nombre del Grupo asignado" SortExpression="Nombre del Grupo asignado" />
                    </Columns>
                    <HeaderStyle BackColor="#ffcc00" ForeColor="White" Font-Size="18px" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ut_kidsConnectionString %>" SelectCommand="  select  
                (P.strNombre+ ' ' +  P.strApellidoP+ ' ' +p.strApellidoM) as 'Nombre del Profesor',
                T.strNombre as 'Nombre del Grupo asignado'
                from 
                TblAsignacionProfesor as AP left join TblProfesor as P
                ON AP.idProfesor = P.id
                left join TblTaller as T
                ON AP.idTaller = T.id 
                group by P.strNombre, T.strNombre, P.strApellidoP, P.strApellidoM; 
                "></asp:SqlDataSource>
             </div>
        </div>
    </div>
    </div>
</asp:Content>