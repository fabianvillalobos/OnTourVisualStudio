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
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId == 3)
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
        GridView1.RenderControl(hw);
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

    }
    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {

    }
}