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
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int Tipo = int.Parse(DropDownListTipoActividad.SelectedValue);
            string descripcion = txtDescripcion.Text.Trim();
            DateTime fecha = CalendarFecha.SelectedDate;
            int monto = int.Parse(txtMonto.Text.Trim());
            string activo = "";
            if (chbActivo.Checked)
            {
                activo = "T";
            }
            else
            {
                activo = "F";
            }
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
            lblAviso.Text = "Actividad Creada";
        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }
        


    }

}