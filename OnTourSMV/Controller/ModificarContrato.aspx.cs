using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ModificarContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();

    }

    protected void btnCargar_Click(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        string idCont = (string)(Session["ID_CONTRATO"]);
        LabelAviso.Text = "Contrato "+ idCont;

    }
}