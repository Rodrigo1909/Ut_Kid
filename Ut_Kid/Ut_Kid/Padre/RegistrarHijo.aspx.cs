using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity.Core.Objects;

namespace Ut_Kid.Padre
{
    public partial class RegistrarNino : System.Web.UI.Page
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["id"] != null)
                {
                    lbPadre.Text = Session["id"].ToString();
                    loadGridItems(Convert.ToInt32(Session["id"].ToString()));

                }
            }
        }

        private void loadGridItems(int idPadre)
        {
            try
            {
                GridView2.DataSource = contexto.TblNino
                    .Where(n => n.idPadre == idPadre)
                    .Select(n => new
                    {
                        Nombre = n.strNombre.ToUpper(),
                        ApellidoP = n.strApellidoP.ToUpper(),
                        ApellidoM = n.strApellidoM.ToUpper(),
                        Edad = n.intEdad,
                        Sexo = n.strSexo.ToUpper(),
                        Alergias = n.strAlergia.ToUpper(),
                        Usuario = n.TblUser != null ? n.TblUser.strusuario : String.Empty,
                        Contraseña = n.TblUser != null ? n.TblUser.strpass : String.Empty

                    })
                    .ToList();
                GridView2.DataBind();
            }
            catch (Exception)
            {

                throw;
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}