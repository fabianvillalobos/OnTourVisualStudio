using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListarActividadesContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        else {
            int perfilId = int.Parse(Session["PerfilID"].ToString());
            if (perfilId == 3)
            {
                btnNuevaActividad.Enabled = false;
                btnNuevaActividad.Visible = false;
            }
            else {
                btnNuevaActividad.Enabled = true;
                btnNuevaActividad.Visible = true;
            }
            string idContratoActual = Request.QueryString["id_contrato"];
            SqlDataSourceActividades.SelectParameters["id"].DefaultValue = idContratoActual;
        }
       
    }

    protected void btnNuevaActividad_Click(object sender, EventArgs e)
    {
        string idContratoActual = Request.QueryString["id_contrato"];
        Response.Redirect("~/View/AgregarActividad.aspx?id_contrato="+idContratoActual);
    }

    protected void btnVolverAContratos_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/ListarContratos.aspx");
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}