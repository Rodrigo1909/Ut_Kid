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
        private string dato1;
        private string dato2;
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
            List<TblProfesor> profesor = CtrlAsignarP.ConsultaProfesor();
            //ddlNombreProfesor.Items.Add("Seleccionar");
            //this.ddlNombreProfesor.DataSource = profesor;
            //var profesor = (from strNombre in contexto.TblProfesor select strNombre).ToList();
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
            //this.lbProfe.Text = dato1;
            //this.lbTaller.Text = dato2;

            var prof = ddlNombreProfesor.SelectedValue;
            var taller = ddlNombreTaller.SelectedValue;

            TblAsignacionProfesor asignacion = new TblAsignacionProfesor();
            //asignacion.idProfesor = Int32.Parse(lbProfe.Text);
            asignacion.idProfesor = int.Parse(prof);
            //asignacion.idTaller = Int32.Parse(lbTaller.Text);
            asignacion.idTaller = int.Parse(taller);
            ControllerAsignarProfesor ctrlAsig = new ControllerAsignarProfesor();
            ctrlAsig.InsertarAsigProfe(asignacion);
            this.Response.Redirect("./InicioAdmin.aspx", true);
        }

        protected void ddlNombreProfesor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlNombreProfesor.SelectedValue != "Seleccionar" && ddlNombreTaller.SelectedValue != "Seleccionar")
            {
                dato1 = this.ddlNombreProfesor.SelectedValue;
                dato2 = this.ddlNombreTaller.SelectedValue;
            }
        }
    }
}