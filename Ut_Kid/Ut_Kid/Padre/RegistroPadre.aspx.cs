using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace Ut_Kid.Padre
{
    public partial class RegistroPadre : System.Web.UI.Page
    {
        private UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarPadre_Click(object sender, EventArgs e)
        {
            var exite = (from pa in contexto.TblUsers where pa.strusuario == txtUsuario.Text select pa).FirstOrDefault();
            

            if (exite != null)
            { 
                    if (FotoPerfil.HasFile)
                    {
                        string path = Server.MapPath("~/Imagenes/PadreRegistrado/" + FotoPerfil.FileName);
                        FotoPerfil.SaveAs(path);

                        TblPadre pad = new TblPadre();
                        pad.strNombre = txtNombre.Text.ToUpper();
                        pad.strApellidoP = txtAPaterno.Text.ToUpper();
                        pad.strApellidoM = txtAMaterno.Text.ToUpper();
                        pad.intEdad = Int32.Parse(txtEdad.Text);
                        pad.strSexo = txtSexo.Text.ToUpper();
                        pad.strCorreo = txtCorreo.Text;
                        pad.bitFoto = path;
                        ControllerPadre ctrlPadre = new ControllerPadre();
                        ctrlPadre.InsertarPadre(GetDatosVista(pad));
                    }

                    this.Response.Redirect("../Login.aspx", true);
                }
            this.Response.Redirect("./RegistroPadre.aspx", true);
            Console.Write("Ya existe este usuario");
        }

        protected TblPadre GetDatosVista(TblPadre padre)
        {
            TblDireccion direccion = new TblDireccion();
            direccion.strestado = txtDirecEstado.Text.ToUpper();
            direccion.strmunicipio = txtDirecMunicipio.Text.ToUpper();
            direccion.strcolonia = txtDirecColonia.Text.ToUpper();
            direccion.strcalle = txtDirecCalle.Text.ToUpper();
            direccion.intcodpost = Int32.Parse(txtIntCodigo.Text);
            direccion.strnumInt = txtDirecInter.Text.ToUpper();
            direccion.strnumExt = txtDirecExt.Text.ToUpper();
            direccion.strreferencias = txtDirecReferencia.Text.ToUpper();

            TblTelefono telefono = new TblTelefono();
            telefono.strcelular = txtTelCelular.Text.ToUpper();
            telefono.strtelCasa = txtTelCasa.Text.ToUpper();
            telefono.strotro = txtTelOtro.Text.ToUpper();

            TblUser login = new TblUser();
            login.strusuario = txtUsuario.Text.ToString();
            login.strpass = txtPass.Text.ToString();
            login.strtipoUsuario = "PADRE";

            padre.TblDireccion = direccion;
            padre.TblTelefono = telefono;
            padre.TblUser = login;

            return padre;


        }
    }
}