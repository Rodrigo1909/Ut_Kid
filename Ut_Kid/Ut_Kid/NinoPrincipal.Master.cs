using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ut_Kid
{
    public partial class NinoPrincipal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lbtnSalir_Click(object sender, EventArgs e)
        {
            this.Session.Abandon();
            this.Response.Redirect("../Login.aspx");
        }
    }
}