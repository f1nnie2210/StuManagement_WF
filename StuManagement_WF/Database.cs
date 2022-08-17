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

        public DataTable SelectData(string sql)
        {
            try
            {
                conn.Open();//mở kết nối
                cmd = new SqlCommand(sql, conn);//truyền giá trị vào cmd
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());//thực thi câu lệnh
                return dt;//trả về kết quả
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load data: " + ex.Message);
                return null;
            }
            finally
            {
                conn.Close();//đóng kết nối
            }
        }

        public DataRow Select(string sql)
        {
            try
            {
                conn.Open();//mở kết nối
                cmd = new SqlCommand(sql, conn);//truyền giá trị vào cmd
                dt = new DataTable();
                dt.Load(cmd.ExecuteReader());//thực thi câu lệnh
                return dt.Rows[0];//trả về kết quả
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load infomation: " + ex.Message);
                return null;
            }
            finally
            {
                conn.Close();//đóng kết nối
            }
        }

        public int ExeCute(string sql)
        {
            try
            {
                conn.Open();//mở kết nối
                cmd = new SqlCommand(sql, conn);//thực thi câu lệnh sql
                return (int)cmd.ExecuteScalar();//trả về kết quả
            }
            catch (Exception ex)
            {

                MessageBox.Show("Failed to execute command: " + ex.Message);
                return -100;
            }
            finally
            {
                conn.Close();//đóng kết nối
            }
        }
    }
}
