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
            int tipo = int.Parse(DropDownListTipo.SelectedValue);
            int cuenta = int.Parse(DropDownListCuenta.SelectedValue);

            CUENTA ctv = bd.CUENTA.FirstOrDefault(it => it.ID_CUENTA == cuenta);
            String varS = ctv.SALDO.ToString();
            int varD = int.Parse(varS);
            int varE = varD + monto;

            TRANSACCION transaccion = new TRANSACCION() {
                FECHA_TRANSACCION=fecha,
                MONTO_TRANSACCION=monto,
                ID_CUENTA=cuenta,
                ID_TIPO_TRANSACCION=tipo,
                ACTIVO="T"
            };
            bd.TRANSACCION.Add(transaccion);
            bd.SP_UPDATESALDOCUENTA(cuenta, varE);
            bd.SaveChanges();

            MostrarModal("Operación realizada", "Se ha registrado la transacción correctamente.");
        }
        catch (Exception ex)
        {
            MostrarModal("Error", "Ha ocurrido un error en la operación, inténtalo de nuevo. Si el problema persiste contáctate con el administrador.");
        }

    }
    protected void DropDownListCuenta_DataBound(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        int cuenta = int.Parse(DropDownListCuenta.SelectedValue);
        CUENTA varCuenta = bd.CUENTA.FirstOrDefault(it => it.ID_CUENTA == cuenta);
        String varContrato = varCuenta.ID_CONTRATO.ToString();
        int nroContrato = int.Parse(varContrato.ToString());

        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == nroContrato);
        String rutX = contrato.NUMRUT_CLI_TITULAR.ToString();
        int rutY = int.Parse(rutX);
        CLIENTE clienteA = bd.CLIENTE.FirstOrDefault(it => it.NUMRUT_CLI == rutY);
        String mostrarNombre = clienteA.NOMBRE_CLIE + " " + clienteA.APELLIDO_PAT_CLI + " " + clienteA.APELLIDO_MAT_CLI; // Se muestra el nombre del cliente concatenado

        txtInfoCta.Text = "Mandante: " + mostrarNombre + "\nID Contrato: " + contrato.ID_CONTRATO + "\nFecha Inicio: " + contrato.FECHA_INICIO;
        txtInfoCta.DataBind();
        txtInfoCta.Enabled = false;
    }

    protected void DropDownListCuenta_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListCuenta_DataBound(sender, e);
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}