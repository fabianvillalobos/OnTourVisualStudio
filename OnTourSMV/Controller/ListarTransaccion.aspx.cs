using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListarTransaccion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        else
        {/*
            int perfilId = int.Parse(Session["PerfilID"].ToString());
            if (perfilId == 3)
            {
                btnNuevaActividad.Enabled = false;
                btnNuevaActividad.Visible = false;
            }
            else
            {
                btnNuevaActividad.Enabled = true;
                btnNuevaActividad.Visible = true;
            }
            */


            string idContratoActual = Request.QueryString["id_contrato"];
            SqlDataSource1.SelectParameters["id"].DefaultValue = idContratoActual;
            
        }



    }
    protected void btnVolverAContratos_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/ListarContratos.aspx");
    }
}