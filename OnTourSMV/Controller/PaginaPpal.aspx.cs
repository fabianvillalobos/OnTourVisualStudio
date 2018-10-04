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
        
        if (Session["Usuario"] != null)
        {
            
        }
        //Caso en que se esté intentando logearse sin usuarios(Forzadamente)
        else
        {
            Response.Redirect("~/View/Login.aspx");
        }
    }
}