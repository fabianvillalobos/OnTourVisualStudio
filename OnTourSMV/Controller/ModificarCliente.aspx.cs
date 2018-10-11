using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModificarCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Modificar cliente no se puede el RUT debido a que se establece como restricción
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        else
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            //Recuperar por URL el ID del cliente que se quiere modificar
            String urlStr = Request.QueryString["NUMRUT_CLI"];
            int numrutCliUrl = int.Parse(urlStr);
            //Instanciar el cliente
            CLIENTE cliente = bd.CLIENTE.FirstOrDefault(t=>t.NUMRUT_CLI == numrutCliUrl);
            //Poblar los textbox con los datos del cliente recuperado
            txtRut.Text = cliente.NUMRUT_CLI.ToString();
            txtDv.Text = cliente.DRUT_CLI;
            txtNombre.Text = cliente.NOMBRE_CLIE;
            txtApellidoM.Text = cliente.APELLIDO_MAT_CLI;
            txtApellidoP.Text = cliente.APELLIDO_PAT_CLI;
            txtMail.Text = cliente.MAIL_CLI;
           //temp
        }
       
    }
}