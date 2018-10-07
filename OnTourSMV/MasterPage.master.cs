using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Si no hay usuarios el menú de la página principal (MasterPage) no se mostrará
        if (Session["Usuario"] == null)
        {
            MenuMantenedor.Visible = false;
       
        }
        else
        {
            MenuMantenedor.Visible = true;
        }
    }
}
 