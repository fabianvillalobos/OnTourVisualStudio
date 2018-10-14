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
            cliente.ACTIVO = "T"; // Por default
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
            string dv = txtDv.Text.Trim().ToUpper();
            string nombre = txtNombre.Text.Trim();
            string apellidoP = txtApellidoP.Text.Trim();
            string apellidoM = txtApellidoM.Text.Trim();
            string mail = txtMail.Text.Trim();
            string activo = DropDownListActivo.SelectedValue;

            //int tipoUsuario = int.Parse(DropDownListTipoUsuario.SelectedValue);
            string direccion = txtDireccion.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            string telefono = txtTelefono.Text;
            bd.SP_UPDATECLIENTE(rut,nombre, apellidoP, apellidoM, mail, direccion, fechaNacimiento);
            
            bd.SaveChanges();
     

            lblAviso.Text = "Cliente Modificado Exitosamente";
        }
        catch(Exception ex)
        {
            lblAviso.Text = ex.Message;
        }
       
        /*
        CLIENTE cliente = bd.CLIENTE.FirstOrDefault(t => t.NUMRUT_CLI == rut);
        cliente.NUMRUT_CLI = rut;
        cliente.DRUT_CLI = dv;
        cliente.NOMBRE_CLIE = nombre;
        cliente.APELLIDO_PAT_CLI = apellidoP;
        cliente.APELLIDO_MAT_CLI = apellidoM;
        cliente.MAIL_CLI = mail;
        cliente.ACTIVO = activo;
        cliente.ID_USR = 3;
        cliente.DIRECCION_CLI = direccion;
        cliente.FECHA_NACIMIENTO_CLI = fechaNacimiento;
        cliente.FONO_CLI = telefono;
        */
       
    }
}