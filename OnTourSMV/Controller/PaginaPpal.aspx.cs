using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaginaPpal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Caso en que se ingresa mediante el login correctamente
        
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        //Caso en que se esté intentando logearse sin usuarios(Forzadamente)
        else
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            String usuarioSesion = Session["Usuario"].ToString();
            
            Label1.Text = Session["Perfil"].ToString();
        }
    }
}