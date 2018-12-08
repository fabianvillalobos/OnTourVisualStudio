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
            int numeroRut = int.Parse(txtBuscarRut.Text);
            clienteObjeto = bd.CLIENTE.FirstOrDefault(x => x.NUMRUT_CLI == numeroRut);
            
            if (clienteObjeto == null) {
                System.Windows.Forms.MessageBox.Show("El rut ingresado no pertenece a ningún contrato");
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
                    System.Windows.Forms.MessageBox.Show("El rut si tiene cuenta");
                }
            }
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
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

                    bd.SP_UPDATEUSERCLI(clienteObjeto.NUMRUT_CLI, idUsr);
                    bd.SaveChanges();
                    System.Windows.Forms.MessageBox.Show("Credencial Generada.");
                    Response.Redirect("LoginClientes.aspx");

                } else
                {
                    System.Windows.Forms.MessageBox.Show("El nombre de usuario ya existe");
                }
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Las contraseñas no coinciden");
            }
            
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
}