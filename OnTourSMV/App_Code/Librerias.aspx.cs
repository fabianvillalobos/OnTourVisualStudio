using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Librerias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // Hasheo de claves para ponerlas en la BD
        /*
        string hashClave = Convert.ToBase64String(new System.Security.Cryptography.MD5CryptoServiceProvider().
            ComputeHash(System.Text.Encoding.Default.GetBytes("luis")));
        LabelAviso.Text += hashClave;
        */
    }
    public bool validarRut(string rut)
    {
        //
        bool validacion = false;
        try
        {
            rut = rut.ToUpper();
            rut = rut.Replace(".", "");
            rut = rut.Replace("-", "");
            int rutAux = int.Parse(rut.Substring(0, rut.Length - 1));

            char dv = char.Parse(rut.Substring(rut.Length - 1, 1));

            int m = 0, s = 1;
            for (; rutAux != 0; rutAux /= 10)
            {
                s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
            }
            if (dv == (char)(s != 0 ? s + 47 : 75))
            {
                validacion = true;
            }
        }
        catch (Exception)
        {
        }
        return validacion;
    }


}