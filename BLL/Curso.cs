using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Curso
    {
        public List<BE.Curso> Listar()
        {
            return MP_Curso.Listar();
        }

        public BE.Curso Obtener(int value)
        {
            return MP_Curso.Obtener(value);
        }

        public bool VerificarFecha(BE.Inscripcion ins)
        {
            return ins.Fecha > ins.Curso.FechaLimite;
        }

        public bool VerificarCursoCompleto(BE.Inscripcion ins)
        {
            int cantidad_inscriptos = MP_Inscripcion.ObtenerCurso(ins.Curso.Id).Count;

            return cantidad_inscriptos > ins.Curso.Cupo;
        }

        public List<BE.Curso> ListarConRecaudacion()
        {
            List<BE.Curso> cursos = MP_Curso.Listar();
            foreach (BE.Curso curso in cursos)
            {
                List<BE.Inscripcion> inscripciones = MP_Inscripcion.ObtenerCurso(curso.Id);
                foreach (BE.Inscripcion inscripcion in inscripciones)
                {
                    curso.Recaudacion += curso.Costo * inscripcion.Beca.Porcentaje;
                }
            }
            return cursos;
        }
    }
}
