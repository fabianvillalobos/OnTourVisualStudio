using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class AgregarContratos : System.Web.UI.Page
{
    public int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        if (!IsPostBack)
        {
            lblFechaStr.Visible = false;
            txtFechaStr.Visible = false;
            txtNombre.Enabled = false;
            txtApellidoP.Enabled = false;
            txtApellidoM.Enabled = false;
            txtFecha.Enabled = false;
            txtMail.Enabled = false;
            txtTelefono.Enabled = false;
            txtDireccion.Enabled = false;
        }

        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejecutivos de ventas pueden agregar contratos
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            //Usado para guardar contrato con el empleado actual
            String usuario = Session["Usuario"].ToString();
            USUARIO usuarioObj = bd.USUARIO.FirstOrDefault(it => it.LOGIN_USR == usuario); //User del empleado
            EMPLEADO empleadoObj = bd.EMPLEADO.FirstOrDefault(it => it.ID_USR == usuarioObj.ID_USR);
            String numrutEmpleadoTemp = empleadoObj.NUMRUT_EMP.ToString();
            int numrutEmpleado = int.Parse(numrutEmpleadoTemp);

            Librerias librerias = new Librerias();
            //Agregar Mandante

            int rutMandante = int.Parse(rutMandanteBuscar.Text.Trim());
            String dv = rutMandanteBuscardv.Text.Trim().ToUpper();
            String rutCompleto = rutMandante + dv;
           
            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("El rut ingresado no es válido.");
            }
            if (bd.CLIENTE.Any(it => it.NUMRUT_CLI == rutMandante) && txtNombre.Enabled)
            {
                throw new Exception("El cliente ya existe en la base de datos.");
            }
            
            String nombre = txtNombre.Text.Trim();
            String apellidoP = txtApellidoP.Text.Trim();
            String apellidoM = txtApellidoM.Text.Trim();
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            DateTime hoy = DateTime.Now;
            txtHoy.Text = hoy.ToShortDateString();
            if (fechaNacimiento > hoy)
            {
                ValidadorFecNac.Text = "Fecha Invalida";
                throw new Exception("La fecha de nacimiento ingresada no es válida.");
            }
            String mail = txtMail.Text.Trim();
            String telefono = txtTelefono.Text;
            String direccion = txtDireccion.Text.Trim();
            String activo = "T"; //Por defecto

            if (txtNombre.Enabled)
            {
                bd.SP_INSERTCLIENTE(rutMandante, dv, nombre, apellidoP, apellidoM, mail, activo, direccion, fechaNacimiento, telefono);
            }

            DateTime fechInicio = DateTime.Parse(txtInicio.Text);
            DateTime fechTermino = DateTime.Parse(txtFin.Text);
            int meta = 0;
            int montoReserva = 0;
            String estado = "T"; //Por defecto, T Será cuando se complete y F cuando se cancele
                                 //int numrutEmpleado = int.Parse(empleadoObj.NUMRUT_EMP.ToString()); // Sesión usuario

            bd.SP_INSERTCONTRATO(fechInicio, fechTermino, meta, montoReserva, estado, numrutEmpleado, rutMandante);
            bd.SaveChanges();
            CONTRATO contrato = bd.CONTRATO.FirstOrDefault(t => t.FECHA_INICIO == fechInicio && t.NUMRUT_CLI_TITULAR == rutMandante);
            bd.SP_INSERTARCUENTA(0, contrato.ID_CONTRATO, rutMandante, estado); //Sigue el estandar P del contrato
            bd.SaveChanges();
            Response.Redirect("ModificarContrato.aspx?ID_CONTRATO="+ contrato.ID_CONTRATO, false);
        }
        catch (Exception ex)
        {
            MostrarModal("Atención", ex.Message);
        }
    }

    protected void ButtonCargarMandante_Click(object sender, EventArgs e)
    {
        try
        {
            LabelAviso.Text = "";
            EntitiesOnTour bd = new EntitiesOnTour();

            decimal numrut = Decimal.Parse(rutMandanteBuscar.Text);
            string dv = rutMandanteBuscardv.Text;
            string rutCompleto = numrut + dv;

            Librerias librerias = new Librerias();
            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("El rut ingresado no es válido.");
            }
            int numrutMandante = int.Parse(rutMandanteBuscar.Text);
            CLIENTE cliente = bd.CLIENTE.FirstOrDefault(t => t.NUMRUT_CLI == numrutMandante);
            if (cliente == null)
            {
                txtNombre.Text = "";
                txtApellidoP.Text = "";
                txtApellidoM.Text = "";
                txtFecha.Text = "";
                txtMail.Text = "";
                txtTelefono.Text = "";
                txtDireccion.Text = "";
                txtNombre.Enabled = true;
                txtApellidoP.Enabled = true;
                txtApellidoM.Enabled = true;
                txtFecha.Enabled = true;
                txtMail.Enabled = true;
                txtTelefono.Enabled = true;
                txtDireccion.Enabled = true;
                txtFecha.Visible = true;
                LabelFecNacimiento.Visible = true;
                rutMandanteBuscar.Enabled = false;
                rutMandanteBuscardv.Enabled = false;
                txtInicio.Enabled = false;
                txtFin.Enabled = false;
                throw new Exception("El rut ingresado no existe en la base de datos.");
            }
            lblFechaStr.Visible = true;
            txtFechaStr.Visible = true;
            txtFechaStr.Enabled = false;
            txtFecha.Visible = false;
            LabelFecNacimiento.Visible = false;
           
            //Llenado de textbox
            txtNombre.Text = cliente.NOMBRE_CLIE;
            txtApellidoP.Text = cliente.APELLIDO_PAT_CLI;
            txtApellidoM.Text = cliente.APELLIDO_MAT_CLI;
            txtFecha.Text = cliente.FECHA_NACIMIENTO_CLI.Value.ToString();

            DateTime fec = DateTime.Parse(cliente.FECHA_NACIMIENTO_CLI.ToString());
            txtFechaStr.Text = fec.ToShortDateString();

            txtMail.Text = cliente.MAIL_CLI;
            txtTelefono.Text = cliente.FONO_CLI.ToString();
            txtDireccion.Text = cliente.DIRECCION_CLI;
            //Deshabilitar para evitar modificar datos de mandante
            txtNombre.Enabled = false;
            txtApellidoP.Enabled = false;
            txtApellidoM.Enabled = false;
            txtFecha.Enabled = false;
            txtMail.Enabled = false;
            txtTelefono.Enabled = false;
            txtDireccion.Enabled = false;
        }
        catch (Exception ex)
        {
            MostrarModal("Atención", ex.Message);
        }
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }

    protected void btnVolverAContratos_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/ListarContratos.aspx");
    }
}