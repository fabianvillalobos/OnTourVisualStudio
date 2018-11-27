using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ModificarContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        else
        {
            string idContratoActual = Request.QueryString["id_contrato"];
            decimal idContrato = int.Parse(idContratoActual);
            
            EntitiesOnTour bd = new EntitiesOnTour();
            var listadoContratos = bd.CONTRATO_PAQUETE.Where( w => w.ID_CONTRATO == idContrato).ToList();
            foreach (var contrato in listadoContratos)
            {
                string yourHTMLstring = "<div class='col-xs-12'>Paquete turístico: " + contrato.ID_PAQUETEVIAJE + "</div>";
                PaquetesContratados.Controls.Add(new LiteralControl(yourHTMLstring));

                //var balance = (from a in bd.SERVICIO
                //               join c in bd.SERVICIO_PAQUETE on a.ID_SERVICIO equals c.ID_SERVICIO
                //               where c.ID_PAQUETEVIAJE == contrato.ID_PAQUETEVIAJE
                //               select new
                //               {
                //                   a.ID_SERVICIO_WS,
                //                   a.ID_TIPO_SERVICIO
                //               }).ToList();


                var listadoServicios = from servicio in bd.SERVICIO
                            join servicio_paquete in bd.SERVICIO_PAQUETE on servicio.ID_SERVICIO equals servicio_paquete.ID_SERVICIO
                            where servicio_paquete.ID_PAQUETEVIAJE == contrato.ID_PAQUETEVIAJE
                            select new { Servicio = servicio, Servicio_Paquete = servicio_paquete };
                foreach (var servicio in listadoServicios)
                {
                    yourHTMLstring = "<div class='col-xs-12'>Servicios del paquete: WS-" + servicio.Servicio.ID_SERVICIO_WS + "<br>Tipo Servicio: "+ servicio.Servicio.ID_TIPO_SERVICIO+"</div>";
                    PaquetesContratados.Controls.Add(new LiteralControl(yourHTMLstring));
                }
                //var listadoServicios = bd.SP_V_LISTARSERVICIOSPORPAQUETE(contrato.ID_PAQUETEVIAJE);

            }
        }
    }

    protected void btnCargar_Click(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        String urlStr = Request.QueryString["id_contrato"];
        int temp2 = int.Parse(urlStr);

        //Empleado empleado = local.Empleado.FirstOrDefault(it => it.username == usuario);
        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == temp2);

        //txtInicio.Text = Convert.ToString(contrato.FECHA_INICIO);
        txtIdContrato.Text = contrato.ID_CONTRATO.ToString();
        txtInicio.Text = contrato.FECHA_INICIO.ToShortDateString();
        txtFin.Text = contrato.FECHA_TERMINO.ToShortDateString();
        txtMeta.Text = contrato.META.ToString();
        txtMonto.Text = contrato.MONTO_RESERVA.ToString();
        DropDownListEstado.Text = contrato.ESTADO.ToString();
        DropDownListEmpleado.Text = contrato.NUMRUT_EMP.ToString();
        DropDownListTitular.Text = contrato.NUMRUT_CLI_TITULAR.ToString();
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int nId = int.Parse(txtIdContrato.Text);
            DateTime nInicio = DateTime.Parse(txtInicio.Text);
            DateTime nFin = DateTime.Parse(txtFin.Text);
            int nMeta = 0;
            //int nMeta = int.Parse(txtMeta.Text);
            //int nMonto = int.Parse(txtMonto.Text);
            int nMonto = 0;
            String nEstado = DropDownListEstado.SelectedValue.ToString();
            int nRutTit = int.Parse(DropDownListTitular.SelectedValue);
            int nRutEmp = int.Parse(DropDownListEmpleado.SelectedValue);

            bd.SP_UPDATECONTRATO(nId, nInicio, nFin, nMeta, nMonto, nEstado, nRutEmp, nRutTit);
            bd.SaveChanges();
            System.Windows.Forms.MessageBox.Show("Contrato Modificado");
           // LabelAviso.Text = "Contrato Modificado";
            GridViewContratos.DataBind();
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            //LabelAviso.Text = "Error: " + ex.Message;
        }
    }
}