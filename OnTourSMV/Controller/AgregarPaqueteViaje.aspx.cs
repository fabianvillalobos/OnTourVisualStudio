using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarPaqueteViaje : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        int perfilId = int.Parse(Session["PerfilID"].ToString());
        if (perfilId != 2) // Solo ejecutivos de ventas pueden agregar paquetes de viaje
        {
            Response.Redirect("~/View/PaginaPpal.aspx");
        }

        DropDownListViajeVuelo.Enabled = false;
        DropDownListEstadia.Enabled = false;
        DropDownListSeguros.Enabled = false;
        DropDownListContrato.Enabled = false;
        
        
    }


  
    protected void ButtonCargar_Click(object sender, EventArgs e)
    {
        try
        {
            String origen = txtOrigen.Text, destino = txtDestino.Text;
            DateTime fecha = CalendarSalida.SelectedDate;
            int pasajeros = int.Parse(txtPasajeros.Text);
            
            //Cargar los dropdown con los parámetros (Se enlazan los objetos)
            DropDownListSeguros.DataSourceID = "ObjectDataSourceSeguros";
            DropDownListViajeVuelo.DataSourceID = "ObjectDataSourceViajeVuelo";

            DropDownListViajeVuelo.Enabled = true;
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
        }
        catch (Exception ex)
        {

            LabelAviso.Text = ex.Message;
        }
        
        
        /*
        ObjectDataSource objSeguros = new ObjectDataSource();
        objSeguros.TypeName = "localhost.wsproveedores";
        objSeguros.SelectMethod = "getSeguros";
        objSeguros.ID = "ObjectDataSourceSeguros";
        DropDownListSeguros.DataSource = objSeguros;
       // DropDownListSeguros.DataSourceID = "ObjectDataSourceSeguros";
        DropDownListSeguros.DataTextField = "se_nombre";
        DropDownListSeguros.DataValueField = "se_id";
        */
    }



    protected void ButtonRegistrar_Click(object sender, EventArgs e)
    {

    }
}