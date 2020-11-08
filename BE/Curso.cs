using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
        public class Curso : IEntidad {

        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        
        private List<Alumno> alumnos  = new List<Alumno>();
         
        public List<Alumno> Alumnos
        {
            get { return alumnos  ; }            
        }

        private int cupo;

        public int Cupo
        {
            get { return cupo; }
            set { cupo = value; }
        }

        private DateTime fechaLimite;

        public DateTime FechaLimite
        {
            get { return fechaLimite; }
            set { fechaLimite = value; }
        }

        private double costo;

        public double Costo
        {
            get { return costo; }
            set { costo = value; }
        }

        public bool Inscribir(Inscripcion ins)
        {
            bool ok = (alumnos.Count < this.cupo && this.fechaLimite >= DateTime.Now);
            if (ok)
            {
                alumnos.Add(ins.Alumno);
                recaudacion += ins.Precio;
            }
            return ok;

        }
        private double recaudacion;

        public double Recaudacion
        {
            get { return recaudacion; }
            set { recaudacion = value; }
        }

        public int Id { get; set; }
        public int Estado { get; set; }
        public int Eliminado { get; set; }

        public override string ToString()
        {
            return this.nombre;
        }

    }
}
