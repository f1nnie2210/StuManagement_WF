using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StuManagement_WF
{
    public class Database
    {
        private string connectionString = @"Data Source=F1NNIE\HOANGLONG; Initial Catalog=QLSV; Integrated Security=True";
        private SqlConnection conn;
        private DataTable dt;
        private SqlCommand cmd;
        
        public Database()
        {
            try
            {
                conn = new SqlConnection(connectionString);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Connection failed: " + ex.Message);
            }
        }

        public DataTable SelectData(string sql, List<CustomParameter> lstParameter)
        {
            try
            {
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load data: " + ex.Message);
                return null;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
