﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarActividad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejec ventas puede acceder
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }

        string idContratoActual = Request.QueryString["id_contrato"];
        DropDownListContratoRela.SelectedValue = idContratoActual;
        DropDownListContratoRela.Enabled = false;
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int Tipo = int.Parse(DropDownListTipoActividad.SelectedValue);
            string descripcion = txtDescripcion.Text.Trim();
            DateTime fecha = DateTime.Parse(txtFechaActividad.Text);
            int monto = int.Parse(txtMonto.Text.Trim());
            string activo = DropDownListActivo.SelectedValue;
            int contrato = int.Parse(DropDownListContratoRela.SelectedValue);

            ACTIVIDAD actividad = new ACTIVIDAD()
            {
                DESC_ACTIVIDAD = descripcion,
                FECHA_REALIZACION_ACT = fecha,
                MONTO_RECAUDADO = monto,
                ACTIVO = activo,
                ID_TIPO_ACTIVIDAD = Tipo,
                ID_CONTRATO = contrato
            };

            bd.ACTIVIDAD.Add(actividad);
            bd.SaveChanges();
            MostrarModal("Atención", "La actividad ha sido registrada correctamente");

            txtDescripcion.Text = "";
            txtFechaActividad.Text = "";
            txtMonto.Text = "";
            DropDownListTipoActividad.SelectedIndex = 0;
            DropDownListContratoRela.SelectedIndex = 0;
            DropDownListActivo.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            MostrarModal("Atención", "Ha ocurrido un error en la operación, inténtalo de nuevo. Si el problema persiste contáctate con el administrador.");
        }
    }

    protected void btnVolverAActividades_Click(object sender, EventArgs e)
    {
        RangeValidator1.Enabled = false;
        RequiredFieldValidator3.Enabled = false;

        string idContratoActual = Request.QueryString["id_contrato"];
        Response.Redirect("~/View/ListarActividadesContrato.aspx?" + idContratoActual);

    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}