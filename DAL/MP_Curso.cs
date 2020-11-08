using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL {
    public static class MP_Curso  {
        public static List<Curso> Listar() {
            try
            {
                Acceso acceso = new Acceso();
                List<Curso> conc = new List<Curso>();
                System.Data.DataTable Tabla = acceso.Leer("Curso_Listar", null);
                foreach (DataRow Registro in Tabla.Rows)
                {
                    if (Registro == null) return null;
                    conc.Add(ConvertDataRow(Registro));
                }
                return conc;
            }
            catch (Exception ex)
            {
                Interaction.DalError(ex.Message, " MP_Curso : No se pudo Listar");
                throw;
            }

        }
        public static Curso ConvertDataRow(DataRow dt) {
            BE.Curso curso = new BE.Curso();
            curso.Id = (Int32)dt["id"];
            curso.Nombre = (String)dt["nombre"];
            curso.Costo = Convert.ToDouble(dt["costo"]);
            curso.Cupo = Convert.ToInt32(dt["cupo"]);
            curso.FechaLimite = (DateTime)dt["fecha_limite"];
            curso.Estado = Convert.ToInt32(dt["estado"]);
            return curso;
        }
        public static Curso Obtener(Int32 id) {
            try {
                Acceso acceso = new Acceso();
                SqlParameter[] Parametros = new SqlParameter[1];
                Parametros[0] = acceso.CrearParametros("@ID", id);
                System.Data.DataTable Tabla = acceso.Leer("Curso_Obtener", Parametros);
                BE.Curso Curso = new BE.Curso();
                foreach (DataRow Registro in Tabla.Rows) {
                    if (Registro == null) return null;
                    Curso = ConvertDataRow(Registro);
                }
                return Curso;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Alumno : No se pudo Obtener");
                throw;
            }
        }

        public static bool Alta(Curso curso) {
            try {
                Acceso acceso = new Acceso();
                Int32 resultado = 0;
                SqlParameter[] Parametros = new SqlParameter[5];
                Parametros[0] = acceso.CrearParametros("@nombre", curso.Nombre);
                Parametros[1] = acceso.CrearParametros("@costo", curso.Costo);
                Parametros[2] = acceso.CrearParametros("@fechalimite", curso.FechaLimite);
                Parametros[3] = acceso.CrearParametros("@cupo", curso.Cupo);
                Parametros[4] = acceso.CrearParametros("@estado", curso.Estado);
                resultado = acceso.Escribir("Curso_Insertar", Parametros);
                if (resultado > 0) return true;
                return false;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Curso : No se pudo dar de Alta");
                throw;
            }
        }

        public static bool Modificar(Curso curso) {
            try {
                Acceso acceso = new Acceso();
                Int32 resultado = 0;
                SqlParameter[] Parametros = new SqlParameter[6];
                Parametros[0] = acceso.CrearParametros("@id", curso.Id);
                Parametros[1] = acceso.CrearParametros("@nombre", curso.Nombre);
                Parametros[2] = acceso.CrearParametros("@costo", curso.Costo);
                Parametros[3] = acceso.CrearParametros("@fechalimite", curso.FechaLimite);
                Parametros[4] = acceso.CrearParametros("@cupo", curso.Cupo);
                Parametros[5] = acceso.CrearParametros("@estado", curso.Estado);
                resultado = acceso.Escribir("Curso_Modificar", Parametros);
                if (resultado > 0) return true;
                return false;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Curso : No se pudo Modificar");
                return false;
            }
        }
    }
}
