﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NuevaTransferencia : System.Web.UI.Page
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
            //EntitiesOnTour bd = new EntitiesOnTour();
            //DateTime fecha = new DateTime();
            //int monto = int.Parse(txtMonto.Text.Trim());
            //int tipo = int.Parse(DropDownListTipo.SelectedValue);
            //int cuenta = int.Parse(DropDownListCuenta.SelectedValue);

            //CUENTA ctv = bd.CUENTA.FirstOrDefault(it => it.ID_CUENTA == cuenta);
            //String varS = ctv.SALDO.ToString();
            //int varD = int.Parse(varS);
            //int varE = varD + monto;

            //TRANSACCION transaccion = new TRANSACCION() {
            //    FECHA_TRANSACCION=fecha,
            //    MONTO_TRANSACCION=monto,
            //    ID_CUENTA=cuenta,
            //    ID_TIPO_TRANSACCION=tipo,
            //    ACTIVO="T"
            //};
            //bd.TRANSACCION.Add(transaccion);
            //bd.SP_UPDATESALDOCUENTA(cuenta, varE);
            //bd.SaveChanges();

            //System.Windows.Forms.MessageBox.Show("Transaccion Creada");
            //lblAviso.Text = "Transaccion Creada";
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            //lblAviso.Text = ex.Message;
        }

    }
    protected void DropDownListCuenta_DataBound(object sender, EventArgs e)
    {
       
    }

    protected void DropDownListCuenta_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListCuenta_DataBound(sender, e);
    }
}