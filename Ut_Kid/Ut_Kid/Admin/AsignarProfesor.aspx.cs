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
    public partial class AsignarProfesor : System.Web.UI.Page
    {
        UtBaseDatoDataContext contexto = new UtBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LlenarProfesor();
                this.LlenarTaller();
            }
        }
        private void LlenarProfesor()
        {
            ControllerAsignarProfesor CtrlAsignarP = new ControllerAsignarProfesor();
            var profesor = CtrlAsignarP.ConsultaProfesor();
            ddlNombreProfesor.Items.Add("Seleccionar");
            ddlNombreProfesor.DataSource = profesor;
            ddlNombreProfesor.DataValueField = "id";
            ddlNombreProfesor.DataTextField = "strNombre";
            ddlNombreProfesor.DataBind();
        }

        private void LlenarTaller()
        {
            ControllerAsignarProfesor CtrlAsignarT = new ControllerAsignarProfesor();
            List<TblTaller> taller = CtrlAsignarT.ConsultaTaller();
            ddlNombreTaller.Items.Add("Seleccionar");
            ddlNombreTaller.DataSource = taller;
            ddlNombreTaller.DataValueField = "id";
            ddlNombreTaller.DataTextField = "strNombre";
            ddlNombreTaller.DataBind();

        }

        protected void btnAsignarTaller(object sender, EventArgs e)
        {
            var prof = ddlNombreProfesor.SelectedValue;
            var taller = ddlNombreTaller.SelectedValue;

            TblAsignacionProfesor asignacion = new TblAsignacionProfesor();
            asignacion.idProfesor = int.Parse(prof);
            asignacion.idTaller = int.Parse(taller);
            ControllerAsignarProfesor ctrlAsig = new ControllerAsignarProfesor();
            ctrlAsig.InsertarAsigProfe(asignacion);
            this.Response.Redirect("./AsignarProfesor.aspx", true);
        }

        protected void ddlNombreProfesor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlNombreProfesor.SelectedValue != "Seleccionar" && ddlNombreTaller.SelectedValue != "Seleccionar")
            {
                
            }
        }
    }
}