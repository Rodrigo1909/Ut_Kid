﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace Ut_Kid
{
    public partial class Login : System.Web.UI.Page
    {
        private UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            ValidarLogin(GetDatosVista());
        }

        protected TblUser GetDatosVista()
        {
            String user = txtUser.Text;
            String pass = txtPass.Text;

            TblUser usuario = new TblUser();
            usuario.strusuario = user;
            usuario.strpass = pass;
            return usuario;

        }

        protected void ValidarLogin(TblUser usuario)
        {
            if (this.txtUser.Text.Equals("administrador") && this.txtPass.Text.Equals("1234"))
            {
                Session["user"] = txtUser.Text;
                this.Response.Redirect("./Admin/InicioAdmin.aspx", true);
            }
            ControllerAutenticacion ctrlAutenticacion = new ControllerAutenticacion();
            TblUser UsuarioLoggeado = ctrlAutenticacion.ValidarLogin(usuario);
            
<<<<<<< Updated upstream
          
           
=======
            
            
>>>>>>> Stashed changes
            if (UsuarioLoggeado != null)
            {
              // 
              
          
                if (UsuarioLoggeado.strtipoUsuario == "PADRE")
                {
<<<<<<< Updated upstream
                    var padre = (from pa in contexto.TblPadre where pa.idUser == UsuarioLoggeado.id select pa).FirstOrDefault();
                    Session["id"] = padre.id;
=======
                    var padre = (from pa in contexto.TblPadres where pa.idUser == UsuarioLoggeado.id select pa).FirstOrDefault();
>>>>>>> Stashed changes
                    Response.Redirect("./Padre/RegistrarHijo.aspx", true);
                }
                else if (UsuarioLoggeado.strtipoUsuario == "PROFESOR")
                {
<<<<<<< Updated upstream
                    var profe = (from pa in contexto.TblProfesor where pa.idUser == UsuarioLoggeado.id select pa).FirstOrDefault();
=======
                    var profe = (from pa in contexto.TblProfesors where pa.idUser == UsuarioLoggeado.id select pa).FirstOrDefault();
>>>>>>> Stashed changes
                    Session["id"] = profe.id;
                    Response.Redirect("./Profe/Inicio.aspx", true);
                }
                else if (UsuarioLoggeado.strtipoUsuario == "NINO")
                {
<<<<<<< Updated upstream
                    var nino = (from pa in contexto.TblNino where pa.idUser == UsuarioLoggeado.id select pa).FirstOrDefault();
=======
                    var nino = (from pa in contexto.TblNinos where pa.idUser == UsuarioLoggeado.id select pa).FirstOrDefault();
>>>>>>> Stashed changes
                    Session["nino"] = UsuarioLoggeado.strusuario;
                    Response.Redirect("Nino/InicioNino.aspx", true);
                }
            }
            else
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Usuario o contraseña incorrecta');</script>");
                Response.Redirect("Login.aspx", true);
                this.Response.Write("<script lenguage='JavaScript'>windows.alert('Fallo')</script>");
            }
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Padre/RegistroPadre.aspx", true);
        }
    }
}
