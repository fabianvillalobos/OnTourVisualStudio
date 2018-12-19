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


public partial class ClienteListadoContratos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null )
        {
            Response.Redirect("~/View/LoginCliente.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 3)
        {
            Response.Redirect("~/View/LoginCliente.aspx");
        }
    }
    
    protected void cargarContratosPorCliente(object sender, EventArgs e)
    {
        if (Session["Usuario"] != null)
        {
            int perfilId = int.Parse(Session["PerfilID"].ToString());
            if (perfilId == 3)
            {
                int usuarioID = int.Parse(Session["UsuarioID"].ToString());
                SqlDataSource1.SelectCommand = "select DISTINCT c.id_contrato ID_CONTRATO, cli.NOMBRE_CLIE AS Nombre, cli.APELLIDO_PAT_CLI AS Apellido, c.FECHA_INICIO, c.FECHA_TERMINO AS Termino, c.ESTADO AS Estado, c.MONTO_RESERVA AS Reserva, c.META as Meta,  META - C.MONTO_RESERVA - SALDO_TOTAL AS PENDIENTE from contrato c join cuenta cu on c.id_contrato = cu.id_contrato join cliente cli on cu.numrut_cli = cli.numrut_cli join usuario u on cli.id_usr = u.id_usr LEFT JOIN (SELECT SUM(SALDO) AS SALDO_TOTAL, ID_CONTRATO FROM CUENTA GROUP BY ID_CONTRATO) TOTAL_CUENTA ON TOTAL_CUENTA.ID_CONTRATO = C.ID_CONTRATO where u.id_usr = " + usuarioID;
            }
        }
    }
}