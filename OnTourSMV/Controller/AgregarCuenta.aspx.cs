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
            MostrarModal("Atención", "La cuenta ha sido creada satisfactoriamente.");
        }
        catch (Exception ex)
        {
            MostrarModal("Atención", ex.Message);
        }
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}