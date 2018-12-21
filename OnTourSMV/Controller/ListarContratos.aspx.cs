 using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.fonts;
using System.IO;
using System.Windows.Forms;


public partial class ListarContratos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null )
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId == 3)
        {
            Response.Redirect("~/View/ClienteListadoContratos.aspx");
        }
        if (perfilId != 4)
        {
            btnExportar.Visible = false;
        }
        if (perfilId == 4)
        {
            btnNuevoContrato.Visible = false;
            
        }
    }
    
    protected void btnNuevoContrato_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/AgregarContratos.aspx");
    }

    //public static iTextSharp.text.Image img = Image.GetInstance("airbus.jpg");
    protected void btnExportar_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Ontour.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView2.Visible = true;
        GridView2.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        pdfDoc.AddTitle("Ontour");
        //img.SetAbsolutePosition(0, 750);
        //pdfDoc.Add(img);

        Font fuente = new Font();
        fuente.Size = 28;
        //Header
        Paragraph header = new Paragraph("Agencia de viajes Ontour", fuente);
        header.SpacingBefore = 200;
        header.SpacingAfter = 0;
        header.Alignment = 1; //0-Left, 1 middle,2 Right
        //salto de linea        
        Paragraph saltoDeLinea1 = new Paragraph("                                                                                                                                                                                                                                                                                                                                                                                   ");
        //fecha
        var fecha = new Paragraph(DateTime.Today.ToString("dd/MM/yyyy"));

        fecha.Alignment = 2;
        fecha.Font.Size = 12;                           

        pdfDoc.Add(header);
        pdfDoc.Add(fecha);
        pdfDoc.Add(saltoDeLinea1);

        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
        GridView2.Visible = false;

    }
    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {

    }

    protected void cargarContratosPorCliente(object sender, EventArgs e)
    {
        if (Session["Usuario"] != null)
        {
            int perfilId = int.Parse(Session["PerfilID"].ToString());
            if (perfilId == 3)
            {
                int usuarioID = int.Parse(Session["UsuarioID"].ToString());
                SqlDataSource1.SelectCommand = "SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CONTRATO.META - TOTAL_CUENTA.SALDO_TOTAL - ONTOUR.CONTRATO.MONTO_RESERVA AS Saldo FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP INNER JOIN ONTOUR.CUENTA ON ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO AND ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI LEFT JOIN (SELECT SUM(SALDO) AS SALDO_TOTAL, ID_CONTRATO FROM CUENTA GROUP BY ID_CONTRATO) TOTAL_CUENTA ON TOTAL_CUENTA.ID_CONTRATO = ONTOUR.CONTRATO.ID_CONTRATO WHERE ONTOUR.CONTRATO.ESTADO != 'F' AND CLIENTE.ID_USR = " + usuarioID;

            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CONTRATO.META - TOTAL_CUENTA.SALDO_TOTAL - ONTOUR.CONTRATO.MONTO_RESERVA AS Saldo FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP INNER JOIN ONTOUR.CUENTA ON ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO AND ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI LEFT JOIN (SELECT SUM(SALDO) AS SALDO_TOTAL, ID_CONTRATO FROM CUENTA GROUP BY ID_CONTRATO) TOTAL_CUENTA ON TOTAL_CUENTA.ID_CONTRATO = ONTOUR.CONTRATO.ID_CONTRATO WHERE ONTOUR.CONTRATO.ESTADO <> 'F'";

            }
        }
    }

    protected void mostrarModal(string titulo, string contenido)
    {
        System.Web.UI.WebControls.Label modtitulo = (System.Web.UI.WebControls.Label)this.FindControl("lblModalTitulo");
        System.Web.UI.WebControls.Label modmensaje = (System.Web.UI.WebControls.Label)this.FindControl("lblModalMensaje");
        modmensaje.Text = contenido;
        modtitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        numeroContratoAEliminar.Text = (sender as System.Web.UI.WebControls.Button).CommandArgument;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalBorrarContrato').modal('show');</script>", false);
    }

    protected void BorrarContratoAceptado(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        bd.SP_ELIMINACONTRATO(int.Parse(numeroContratoAEliminar.Text));
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
}