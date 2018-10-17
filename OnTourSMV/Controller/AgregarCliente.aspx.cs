﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarCliente : System.Web.UI.Page
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
            
            int rut = int.Parse(txtRut.Text.Trim());
            string dv = txtDv.Text.Trim().ToUpper();
            string nombre = txtNombre.Text.Trim();
            string apellidoP = txtApellidoP.Text.Trim();
            string apellidoM = txtApellidoM.Text.Trim();
            string mail = txtMail.Text.Trim();
            string activo = DropDownListActivo.SelectedValue;
            
            int tipoUsuario = int.Parse(DropDownListUsuario.SelectedValue);
            string direccion = txtDireccion.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            string telefono = txtTelefono.Text;

            
            //CLIENTE cliente = new CLIENTE()
            //{
            //    NUMRUT_CLI = rut,
            //    DRUT_CLI = dv,
            //    NOMBRE_CLIE = nombre,
            //    APELLIDO_PAT_CLI = apellidoP,
            //    APELLIDO_MAT_CLI = apellidoM,
            //    MAIL_CLI = mail,
            //    ACTIVO = activo,
            //    ID_USR = tipoUsuario,
            //    DIRECCION_CLI = direccion,
            //    FECHA_NACIMIENTO_CLI = fechaNacimiento,
            //    FONO_CLI = telefono,
            //};

            //bd.CLIENTE.Add(cliente);
            bd.SaveChanges();
            lblAviso.Text = "Cliente Creado";


        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }


    }
}