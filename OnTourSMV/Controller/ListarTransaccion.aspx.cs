﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListarTransaccion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId == 2)
        {
            btnNueva.Visible = false;
        }

        string idContratoActual = Request.QueryString["id_contrato"];
        SqlDataSource1.SelectParameters["id"].DefaultValue = idContratoActual;
    }

    protected void btnVolverAContratos_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/ListarContratos.aspx");
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}