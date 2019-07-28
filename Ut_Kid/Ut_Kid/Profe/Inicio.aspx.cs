using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace Ut_Kid.Profe
{
    public partial class Inicio : System.Web.UI.Page
    {
        ControllerProfesor contexto = new ControllerProfesor();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("../Login.aspx");
            var profe = contexto.verProfesorPorId(Convert.ToInt32(Session["id"]));
            lblUser.Text = profe.strNombre + " " + profe.strApellidoP;
        }
    }
}