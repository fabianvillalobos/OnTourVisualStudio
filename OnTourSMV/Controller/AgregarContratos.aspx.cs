using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarContratos : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejecutivos de ventas pueden agregar contratos
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        /*try
        {*/
            EntitiesOnTour bd = new EntitiesOnTour();
            //Usado para guardar contrato con el empleado actual
            //USUARIO usuarioObj = bd.USUARIO.FirstOrDefault(it => it.LOGIN_USR == Session["Usuario"].ToString());
            //EMPLEADO empleadoObj = bd.EMPLEADO.FirstOrDefault(it => it.ID_USR == usuarioObj.ID_USR);

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
            String nombre = txtNombre.Text.Trim();
            String apellidoP = txtApellidoP.Text.Trim();
            String apellidoM = txtApellidoM.Text.Trim();
            
            
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            String mail = txtMail.Text.Trim();
            String telefono = txtTelefono.Text;
            String direccion = txtDireccion.Text.Trim();
            //Implícitos
            String activo = "T"; //Por defecto
            int? idUsuario = null;

            bd.SP_INSERTCLIENTE(rutMandante, dv, nombre, apellidoP, apellidoM, mail, "T", idUsuario, direccion, fechaNacimiento, telefono);


            //Agregar Contrato
            
            DateTime fechInicio = DateTime.Parse(txtInicio.Text);
            DateTime fechTermino = DateTime.Parse(txtFin.Text);
            int meta = 0;
            int montoReserva = 0;
            String estado = "P"; //Por defecto, T Será cuando se complete y F cuando se cancele
                                 //int numrutEmpleado = int.Parse(empleadoObj.NUMRUT_EMP.ToString()); // Sesión usuario
        int numrutEmpleado = 22222222;

            bd.SP_INSERTCONTRATO(fechInicio, fechTermino, meta, montoReserva, estado, numrutEmpleado, rutMandante);
         
            bd.SaveChanges();
            LabelAviso.Text = "Contrato Generado.";
        }/*
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }*/
    /*
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();


            

           
            CLIENTE cliente = new CLIENTE()
            {
                NUMRUT_CLI = rut,
                DRUT_CLI = dv,
                NOMBRE_CLIE = nombre,
                APELLIDO_PAT_CLI = apellidoP,
                APELLIDO_MAT_CLI = apellidoM,
                MAIL_CLI = mail,
                ACTIVO = activo,
                ID_USR = tipoUsuario,
                DIRECCION_CLI = direccion,
                FECHA_NACIMIENTO_CLI = fechaNacimiento,
                FONO_CLI = telefono,
            };

            bd.CLIENTE.Add(cliente);
            bd.SaveChanges();
            lblAviso.Text = "Cliente Creado";


        }
        catch (Exception ex)
        {
            lblAviso.Text = ex.Message;
        }

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {

    }
    */
   
}