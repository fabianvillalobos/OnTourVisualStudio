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

    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            DateTime fecha = CalendarFecha.SelectedDate;
            int monto = int.Parse(txtMonto.Text.Trim());
            int cuenta = int.Parse(DropDownListCuenta.SelectedValue);
            int tipo = int.Parse(DropDownListTipo.SelectedValue);
            string activo = "";
            if (chbActivo.Checked)
            {
                activo = "T";
            }
            else
            {
                activo = "F";
            }

            TRANSACCION transaccion = new TRANSACCION() {
                FECHA_TRANSACCION=fecha,
                MONTO_TRANSACCION=monto,
                ID_CUENTA=cuenta,
                ID_TIPO_TRANSACCION=tipo,
                ACTIVO=activo
            };

            bd.TRANSACCION.Add(transaccion);
            bd.SaveChanges();
            lblAviso.Text = "Transaccion Creada";
        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }
    }
}