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
            System.Windows.Forms.MessageBox.Show(monto.ToString());
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
        System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
        mail.From = new MailAddress("computin.ponce@gmail.com");
        mail.To.Add("l.ponces@alumnos.duoc.cl");
        mail.Subject = "Transferencia en []";
        mail.Body = "Se ha realizado una transferencia";

        string strFileName = System.IO.Path.GetFileName(comprobante.PostedFile.FileName);
        Attachment attachFile = new Attachment(comprobante.PostedFile.InputStream, strFileName);
        mail.Attachments.Add(attachFile);

        SmtpServer.Port = 25;
        SmtpServer.Credentials = new System.Net.NetworkCredential("computin.ponce@gmail.com", "jeanette0513");
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);
        System.Windows.Forms.MessageBox.Show("Enviado");
        
    }
}