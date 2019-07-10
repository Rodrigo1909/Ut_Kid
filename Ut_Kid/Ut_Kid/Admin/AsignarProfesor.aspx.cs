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
                //this.LlenarProfesor();
                //this.LlenarTaller();
            }
        }
        //private void LlenarProfesor()
        //{
        //    //ControllerAsignarProfesor CtrlAsignarP = new ControllerAsignarProfesor();
        //    //List<TblProfesor> profesor = CtrlAsignarP.ConsultaProfesor();
        //    //ddlNombreProfesor.Items.Add("Seleccionar");
        //    ////this.ddlNombreProfesor.DataSource = profesor;
        //    //var profesor = (from strNombre in contexto.TblProfesor select strNombre).ToList();
        //    //ddlNombreProfesor.Items.Add("Seleccionar");
        //    //ddlNombreProfesor.DataSource = profesor;
        //    //ddlNombreProfesor.DataValueField = "id";
        //    //ddlNombreProfesor.DataTextField = "strNombre";
        //    //ddlNombreProfesor.DataTextField ="strApellidoP";
        //    //ddlNombreProfesor.DataBind();
 

        //}

        //private void LlenarTaller()
        //{
        //    ControllerAsignarProfesor CtrlAsignarT = new ControllerAsignarProfesor();
        //    List<TblTaller> taller = CtrlAsignarT.ConsultaTaller();
        //    ddlNombreTaller.Items.Add("Seleccionar");
        //    this.ddlNombreTaller.DataSource = taller;
        //    this.ddlNombreTaller.DataBind();

        //}

        protected void btnAsignarTaller(object sender, EventArgs e)
        {
            this.lbProfe.Text = dato1;
            this.lbTaller.Text = dato2;


            TblAsignacionProfesor asignacion = new TblAsignacionProfesor();
            asignacion.idProfesor = Int32.Parse(lbProfe.Text);
            asignacion.idTaller = Int32.Parse(lbTaller.Text);
            ControllerAsignarProfesor ctrlAsig = new ControllerAsignarProfesor();
            ctrlAsig.InsertarAsigProfe(asignacion);
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