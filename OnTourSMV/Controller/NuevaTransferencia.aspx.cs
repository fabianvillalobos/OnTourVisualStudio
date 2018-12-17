using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }

    protected void Continuar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            //DateTime fecha = new DateTime();
            int monto = int.Parse(txtMonto.Value);
            pasoDos.Visible = true;
            txtMonto.Disabled = true;
            DropDownListTipo.Enabled = false;
            continuar.Enabled = false;
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }

    protected void Notificar_Click(object sender, EventArgs e)
    {
        
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

        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
        mail.From = new MailAddress("computin.ponce@gmail.com");
        mail.To.Add("l.ponces@alumnos.duoc.cl");
        mail.Subject = "Transferencia en contrato: "+idContrato;
        mail.Body = "Monto: "+monto+"\n"+
            "Fecha: "+fecha+ "\n" +
            "Rut de autor: "+cliente.NUMRUT_CLI+"-"+cliente.DRUT_CLI+ "\n" +
            "Nombre: "+cliente.NOMBRE_CLIE+" "+cliente.APELLIDO_PAT_CLI;

        string strFileName = System.IO.Path.GetFileName(comprobante.PostedFile.FileName);
        Attachment attachFile = new Attachment(comprobante.PostedFile.InputStream, strFileName);
        mail.Attachments.Add(attachFile);

        SmtpServer.Port = 25;
        SmtpServer.Credentials = new System.Net.NetworkCredential("computin.ponce@gmail.com", "jeanette0513");
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);
        System.Windows.Forms.MessageBox.Show("Confirmación enviada");

        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
}