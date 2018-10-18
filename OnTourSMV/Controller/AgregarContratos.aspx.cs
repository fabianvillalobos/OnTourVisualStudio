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
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            Librerias librerias = new Librerias();
            //Agregar Mandante

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
            
            
            DateTime fechaNacimiento = DateTime.Parse(txtFecha.Text);
            String mail = txtMail.Text.Trim();
            String telefono = txtTelefono.Text;
            String direccion = txtDireccion.Text.Trim();
            //Implícitos
            char activo = 'T'; //Por defecto
            int? idUsuario = null;

            //bd.SP_INSERTCLIENTE(rut, dv, nombre, apellidoP, apellidoM, mail, activo, idUsuario, direccion, fechaNacimiento, telefono);







            //Agregar Contrato
            DateTime fechInicio = DateTime.Parse(txtInicio.Text);
            DateTime fechTermino = DateTime.Parse(txtFin.Text);
            int meta = 0;
            int monto = 0;
            String estado = "P"; //Por defecto, T Será cuando se complete y F cuando se cancele
            
            //int rutCli = int.Parse(DropDownListTitular.SelectedValue);

         //   bd.SP_INSERTCONTRATO(rut, fechInicio, fechTermino, meta, monto, estado, rutEmp, rutCli);

            /*
            CONTRATO contrato = new CONTRATO()
            {
                FECHA_INICIO = fechInicio,
                FECHA_TERMINO = fechTermino,
                META = meta,
                MONTO_RESERVA = monto,
                ESTADO = estado,
                NUMRUT_EMP = rutEmp,
                NUMRUT_CLI_TITULAR = rutCli
            };
            bd.CONTRATO.Add(contrato);
            */
            bd.SaveChanges();
            LabelAviso.Text = "Contrato Generado.";
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }
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