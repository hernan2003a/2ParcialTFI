using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Alumno
    {
        public List<BE.Alumno> Listar()
        {
            return MP_Alumno.Listar();
        }

        public BE.Alumno Obtener(int value)
        {
            return MP_Alumno.Obtener(value);
        }

        public bool Alta(BE.Alumno alumno)
        {
            return MP_Alumno.Alta(alumno);
        }
    }
}
