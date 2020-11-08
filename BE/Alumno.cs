using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Alumno : IEntidad
    {
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private int legajo;

        public int Legajo
        {
            get { return legajo; }
            set { legajo = value; }
        }

        public int Id { get  ; set ; }
    }
}
