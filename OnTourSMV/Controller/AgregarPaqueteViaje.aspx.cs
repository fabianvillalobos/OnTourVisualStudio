using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

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

    protected string getJSONBuses(string origen_terminal, string origen_ciudad, string origen_pais, string destino_terminal,
        string destino_ciudad, string destino_pais, DateTime salida, int pasajeros)
    {
        

            HttpWebRequest request = 
            (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getBuses?origen_terminal="+origen_terminal+
            "&origen_ciudad="+origen_ciudad+"&origen_pais="+origen_pais+"&destino_terminal="+destino_terminal+"&destino_ciudad="+destino_ciudad+
            "&destino_pais="+destino_pais+"&salida="+salida+"&pasajeros="+pasajeros);


            try
            {
                WebResponse response = request.GetResponse();
                using (Stream responseStream = response.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                    return reader.ReadToEnd();
                }
            }
            catch (WebException ex)
            {
                WebResponse errorResponse = ex.Response;
                using (Stream responseStream = errorResponse.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.GetEncoding("utf-8"));
                    String errorText = reader.ReadToEnd();
                    // log errorText
                }
                throw;
            }

       
    }


    protected void ButtonCargar_Click(object sender, EventArgs e)
    {

        try { 

            // Dropdown tipo transporte 1) Bus 2)Vuelo
            // String origen = txtOrigen.Text, destino = txtDestino.Text;
            DateTime fecha = CalendarSalida.SelectedDate;
            int pasajeros = int.Parse(txtPasajeros.Text);


            var json = getJSONBuses(txtTerminalOrigen.Text,txtCiudadOrigen.Text,txtPaisOrigen.Text,txtTerminalDestino.Text,
                txtCiudadDestino.Text,txtPaisDestino.Text,fecha,pasajeros); //Poner punto de interrupcion acá 

            JArray jarray = new JArray(json);

            dynamic dynJson = JsonConvert.DeserializeObject(json);
            int index = 0;
            foreach (var item in dynJson)
            {
                Console.WriteLine("{0} {1}\n", item.id, item.linea); // Poner un punto de interrupción para probar, está funcionando
                
                DDLHoraSalida.Items.Add(new ListItem("test", "0"));
                DDLHoraSalida.DataBind(); //Intento de poblar manualmente dropdown
                index++;
            }


            //Cargar los dropdown con los parámetros (Se enlazan los objetos)
          //  DropDownListSeguros.DataSourceID = "ObjectDataSourceSeguros";
           
          //  DropDownListEstadia.DataSourceID = "ObjectDataSourceEstadia";
          
          

           
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
            DropDownListTipoTransporte.Enabled = true;


           
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            
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
           
            LabelViajeBus.Visible = true;
          
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
            DropDownListTipoTransporte.Enabled = true;

        }
        else
        {
            LabelViajeVuelo.Visible = true;
          
            LabelViajeBus.Visible = false;
        

         
            DropDownListEstadia.Enabled = true;
            DropDownListSeguros.Enabled = true;
            DropDownListContrato.Enabled = true;
            DropDownListTipoTransporte.Enabled = true;
        }
    }




    



}