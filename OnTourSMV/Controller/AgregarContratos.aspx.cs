using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarContratos : System.Web.UI.Page
{
    public int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        lblFechaStr.Visible = false;
        txtFechaStr.Visible = false;
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

            int rutMandante = int.Parse(txtRut.Text.Trim());
            String dv = txtDv.Text.Trim().ToUpper();
            String rutCompleto = rutMandante + dv;

            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("Rut inválido");
            }
            if (bd.CLIENTE.Any(it => it.NUMRUT_CLI == rutMandante) && txtNombre.Enabled)
            {
                throw new Exception("Cliente ya existe"); //txtNombre es desactivado siempre que se cargue del botón
            }
            
            
            String nombre = txtNombre.Text.Trim();
            String apellidoP = txtApellidoP.Text.Trim();

            String apellidoM = txtApellidoM.Text.Trim();


            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            String mail = txtMail.Text.Trim();
            String telefono = txtTelefono.Text;
            String direccion = txtDireccion.Text.Trim();
            //Implícitos
            String activo = "T"; //Por defecto

            if (txtNombre.Enabled)
            {
                bd.SP_INSERTCLIENTE(rutMandante, dv, nombre, apellidoP, apellidoM, mail, activo, direccion, fechaNacimiento, telefono);
            }

            //Agregar Contrato

            DateTime fechInicio = DateTime.Parse(txtInicio.Text);
            DateTime fechTermino = DateTime.Parse(txtFin.Text);
            int meta = 0;
            int montoReserva = 0;
            String estado = "P"; //Por defecto, T Será cuando se complete y F cuando se cancele
                                 //int numrutEmpleado = int.Parse(empleadoObj.NUMRUT_EMP.ToString()); // Sesión usuario

            //Al crear un contrato se crea una cuenta inmediatamente, esta cuenta se debe asignar a los nuevos clientes (Pasajeros no mandantes)
            bd.SP_INSERTCONTRATO(fechInicio, fechTermino, meta, montoReserva, estado, numrutEmpleado, rutMandante);
            bd.SaveChanges();
            CONTRATO contrato = bd.CONTRATO.FirstOrDefault(t => t.FECHA_INICIO == fechInicio && t.NUMRUT_CLI_TITULAR == rutMandante);
            bd.SP_INSERTARCUENTA(0, contrato.ID_CONTRATO, rutMandante, estado); //Sigue el estandar P del contrato
            bd.SaveChanges();
            LabelAviso.Text = "Contrato y cuenta Generado.";
            DropDownListMandante.DataBind();//Actualizar dropdown
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }



   

    protected void ButtonCargarMandante_Click(object sender, EventArgs e)
    {
        try
        {
            LabelAviso.Text = "";
            EntitiesOnTour bd = new EntitiesOnTour();
            if(DropDownListMandante.SelectedValue == "")
            {
                throw new Exception("No existen valores en el listado, se deben ingresar mandantes");
            }
            lblFechaStr.Visible = true;
            txtFechaStr.Visible = true;
            txtFechaStr.Enabled = false;
            txtFecha.Visible = false;
            LabelFecNacimiento.Visible = false;
            LabelFecNacimiento.Visible = false;
            int numrutMandante = int.Parse(DropDownListMandante.SelectedValue);
            CLIENTE cliente = bd.CLIENTE.FirstOrDefault(t => t.NUMRUT_CLI == numrutMandante);
            //Llenado de textbox
            txtNombre.Text = cliente.NOMBRE_CLIE;
            txtApellidoP.Text = cliente.APELLIDO_PAT_CLI;
            txtApellidoM.Text = cliente.APELLIDO_MAT_CLI;
            txtRut.Text = cliente.NUMRUT_CLI.ToString();
            txtDv.Text = cliente.DRUT_CLI;
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
            txtRut.Enabled = false;
            txtDv.Enabled = false;
            txtFecha.Enabled = false;
            txtMail.Enabled = false;
            txtTelefono.Enabled = false;
            txtDireccion.Enabled = false;
        }
        catch (Exception ex)
        {

            LabelAviso.Text = ex.Message;
        }
        


    }
}