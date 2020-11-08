using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial
{
    public partial class ABMAlumno : Page
    {
        BLL.Alumno _bllAlumno = new BLL.Alumno();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) cargarData();
        }

        protected void cargarData()
        {
            try
            {
                bool esNuevoIngreso = String.IsNullOrEmpty(Request.QueryString["id"]);

                if (!esNuevoIngreso)
                {
         

                }
                else
                {
                    //lb_ModificarAlumno.Visible = false;

                }
            }

            catch (Exception )
            {
            }

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                BE.Alumno _Alumno = new BE.Alumno();

                    _Alumno.Nombre = txtNombre.Text;
                    _Alumno.Legajo = Convert.ToInt32(txtLegajo.Text);
                    _Alumno.Id = Convert.ToInt32(Request.QueryString["Id"]);
                if (_bllAlumno.Alta(_Alumno))
                {
                    Response.Redirect("~/ABMAlumno.aspx");
                }
                else {
                    PanelExistente.Visible = true;
                }
                
            }
            catch (Exception )
            {

            }

        }
    }
       
}