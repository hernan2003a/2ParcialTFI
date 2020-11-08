using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
using BE;
namespace DAL
{
    internal class Acceso
    {
        private String conn = WebConfigurationManager.AppSettings["database"];
        private SqlConnection Conexion;
        private SqlTransaction Transaccion;


        #region Manejo de Conexion 
        private Boolean Abrir()
        {
            if (Conexion == null)
            {
                Conexion = new SqlConnection();
                Conexion.ConnectionString = conn;
            }
            try
            {
                if (Conexion.State != ConnectionState.Open)
                {
                    Conexion.Open();
                    return true;
                }
                else
                    return true;
            }
            catch (Exception )
            {
                return false;
            }
        }

        private void Cerrar()
        {
            if (Transaccion == null)
            {
                Conexion.Close();
                Conexion = null;
            }
        }

        public void IniciarTransaccion()
        {
            Abrir();
            Transaccion = Conexion.BeginTransaction("SampleTransaction");
        }

        public void ConfirmarTransaccion()
        {
            Transaccion.Commit();
            Transaccion = null;
            Cerrar();
        }

        public void DeshacerTransaccion()
        {
            Transaccion.Rollback();
            Transaccion = null;
            Cerrar();
        }
        #endregion


        #region Constructor de Parametros
        public SqlParameter CrearParametros(String nombre, String valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            if ((valor == null))
                valor = "";
            param.Value = valor;
            param.DbType = DbType.String;
            return param;
        }

        public SqlParameter CrearParametros(String nombre, Double valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            if ((valor == default(Double)))
                valor = 0;
            param.Value = valor;
            param.DbType = DbType.Double;
            return param;
        }

        public SqlParameter CrearParametros(String nombre, DateTime valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            param.Value = valor;
            param.DbType = DbType.DateTime;
            return param;
        }
        public SqlParameter CrearParametros(String nombre, Decimal valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            param.Value = valor;
            param.DbType = DbType.Decimal;
            return param;
        }

        public SqlParameter CrearParametros(String nombre, Int32 valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            if ((valor == default(Int32)))
                valor = 0;
            param.Value = valor;
            param.DbType = DbType.Int32;
            return param;
        }

        public SqlParameter CrearParametros(String nombre, Int64 valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            if ((valor == default(Int64)))
                valor = 0;
            param.Value = valor;
            param.DbType = DbType.Int64;
            return param;
        }

        public SqlParameter CrearParametros(String nombre, Boolean valor)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = nombre;
            if ((valor == default(Boolean)))
                valor = false;
            param.Value = valor;
            param.DbType = DbType.Boolean;
            return param;
        }
        #endregion


        #region Metodos
        public DataTable Leer(String Nombre, SqlParameter[] Parametros)
        {
            SqlDataAdapter DataAdapter = new SqlDataAdapter();
            DataAdapter.SelectCommand = new SqlCommand(Nombre);
            if (Abrir())
            {
                DataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (Parametros != null)
                    DataAdapter.SelectCommand.Parameters.AddRange(Parametros);
                DataAdapter.SelectCommand.Connection = Conexion;
                if (Transaccion != null)
                    DataAdapter.SelectCommand.Transaction = Transaccion;
                DataTable Tabla = new DataTable();
                DataAdapter.Fill(Tabla);
                Cerrar();
                return Tabla;
            }
            else
                return null;
        }

        public Int32 LeerEntero(String nombre, SqlParameter[] parametros)
        {
            if (Abrir())
            {
                SqlCommand cmd = new SqlCommand(nombre, Conexion);
                if (parametros != null)
                    cmd.Parameters.AddRange(parametros);
                if (Transaccion != null)
                    cmd.Transaction = Transaccion;
                cmd.CommandType = CommandType.StoredProcedure;
                Int32 valorEscalar;
                try
                {
                    valorEscalar = (Int32)cmd.ExecuteScalar();
                }
                catch (Exception )
                {
                    throw;
                }
                Cerrar();
                return valorEscalar;
            }
            else
                return default(Int32);
        }

        public Int64 LeerEnteroLong(String nombre, SqlParameter[] parametros)
        {
            if (Abrir())
            {
                SqlCommand cmd = new SqlCommand(nombre, Conexion);
                if (parametros != null)
                    cmd.Parameters.AddRange(parametros);
                if (Transaccion != null)
                    cmd.Transaction = Transaccion;
                cmd.CommandType = CommandType.StoredProcedure;
                Int64 valorEscalar = 0;
                object obj = cmd.ExecuteScalar();
                if (obj != null)
                    valorEscalar = (Int64)obj;
                Cerrar();
                return valorEscalar;
            }
            else
                return default(Int64);
        }



        public String LeerCadena(String nombre, SqlParameter[] parametros)
        {
            if (Abrir())
            {
                SqlCommand cmd = new SqlCommand(nombre, Conexion);
                if (parametros != null)
                    cmd.Parameters.AddRange(parametros);
                if (Transaccion != null)
                    cmd.Transaction = Transaccion;
                cmd.CommandType = CommandType.StoredProcedure;
                String valorCadena;
                try
                {
                    valorCadena = cmd.ExecuteScalar().ToString();
                }
                catch (Exception )
                {
                    return null;
                }

                Cerrar();
                return valorCadena;
            }
            else return null;
        }

        public int Escribir(string Nombre, SqlParameter[] Parametros)
        {
            if (Abrir())
            {
                SqlCommand cmd = new SqlCommand(Nombre, Conexion);
                cmd.Parameters.AddRange(Parametros);
                if (Transaccion != null)
                    cmd.Transaction = Transaccion;
                cmd.CommandType = CommandType.StoredProcedure;
                int FilasAfectadas;
                try
                {
                    FilasAfectadas = cmd.ExecuteNonQuery();
                }
                catch (Exception ex )
                {
                    throw;
                    FilasAfectadas = -2;
                }
                cmd.Parameters.Clear();
                cmd = null;
                Cerrar();
                GC.Collect();
                return FilasAfectadas;
            }
            else
                return default(Int32);
        }

        public int EscribirBDCommandText(string cmdText)
        {
            int i = 0;
            Abrir();
            SqlCommand cmd = new SqlCommand() { CommandType = CommandType.Text, CommandText = cmdText, Connection = Conexion };
            try
            {
                i = cmd.ExecuteNonQuery();
            }
            catch (Exception )
            {
               
                i = -2;
            }
            Cerrar();
            return i;
        }

        public bool TestDB()
        {
            if (Abrir())
                return true;
            else
                return false;
        }
        #endregion

    }
}


