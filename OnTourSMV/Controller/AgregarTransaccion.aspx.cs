using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarTransaccion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            DateTime fecha = DateTime.Parse(txtFecha.Text.Trim());
            int monto = int.Parse(txtMonto.Text.Trim());
            int cuenta = int.Parse(DropDownListCuenta.SelectedValue);
            int tipo = int.Parse(DropDownListTipo.SelectedValue);
            string activo = DropDownListActivo.SelectedValue;
            

            TRANSACCION transaccion = new TRANSACCION() {
                FECHA_TRANSACCION=fecha,
                MONTO_TRANSACCION=monto,
                ID_CUENTA=cuenta,
                ID_TIPO_TRANSACCION=tipo,
                ACTIVO=activo
            };

            bd.TRANSACCION.Add(transaccion);
            bd.SaveChanges();

            System.Windows.Forms.MessageBox.Show("Transaccion Creada");
            //lblAviso.Text = "Transaccion Creada";
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            //lblAviso.Text = ex.Message;
        }
    }
}