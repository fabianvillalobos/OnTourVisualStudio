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
            Mantenedor.Visible = false;

        }
        else
        {
            EntitiesOnTour bd = new EntitiesOnTour();

            //Buscar cliente para poner nombre 
            lblUsuario.Text = Session["Usuario"].ToString().ToUpper();
            lblUsuario.Text += "<br>" + Session["Perfil"].ToString();


            Mantenedor.Visible = true;

        }
    }
}
 