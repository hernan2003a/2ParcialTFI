using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Beca
    {
        public List<BE.Beca> Listar()
        {
            return MP_Beca.Listar();
        }

        public BE.Beca Obtener(int value)
        {
            return MP_Beca.Obtener(value);
        }
    }
}
