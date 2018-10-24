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

            String activo = "P";
            int numrutCliente = int.Parse(txtRut.Text);
            if (txtNombre.Enabled)
            {
                bd.SP_INSERTCLIENTE(rut, dv, nombre, apellidoP, apellidoM,
                mail, activo, direccion, fechaNacimiento, telefono);
                lblAviso.Text = " Cliente agregado a la BD. ";
            }
            
            //Buscar contrato para obtener id
            int idContrato = int.Parse(DropDownListContratoAsociar.SelectedValue);
          
            bd.SP_INSERTARCUENTA(0, idContrato, numrutCliente, activo);
            lblAviso.Text += "Cuenta asignada y cliente asignado al contrato";
            bd.SaveChanges();
         


        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }


    }

    protected void btnCargarCliente_Click(object sender, EventArgs e)
    {
        try
        {
            lblAviso.Text = "";
            EntitiesOnTour bd = new EntitiesOnTour();
            Librerias librerias = new Librerias();

            int rutMandante = int.Parse(txtBuscarRut.Text.Trim());
            String dv = txtDvBuscar.Text.Trim().ToUpper();
            String rutCompleto = rutMandante + dv;
            
            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("Rut inválido");
            }
            CLIENTE cliente = bd.CLIENTE.FirstOrDefault(t => t.NUMRUT_CLI == rutMandante);
            if (cliente == null) //No existen coincidencias -> Crear nuevo cliente
            {
                DropDownListContratoAsociar.Enabled = true;
                txtRut.Enabled = true;
                txtDv.Enabled = true;
                txtNombre.Enabled = true;
                txtApellidoM.Enabled = true;
                txtApellidoP.Enabled = true;
                txtMail.Enabled = true;
                txtDireccion.Enabled = true;
                txtFecha.Enabled = true;
                txtTelefono.Enabled = true;
                txtFechaStr.Visible = false;
                lblFechaStr.Visible = false;
                lblAviso.Text = "No existe el pasajero, por favor rellene los campos";
            }
            else //Existen coincidencias, se cargan los textbox
            {
                DropDownListContratoAsociar.Enabled = true;
                txtRut.Text = cliente.NUMRUT_CLI.ToString();
                txtDv.Text = cliente.DRUT_CLI.ToString();
                txtNombre.Text = cliente.NOMBRE_CLIE;
                txtApellidoM.Text = cliente.APELLIDO_MAT_CLI;
                txtApellidoP.Text = cliente.APELLIDO_PAT_CLI;
                txtMail.Text = cliente.MAIL_CLI;
                txtDireccion.Text = cliente.DIRECCION_CLI;
                txtFecha.Text = cliente.FECHA_NACIMIENTO_CLI.ToString();
                txtFecha.Visible = false;
                LabelFecNacimiento.Visible = false;
                DateTime fechaNacimiento = DateTime.Parse(cliente.FECHA_NACIMIENTO_CLI.ToString());

                
                //Los str son netamente para que el usuario vea su fecha en el sistema, pero se usa
                //el normal sin str
                txtFechaStr.Visible = true;
                lblFechaStr.Visible = true;
                txtFechaStr.Text = fechaNacimiento.ToShortDateString();
                txtTelefono.Text = cliente.FONO_CLI;
               
            }
        }
        catch (Exception ex)
        {

            lblAviso.Text = ex.Message;
        }
        
    }
}