using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Reflection;
using log4net;

using CommonLib.Utils;
using System.Text;

namespace CommonLib.DB
{
    public class CSQLHelper
    {
        /// <summary>
        /// 응용 프로그램 설정 파일에서 정의된 데이터베이스 연결 문자열입니다.
        /// </summary>
        private static readonly ILog logger = LogManager.GetLogger(typeof(CSQLHelper));

        public readonly string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        private static Hashtable parameterCache = Hashtable.Synchronized(new Hashtable());

        #region ExecuteReader
        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 SqlDataReader 타입의 쿼리 결과 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">실행할 쿼리 문자열입니다. 저장 프로시저는 허용하지 않습니다.</param>
        /// <returns>결과로 반환되는 SqlDataReader 객체입니다. 연결을 끊으면 SqlConnection 개체의 연결까지 끊어집니다.</returns>
        public SqlDataReader ExecuteReader(string sqlQuery)
        {
            SqlConnection myConnection = new SqlConnection(connString);
            SqlCommand myCommand = new SqlCommand();

            try
            {
                PrepareCommand(myConnection, myCommand, CommandType.Text, null, sqlQuery, null);
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                return myReader;
            }
            catch (Exception e)
            {
                myConnection.Close();
                throw new CDataAccessHelperException(e.ToString());
            }
        }

        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 SqlDataReader 타입의 쿼리 결과 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">실행할 쿼리 문자열 또는 저장 프로시저의 이름입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다. CommandType.StoredProcedure는 쿼리가 저장 프로시저임을 나타냅니다.</param>
        /// <returns>결과로 반환되는 SqlDatraReader 개체입니다. 연글을 끊으면 SqlConnection 개체의 연결까지 끊어집니다.</returns>
        public SqlDataReader ExecuteReader(string sqlQuery, CommandType commandType)
        {
            SqlConnection myConnection = new SqlConnection(connString);
            SqlCommand myCommand = new SqlCommand();

            try
            {
                PrepareCommand(myConnection, myCommand, commandType, null, sqlQuery, null);
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                return myReader;
            }
            catch (Exception e)
            {
                myConnection.Close();
                throw new CDataAccessHelperException(e.ToString());
            }
        }

        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 SqlDataReader 타입의 쿼리 결과 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">실행할 쿼리 문자열 또는 저장 프로시저의 이름입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다.</param>
        /// <param name="parameters">쿼리의 실행에 사용될 SqlParameter 개체입니다.</param>
        /// <returns>결과로 반환되는 SqlDataReader 개체입니다. 연결을 끊으면 SqlConnection 개체의 연결까지 끊어집니다.</returns>
        public SqlDataReader ExecuteReader(string sqlQuery, CommandType commandType, params IDataParameter[] parameters)
        {
            SqlConnection myConnection = new SqlConnection(connString);
            SqlCommand myCommand = new SqlCommand();

            try
            {
                PrepareCommand(myConnection, myCommand, commandType, null, sqlQuery, parameters);
                SqlDataReader myReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                return myReader;
            }
            catch (Exception e)
            {
                myConnection.Close();
                throw new CDataAccessHelperException(e.ToString());
            }
        }
        #endregion

        #region ExecuteScalar
        /// <summary>
        /// SqlServer 데이터베이스에 연결하여 쿼리를 실행하고 쿼리에서 반환된 결과 집합의 첫 번째 행의 첫 번째 열을 반환합니다. 추가 열이나 행은 무시됩니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <returns>결과 집합의 첫 번째 행의 첫 번째 열을 반환합니다.</returns>
        public object ExecuteScalar(string sqlQuery)
        {
            SqlCommand myCommand = new SqlCommand();
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand(myConnection, myCommand, CommandType.Text, null, sqlQuery, null);
                object result = myCommand.ExecuteScalar();
                return result;
            }
        }

        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 쿼리에서 반환된 결과 집합의 첫 번째 행의 첫 번째 열을 반환합니다. 추가 열이나 행은 무시됩니다
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열 또는 저장 프로시저의 이름입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다. CommandType.StoredProcedure는 쿼리가 저장 프로시저임을 나타냅니다.</param>
        /// <returns>결과 집합 중 첫 번째 행의 첫 번째 열을 반환합니다.</returns>
        public object ExecuteScalar(string sqlQuery, CommandType commandType)
        {
            SqlCommand myCommand = new SqlCommand();
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand(myConnection, myCommand, commandType, null, sqlQuery, null);
                object result = myCommand.ExecuteScalar();
                return result;
            }
        }
        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 쿼리에서 반환된 결과 집합의 첫 번째 행의 첫 번째 열을 반환합니다. 추가 열이나 행은 무시됩니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열 또는 저장 프로시저의 이름입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다. CommandType.StoredProcedure는 쿼리가 저장 프로시저임을 나타냅니다.</param>
        /// <param name="parameters">쿼리에 사용될 SqlParameter입니다.</param>
        /// <returns>결과 집합 중 첫 번째 행의 첫 번째 열을 반환합니다.</returns>
        public object ExecuteScalar(string sqlQuery, CommandType commandType, params IDataParameter[] parameters)
        {
            SqlCommand myCommand = new SqlCommand();
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand(myConnection, myCommand, commandType, null, sqlQuery, parameters);
                object result = myCommand.ExecuteScalar();
                myCommand.Parameters.Clear();

                return result;
            }
        }
        #endregion

        #region ExecuteNonQuery
        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 SQL 문을 실행하고 적용된 행 수를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <returns>영향받은 행의 수입니다.</returns>
        public int ExecuteNonQuery(string sqlQuery)
        {
            SqlCommand myCommand = new SqlCommand();

            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand(myConnection, myCommand, CommandType.Text, null, sqlQuery, null);
                int result = myCommand.ExecuteNonQuery();
                return result;
            }
        }
        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 적용된 행 수를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다. CommandType.StoredProcedure는 쿼리가 저장 프로시저임을 나타냅니다.</param>
        /// <returns>영향받은 행의 수입니다.</returns>
        public int ExecuteNonQuery(string sqlQuery, CommandType commandType)
        {
            SqlCommand myCommand = new SqlCommand();

            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand(myConnection, myCommand, commandType, null, sqlQuery, null);
                int result = myCommand.ExecuteNonQuery();
                return result;
            }
        }
        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 쿼리를 실행하고 적용된 행 수를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다. CommandType.StoredProcedure는 쿼리가 저장 프로시저임을 나타냅니다.</param>
        /// <param name="parameters">저장 프로시저 또는 쿼리에서 실행될 SQL 파라미터 입니다.</param>
        /// <returns>영향받은 행의 수 입니다.</returns>
        public int ExecuteNonQuery(string sqlQuery, CommandType commandType, params IDataParameter[] parameters)
        {
            SqlCommand myCommand = new SqlCommand();
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand(myConnection, myCommand, commandType, null, sqlQuery, parameters);
                int result = myCommand.ExecuteNonQuery();
                return result;
            }
        }


        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 SQL 문을 실행하고 적용된 행 수를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <param name="transaction">데이터소스에서 수행될 트랜잭션 입니다.</param>
        /// <returns>영향받은 행의 수입니다.</returns>
        public int ExecuteNonQuery(string sqlQuery, IDbTransaction transaction)
        {
            SqlCommand myCommand = new SqlCommand();

            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand((SqlConnection)transaction.Connection, myCommand, CommandType.Text, (SqlTransaction)transaction, sqlQuery, null);
                int result = myCommand.ExecuteNonQuery();
                return result;
            }
        }

        /// <summary>
        /// SQL Server 데이터베이스에 연결하여 SQL 문을 실행하고 적용된 행 수를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <param name="transaction">데이터소스에서 수행될 트랜잭션 입니다.</param>
        /// <param name="parameters">주로 Identity 값에 사용되는 SqlParameter 입니다.</param>
        /// <returns>영향받은 행의 수입니다.</returns>
        public int ExecuteNonQuery(string sqlQuery, IDbTransaction transaction, params IDataParameter[] parameters)
        {
            SqlCommand myCommand = new SqlCommand();

            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                PrepareCommand((SqlConnection)transaction.Connection, myCommand, CommandType.Text, (SqlTransaction)transaction, sqlQuery, parameters);
                int result = myCommand.ExecuteNonQuery();
                return result;
            }
        }

        #endregion

        #region ExecuteTable
        /// <summary>
        ///  SQL SERVER데이터베이스에 연결하여 SQL 문을 실행하고 결과로 DataTable 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <returns>쿼리 결과로 생성된 DataTable 객체입니다.</returns>
        public DataTable ExecuteTable(string sqlQuery)
        {
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                SqlDataAdapter myAdapter = new SqlDataAdapter(sqlQuery, myConnection);
                DataSet myDataSet = new DataSet();
                myAdapter.Fill(myDataSet, "Table");

                return myDataSet.Tables["Table"];
            }
        }
        #endregion

        #region ExecuteDataSet
        /// <summary>
        /// SQL SERVER데이터베이스에 연결하여 SQL문을 실행하고 결과로 DataSet 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <returns>Test라는 이름의 하나의 DataTable객체를 포함하는 쿼리 결과로 생성된 DataSet 객체입니다.</returns>
        public DataSet ExecuteDataSet(string sqlQuery)
        {
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                SqlDataAdapter myAdapter = new SqlDataAdapter(sqlQuery, myConnection);

                DataSet myDataSet = new DataSet();
                myAdapter.Fill(myDataSet, "Table");

                return myDataSet;
            }
        }



        /// <summary>
        /// SQL SERVER데이터베이스에 연결하여 SQL문을 실행하고 결과로 DataSet 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열</param>
        /// <param name="variable">데이터베이스에서 사용될 변수 문자열</param>
        /// <param name="value">데이터베이스에서 사용될 값 문자열</param>
        /// <param name="type">데이터베이스에서 사용될 변수 타입 문자열</param>
        /// <param name="variableLength">파라미터 갯수</param>
        /// <returns></returns>
        public DataSet ExecuteDataSetSecure(string sqlQuery, string[] variable, string[] value, SqlDbType[] type, int variableLength)
        {
            DataSet myDataSet = new DataSet();

            // SQL 프린트
            PrintSQL(sqlQuery, variable, value, type, variableLength);

            try
            {
                using (SqlConnection myConnection = new SqlConnection(connString))
                {
                    SqlDataAdapter myAdapter = new SqlDataAdapter(sqlQuery, myConnection);
                    myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    for (int i = 0; i < variableLength; i++)
                    {
                        myAdapter.SelectCommand.Parameters.Add(variable[i], type[i]);
                        myAdapter.SelectCommand.Parameters[variable[i]].Value = value[i];
                    }

                    myAdapter.Fill(myDataSet, "Table");
					myConnection.Close();
                }
            }
            catch (Exception e)
            {
				string error = string.Format("CSQLHelper.ExecuteDataSetSecure: exception={0}", "["+sqlQuery+ "]"+e.Message);
                CLog.debug(logger, error);
            }

            return myDataSet;
        }

        public DataSet ExecuteDataSetSecureNonQuery(string sqlQuery, string[] variable, string[] value, SqlDbType[] type, int variableLength)
        {
            DataSet myDataSet = new DataSet();
            //SqlCommand myCommand = new SqlCommand();
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                SqlCommand myCommand = new SqlCommand();

                if (myConnection.State != ConnectionState.Open)
                    myConnection.Open();
                myCommand.Connection = myConnection;
                myCommand.CommandText = sqlQuery;
                myCommand.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i < variableLength; i++)
                {
                    myCommand.Parameters.Add(variable[i], type[i]);
                    myCommand.Parameters[variable[i]].Value = value[i];
                }

                myCommand.ExecuteNonQuery();
                myConnection.Close();

            }
            return myDataSet;
        }

        /// <summary>
        /// SQL SERVER데이터베이스에 연결하여 SQL문을 실행하고 결과로 DataSet 객체를 반환합니다.
        /// </summary>
        /// <param name="sqlQuery">데이터베이스에서 사용될 쿼리 문자열입니다.</param>
        /// <param name="commandType">Select Command의 타입입니다.</param>
        /// <param name="parameters">연결에 사용될 SqlParameter 입니다.</param>
        /// <returns>Test라는 이름의 하나의 DataTable객체를 포함하는 쿼리 결과로 생성된 DataSet 객체입니다.</returns>
        public DataSet ExecuteDataSet(string sqlQuery, CommandType commandType, params IDataParameter[] parameters)
        {
            using (SqlConnection myConnection = new SqlConnection(connString))
            {
                SqlDataAdapter myAdapter = new SqlDataAdapter(sqlQuery, myConnection);
                foreach (SqlParameter parameter in parameters)
                {
                    myAdapter.SelectCommand.Parameters.Add(parameter);
                }
                DataSet myDataSet = new DataSet();
                myAdapter.Fill(myDataSet, "Table");

                return myDataSet;
            }
        }
        #endregion

        #region PrepareCommand
        /// <summary>
        /// 명령을 준비합니다.
        /// </summary>
        /// <param name="myConnection">SQL Server 데이터베이스와의 연결에 사용될 SqlConnection 개체입니다.</param>
        /// <param name="myCommand">명령을 실행할 SqlCommand 클래스입니다.</param>
        /// <param name="commandType">CommandType 열거형입니다.</param>
        /// <param name="myTransaction">데이터소스에서 수행될 SqlTransaction 개체입니다.</param>
        /// <param name="sqlQuery">수행될 쿼리 문자열입니다.</param>
        /// <param name="parameters">쿼리에 사용될 SqlParameter입니다.</param>
        private void PrepareCommand(SqlConnection myConnection, SqlCommand myCommand, CommandType commandType, SqlTransaction myTransaction, string sqlQuery, params IDataParameter[] parameters)
        {
            if (myConnection.State != ConnectionState.Open)
                myConnection.Open();

            myCommand.Connection = myConnection;
            myCommand.CommandText = sqlQuery;
            myCommand.CommandType = commandType;

            if (myTransaction != null)
                myCommand.Transaction = myTransaction;
            if (parameters != null)
                foreach (SqlParameter p in parameters)
                    myCommand.Parameters.Add(p);
        }
        #endregion

        #region ParameterCache
        /// <summary>
        /// 파라미터를 캐시합니다.
        /// </summary>
        /// <param name="cacheKey">캐시할 파라미터의 키입니다.</param>
        /// <param name="parameters">캐시할 파라미터입니다.</param>
        public void CacheParameters(string cacheKey, params IDataParameter[] parameters)
        {
            parameterCache[cacheKey] = parameters;
        }
        /// <summary>
        /// 캐시된 파라미터를 되찾습니다.
        /// </summary>
        /// <param name="cacheKey">찾을 파라미터의 키 입니다.</param>
        /// <returns>캐시된 SqlParameter의 배열입니다.</returns>
        public SqlParameter[] GetCachedParameters(string cacheKey)
        {
            SqlParameter[] cachedParameters = (SqlParameter[])parameterCache[cacheKey];

            if (cachedParameters == null)
                return null;

            SqlParameter[] cloneParameters = new SqlParameter[cachedParameters.Length];

            for (int i = 0, j = cloneParameters.Length; i < j; i++)
                cloneParameters[i] = (SqlParameter)((ICloneable)cachedParameters[i]).Clone();

            return cloneParameters;
        }
        #endregion


        #region SQL 유틸


        /// <summary>
        /// SQL 구문을 프린트한다.
        /// </summary>
        /// <param name="sqlQuery"></param>
        /// <param name="variable"></param>
        /// <param name="value"></param>
        /// <param name="type"></param>
        /// <param name="variableLength"></param>
        public void PrintSQL(string sqlQuery, string[] variable, string[] value, SqlDbType[] type, int variableLength)
        {
            StringBuilder sql = new StringBuilder();
            sql.Append(sqlQuery).Append(" ");

            for (int i = 0; i < variableLength; i++)
            {
                sql.Append("'").Append(value[i]).Append("',");
            }

            sql.Length = sql.Length - 1;

            System.Diagnostics.Debug.WriteLine(sql.ToString());
        }

        #endregion
    }
}
