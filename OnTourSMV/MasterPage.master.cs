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
            int perfilId = int.Parse(Session["PerfilID"].ToString());
            if (perfilId == 1)
            {
                contratos.Visible = false;
                paquetes.Visible = false;
                actividades.Visible = false;

            }
            if (perfilId == 2)
            {
                usuariosSis.Visible = false;
            }
            if (perfilId == 3)
            {
                contraAgregaCon.Visible = false;
                //contraAgregaCli.Visible = false;
                paquetes.Visible = false;
                usuarios.Visible = false;
                actAgrega.Visible = false;
                transAgre.Visible = false;
            }
            if (perfilId == 4)
            {
                paquetes.Visible = false;
                actividades.Visible = false;
                contraAgregaCon.Visible = false;
                transacciones.Visible = false;
            }

        }
    }
}
 