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

        string idContratoActual = Request.QueryString["id_contrato"];
        decimal idContrato = int.Parse(idContratoActual);
        EntitiesOnTour bd = new EntitiesOnTour();
        var resultado = bd.CONTRATO.FirstOrDefault(x => x.ID_CONTRATO == idContrato);
        if(resultado == null)
        {
            agregarClienteFormulario.Visible = false;
            idNoValido.Visible = true;
        }
        backContrato_link.Attributes["href"] = "ModificarContrato.aspx?ID_CONTRATO=" + Request.QueryString["ID_CONTRATO"];
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            Librerias librerias = new Librerias();
            string idContratoActual = Request.QueryString["id_contrato"];
            decimal idContrato = int.Parse(idContratoActual);

            int rut = int.Parse(txtRut.Text.Trim());
            String dv = txtDv.Text.Trim().ToUpper();
            String rutCompleto = rut + dv;
            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("Rut inválido");
            }
            int totalRegistros = bd.CUENTA.Count(x => x.ID_CONTRATO == idContrato && x.NUMRUT_CLI == rut && x.ACTIVO == "T");
            if (totalRegistros > 0)
            {
                throw new Exception("Ya existe este pasajero en el contrato");
            }
            String nombre = txtNombre.Text.Trim();
            String apellidoP = txtApellidoP.Text.Trim();
            String apellidoM = txtApellidoM.Text.Trim();
            String mail = txtMail.Text.Trim();
            String direccion = txtDireccion.Text.Trim();
            DateTime today = DateTime.Today;
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            if(fechaNacimiento > today)
            {
                throw new Exception("Fecha de nacimiento no puede ser mayor a la fecha actual");
            }
            String telefono = txtTelefono.Text;
            String mensajeFinal = "";
            String activo = "T"; //Un cliente es solo T o F
            int numrutCliente = int.Parse(txtRut.Text);
            if (txtNombre.Enabled)
            {
                bd.SP_INSERTCLIENTE(rut, dv, nombre, apellidoP, apellidoM,
                mail, activo, direccion, fechaNacimiento, telefono);
                mensajeFinal += " Cliente agregado a la BD. ";
            }
            
            bd.SP_INSERTARCUENTA(0, idContrato, numrutCliente, activo);
            mensajeFinal += "Cuenta asignada y cliente asignado al contrato";
            System.Windows.Forms.MessageBox.Show(mensajeFinal);
            bd.SaveChanges();
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }

    protected void bloquearCampos()
    {
        txtRut.Enabled = false;             
        txtDv.Enabled = false;
        txtNombre.Enabled = false;
        txtApellidoM.Enabled = false;
        txtApellidoP.Enabled = false;
        txtMail.Enabled = false;
        txtDireccion.Enabled = false;
        txtFecha.Enabled = false;
        txtTelefono.Enabled = false;
        txtFechaStr.Visible = true;
        lblFechaStr.Visible = true;
        txtFecha.Visible = false;
        LabelFecNacimiento.Visible = false;
    }
    protected void activarCampos()
    {
        txtRut.Enabled = false;
        txtRut.Text = null;
        txtDv.Enabled = false;
        txtDv.Text = null;
        txtNombre.Enabled = true;
        txtNombre.Text = null;
        txtApellidoM.Enabled = true;
        txtApellidoM.Text = null;
        txtApellidoP.Enabled = true;
        txtApellidoP.Text = null;
        txtMail.Enabled = true;
        txtMail.Text = null;
        txtDireccion.Enabled = true;
        txtDireccion.Text = null;       
        txtTelefono.Enabled = true;
        txtTelefono.Text = null;
        txtFechaStr.Visible = false;
        lblFechaStr.Visible = false;
        txtFecha.Enabled = true;
        txtFecha.Visible = true;
        LabelFecNacimiento.Visible = true;
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
                // RECUPERANDO EL NOMBRE DEL CLIENTE ASOCIADO AL RUT DEL DROPDOWNLIST
                activarCampos();
                txtRut.Text = txtBuscarRut.Text;               
                txtDv.Text = txtDvBuscar.Text;
                System.Windows.Forms.MessageBox.Show("No existe el pasajero, por favor rellene los campos");
                // lblAviso.Text = "No existe el pasajero, por favor rellene los campos";
            }
            else //Existen coincidencias, se cargan los textbox
            {
                //Completar rut para que no se repita el ingreso
                txtRut.Text = txtBuscarRut.Text;
                txtDv.Text = txtDvBuscar.Text;
                bloquearCampos();
                txtDv.Text = cliente.DRUT_CLI.ToString();
                txtNombre.Text = cliente.NOMBRE_CLIE;
                txtApellidoM.Text = cliente.APELLIDO_MAT_CLI;
                txtApellidoP.Text = cliente.APELLIDO_PAT_CLI;
                txtMail.Text = cliente.MAIL_CLI;
                txtDireccion.Text = cliente.DIRECCION_CLI;
                txtFecha.Text = cliente.FECHA_NACIMIENTO_CLI.ToString();
                
                DateTime fechaNacimiento = DateTime.Parse(cliente.FECHA_NACIMIENTO_CLI.ToString());
                //Los str son netamente para que el usuario vea su fecha en el sistema, pero se usa
                //el normal sin str
                txtFechaStr.Text = fechaNacimiento.ToShortDateString();
                txtTelefono.Text = cliente.FONO_CLI;
            }
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
}