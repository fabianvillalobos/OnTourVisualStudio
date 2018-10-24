using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListarContratos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejec ventas puede acceder
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }

    protected void btnNuevoContrato_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/AgregarContratos.aspx");
    }
  

}