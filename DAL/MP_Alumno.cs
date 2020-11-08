using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public static class MP_Alumno
    {
        public static List<Alumno> Listar() {
            try  {
                Acceso acceso = new Acceso();
                List<Alumno> conc = new List<Alumno>();
                DataTable Tabla = acceso.Leer("Alumno_Listar", null);
                foreach (DataRow Registro in Tabla.Rows) {
                    if (Registro == null) return null;
                    conc.Add(ConvertDataRow(Registro));
                }
                return conc;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Alumno : No se pudo listar");
                throw;
            }
        }
        public static Alumno ConvertDataRow(DataRow dt) {
            BE.Alumno Alumno = new BE.Alumno();
            Alumno.Id = (Int32)dt["id"];
            Alumno.Nombre = (String)dt["nombre"];
            Alumno.Legajo = (Int32)dt["legajo"];
            return Alumno;
        }
        public static Alumno Obtener(int id) {
            try {
                Acceso acceso = new Acceso();
                Alumno Alumno = new Alumno();
                SqlParameter[] Parametros = new SqlParameter[1];
                Parametros[0] = acceso.CrearParametros("@ID", id);
                System.Data.DataTable Tabla = acceso.Leer("Alumno_Obtener", Parametros);
                foreach (DataRow Registro in Tabla.Rows) {
                    if (Registro == null) return null;
                    Alumno = ConvertDataRow(Registro);
                }
                return Alumno;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Alumno : No se pudo Obtener");
                throw;
            }

        }
        public static bool Alta(Alumno conc) {
            try {
                Acceso acceso = new Acceso();
                Int32 resultado = 0;
                SqlParameter[] Parametros = new SqlParameter[2];
                Parametros[0] = acceso.CrearParametros("@nombre", conc.Nombre);
                Parametros[1] = acceso.CrearParametros("@legajo", (Int32)conc.Legajo);
                resultado = acceso.Escribir("Alumno_Insertar", Parametros);
                if (resultado > 0)
                    return true;
                return false;
            } catch (Exception ex) {
                Interaction.DalError(ex.Message, " MP_Alumno : No se pudo dar de Alta");
                return false;
            }
        }
    }
}
