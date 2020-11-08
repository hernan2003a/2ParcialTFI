using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
namespace DAL
{
    public static class MP_Inscripcion
    {
        public static List<BE.Inscripcion> Listar()  {
            try {
                Acceso acceso = new Acceso();
                List<BE.Inscripcion> conc = new List<BE.Inscripcion>();
                System.Data.DataTable Tabla = acceso.Leer("Inscripcion_Listar", null);
                foreach (DataRow Registro in Tabla.Rows)
                {
                    if (Registro == null) return null;
                    conc.Add(ConvertDataRow(Registro));
                }
                return conc;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Inscripcion : No se pudo Listar");
                throw;
            }
        }
        public static Inscripcion ConvertDataRow(DataRow dt) {
            BE.Inscripcion ins = new BE.Inscripcion();
            ins.Alumno = MP_Alumno.Obtener((Int32)dt["alumno_id"]);
            ins.Curso = MP_Curso.Obtener((Int32)dt["curso_id"]);
            ins.Beca = MP_Beca.Obtener((Int32)dt["beca_id"]);
            ins.Fecha = ((DateTime)dt["fecha"]);
            return ins;
        }
        public static BE.Inscripcion Obtener(Int32 id) {
            try {
                Acceso acceso = new Acceso();
                BE.Inscripcion ins = new BE.Inscripcion();
                SqlParameter[] Parametros = new SqlParameter[1];
                Parametros[0] = acceso.CrearParametros("@ID", id);
                System.Data.DataTable Tabla = acceso.Leer("Inscripcion_Obtener", Parametros);
                foreach (DataRow Registro in Tabla.Rows)
                {
                    if (Registro == null) return null;
                    ins = ConvertDataRow(Registro);
                }
                return ins;
            } catch (Exception ex) {

                Interaction.DalError(ex.Message, " MP_Inscripcion : No se pudo Obtener");
                throw;
            }
        }
        public static List<BE.Inscripcion> ObtenerCurso(Int32 id)
        {
            try
            {
                Acceso acceso = new Acceso();
                List<BE.Inscripcion> conc = new List<BE.Inscripcion>();
                SqlParameter[] Parametros = new SqlParameter[1];
                Parametros[0] = acceso.CrearParametros("@ID", id);
                System.Data.DataTable Tabla = acceso.Leer("Inscripcion_ObtenerCurso", Parametros);
                foreach (DataRow Registro in Tabla.Rows)
                {
                    if (Registro == null) return null;
                    conc.Add(ConvertDataRow(Registro));
                }
                return conc;
            }
            catch (Exception ex)
            {

                Interaction.DalError(ex.Message, " MP_Inscripcion : No se pudo Obtener");
                return null;
            }
        }
        public static bool Alta(BE.Inscripcion ins) {
            try {
                Acceso acceso = new Acceso();
                int resultado = 0;
                SqlParameter[] Parametros = new SqlParameter[4];
                Parametros[0] = acceso.CrearParametros("@alumno", ins.Alumno.Id);
                Parametros[1] = acceso.CrearParametros("@curso", ins.Curso.Id);
                Parametros[2] = acceso.CrearParametros("@beca", ins.Beca.Id);
                Parametros[3] = acceso.CrearParametros("@fecha", ins.Fecha);
                resultado = acceso.Escribir("Inscripcion_Insertar", Parametros);
                if (resultado > 0)
                    return true;
                return false;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Inscripcion : No se pudo dar de alta");
                return false;
                //throw;
            }
        }
    }
}
