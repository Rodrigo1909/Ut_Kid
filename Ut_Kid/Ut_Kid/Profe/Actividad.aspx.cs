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
        ControllerProfesor contexto = new ControllerProfesor();
        string[] acciones = { "Editar", "Eliminar" };
        public int id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("../Login.aspx");
            if (!IsPostBack)
            {
                try
                {
                    llenarDdl();
                    llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
                    divEditar.Visible = false;
                    divEliminar.Visible = false;
                    divCrear.Visible = false;
                    
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
            var lista2 = contexto.verTalleres();
            
            ddlTalleres.DataSource = lista2.Select(a=>new { a.id, a.strNombre });
            ddlTalleres.DataValueField = "id";
            ddlTalleres.DataTextField = "strNombre";
            ddlTalleres.DataBind();
        }

        private void llenarDdlActualizar(int? idTeller)
        {
            if (ddlActualizarTaller.DataSource != null)
                return;
            var lista = contexto.verTalleres();
            var item = lista.Where(i => i.id == idTeller).FirstOrDefault();
            ddlActualizarTaller.DataSource = lista.Select(a => new { a.id, a.strNombre });
            ddlActualizarTaller.DataValueField = "id";
            ddlActualizarTaller.DataTextField = "strNombre";
            ddlActualizarTaller.DataBind();
            ListItem selectedListItem = ddlActualizarTaller.Items.FindByValue(item.id.ToString());
            if (selectedListItem != null)
                selectedListItem.Selected = true;
        }

        private void llenarGrid(int idTaller)
        {
            
            if (gvActividades.DataSource != null)
                gvActividades.DataSource=null;
            var lista = contexto.verActividades(idTaller);
            gvActividades.DataSource = lista.Select(a => new { a.id, a.idTaller, a.TblTaller.strNombre, a.strvalor, a.strdescripcion });
            gvActividades.Columns[1].Visible = false;
            gvActividades.DataBind();
        }

        private TblActividadTaller asignarValoresActualizar(int idActividad)
        {
            return new TblActividadTaller() { id=idActividad,
                idTaller = Convert.ToInt32(ddlActualizarTaller.SelectedValue),
                strvalor = txtActualizarNombre.Text,
                strdescripcion = txtActualizarDescripcion.Text };
        }

        private TblActividadTaller asignarValoresCrear()
        {
            return new TblActividadTaller() { idTaller = Convert.ToInt32(ddlTalleres.SelectedValue),
                strvalor =txtActividad.Text,
                strdescripcion =txtdescripcion.Text };
            
        }       

        void llenarValores(TblActividadTaller actividad, string accion)
        {
            if (accion=="Editar")
            {
                txtActualizarId.Text = actividad.id.ToString();
                llenarDdlActualizar(actividad.idTaller);
                txtActualizarNombre.Text = actividad.strvalor;
                txtActualizarDescripcion.Text = actividad.strdescripcion;
            }
            if (accion=="Eliminar")
            {
                txtEliminarId.Text = actividad.id.ToString();
                lblEliminarTaller.Text = actividad.TblTaller.strNombre;
                lblEliminarNombre.Text = actividad.strvalor;
                lblEliminarDescripcion.Text = actividad.strdescripcion;
            }
        }

        private void limpiartextos()
        {
            txtActividad.Text = "";
            txtActualizarDescripcion.Text = "";
            txtActualizarNombre.Text = "";
            txtdescripcion.Text = "";
        }

        private TblActividadTaller recuperarActividadGrid()
        {
            return contexto.verActividadPorId(this.id);
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            divDdl.Visible = true;
            divEditar.Visible = false;
            divEliminar.Visible = false;
            divCrear.Visible = false;
            divGrid.Visible = true;
            ddlTalleres.AutoPostBack = true;
            Page_Load(null,null);
            llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (contexto.actualizarActividad(asignarValoresActualizar(Convert.ToInt32(txtActualizarId.Text))))
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Green;
                lblmsgGeneral.Text = "Registro actualizado";
                limpiartextos();
                llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
            }

            else
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Red;
                lblmsgGeneral.Text = "No se pudo actualizar el registro";
            }
            divDdl.Visible = true;
            divGrid.Visible = true;
            divEditar.Visible = false;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (contexto.eliminarActividad(Convert.ToInt32(txtEliminarId.Text)))
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Green;
                lblmsgGeneral.Text = "Registro eliminado";
                limpiartextos();
                llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
            }

            else
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Red;
                lblmsgGeneral.Text = "No se pudo eliminar el registro";
            }
            divDdl.Visible = true;
            divGrid.Visible = true;
            divEliminar.Visible = false;
        }

        protected void btnCrear_Click1(object sender, EventArgs e)
        {
            if (contexto.CrearActividad(asignarValoresCrear()))
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Green;
                limpiartextos();
                lblmsgGeneral.Text = "Registro Guardado";
                ddlTalleres.AutoPostBack = true;
                llenarGrid(Convert.ToInt32(ddlTalleres.SelectedValue));
            }
            else
            {
                lblmsgGeneral.ForeColor = System.Drawing.Color.Red;
                lblmsgGeneral.Text = "Error al guardar";
            }
            divCrear.Visible = false;
            divGrid.Visible = true;
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            divCrear.Visible = true;
            divGrid.Visible = false;
            ddlTalleres.AutoPostBack = false;
        }

        protected void gvActividades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit" || e.CommandName == "Delete")
            {
                int index = Int32.Parse( e.CommandArgument.ToString());
                var id = gvActividades.Rows[index].Cells[0].Text;
                var actividad = contexto.verActividadPorId(Convert.ToInt32(id));
                if (e.CommandName == "Edit")
                    llenarValores(actividad, acciones[0]);
                else
                    llenarValores(actividad, acciones[1]);
                
            }
        }

        protected void gvActividades_RowEditing(object sender, GridViewEditEventArgs e)
        {
            divDdl.Visible = false;
            divGrid.Visible = false;
            divEditar.Visible = true;
            e.Cancel = true;
        }

        protected void gvActividades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            divDdl.Visible = false;
            divGrid.Visible = false;
            divEliminar.Visible = true;
            e.Cancel = true;
        }
    }
}