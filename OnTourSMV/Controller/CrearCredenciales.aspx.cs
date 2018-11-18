using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CrearCredenciales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2 && perfilId != 1) // Solo ejecutivos de ventas y administradores pueden agregar credenciales
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }
    int rutY = 0;
    protected void DropDownListContratos_databound(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        int intA = int.Parse(DropDownListContratos.SelectedValue);
        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == intA);
        String rutX = contrato.NUMRUT_CLI_TITULAR.ToString();
        rutY = int.Parse(rutX);
        CLIENTE clienteA = bd.CLIENTE.FirstOrDefault(it => it.NUMRUT_CLI == rutY);
        String mostrarNombre = clienteA.NOMBRE_CLIE + " " + clienteA.APELLIDO_PAT_CLI + " " + clienteA.APELLIDO_MAT_CLI; // Se muestra el nombre del cliente concatenado

        txtMostrarNombre.Text = "Mandante: " + mostrarNombre;
        txtMostrarNombre.DataBind();
        txtMostrarNombre.Enabled = false;

        txtLgnUsuario.Text = (clienteA.NOMBRE_CLIE + clienteA.APELLIDO_PAT_CLI).ToUpper();
        txtLgnUsuario.Enabled = false;
        String pass = txtPass.Text;
        String confPass = txtConfPass.Text;

    }
    protected void DropDownListContratos_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListContratos_databound(sender, e);
    }

    protected void btnCrearCredencial_Click(object sender, EventArgs e)
    {
        try
        {

            EntitiesOnTour bd = new EntitiesOnTour();
            int intA = int.Parse(DropDownListContratos.SelectedValue);
            CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == intA);
            String rutX = contrato.NUMRUT_CLI_TITULAR.ToString();
            rutY = int.Parse(rutX);
            CLIENTE clienteA = bd.CLIENTE.FirstOrDefault(it => it.NUMRUT_CLI == rutY);
            String mostrarNombre = clienteA.NOMBRE_CLIE + " " + clienteA.APELLIDO_PAT_CLI + " " + clienteA.APELLIDO_MAT_CLI; // Se muestra el nombre del cliente concatenado

            txtMostrarNombre.Text = "Mandante: " + mostrarNombre;
            txtMostrarNombre.DataBind();
            txtMostrarNombre.Enabled = false;

            txtLgnUsuario.Text = (clienteA.NOMBRE_CLIE + clienteA.APELLIDO_PAT_CLI).ToUpper();
            txtLgnUsuario.Enabled = false;
            String lgn = txtLgnUsuario.Text;
            String pass = txtPass.Text;
            String confPass = txtConfPass.Text;
            if (pass == confPass)
            {
                byte[] bytes = { 0x35, 0x24, 0, 76, 0x12 };
                MD5 md5 = new MD5CryptoServiceProvider();
                byte[] result = md5.ComputeHash(Encoding.ASCII.GetBytes(pass));
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < result.Length; i++)
                {
                    sb.Append(result[i].ToString("x2"));
                }
                String hashClave = sb.ToString();

                bd.SP_INSERTAUSUARIO(lgn, hashClave, 3, "T");
                bd.SaveChanges();
                System.Windows.Forms.MessageBox.Show("Credencial Generada.");
                Response.Redirect("listarContratos.aspx");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Contraseñas no concordantes.");
            }
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }     
    }
}