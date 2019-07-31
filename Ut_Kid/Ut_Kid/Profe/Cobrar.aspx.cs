using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace Ut_Kid.Profe
{
    public partial class Cobrar : System.Web.UI.Page
    {
        ControllerProfesor context = new ControllerProfesor();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("../Login.aspx");
            txtCantidad.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (context.cargoMonedero(Convert.ToInt32(txtClave.Text),Convert.ToDecimal(txtCantidad.Text)))
            {
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                lblMensaje.Text = "Movimiento exitoso";
                txtClave_TextChanged(null, null);
            }
            else
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Error al realizar el movimiento";
                txtClave_TextChanged(null, null);
            }

        }

        protected void txtClave_TextChanged(object sender, EventArgs e)
        {
            var nino = context.validarNino(Convert.ToInt32(txtClave.Text));
            if (nino != null)
            {
                lblCantidad.Text ="$" + context.verSaldo(nino.id);
                lblDatos.Text = nino.strNombre + " " +
                    nino.strApellidoP + " " +
                    nino.strApellidoM;

                txtCantidad.Enabled = true;
            }
            else
            {
                lblCantidad.Text = "Clave incorrecta";
                txtCantidad.Enabled = false;
                lblDatos.Text = "";
            }
        }
    }
}