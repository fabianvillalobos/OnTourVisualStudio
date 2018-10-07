using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarCuenta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {

        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int saldo = int.Parse(txtSaldo.Text.Trim());
            int contrato = int.Parse(DropDownListContratoRela.SelectedValue);
            int rut = int.Parse(txtRut.Text.Trim());
            string activo = "";
            if (chbActivo.Checked)
            {
                activo = "T";
            }
            else
            {
                activo = "F";
            }

            CUENTA cuenta = new CUENTA()
            {
                SALDO = saldo,
                ID_CONTRATO = contrato,
                NUMRUT_CLI = rut,
                ACTIVO = activo
            };

            bd.CUENTA.Add(cuenta);
            bd.SaveChanges();
            lblAviso.Text = "Cuenta Creada";
        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }
        

    }
}