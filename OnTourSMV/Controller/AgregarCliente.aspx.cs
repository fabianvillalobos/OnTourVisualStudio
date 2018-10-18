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
            String activo = DropDownListActivo.SelectedValue;
            
            int tipoUsuario = int.Parse(DropDownListUsuario.SelectedValue);
            String direccion = txtDireccion.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            String telefono = txtTelefono.Text;

           // bd.SP_INSERTCLIENTE(rut, dv, nombre, apellidoP, apellidoM, mail, activo, tipoUsuario, direccion, fechaNacimiento, telefono);
            
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