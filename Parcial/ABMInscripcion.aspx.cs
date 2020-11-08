using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Parcial
{
    public partial class ABMInscripcion : Page
    {
        BLL.Alumno _bllAlumno = new BLL.Alumno();
        BLL.Beca _bllBeca = new BLL.Beca();
        BLL.Inscripcion _bllIns = new BLL.Inscripcion();
        BLL.Curso _bllCurso = new BLL.Curso();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) cargarData();
        }

        protected void cargarData()
        {
            try
            {

                ddlCurso.DataTextField = "nombre";
                ddlCurso.DataValueField = "id";
                ddlCurso.DataSource = _bllCurso.Listar();
                ddlCurso.DataBind();

                ddlBeca.DataTextField = "nombre";
                ddlBeca.DataValueField = "id";
                ddlBeca.DataSource = _bllBeca.Listar();
                ddlBeca.DataBind();

                
                ddlAlumno.DataTextField = "nombre";
                ddlAlumno.DataValueField = "id";
                ddlAlumno.DataSource = _bllAlumno.Listar();
                ddlAlumno.DataBind();

                bool esNuevoIngreso = String.IsNullOrEmpty(Request.QueryString["id"]);

                if (!esNuevoIngreso)
                {


                   
                }
                else
                {
                    

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
                BE.Inscripcion _incripcion = new BE.Inscripcion
                {
                    Alumno = _bllAlumno.Obtener(int.Parse(ddlAlumno.SelectedItem.Value)),
                    Curso = _bllCurso.Obtener(int.Parse(ddlCurso.SelectedItem.Value)),
                    Beca = _bllBeca.Obtener(int.Parse(ddlBeca.SelectedItem.Value)),
                    Fecha = DateTime.ParseExact(Calendario.SelectedDate.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture)
                };


                if (_bllCurso.VerificarFecha(_incripcion))
                {
                    PanelFueraFecha.Visible = true;
                }
                else if (_bllCurso.VerificarCursoCompleto(_incripcion))
                {
                    PanelCursoCompleto.Visible = true;
                }
                else {
                    if (_bllIns.Alta(_incripcion))
                    {
                        Response.Redirect("~/ABMInscripcion.aspx");
                    }
                    else {
                        PanelCursoCompleto.Visible = true;
                    }

                }

            }
            catch (Exception  )
            {
               
            }

        }
    }
       
}