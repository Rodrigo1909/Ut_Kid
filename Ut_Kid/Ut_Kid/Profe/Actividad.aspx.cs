using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Modelo;

namespace Ut_Kid.Profe
{
    public partial class Actividad : System.Web.UI.Page
    {
        ControllerProfesor context = new ControllerProfesor();
        List<TblActividadTaller> lista { set; get; }
        TblActividadTaller actividad { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    llenarDdl();
                    llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
                    divEditar.Visible = false;
                    divEliminar.Visible = false;
                    
                }
                catch (Exception)
                {
                    
                }
                
            }
        }

        private void llenarDdl()
        {
            if (ddlTalleres.DataSource != null)
                return;
            var lista2 = context.verTalleres();
            
            ddlTalleres.DataSource = lista2.Select(a=>new { a.id, a.strNombre });
            ddlTalleres.DataValueField = "id";
            ddlTalleres.DataTextField = "strNombre";
            ddlTalleres.DataBind();
        }
        private void llenarDdlActualizar()
        {
            if (ddlActualizarTaller.DataSource != null)
                return;
            var lista2 = context.verTalleres();

            ddlActualizarTaller.DataSource = lista2.Select(a => new { a.id, a.strNombre });
            ddlActualizarTaller.DataValueField = "id";
            ddlActualizarTaller.DataTextField = "strNombre";
            ddlActualizarTaller.DataBind();
        }
        
        List<TblActividadTaller> traerLista(int idTaller)
        {
            return context.verActividades(idTaller);
        }
        TblActividadTaller traerActividad(int index, int idTaller)
        {
            return traerLista(idTaller)[index];
        }
        private void llenarGrid(int idTaller)
        {
            if (gvActividades.DataSource != null)
                gvActividades.DataSource=null;
            lista = traerLista(idTaller);
            gvActividades.DataSource = lista.Select(a => new { a.id, a.idTaller, a.TblTaller.strNombre, a.strvalor, a.strdescripcion });
            gvActividades.Columns[0].Visible = false;
            gvActividades.Columns[1].Visible = false;
            gvActividades.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CrearActividad();
            llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
        }

        private void CrearActividad()
        {
            actividad = new TblActividadTaller() { idTaller = Convert.ToInt32(ddlTalleres.SelectedValue), strvalor=txtActividad.Text, strdescripcion=txtdescripcion.Text };
            if (context.CrearActividad(actividad))
            {
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                txtActividad.Text = "";
                txtdescripcion.Text = "";
                lblMensaje.Text = "Registro Guardado";
            }
            else
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Error al guardar";
            }
        }
 
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (context.eliminarActividad(actividad.id))
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Green;
                lblmsgGeneral.Text = "Registro eliminado";
                llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
            }
                
            else
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Red;
                lblmsgGeneral.Text = "No se pudo eliminar el registro";
            }
            cambio();
            divEliminar.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            actividad = traerActividad(gvActividades.SelectedIndex,Convert.ToInt32(ddlActualizarTaller.SelectedValue));
            actividad.idTaller = Convert.ToInt32(ddlActualizarTaller.SelectedValue);
            actividad.strvalor = txtActualizarNombre.Text;
            actividad.strdescripcion = txtActualizarDescripcion.Text;
            if (context.actualizarActividad(actividad))
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Green;
                lblmsgGeneral.Text = "Registro actualizado";
                llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
            }

            else
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Red;
                lblmsgGeneral.Text = "No se pudo actualizar el registro";
            }
            cambio();
            divEditar.Visible = false;
        }
        
        private void cambio()
        {
            //if (gvActividades.Columns[5].Visible)
            //    gvActividades.Columns[5].Visible = false;
            //else
            //    gvActividades.Columns[5].Visible = true;
            //if (gvActividades.Columns[6].Visible)
            //    gvActividades.Columns[6].Visible = false;
            //else
            //    gvActividades.Columns[6].Visible = true;
            if (divCrear.Visible)
                divCrear.Visible = false;
            else
                divCrear.Visible = true;
            if (divGrid.Visible)
                divGrid.Visible = false;
            else
                divGrid.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            cambio();
            divEliminar.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            cambio();
            divEditar.Visible = false;
        }

        protected void gvActividades_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lista = traerLista(Convert.ToInt32(ddlTalleres.SelectedValue));
            //lblMensaje.Text = lista[gvActividades.SelectedIndex].id.ToString();
            //lblmsgGeneral.Text = lista[gvActividades.SelectedIndex].strdescripcion.ToString();
            try
            {
                lista = traerLista(Convert.ToInt32(ddlTalleres.SelectedValue));
                actividad = lista[gvActividades.SelectedIndex];
                llenarDdlActualizar();
                ddlActualizarTaller.SelectedValue = actividad.id.ToString();
                txtActualizarNombre.Text = actividad.strvalor;
                txtActualizarDescripcion.Text = actividad.strdescripcion;
                cambio();
                divEditar.Visible = true;
            }
            catch (Exception)
            {

            }

        }
        protected void gvActividades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lista = traerLista(Convert.ToInt32(ddlTalleres.SelectedValue));
            lblMensaje.Text = lista[gvActividades.SelectedIndex].id.ToString();
            lblmsgGeneral.Text = lista[gvActividades.SelectedIndex].strdescripcion.ToString();

            //try
            //{
            //    index = Convert.ToInt32(gvActividades.SelectedRow.Cells[0].Text);
            //    actividad = lista[index];
            //    lblEliminarTaller.Text = actividad.TblTaller.strNombre;
            //    lblEliminarNombre.Text = actividad.strvalor;
            //    lblEliminarDescripcion.Text = actividad.strdescripcion;
            //    cambio();
            //    divEliminar.Visible = true;
            //}
            //catch (Exception)
            //{

            //}
        }

        protected void gvActividades_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            

        }
        
        protected void ddlTalleres_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
            }
            catch (Exception)
            {
                
            }
        }
    }
}