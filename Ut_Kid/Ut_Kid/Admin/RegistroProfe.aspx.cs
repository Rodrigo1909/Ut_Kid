using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace Ut_Kid.Admin
{
    public partial class RegistroProfe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarProfe_Click(object sender, EventArgs e)
        {
            if (FotoPerfil.HasFile)
            {
                string path = Server.MapPath("~/Imagenes/ProfeRegistrado/" + FotoPerfil.FileName);
                FotoPerfil.SaveAs(path);

                TblProfesor prof = new TblProfesor();
                prof.strNombre = txtNombre.Text.ToUpper();
                prof.strApellidoP = txtAPaterno.Text.ToUpper();
                prof.strApellidoM = txtAMaterno.Text.ToUpper();
                prof.intEdad = Int32.Parse(txtEdad.Text);
                prof.strSexo = txtSexo.Text.ToUpper();
                prof.strCorreo = txtCorreo.Text;
                prof.strCedula = txtCedula.Text;
                prof.bitFoto = path;
                ControllerProfesor ctrlProfe = new ControllerProfesor();
                ctrlProfe.InsertarProfe(GetDatosVista(prof));
            }
           this.Response.Redirect("./InicioAdmin.aspx", true);
        }

        protected TblProfesor GetDatosVista(TblProfesor prof)
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
            login.strtipoUsuario = "PROFESOR";

            prof.TblDireccion = direccion;
            prof.TblTelefono = telefono;
            prof.TblUser = login;

            return prof;


        }
    }
}
        