using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarEmpleado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnAgregarEmp_Click(object sender, EventArgs e)
    {
        try
        {
            EntitiesOnTour db = new EntitiesOnTour();
            int rut = int.Parse(txtRut.Text);
            String dv = txtxDv.Text;
            String nombre = txtNombreEmp.Text;
            String apPaterno = txtAppaterno.Text;
            String apMaterno = txtApMaterno.Text;
            String email = txtEmail.Text;
            String direccion = txtDireccion.Text;
            String activo = "";

            if (chkActivo.Checked)
            {
                activo = "T";
            }
            else
            {
                activo = "F";
            }
            int idUsuario = int.Parse(DropDownListTipoCliente.SelectedValue);

            //DateTime fechaNac = DateTime.Parse(txtFechaNac.Text);
            //String fn = txtFechaNac.Text;
            //DateTime fechaNac = DateTime.ParseExact(fn, "dd-mon-yy", null);
            //char fechaNac = char.Parse(fn);
            //DateTime dt = DateTime.ParseExact(txtFechaNac.ToString(), "MM/dd/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture);
            //String fn = dt.ToString("dd-mon-yy", CultureInfo.InstalledUICulture);
            //DateTime fechaNac = DateTime.Parse(fn);

            String fono = txtTelefono.Text;

            EMPLEADO empleado = new EMPLEADO()
            {
                NUMRUT_EMP = rut,
                DRUT_EMP = dv,
                NOMBRE_EMP = nombre,
                APELLIDO_PAT_EMP = apPaterno,
                APELLIDO_MAT_EMP = apMaterno,
                MAIL_LABORAL = email,
                DIRECCION_EMP = direccion,
                ACTIVO = activo,
                ID_USR = idUsuario,
                //FECHA_NACIMIENTO_EMP = date,
                FONO_EMP = fono
            };
            db.EMPLEADO.Add(empleado);
            db.SaveChanges();
            LabelAviso.Text = "Empleado creado";
        }
        catch (Exception ex)
        {
            LabelAviso.Text = ex.Message;
        }
    }
}