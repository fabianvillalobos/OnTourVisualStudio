using System;
using System.Collections;
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
    int precioTotal = 0;

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
        string idContratoActual = Request.QueryString["id_contrato"];
        decimal idContrato = int.Parse(idContratoActual);
        DropDownListContrato.SelectedValue= idContrato.ToString();
    }

    protected string getJSONVuelos(string origen_terminal, string origen_ciudad, string origen_pais, string destino_terminal,
        string destino_ciudad, string destino_pais, DateTime salida, int pasajeros)
    {
        HttpWebRequest request =
        (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getVuelos?origen_terminal=" + origen_terminal +
        "&origen_ciudad=" + origen_ciudad + "&origen_pais=" + origen_pais + "&destino_terminal=" + destino_terminal + "&destino_ciudad=" + destino_ciudad +
        "&destino_pais=" + destino_pais + "&salida=" + salida + "&pasajeros=" + pasajeros);

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

            }
            throw;
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
                  
                }
                throw;
            }

       
    }

    protected string getJSONAlojamientos(String ciudad, String pais, int habitacion)
    {
        HttpWebRequest request =
            (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getAlojamientos?ciudad=" + ciudad +
            "&pais=" + pais + "&habitacion=" + habitacion);

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

            }
            throw;
        }
    }

    protected string getJSONSeguros()
    {
        HttpWebRequest request =
            (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getSeguros");

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

            }
            throw;
        }
    }

    protected void deshabilitarFormulario()
    {
        DropDownListTipoTransporte.Enabled = false;
        txtCiudadOrigen.Enabled = false;
        txtCiudadDestino.Enabled = false;
        txtPaisOrigen.Enabled = false;
        txtTerminalOrigen.Enabled = false;
        txtTerminalDestino.Enabled = false;
        txtPasajeros.Enabled = false;
        CalendarSalida.Enabled = false;
        txtPaisDestino.Enabled = false;
    }
    protected void deshabilitarDropDowns()
    {
        DropDownListEstadia.Enabled = false;
        DropDownListSeguros.Enabled = false;
        DropDownListContrato.Enabled = false;
        ButtonRegistrar.Visible = false;
    }

    protected void ButtonCargar_Click(object sender, EventArgs e)
    {

        try {
            int tipoTransporte = int.Parse(DropDownListTipoTransporte.SelectedValue);
            // Dropdown tipo transporte 1) Bus 2)Vuelo   
            
            DateTime fecha = CalendarSalida.SelectedDate;
            int pasajeros = int.Parse(txtPasajeros.Text);
            if(pasajeros <= 0)
            {
                throw new Exception("Pasajeros debe ser número positivo mayor a 0");
            }
            String ciudad = txtCiudadDestino.Text;
            String pais = txtPaisDestino.Text;

            if (tipoTransporte == 1)
            {
                var jsonBuses = getJSONBuses(txtTerminalOrigen.Text, txtCiudadOrigen.Text, txtPaisOrigen.Text, txtTerminalDestino.Text,
                txtCiudadDestino.Text, txtPaisDestino.Text, fecha, pasajeros);
                
                dynamic dynJsonBuses = JsonConvert.DeserializeObject(jsonBuses);
                
                if (dynJsonBuses.First == null)
                {
                    throw new Exception("No hay fechas disponibles, por favor seleccione otro destino");
                }
                foreach (var item in dynJsonBuses)
                {
                    String idBus = item.id; //Valor a utilizar para llenar los demás dropdownlist
                    String linea = item.linea + " " + item.salida + " $" + item.precio;
                    DDLHoraSalida.Items.Add(new ListItem(linea, idBus));

                }
            }
            else
            {

                var jsonVuelos = getJSONVuelos(txtTerminalOrigen.Text, txtCiudadOrigen.Text, txtPaisOrigen.Text, txtTerminalDestino.Text,
                    txtCiudadDestino.Text, txtPaisDestino.Text, fecha, pasajeros);
                
                dynamic dynJsonVuelos = JsonConvert.DeserializeObject(jsonVuelos);
                if (dynJsonVuelos.First == null)
                {
                    throw new Exception("No hay fechas disponibles, por favor seleccione otro destino");
                }
                foreach (var item in dynJsonVuelos)
                {
                    String idVuelo = item.id; //Valor a utilizar para llenar los demás dropdownlist
                    String aerolinea = item.aerolinea + " " + item.salida + " $" + item.precio;
                    DDLHoraSalida.Items.Add(new ListItem(aerolinea, idVuelo));
                }
            }

            var jsonAlojamientos = getJSONAlojamientos(ciudad, pais, pasajeros);
            var jsonSeguros = getJSONSeguros();
            dynamic dynJsonAlojamientos = JsonConvert.DeserializeObject(jsonAlojamientos);
            dynamic dynJsonSeguros = JsonConvert.DeserializeObject(jsonSeguros);


            foreach (var itemAloj in dynJsonAlojamientos)
            {
                String idAloj = itemAloj.h_id;
                String nombre = itemAloj.h_nombre + " Dirección: " + itemAloj.h_direccion +" $" + itemAloj.h_precio;
                DropDownListEstadia.Items.Add(new ListItem(nombre, idAloj));
            }
            foreach (var itemSeg in dynJsonSeguros)
            {
                String idSeguro = itemSeg.se_id;
                String nombre = itemSeg.se_nombre + " Empresa: " + itemSeg.se_empresa + " $" + itemSeg.se_precio;
                DropDownListSeguros.Items.Add(new ListItem(nombre, idSeguro));
            }


            deshabilitarFormulario();
            DDLHoraSalida.Enabled = true;

        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            Page_Load(sender, e);
        }
    }



    protected void ButtonRegistrar_Click(object sender, EventArgs e)
    {
        int id_tipo_servicio;
        int id_ws;

        EntitiesOnTour db = new EntitiesOnTour();
        int idContrato = int.Parse(DropDownListContrato.SelectedValue);
        string descripcionPaquete = "Paquete nuevo";
        int precioPaquete = int.Parse(txtPrecioTemp.Text);
        string activo = "T";
        DateTime fechaCreacion = DateTime.Now;

        db.SP_V_INSERTAPAQUETE(descripcionPaquete, precioPaquete, activo, fechaCreacion);
        db.SaveChanges();
        PAQUETEVIAJE paquete = db.PAQUETEVIAJE.OrderByDescending(x => x.ID_PAQUETEVIAJE).First();

        CONTRATO contrato = db.CONTRATO.FirstOrDefault(x => x.ID_CONTRATO == idContrato);
        contrato.META+= int.Parse(lblPrecio.Text);

        db.SP_INSERTAPAQUETECONTRATO(idContrato, paquete.ID_PAQUETEVIAJE, activo);
        db.SaveChanges();

        if (DDLHoraSalida.SelectedValue != null)
        {
            int tipoTransporte = int.Parse(DropDownListTipoTransporte.SelectedValue);
            if (tipoTransporte == 1) 
            {
                id_tipo_servicio = 2;//bus
            }
            else 
            {
                id_tipo_servicio = 1;//vuelo
            }
            int id_ws_viaje = int.Parse(DDLHoraSalida.SelectedValue);
            db.SP_V_INSERTASERVICIO(id_ws_viaje, activo, id_tipo_servicio);
            db.SaveChanges();
            SERVICIO servicio = db.SERVICIO.OrderByDescending(x => x.ID_SERVICIO).First();
            db.SP_INSERTASERVICIOPAQUETE(servicio.ID_SERVICIO, paquete.ID_PAQUETEVIAJE, activo);
            db.SaveChanges();
        }
        
        if(DropDownListEstadia.SelectedValue != null)
        {
            id_tipo_servicio = 3; //Estadia
            id_ws = int.Parse(DropDownListEstadia.SelectedValue);
            db.SP_V_INSERTASERVICIO(id_ws, activo, id_tipo_servicio);
            db.SaveChanges();
            SERVICIO servicio = db.SERVICIO.OrderByDescending(x => x.ID_SERVICIO).First();
            db.SP_INSERTASERVICIOPAQUETE(servicio.ID_SERVICIO, paquete.ID_PAQUETEVIAJE, activo);
            db.SaveChanges();
        }

        if(DropDownListSeguros.SelectedValue != null)
        {
            id_tipo_servicio = 4; //Seguros
            id_ws = int.Parse(DropDownListSeguros.SelectedValue);
            db.SP_V_INSERTASERVICIO(id_ws, activo, id_tipo_servicio);
            db.SaveChanges();
            SERVICIO servicio = db.SERVICIO.OrderByDescending(x => x.ID_SERVICIO).First();
            db.SP_INSERTASERVICIOPAQUETE(servicio.ID_SERVICIO, paquete.ID_PAQUETEVIAJE, activo);
            db.SaveChanges();
        }
        System.Windows.Forms.MessageBox.Show("Se ha agregado el paquete de viaje");
        deshabilitarFormulario();
        deshabilitarDropDowns();
    }

  


    protected void DDLHoraSalida_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDLHoraSalida.Enabled = false;
        if (DDLHoraSalida.SelectedValue == "0000")
        {
            deshabilitarDropDowns();
            ButtonEliminar_Click(sender,e);
        }
        else
        {
            DropDownListEstadia.Enabled = true;
           
            String horaSalidaSeleccionada = DDLHoraSalida.SelectedItem.ToString();
            int indicePrecioSalida = horaSalidaSeleccionada.IndexOf("$");
            indicePrecioSalida++;
            String precioSalida = horaSalidaSeleccionada.Substring(indicePrecioSalida);
            txtPrecioTemp.Text = precioSalida;
            lblPrecio.Text = "$" + precioSalida.ToString();
        }
        
    }

    protected void DropDownListEstadia_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListSeguros.Enabled = true;
        DropDownListEstadia.Enabled = false;
        if(DropDownListEstadia.SelectedValue != "0000")
        {
            String estadiaSeleccionada = DropDownListEstadia.SelectedItem.ToString();
            int indicePrecioEstadia = estadiaSeleccionada.IndexOf("$");
            indicePrecioEstadia++;
            String precioEstadia = estadiaSeleccionada.Substring(indicePrecioEstadia);

            int precioSumaTemp = int.Parse(txtPrecioTemp.Text);
            precioSumaTemp += int.Parse(precioEstadia);
            txtPrecioTemp.Text = precioSumaTemp.ToString();
            lblPrecio.Text = "$" + precioSumaTemp.ToString();
        }
    }

    protected void DropDownListSeguros_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownListContrato.Enabled = true;
        DropDownListSeguros.Enabled = false;
        String seguroSeleccionado = DropDownListSeguros.SelectedItem.ToString();
        int indicePrecioSeguro = seguroSeleccionado.IndexOf("$");
        indicePrecioSeguro++;
        String precioSeguro = seguroSeleccionado.Substring(indicePrecioSeguro);
        int precioSumaTemp = int.Parse(txtPrecioTemp.Text);
        precioSumaTemp += int.Parse(precioSeguro);
        txtPrecioTemp.Text = precioSumaTemp.ToString();
        lblPrecio.Text = "$"+precioSumaTemp.ToString();

        ButtonRegistrar.Visible = true;
    }

    protected void ButtonEliminar_Click(object sender, EventArgs e)
    {
        Response.Redirect("AgregarPaqueteViaje.aspx");
    }
}