using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Se hace esto para que cuando se ingrese acá se borren las sesiones
        Session["Usuario"] = null;
       
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            String usuario = txtUsuario.Text;
            String clave = txtClave.Text;
            //Busca si el usuario existe en la base de datos (Hasheo no implementado aún)
            if (bd.USUARIO.Any(it=> it.LOGIN_USR == usuario && it.PASS_USR == clave))
            {
                Session["Usuario"] = usuario;
                Response.Redirect("~/View/PaginaPpal.aspx");
            }
            else
            {
                LabelAviso.Text = "Credenciales incorrectas, ingresar nuevamente";
            }
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
         
        }
    }
}