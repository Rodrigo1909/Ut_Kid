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
    public partial class RegistrarNino : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["id"] != null)
                {
                    lbPadre.Text = Session["id"].ToString();
                }
            }
        }

        protected void btnRegistarHijo(object sender, EventArgs e)
        {

            TblNino nino = new TblNino();
            nino.strNombre = txtNombre.Text.ToUpper();
            nino.strApellidoP = txtApellidoP.Text.ToUpper();
            nino.strApellidoM = txtApellidoM.Text.ToUpper();
            nino.intEdad = Int32.Parse(txtEdad.Text);
            nino.strSexo = txtSexo.Text.ToUpper();
            nino.strAlergia = txtAlergia.Text.ToUpper();
            nino.idPadre = Int32.Parse(lbPadre.Text);
            ControllerHijo ctrlNino = new ControllerHijo();
            ctrlNino.InsertarHijo(GetDatosVista(nino));
            this.Response.Redirect("./RegistrarHijo.aspx", true);
        }

        protected TblNino GetDatosVista(TblNino nino)
        { 
            TblUser login = new TblUser();
            login.strusuario = txtUsuario.Text.ToString();
            login.strpass = txtPass.Text.ToString();
            login.strtipoUsuario = "HIJO";

            nino.TblUser = login;

            return nino;
        }
    }
}