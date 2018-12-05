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
            //decimal idContrato = int.Parse(idContratoActual);
            SqlDataSourceActividades.SelectParameters["id"].DefaultValue = idContratoActual;
           // GridView1.DataBind();
        }
       
    }
}