<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ut_Kid.Login" %>

<!DOCTYPE html>


<html lang="en">
    <head>
        
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title> Ut Kids </title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link href="Content/EstiloFondo.css" rel="stylesheet" />

         <link href="css/font-awesome.min.css">
         <style type="text/css">
        .offset-md-3 {
            top: -20px;
            left: 100px;
            width: 305px;
        }
    </style>
 </head>
<body>
<section class="home_banner_area">
		<div class="banner_inner">
			<div class="container">
				<div class="banner_content">
				<p class="upper_text">Acceso al Sistema</p>
<div class="container">
        <div class="login-form col-md-5 offset-md-3">
       
            <form id="form1" runat="server">

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Usuario" BackColor="gray "></asp:Label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control input-sm" placeholder="Ingresa tu usuario"></asp:TextBox>
                </div>
                  <div class="form-group ">
                    <asp:Label ID="Label2" runat="server" Text="Contraseña" BackColor="Gray"></asp:Label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control input-sm" placeholder="Ingresa la contraseña: " TextMode="Password"></asp:TextBox>
                </div>
                      <br />
   <div class="form-group">
                     <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-block btn-sm btn-primary" Text="Ingresar" OnClick="btnLogin_Click"  />
                </div>

                <asp:Label ID="Label3" runat="server" Text="¿Eres nuevo? Crea tu cuenta" BackColor="Gray"></asp:Label>
                <div class="form_group">
                      <asp:Button ID="btnRegistro" runat="server" CssClass="btn  btn-block btn-sm btn-success" Text="Registrarse" OnClick="btnRegistro_Click" />
                </div>
                
            </form>
        </div>
    </div>
	</div>
			</div>
		</div>
	</section>

    </body>
</html>
