using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using MailMessage = System.Net.Mail.MailMessage;

public partial class NuevaTransferencia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 3)
        {
            Response.Redirect("~/View/LoginCliente.aspx");
        }
        pasoDos.Visible = false;
        pasoError.Visible = false;
        
        if (!(Request.QueryString["send"]==null))
        {
            MostrarModal("Envío realizado","La transacción ha sido enviada correctamente.");
        }
    }

    protected void Continuar_Click(object sender, EventArgs e)
    {
        try
        {
            int monto = int.Parse(txtMonto.Value);
            EntitiesOnTour bd = new EntitiesOnTour();
            if (monto < 1000)
            {
                throw new Exception("El monto a depósitar no es válido. Debe ser una cantidad superior a $1.000");
            }
            

            pasoDos.Visible = true;
            txtMonto.Disabled = true;
            DropDownListTipo.Enabled = false;
            DropDownListTipo.CssClass = "form-control";
            continuar.Enabled = false;
            continuar.CssClass = "btn btn-success";
        }
        catch (Exception ex)
        {
            MostrarModal("Atención", ex.Message);
        }
    }

    protected void Notificar_Click(object sender, EventArgs e)
    {
        try
        {
            string file = System.IO.Path.GetFileName(comprobante.PostedFile.FileName);
            if (file == null || file.Equals(""))
            {
                pasoDos.Visible = true;
                txtMonto.Disabled = true;
                throw new Exception("Documento no adjuntado.");
            }
            
            EntitiesOnTour bd = new EntitiesOnTour();
            DateTime fecha = DateTime.Now;
            int monto = int.Parse(txtMonto.Value);
            int tipo = int.Parse(DropDownListTipo.SelectedValue);
            string idContratoActual = Request.QueryString["id_contrato"];
            decimal idContrato = int.Parse(idContratoActual);

            decimal idusuario = decimal.Parse(Session["UsuarioID"].ToString());
            CLIENTE cliente = bd.CLIENTE.FirstOrDefault(x => x.ID_USR == idusuario);
            CUENTA cuentaEmisor = bd.CUENTA.FirstOrDefault(it => it.ID_CONTRATO == idContrato && it.NUMRUT_CLI == cliente.NUMRUT_CLI && it.ACTIVO.Equals("T"));

            if (tipo == 1)
            {
                cuentaEmisor.SALDO = cuentaEmisor.SALDO + monto;
                bd.SaveChanges();
            }
            else
            {
                //grupal
                var v_cantidad = bd.CUENTA.Count(x => x.ID_CONTRATO == idContrato && x.ACTIVO.Equals("T"));
                
                decimal saldo_prorrateado = monto / v_cantidad;
                var cuentas = bd.CUENTA.Where(x => x.ID_CONTRATO == idContrato && x.ACTIVO.Equals("T")).ToList();
                foreach (var cuenta in cuentas)
                {
                    cuenta.SALDO = cuenta.SALDO + saldo_prorrateado;
                }
                bd.SaveChanges();
            }

            TRANSACCION transaccion = new TRANSACCION()
            {
                FECHA_TRANSACCION = fecha,
                MONTO_TRANSACCION = monto,
                ID_CUENTA = cuentaEmisor.ID_CUENTA,
                ID_TIPO_TRANSACCION = tipo,
                ACTIVO = "F"
            };
            bd.TRANSACCION.Add(transaccion);
            bd.SaveChanges();


            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient()
            {
                Host = "smtp.gmail.com",
                Port = 587,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("computin.ponce@gmail.com", "jeanette0513"),
                EnableSsl = true
            };
            mail.From = new MailAddress("computin.ponce@gmail.com");
            mail.To.Add("l.ponces@alumnos.duoc.cl");
            mail.Subject = "Transferencia";
            mail.Body = "Monto: " + monto + "\n" +
            "Fecha: " + fecha + "\n" +
            "Rut de autor: " + cliente.NUMRUT_CLI + "-" + cliente.DRUT_CLI + "\n" +
            "Nombre: " + cliente.NOMBRE_CLIE + " " + cliente.APELLIDO_PAT_CLI;

            string strFileName = System.IO.Path.GetFileName(comprobante.PostedFile.FileName);
            Attachment attachFile = new Attachment(comprobante.PostedFile.InputStream, strFileName);
            mail.Attachments.Add(attachFile);
            
            SmtpServer.Send(mail);

            Page.Response.Redirect(Page.Request.Url.ToString() + "&send=true", true);
        }
        catch (Exception ex)
        {
            MostrarModal("Atención","No se ha podido conectar con el servidor de correo");
        }
    }

    protected void btnVolverATransacciones_Click(object sender, EventArgs e)
    {
        string idContratoActual = Request.QueryString["id_contrato"];
        txtMonto.Attributes.Remove("required");
        Response.Redirect("~/View/ListarTransaccion.aspx?ID_CONTRATO=" + idContratoActual);
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}