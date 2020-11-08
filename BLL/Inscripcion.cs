using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Inscripcion
    {
        public bool Alta(BE.Inscripcion inscripcion)
        {
            return MP_Inscripcion.Alta(inscripcion);
        }

    
        public List<BE.Inscripcion> Listar()
        {
           return MP_Inscripcion.Listar();
        }

        public bool Inscribir(BE.Alumno alum,BE.Curso curso)
        {
            bool ok = (curso.Alumnos.Count < curso.Cupo && curso.FechaLimite >= DateTime.Now);
            if (ok)
            {
                curso.Alumnos.Add(alum);
                //recaudacion += ins.Curso.Precio;
            }
            return ok;

        }
    }
}
