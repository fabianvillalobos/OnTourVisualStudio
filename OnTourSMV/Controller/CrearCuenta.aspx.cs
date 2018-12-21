using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CrearCuenta : System.Web.UI.Page
{
    CLIENTE clienteObjeto = new CLIENTE();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            panelCrearCuenta.Visible = false;
        } 
    }

    protected void buscarRut_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();

            Librerias librerias = new Librerias();
            int numeroRut = int.Parse(txtBuscarRut.Text.Trim());
            String dv = txtDvBuscar.Text.Trim().ToUpper();
            String rutCompleto = numeroRut + dv;

            bool rutValido = librerias.validarRut(rutCompleto); //Validación de Rut
            if (!rutValido)
            {
                throw new Exception("El rut ingresado no es válido.");
            }

            clienteObjeto = bd.CLIENTE.FirstOrDefault(x => x.NUMRUT_CLI == numeroRut);
            
            if (clienteObjeto == null) {
                throw new Exception("El rut ingresado no pertenece a ningún contrato");
            }
            else
            {  
                if (clienteObjeto.ID_USR == null)
                {
                    panelCrearCuenta.Visible = true;
                    txtBuscarRut.Enabled = false;
                    txtDvBuscar.Enabled = false;
                    buscarRut.Enabled = false;
                }
                else
                {
                    MostrarModal("Atención", "El rut si tiene cuenta");
                }
            }
        }
        catch (Exception ex)
        {
            MostrarModal("Atención", ex.Message);
        }
    }

    protected void crearCuenta_Click(object sender, EventArgs e)
    {
        try
        {
            string nombre = txtNombre.Text;
            string clave = txtPass.Text;
            string confirmarClave = txtConfPass.Text;

            if (clave.Equals(confirmarClave)){
                EntitiesOnTour bd = new EntitiesOnTour();
                USUARIO usuario = bd.USUARIO.FirstOrDefault(x => x.LOGIN_USR.Equals(nombre));
                if(usuario == null)
                {
                    byte[] bytes = { 0x35, 0x24, 0, 76, 0x12 };
                    MD5 md5 = new MD5CryptoServiceProvider();
                    byte[] result = md5.ComputeHash(Encoding.ASCII.GetBytes(clave));
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < result.Length; i++)
                    {
                        sb.Append(result[i].ToString("x2"));
                    }
                    String hashClave = sb.ToString();
                    bd.SP_INSERTAUSUARIO(nombre, hashClave, 3, "T");
                    bd.SaveChanges();

                    USUARIO ultimoUsuario = bd.USUARIO.OrderByDescending(x => x.ID_USR).First();
                    decimal idUsr = ultimoUsuario.ID_USR;
                    int numeroRut = int.Parse(txtBuscarRut.Text);
                    
                    bd.SP_UPDATEUSERCLI(numeroRut, idUsr);
                    bd.SaveChanges();
                    MostrarModal("Atención", "Las credenciales han sido generadas correctamente.");

                    txtBuscarRut.Enabled = true;
                    txtDvBuscar.Enabled = true;
                    panelCrearCuenta.Visible = false;
                    txtBuscarRut.Text="";
                    txtConfPass.Text="";
                    txtDvBuscar.Text="";
                    txtNombre.Text="";
                    txtPass.Text="";
                }
                else
                {
                    MostrarModal("Atención", "El nombre de usuario ya existe.");
                }
            }
            else
            {
                MostrarModal("Atención", "Las contraseñas no coinciden.");
            }
        }
        catch (Exception ex)
        {
            MostrarModal("Error", "Ha ocurrido un error en la operación, inténtalo de nuevo. Si el problema persiste contáctate con el administrador.");
        }
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}