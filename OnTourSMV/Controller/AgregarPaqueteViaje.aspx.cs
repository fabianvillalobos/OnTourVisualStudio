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
            DropDownListViajeBus.DataSourceID = "ObjectDataSourceViajeBus";

            DropDownListViajeVuelo.Enabled = true;
            DropDownListViajeBus.Enabled = true;
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
            DropDownListTipoTransporte.Enabled = true;


            DropDownListViajeVuelo.DataTextField = "salida" ;
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            //LabelAviso.Text = ex.Message;
        }
        
        
      
    }



    protected void ButtonRegistrar_Click(object sender, EventArgs e)
    {

    }

   
    protected void DropDownListTipoTransporte_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownListTipoTransporte.SelectedIndex == 0)
        {
            LabelViajeVuelo.Visible = false;
            DropDownListViajeVuelo.Visible = false;
            LabelViajeBus.Visible = true;
            DropDownListViajeBus.Visible = true;

            DropDownListViajeVuelo.Enabled = true;
            DropDownListViajeBus.Enabled = true;
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
            DropDownListTipoTransporte.Enabled = true;

        }
        else
        {
            LabelViajeVuelo.Visible = true;
            DropDownListViajeVuelo.Visible = true;
            LabelViajeBus.Visible = false;
            DropDownListViajeBus.Visible = false;

            DropDownListViajeVuelo.Enabled = true;
            DropDownListViajeBus.Enabled = true;
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
            DropDownListTipoTransporte.Enabled = true;
        }
    }

    protected void DropDownListViajeVuelo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownListViajeBus_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}