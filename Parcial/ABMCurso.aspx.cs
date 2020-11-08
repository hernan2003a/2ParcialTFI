using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial
{
    public partial class ABMCurso : System.Web.UI.Page
    {
        BLL.Curso _bllCurso = new BLL.Curso();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Session["CursoEdit"] = "";
                Enlazar();
            }

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            try
            {
                BE.Curso _curso = new BE.Curso();
                if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
                { // MOFID
                    _curso.Id = Convert.ToInt32(Request.QueryString["Id"]);
                    _curso.Nombre = txtNombre.Text;
                    _curso.Costo = Convert.ToDouble(txtCosto.Text);
                    _curso.Cupo = Convert.ToInt32(txtCupo.Text);
                    _curso.FechaLimite = Calendario.SelectedDate;
                    _curso.Estado = 1;
                    _bllCurso.Modificar(_curso);
                    Response.Redirect("~/ABMCurso.aspx");
                }
                else
                { // ALTA 
                    _curso.Nombre = txtNombre.Text;
                    _curso.Costo = Convert.ToDouble(txtCosto.Text);
                    _curso.Cupo = Convert.ToInt32(txtCupo.Text);
                    _curso.FechaLimite = Calendario.SelectedDate;
                    _curso.Estado = 1;
                    _bllCurso.Alta(_curso);
                    Response.Redirect("~/ABMCurso.aspx");
                }
            }
            catch (Exception) { }
        }
        protected void Enlazar()
        {
            try
            {
                bool esNuevoIngreso = String.IsNullOrEmpty(Request.QueryString["id"]);
                if (!esNuevoIngreso)
                {
                    lb_AltaCurso.Visible = false;
                    Int32 cod = Convert.ToInt32(Request.QueryString["id"]);
                    BE.Curso curso = _bllCurso.Obtener(cod);
                    txtNombre.Text = curso.Nombre;
                    txtCosto.Text = curso.Costo.ToString();
                    txtCupo.Text = curso.Cupo.ToString();
                    Calendario.SelectedDate = curso.FechaLimite;
                }
                else
                {
                    lb_ModificarCurso.Visible = false;
                }
                BLL.Curso bllConc = new BLL.Curso();
                List<BE.Curso> Cursos = bllConc.Listar();
                DgvCurso.AutoGenerateColumns = false;
                DgvCurso.DataSource = Cursos;
                DgvCurso.DataBind();
                txtCantRegistros.Text = Cursos.Count.ToString();
            }
            catch (Exception) { }
        }
        protected void DgvCurso_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "DeletedRow")
                {
                    int Id = Convert.ToInt32(e.CommandArgument.ToString());
                    Button lb = sender as Button;
                    BE.Curso _Curso = new BE.Curso();
                    //OBTENGO EL ROW SELECCIONADO
                    _Curso = _bllCurso.Obtener(Id);
                    _Curso.Estado = 0;
                    _bllCurso.Modificar(_Curso);
                    Enlazar();
                }
                if (e.CommandName == "EditedRow")
                {
                    int Id = Convert.ToInt32(e.CommandArgument.ToString());
                    Response.Redirect("~/ABMCurso.aspx?id=" + Id);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void DgvCurso_RowEditing(object sender, GridViewEditEventArgs e) { }
        protected void DgvCurso_RowUpdating(object sender, GridViewUpdateEventArgs e) { }
        protected void DgvCurso_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DgvCurso.PageIndex = e.NewPageIndex;
            Enlazar();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)  {
            try {
                List<BE.Curso> registros = _bllCurso.Listar();
                if (!string.IsNullOrEmpty(txtBuscarCurso.Text)) {
                    registros = registros.Where(x => x.Nombre.ToLower().Contains(txtBuscarCurso.Text.ToLower())).ToList();
                }
                DgvCurso.AutoGenerateColumns = false;
                DgvCurso.DataSource = registros;
                if (registros != null) {
                    txtCantRegistros.Text = registros.Count.ToString();
                } else {
                    txtCantRegistros.Text = "0";
                }
                DgvCurso.DataBind();
            }  catch (Exception ex)  {  throw ex; }
        }
        protected void DgvCurso_SelectedIndexChanged(object sender, EventArgs e) { }
    }
}