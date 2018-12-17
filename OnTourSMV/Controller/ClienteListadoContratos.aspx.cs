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
                SqlDataSource1.SelectCommand = "SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CUENTA.SALDO AS Saldo FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP INNER JOIN ONTOUR.CUENTA ON ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO AND ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI WHERE CLIENTE.ID_USR = " + usuarioID;
            }
        }
    }
}