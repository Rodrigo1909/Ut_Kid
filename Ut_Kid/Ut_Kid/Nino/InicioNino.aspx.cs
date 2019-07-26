using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ut_Kid.Nino
{
    public partial class InicioNino : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string nino = (string)Session["nino"];
                if(nino != null)
                {
                    this.lblNino.Text = nino;
                }
                else
                {
                    this.Response.Redirect("../Login.aspx");
                }
            }
        }
    }
}