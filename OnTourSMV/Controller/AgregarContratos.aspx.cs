using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarContratos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int rut = 0;
            DateTime fechInicio = DateTime.Parse(txtInicio.Text);
            DateTime fechTermino = DateTime.Parse(txtFin.Text);
            int meta = int.Parse(txtMeta.Text);
            int monto = int.Parse(txtMonto.Text);
            String estado = DropDownListEstado.SelectedValue;
            int rutEmp = int.Parse(DropDownListEmpleado.SelectedValue);
            int rutCli = int.Parse(DropDownListTitular.SelectedValue);

            bd.SP_INSERTCONTRATO(rut, fechInicio, fechTermino, meta, monto, estado, rutEmp, rutCli);

            /*
            CONTRATO contrato = new CONTRATO()
            {
                FECHA_INICIO = fechInicio,
                FECHA_TERMINO = fechTermino,
                META = meta,
                MONTO_RESERVA = monto,
                ESTADO = estado,
                NUMRUT_EMP = rutEmp,
                NUMRUT_CLI_TITULAR = rutCli
            };
            bd.CONTRATO.Add(contrato);
            */
            bd.SaveChanges();
            LabelAviso.Text = "Contrato Generado.";
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }
}