using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ModificarContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/View/Login.aspx");
        }
        else
        {
            string idContratoActual = Request.QueryString["id_contrato"];
            decimal idContrato = int.Parse(idContratoActual);
            
            EntitiesOnTour bd = new EntitiesOnTour();
            var listadoContratos = bd.CONTRATO_PAQUETE.Where( w => w.ID_CONTRATO == idContrato).ToList();
            foreach (var contrato in listadoContratos)
            {
                string yourHTMLstring = "<div class='row'><div class='col-xs-12'><h3>Paquetes turísticos</h3><p>Listado de paquetes turísticos asignados al contrato</p></div></div><div class='row bg-paquete'><div class='col-xs-12'>";
                          
                var listadoServicios = from servicio in bd.SERVICIO
                    join servicio_paquete in bd.SERVICIO_PAQUETE on servicio.ID_SERVICIO equals servicio_paquete.ID_SERVICIO
                    where servicio_paquete.ID_PAQUETEVIAJE == contrato.ID_PAQUETEVIAJE
                    select new { Servicio = servicio, Servicio_Paquete = servicio_paquete };
                foreach (var servicio in listadoServicios)
                {
                    decimal id_ws = servicio.Servicio.ID_TIPO_SERVICIO;
                    switch (servicio.Servicio.ID_TIPO_SERVICIO){
                        case 1://vuelo
                            var jsonVuelos = getJSONVuelosConID(id_ws);
                            dynamic dynJsonVuelos = JsonConvert.DeserializeObject(jsonVuelos);
                            if (dynJsonVuelos.First == null)
                            {
                                throw new Exception("No hay fechas disponibles, por favor seleccione otro destino");
                            }
                            foreach (var item in dynJsonVuelos)
                            {
                                yourHTMLstring += "<div class='box'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-plane'></i> Viaje a "+item.d_ciudad+"</h3></div><div class='box-cuerpo'><div class='col-xs-2'><span class='aerolinea'>"+item.aerolinea+"</span><br /><span>Vuelo: "+item.id+"</span></div><div class='col-xs-3'><span class='terminal'>"+item.o_terminal+"</span><span class='ciudad'>"+item.o_ciudad+", "+item.o_pais+"</span><span class='hora'>"+item.salida+"</span><span class='salida'>28/06/2018</span></div><div class='col-xs-1'>></div><div class='col-xs-3'><span class='terminal'>"+item.d_terminal+"</span><span class='ciudad'>"+item.d_ciudad+", "+item.d_pais+"</span><span class='hora'>18:00:00</span><span class='salida'>28/06/2018</span></div></div></div>";
                            }
                            break;

                        case 2://bus
                            var jsonBuses = getJSONBusesConID(id_ws);
                            dynamic dynJsonBuses = JsonConvert.DeserializeObject(jsonBuses);

                            if (dynJsonBuses.First == null)
                            {
                                throw new Exception("No hay fechas disponibles, por favor seleccione otro destino");
                            }
                            foreach (var item in dynJsonBuses)
                            {
                                yourHTMLstring += "<div class='box'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-plane'></i> Viaje a " + item.o_ciudad + "</h3></div><div class='box-cuerpo'><div class='col-xs-2'><span class='aerolinea'>" + item.linea + "</span><br /><span>Vuelo: " + item.id + "</span></div><div class='col-xs-3'><span class='terminal'>" + item.o_terminal + "</span><span class='ciudad'>" + item.o_ciudad + ", " + item.o_pais + "</span><span class='hora'>" + item.salida + "</span><span class='salida'>28/06/2018</span></div><div class='col-xs-1'>></div><div class='col-xs-3'><span class='terminal'>" + item.d_terminal + "</span><span class='ciudad'>" + item.d_ciudad + ", " + item.d_pais + "Pucón, Chile</span><span class='hora'>18:00:00</span><span class='salida'>28/06/2018</span></div></div></div>";
                            }
                            break;

                        case 3://estadia
                            var jsonAlojamientos = getJSONAlojamientoConID(id_ws);
                            dynamic dynJsonAlojamientos = JsonConvert.DeserializeObject(jsonAlojamientos);
                            foreach (var itemAloj in dynJsonAlojamientos)
                            {
                                yourHTMLstring += "<div class='box'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-bed'></i> Estadía en "+itemAloj.h_ciudad+"</h3></div><div class='box-cuerpo'><div class='col-xs-2'><span class='aerolinea'>PU</span><br /><span>Vuelo: "+itemAloj.h_id+"</span></div><div class='col-xs-3'><span class='terminal'>"+itemAloj.h_nombre+"</span><span class='ciudad'>"+itemAloj.h_direccion+"</span></div><div class='col-xs-7'><h5>Servicios disponibles</h5><span class='descripcion_estadia'>"+itemAloj.h_servicios+"</span></div></div></div>";
                            }
                            break;

                        case 4://seguro
                            var jsonSeguros = getJSONSegurosConId(id_ws);
                            dynamic dynJsonSeguros = JsonConvert.DeserializeObject(jsonSeguros);
                            foreach (var itemSeg in dynJsonSeguros)
                            {
                                yourHTMLstring += "<div class='box'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-lock'> </i>Seguros</h3></div><div class='box-cuerpo'><div class='col-xs-2'><span class='aerolinea'>PU</span><br /><span>"+itemSeg.se_id+"</span></div><div class='col-xs-3'><span class='terminal'>"+itemSeg.se_nombre+"</span><span class='ciudad'>"+itemSeg.se_empresa+"</span><span>Vigencia: "+itemSeg.se_vigencia+"/span></div><div class='col-xs-7'><h5>Descripción</h5> <span class='descripcion_estadia'>"+itemSeg.se_desc+"</span></div></div></div>";
                            }
                            break;

                        case 5://actividades
                            break;
                        
                    }
                }
                yourHTMLstring += "</div></div>";
                PaquetesContratados.Controls.Add(new LiteralControl(yourHTMLstring));
            }
        }
    }


    protected string getJSONVuelosConID(decimal id_ws)
    {
        HttpWebRequest request =
        (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getVueloConID?id="+id_ws);
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

    protected string getJSONBusesConID(decimal ID_WS)
    {
        HttpWebRequest request =
        (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getBusesConID?id="+ID_WS);
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

    protected string getJSONAlojamientoConID(decimal id_ws)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getAlojamientoConID?id=" + id_ws);
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

    protected string getJSONSegurosConId(decimal id_ws)
    {
        HttpWebRequest request =
            (HttpWebRequest)WebRequest.Create("http://ontour.somee.com/wsproveedores.asmx/json_getSegurosConID?id="+id_ws);
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



    protected void btnCargar_Click(object sender, EventArgs e)
    {
        EntitiesOnTour bd = new EntitiesOnTour();
        String urlStr = Request.QueryString["id_contrato"];
        int temp2 = int.Parse(urlStr);

        //Empleado empleado = local.Empleado.FirstOrDefault(it => it.username == usuario);
        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(it => it.ID_CONTRATO == temp2);

        //txtInicio.Text = Convert.ToString(contrato.FECHA_INICIO);
        txtIdContrato.Text = contrato.ID_CONTRATO.ToString();
        txtInicio.Text = contrato.FECHA_INICIO.ToShortDateString();
        txtFin.Text = contrato.FECHA_TERMINO.ToShortDateString();
        txtMeta.Text = contrato.META.ToString();
        txtMonto.Text = contrato.MONTO_RESERVA.ToString();
        DropDownListEstado.Text = contrato.ESTADO.ToString();
        DropDownListEmpleado.Text = contrato.NUMRUT_EMP.ToString();
        DropDownListTitular.Text = contrato.NUMRUT_CLI_TITULAR.ToString();
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour bd = new EntitiesOnTour();
            int nId = int.Parse(txtIdContrato.Text);
            DateTime nInicio = DateTime.Parse(txtInicio.Text);
            DateTime nFin = DateTime.Parse(txtFin.Text);
            int nMeta = 0;
            //int nMeta = int.Parse(txtMeta.Text);
            //int nMonto = int.Parse(txtMonto.Text);
            int nMonto = 0;
            String nEstado = DropDownListEstado.SelectedValue.ToString();
            int nRutTit = int.Parse(DropDownListTitular.SelectedValue);
            int nRutEmp = int.Parse(DropDownListEmpleado.SelectedValue);

            bd.SP_UPDATECONTRATO(nId, nInicio, nFin, nMeta, nMonto, nEstado, nRutEmp, nRutTit);
            bd.SaveChanges();
            System.Windows.Forms.MessageBox.Show("Contrato Modificado");
           // LabelAviso.Text = "Contrato Modificado";
            GridViewContratos.DataBind();
        }
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Message);
            //LabelAviso.Text = "Error: " + ex.Message;
        }
    }
}