using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Inscripcion : IEntidad
    {

        private Alumno alumno;
                    
        public Alumno Alumno
        {
            get { return alumno; }
            set { alumno = value; }
        }
        protected Curso curso;

        public Curso Curso
        {
            get { return curso; }
            set { curso = value; }
        }
        private Beca beca;

        public Beca Beca
        {
            get { return beca; }
            set { beca = value; }
        }


        public double Precio
        {
            get {
                return curso.Costo;
            }
        }
        public int Id { get  ; set; }
        public DateTime Fecha { get; set; }
    }
}
