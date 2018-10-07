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

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            String desc = txtDescripcion.Text;
            int valor = int.Parse(txtValor.Text);
            string activo = "";
            if (chkActivo.Checked)
            {
                activo = "T";
            }
            else
            {
                activo = "F";
            }
            DateTime fecha = DateTime.Parse(txtFecha.Text);

            PAQUETEVIAJE pkgViaje = new PAQUETEVIAJE()
            {
                DESC_PAQUETEVIAJE = desc,
                VALOR_PAQUETEVIAJE = valor,
                ACTIVO = activo,
                FECHA_CREACION_PAQVIAJE = fecha
            };
            bd.PAQUETEVIAJE.Add(pkgViaje);
            bd.SaveChanges();
            LabelAviso.Text = "Paquete creado.";
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }
}