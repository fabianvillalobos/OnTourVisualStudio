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
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;

public partial class ListarContratos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejec ventas puede acceder
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }
    }

    protected void btnNuevoContrato_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/AgregarContratos.aspx");
    }



    /*
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/pdf";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        Document doc = new Document(PageSize.LETTER.Rotate(), 10, 10, 10, 10);
        String path = this.Server.MapPath(".") + "Archivos\\MiArchivo.pdf";

        FileStream file = new FileStream(path, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);

        PdfWriter.GetInstance(doc, file);
        doc.Open();

        doc.Add(new Paragraph(GridView1.ToString()));
        doc.Close();

        Process.Start(path);
    }
    */
}