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
    public partial class RegistrarTaller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarTaller_Click(object sender, EventArgs e)
        {
            TblTaller taller = new TblTaller();
            taller.strNombre = txtNombre.Text.ToUpper();
            taller.strDescripcion = txtDescipcion.Text.ToUpper();
            taller.strStatus = "1";
            ControllerTaller ctrlTall = new ControllerTaller();
            ctrlTall.InsertarTaller(taller);
            this.Response.Redirect("./RegistrarTaller.aspx", true);
        }
    }
}