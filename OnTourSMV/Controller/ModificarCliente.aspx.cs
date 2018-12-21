using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModificarCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Modificar cliente no se puede el RUT debido a que se establece como restricción
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        else
        {
            //Mostrar datos no modificables para mostrar al usuario los datos actuales
            EntitiesOnTour bd = new EntitiesOnTour();
            //Recuperar por URL el ID del cliente que se quiere modificar
            String urlStr = Request.QueryString["NUMRUT_CLI"];
            int numrutCliUrl = int.Parse(urlStr);
            //Instanciar el cliente
            CLIENTE cliente = bd.CLIENTE.FirstOrDefault(t=>t.NUMRUT_CLI == numrutCliUrl);
            //Poblar los textbox con los datos del cliente recuperado
            txtRut.Text = cliente.NUMRUT_CLI.ToString();
            txtDv.Text = cliente.DRUT_CLI;
            txtNombre.Text = cliente.NOMBRE_CLIE;
            txtApellidoM.Text = cliente.APELLIDO_MAT_CLI;
            txtApellidoP.Text = cliente.APELLIDO_PAT_CLI;
            txtMail.Text = cliente.MAIL_CLI;
            txtActivo.Text = cliente.ACTIVO; // Por default
            //cliente tipo usuario acá
            txtDireccion.Text = cliente.DIRECCION_CLI;
            txtFecha.Text = cliente.FECHA_NACIMIENTO_CLI.ToString();
            txtTelefono.Text = cliente.FONO_CLI;

        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int rut = int.Parse(txtRut.Text.Trim());
          
            String nombreNuevo = txtNombreNuevo.Text.Trim();
            String apellidoP = txtApellidoPNuevo.Text.Trim();
            String apellidoM = txtApellidoMNuevo.Text.Trim();
            String mail = txtMailNuevo.Text.Trim();
            String activo = DropDownListActivoNuevo.SelectedValue; // AÚN NO IMPLEMENTADO EN SP
            String direccion = txtDireccionNuevo.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFechaNuevo.Text);
            String telefono = txtTelefonoNuevo.Text;

            bd.SP_UPDATECLIENTE(rut, nombreNuevo, apellidoP, apellidoM, mail, activo ,direccion, fechaNacimiento, telefono);
            bd.SaveChanges();
            MostrarModal("Atención", "Cliente Modificado Exitosamente");
            Page_Load(null, EventArgs.Empty);
        }
        catch(Exception ex)
        {
            MostrarModal("Atención", ex.Message);
        }
    }
    
    protected void ButtonActualizarUsuario_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/ActualizarUsuario.aspx");
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}