using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarPaqueteViaje : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejecutivos de ventas pueden agregar paquetes de viaje
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        /*
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            String desc = txtDescripcion.Text;
            int valor = int.Parse(txtValor.Text);
            DateTime fechaCreacion = DateTime.Now;

            PAQUETEVIAJE pkgViaje = new PAQUETEVIAJE()
            {
                DESC_PAQUETEVIAJE = desc,
                VALOR_PAQUETEVIAJE = valor,
                ACTIVO = "T",
                FECHA_CREACION_PAQVIAJE = fechaCreacion
            };
            bd.PAQUETEVIAJE.Add(pkgViaje);
            bd.SaveChanges();
            LabelAviso.Text = "Paquete creado.";
            txtDescripcion.Text = "";
            txtValor.Text = "";
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
        */
    }
}