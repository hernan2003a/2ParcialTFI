using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial
{
    public partial class ListarCursos : System.Web.UI.Page
    {
        BLL.Curso bllCur = new BLL.Curso();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Enlazar();
            }
        }

        protected void Enlazar()
        {
            List<Curso> cursos = bllCur.ListarConRecaudacion();
            dgvCursos.AutoGenerateColumns = false;
            dgvCursos.DataSource = cursos;
            dgvCursos.DataBind();
            double total = 0;
            foreach (Curso item in cursos)
            {
                total += item.Recaudacion; 
            }
            txtRecaudacionTotal.Text = total.ToString();
        }
    }
}