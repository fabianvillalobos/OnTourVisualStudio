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
            decimal id = int.Parse(Request.QueryString["ID_CONTRATO"]);
            var clientes = (from contrato in bd.CONTRATO
                            join cue in bd.CUENTA on contrato.ID_CONTRATO equals cue.ID_CONTRATO
                            join clie in bd.CLIENTE on cue.NUMRUT_CLI equals clie.NUMRUT_CLI
                            where contrato.ID_CONTRATO == id
                            where cue.ACTIVO == "T"
                            select new { Cliente = clie }).ToList();
            repeaterPasajeros.DataSource = clientes;
            repeaterPasajeros.DataBind();

            //Cargar paquete turisticos
            var listadoContratos = bd.CONTRATO_PAQUETE.Where( w => w.ID_CONTRATO == idContrato && w.ACTIVO == "T").ToList();
            foreach (var contrato in listadoContratos)
            {       
                var listadoServicios = from servicio in bd.SERVICIO
                    join servicio_paquete in bd.SERVICIO_PAQUETE on servicio.ID_SERVICIO equals servicio_paquete.ID_SERVICIO
                    where servicio_paquete.ID_PAQUETEVIAJE == contrato.ID_PAQUETEVIAJE
                    where servicio_paquete.ACTIVO.Equals("T")
                    orderby servicio.ID_TIPO_SERVICIO ascending
                    select new { Servicio = servicio, Servicio_Paquete = servicio_paquete };

                Button btnBorrarPaquete = new Button();
                btnBorrarPaquete.ID = "botonBorrarPaquete"+contrato.ID_PAQUETEVIAJE;
                btnBorrarPaquete.Text = "Borrar paquete turístico";
                btnBorrarPaquete.CssClass = "btn btn-danger btn-borrar-paquete-turistico";
                btnBorrarPaquete.CommandArgument = contrato.ID_PAQUETEVIAJE.ToString();
                btnBorrarPaquete.Click += new EventHandler(botonBorrarPaquete_Click);
                string yourHTMLstring = "<div class='row bg-paquete modificar-contrato'><div class='col-xs-12'>";

                foreach (var servicio in listadoServicios)
                {
                    decimal id_ws = servicio.Servicio.ID_SERVICIO_WS;
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
                                yourHTMLstring += "<div class='box box-cuerpo'><div class='col-xs-3 padding-left-0'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-plane'></i> Viaje a " + item.d_ciudad + "</h3></div></div><div class='col-xs-3'><span class='terminal'>" + item.o_terminal+"</span><span class='ciudad'>"+item.o_ciudad+", "+item.o_pais+"</span><span class='hora'>"+item.salida+ "</span></div><div class='col-xs-1'><i class='glyphicon glyphicon-menu-right big-icon'></i></div><div class='col-xs-3'><span class='terminal'>" + item.d_terminal+"</span><span class='ciudad'>"+item.d_ciudad+", "+item.d_pais+"</span></div></div>";
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
                                yourHTMLstring += "<div class='box box-cuerpo'><div class='col-xs-3 padding-left-0'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-plane'></i> Viaje a " + item.o_ciudad + "</h3></div></div><div class='col-xs-3'><span class='terminal'>" + item.o_terminal + "</span><span class='ciudad'>" + item.o_ciudad + ", " + item.o_pais + "</span><span class='hora'>" + item.salida + "</span></div><div class='col-xs-1'><i class='glyphicon glyphicon-menu-right big-icon'></i></div><div class='col-xs-3'><span class='terminal'>" + item.d_terminal + "</span><span class='ciudad'>" + item.d_ciudad + ", " + item.d_pais + "</span></div></div>";
                            }
                            break;

                        case 3://estadia
                            var jsonAlojamientos = getJSONAlojamientoConID(id_ws);
                            dynamic dynJsonAlojamientos = JsonConvert.DeserializeObject(jsonAlojamientos);
                            foreach (var itemAloj in dynJsonAlojamientos)
                            {
                                yourHTMLstring += "<div class='box box-cuerpo'><div class='col-xs-3 padding-left-0'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-bed'></i> Estadía en " + itemAloj.h_ciudad+ "</h3></div></div><div class='col-xs-3'><span class='terminal'>"+itemAloj.h_nombre+"</span><span class='ciudad'>"+itemAloj.h_direccion+"</span></div><div class='col-xs-6'><h5>Servicios disponibles</h5><span class='descripcion_estadia'>"+itemAloj.h_servicios+"</span></div></div>";
                            }
                            break;

                        case 4://seguro
                            var jsonSeguros = getJSONSegurosConId(id_ws);
                            dynamic dynJsonSeguros = JsonConvert.DeserializeObject(jsonSeguros);
                            foreach (var itemSeg in dynJsonSeguros)
                            {
                                yourHTMLstring += "<div class='box box-cuerpo'><div class='col-xs-3 padding-left-0'><div class='box-encabezado'><h3><i class='glyphicon glyphicon-lock'></i> Seguros</h3></div></div><div class='col-xs-3'><span class='terminal'>"+itemSeg.se_nombre+"</span><span class='ciudad'>"+itemSeg.se_empresa+"</span><span>Vigencia: "+itemSeg.se_vigencia+"</span></div><div class='col-xs-6'><h5>Descripción</h5> <span class='descripcion_estadia'>"+itemSeg.se_desc+"</span></div></div>";
                            }
                            break;

                        case 5://actividades
                            break;
                        
                    }
                }
                yourHTMLstring += "</div></div>";
                PaquetesContratados.Controls.Add(new LiteralControl(yourHTMLstring));
                PaquetesContratados.Controls.Add(btnBorrarPaquete);
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
            MostrarModal("Operación realizada", "El contrato ha sido modificado correctamente.");
            GridViewContratos.DataBind();
        }
        catch (Exception ex)
        {
            MostrarModal("Error", "Ha ocurrido un error en la operación, inténtalo de nuevo.");
        }
    }

    protected void QuitarPasajero(object sender, EventArgs e)
    {
        string idContratoActual = Request.QueryString["id_contrato"];
        decimal idContrato = int.Parse(idContratoActual);
        decimal clienteRut = decimal.Parse(datosPasajero.Text);
        EntitiesOnTour bd = new EntitiesOnTour();
        var v_saldo = bd.CUENTA.FirstOrDefault(x => x.ID_CONTRATO == idContrato && x.NUMRUT_CLI == clienteRut && x.ACTIVO.Equals("T"));
        decimal saldo_pasajero = v_saldo.SALDO;
        v_saldo.ACTIVO = "F";
        v_saldo.SALDO = 0;
        bd.SaveChanges();
        var v_cantidad = bd.CUENTA.Count(x => x.ID_CONTRATO == idContrato && x.ACTIVO.Equals("T"));
        decimal saldo_prorrateado = saldo_pasajero / v_cantidad;
        var cuentas = bd.CUENTA.Where(x => x.ID_CONTRATO == idContrato && x.ACTIVO.Equals("T")).ToList();
        foreach (var cuenta in cuentas)
        {
            cuenta.SALDO = cuenta.SALDO + saldo_prorrateado;
        }
        bd.SaveChanges();
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }

    protected void btnDelete_Command(object sender, EventArgs e)
    {
        datosPasajero.Text = (sender as System.Web.UI.WebControls.Button).CommandArgument;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalQuitarPasajero').modal('show');</script>", false);
    }

    protected void botonBorrarPaquete_Click(object sender, EventArgs e)
    {
        idPaqueteTuristico.Value = (sender as System.Web.UI.WebControls.Button).CommandArgument;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalQuitarPaquete').modal('show');</script>", false);
    }

    protected void QuitarPaquete_Click(object sender, EventArgs e)
    {
        decimal idPaquete = decimal.Parse(idPaqueteTuristico.Value);
        EntitiesOnTour bd = new EntitiesOnTour();

        List<SERVICIO> servciosPaquete = new List<SERVICIO>();
        servciosPaquete = bd.SP_LISTARSERVICIOSPORPAQUETE(idPaquete).ToList();

        int restaTotal = 0;

        foreach (var item in servciosPaquete)
        {
            string jsonServicioWS;
            switch (item.ID_TIPO_SERVICIO) {
                case 1 :
                    jsonServicioWS = getJSONVuelosConID(item.ID_SERVICIO_WS);
                    dynamic dynJsonVuelos = JsonConvert.DeserializeObject(jsonServicioWS);
                    foreach (var servicioWS in dynJsonVuelos)
                        restaTotal += servicioWS.precio;
                    break;
                case 2 :
                    jsonServicioWS = getJSONBusesConID(item.ID_SERVICIO_WS);
                    dynamic dynJsonBuses = JsonConvert.DeserializeObject(jsonServicioWS);
                    foreach (var servicioWS in dynJsonBuses)
                        restaTotal += servicioWS.precio;
                    break;
                case 3 :
                    jsonServicioWS = getJSONAlojamientoConID(item.ID_SERVICIO_WS);
                    dynamic dynJsonAlojamiento = JsonConvert.DeserializeObject(jsonServicioWS);
                    foreach (var servicioWS in dynJsonAlojamiento)
                        restaTotal += servicioWS.precio;
                    break;
                case 4 :
                    jsonServicioWS = getJSONSegurosConId(item.ID_SERVICIO_WS);
                    dynamic dynJsonSeguro = JsonConvert.DeserializeObject(jsonServicioWS);
                    foreach (var servicioWS in dynJsonSeguro)
                        restaTotal += servicioWS.precio;
                    break;
            }   
        }

        string idContratoActual = Request.QueryString["id_contrato"];
        decimal idContrato = int.Parse(idContratoActual);
        CONTRATO contrato = bd.CONTRATO.FirstOrDefault(x => x.ID_CONTRATO == idContrato);
        contrato.META -= restaTotal;

        bd.SP_ELIMINAPAQUETEVIAJECONTRATO(idPaquete);
        bd.SP_ELIMINAPAQUETEVIAJE(idPaquete);
        bd.SaveChanges();
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }

    public void MostrarModal(string titulo, string contenido)
    {
        lblModalMensaje.Text = contenido;
        lblModalTitulo.Text = titulo;
        ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "<script>$('#modalMensaje').modal('show');</script>", false);
    }
}

