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
            int saldo = int.Parse(txtSaldo.Text.Trim());
            int contrato = int.Parse(DropDownListContratoRela.SelectedValue);
            int rut = int.Parse(DropDownListRut.SelectedValue);
            string activo = DropDownListActivo.SelectedValue;

            CUENTA cuenta = new CUENTA()
            {
                SALDO = saldo,
                ID_CONTRATO = contrato,
                NUMRUT_CLI = rut,
                ACTIVO = activo
            };

            bd.CUENTA.Add(cuenta);
            bd.SaveChanges();
            System.Windows.Forms.MessageBox.Show("Cuenta Creada");
            //lblAviso.Text = "Cuenta Creada";
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            //lblAviso.Text = ex.Message;
        }


    }
}