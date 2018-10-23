using System;
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
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejecutivos de ventas pueden agregar pasajeros (Clientes con cuentas asociarlos a contratos)
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {

        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            Librerias librerias = new Librerias();
            
            int rut = int.Parse(txtRut.Text.Trim());
            String dv = txtDv.Text.Trim().ToUpper();
            String rutCompleto = rut + dv;
            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("Rut inválido");
            }
            String nombre = txtNombre.Text.Trim();
            String apellidoP = txtApellidoP.Text.Trim();
            String apellidoM = txtApellidoM.Text.Trim();
            String mail = txtMail.Text.Trim();
            
            String direccion = txtDireccion.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            String telefono = txtTelefono.Text;
            
          
            bd.SaveChanges();
            lblAviso.Text = "Cliente creado y asignado al contrato";


        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }


    }
}