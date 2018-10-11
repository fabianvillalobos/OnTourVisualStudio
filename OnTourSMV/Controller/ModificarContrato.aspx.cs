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
            //String urlStr = Request.QueryString["id_contrato"];
            //int temp2 = int.Parse(urlStr);
        }
    }

    EntitiesOnTour bd = new EntitiesOnTour();

    protected void btnCargar_Click(object sender, EventArgs e)
    {
        String urlStr = Request.QueryString["id_contrato"];
        int temp2 = int.Parse(urlStr);

        //Empleado empleado = local.Empleado.FirstOrDefault(it => it.username == usuario);
        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == temp2);

        //txtInicio.Text = Convert.ToString(contrato.FECHA_INICIO);
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
        String urlStr = Request.QueryString["id_contrato"];
        int temp2 = int.Parse(urlStr);
        EntitiesOnTour bd = new EntitiesOnTour();
        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == temp2);
        DateTime nInicio = DateTime.Parse(txtInicio.Text);
        DateTime nFin = DateTime.Parse(txtFin.Text);
        int nMeta = int.Parse(txtMeta.Text);
        int nMonto = int.Parse(txtMonto.Text);
        String nEstado = DropDownListEstado.SelectedValue;
        int nRutTit = int.Parse(DropDownListTitular.SelectedValue);
        int nRutEmp = int.Parse(DropDownListEmpleado.SelectedValue);

        //empleado.direccion = nuevoDireccion;
        //local.SaveChanges();

        try{
            contrato.FECHA_INICIO = nInicio;
            contrato.FECHA_TERMINO = nFin;
            contrato.META = nMeta;
            contrato.MONTO_RESERVA = nMonto;
            contrato.ESTADO = nEstado;
            contrato.NUMRUT_CLI_TITULAR = nRutTit;
            contrato.NUMRUT_EMP = nRutEmp;
            bd.SaveChanges();
            LabelAviso.Text = "Contrato Modificado";
            GridViewContratos.DataBind();
        }
        catch(Exception ex)
        {
            LabelAviso.Text = "Error: "+ex.Message;
        }
    }
}