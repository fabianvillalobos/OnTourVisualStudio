using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
public partial class View_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Se hace esto para que cuando se ingrese acá se borren las sesiones
        Session["Usuario"] = null;
       
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //Los usuarios VIENEN creados desde cuando el cliente/empleado solicita/concreta el usuario/contrato
        try
        {

            EntitiesOnTour bd = new EntitiesOnTour();

            String usuario = txtUsuario.Text.Trim();
            String clave = txtClave.Text.Trim();

            //Hasheo
            byte[] bytes = { 0x35, 0x24, 0, 76, 0x12 };
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(Encoding.ASCII.GetBytes(clave));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                sb.Append(result[i].ToString("x2"));
            }
            String hashClave = sb.ToString();
            
            // Buscar User en la BD
            USUARIO usuarioObj = bd.USUARIO.FirstOrDefault(it => it.LOGIN_USR == usuario && it.PASS_USR == hashClave);
            if (usuarioObj == null)
            {
                throw new Exception("Credenciales incorrectas, ingresar nuevamente");
            }
                //Verificar que sea un usuario activo
                char activoLocal = char.Parse(usuarioObj.ACTIVO);
            
                if (activoLocal == 'T')
                {
                    //Nombre de usuario
                    Session["Usuario"] = usuario;
                    Session["UsuarioID"] = usuarioObj.ID_USR;
                    //Tipos de usuario 1)Administrador 2)Ejecutivo De Venta 3)Cliente 4)Dueño Agencia
                    Session["Perfil"] = usuarioObj.TIPO_USUARIO.DESC_TIPO_USUARIO;
                    String perfilID = usuarioObj.TIPO_USUARIO.ID_TIPO_USUARIO.ToString();
                    Session["PerfilID"] = perfilID;

                    Response.Redirect("~/View/ListarContratos.aspx");
                }
                else
                {
                LabelAviso.Text = "Usuario no habilitado, contacte al administrador";
            }
                
            
            
        }
        catch (Exception ex)
        {

            LabelAviso.Text = ex.Message;

        }
    }
}