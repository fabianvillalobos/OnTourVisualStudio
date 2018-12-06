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
            string idContratoActual = Request.QueryString["id_contrato"];
            SqlDataSourceActividades.SelectParameters["id"].DefaultValue = idContratoActual;
           // GridView1.DataBind();
        }
       
    }

    protected void btnNuevaActividad_Click(object sender, EventArgs e)
    {
        string idContratoActual = Request.QueryString["id_contrato"];
        Response.Redirect("~/View/AgregarActividad.aspx?id_contrato="+idContratoActual);
    }   
}