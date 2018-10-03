using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        String usuario = txtUsuario.Text;
        String clave = txtClave.Text;

        try
        {
            if (bd.USUARIO.Any(it => it.LOGIN_USR == usuario && it.PASS_USR == clave))
            {
                Response.Redirect("PaginaPpal.aspx");
            }
            else
            {
                LabelAviso.Text = "Credenciales Incorrectas";
            }
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }
}