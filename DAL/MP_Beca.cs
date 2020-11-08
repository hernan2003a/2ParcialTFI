using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
namespace DAL {
    public static class MP_Beca {
        public static List<BE.Beca> Listar() {
            try {
                Acceso acceso = new Acceso();
                List<BE.Beca> conc = new List<BE.Beca>();
                DataTable Tabla = acceso.Leer("Beca_Listar", null);
                foreach (DataRow Registro in Tabla.Rows)
                {
                    if (Registro == null) return null;
                    conc.Add(ConvertDataRow(Registro));
                }
                return conc;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP Beca : No se pudo listar");
                throw;
            }
            
        }
        public static Beca ConvertDataRow(DataRow dt) {
            BE.Beca beca = new BE.Beca();
            beca.Id = Convert.ToInt32(dt["id"]);
            beca.Nombre = (String)dt["nombre"];
            beca.Porcentaje = Convert.ToDouble(dt["porcentaje"]);
            return beca;
        }
        public  static BE.Beca Obtener(int id) {
            try  {
                Acceso acceso = new Acceso();
                BE.Beca beca = new BE.Beca();
                SqlParameter[] Parametros = new SqlParameter[1];
                Parametros[0] = acceso.CrearParametros("@ID", id);
                DataTable Tabla = acceso.Leer("Beca_Obtener", Parametros);
                foreach (DataRow Registro in Tabla.Rows)
                {
                    if (Registro == null) return null;
                    beca = ConvertDataRow(Registro);
                }
                return beca;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP Beca : No se pudo Obtener");
                throw;
            }
        }
    }
}
