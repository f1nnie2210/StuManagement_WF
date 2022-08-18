using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StuManagement_WF
{
    public partial class frmSinhVien : Form
    {
        public frmSinhVien(string msv)
        {
            this.msv = msv; //truyền lại msv khi form chạy
            InitializeComponent();
        }
        private string msv;
        private void frmSinhVien_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(msv)) //nếu không có msv => thêm mới sv
            {
                this.Text = "Thêm mới sinh viên";
            }
            else
            {
                this.Text = "Cập nhật thông tin sinh viên";
                //Get info 1 sv dựa vào msv
                //msv được truyền từ form dssv
                var r = new Database().Select("selectSV '"+msv+"'");
                //MessageBox.Show(r[0].ToString());//load thành công
                //set các giá trị vào component của form

                txtHo.Text = r["ho"].ToString();
                txtTendem.Text = r["tendem"].ToString();
                txtTen.Text = r["ten"].ToString();
                mtbNgaysinh.Text = r["ngaysinh"].ToString();
                if (int.Parse(r["gioitinh"].ToString()) == 1)
                {
                    rbtNam.Checked = true;
                }
                else
                {
                    rbtNu.Checked = true;
                }

                txtQuequan.Text = r["quequan"].ToString();
                txtDiachi.Text = r["diachi"].ToString();
                txtDienthoai.Text = r["dienthoai"].ToString();
                txtEmail.Text = r["email"].ToString();

            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql = "";
            string ho = txtHo.Text;
            string tendem = txtTendem.Text;
            string ten = txtTen.Text;

            //masketbox: dd/mm/yyyy
            //database: yyyy-mm-dd
            //=> Chuyển định dạng dd/mm/yyyy sang yyyy-mm-dd
            DateTime ngaysinh;
            try
            {
                ngaysinh = DateTime.ParseExact(mtbNgaysinh.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            catch
            {

                MessageBox.Show("Input is invalid");
                mtbNgaysinh.Select();//trỏ chuột về mtbNgaysinh
                return; //không thực hiện hàm phía dưới
            }

            string gioitinh = rbtNam.Checked ? "1" : "0";//rbtNam checked thì chọn giá trị 1, ngược lại

            string quequan = txtQuequan.Text;
            string diachi = txtDiachi.Text;
            string dienthoai = txtDienthoai.Text;
            string email = txtEmail.Text;

            //msv = null => add sv
            //msv = "..." => update
            //khai báo ds tham số = class CustomParameter
            List<CustomParameter> lstPara = new List<CustomParameter>();
            if (string.IsNullOrEmpty(msv))//add sv
            { 
                sql = "ThemMoiSV";//gọi procedure add new sv

            }
            else//update sv
            {
                sql = "updateSV";//gọi procedure update sv
                lstPara.Add(new CustomParameter()
                {
                    key = "@masinhvien",
                    value = msv
                });
            }

            lstPara.Add(new CustomParameter()
            {
                key = "@ho",
                value = ho
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@tendem",
                value = tendem
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@ten",
                value = ten
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@ngaysinh",
                value = ngaysinh.ToString("yyyy-MM-dd")
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@gioitinh",
                value = gioitinh
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@quequan",
                value = quequan
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@diachi",
                value = diachi
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@dienthoai",
                value = dienthoai
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@email",
                value = email
            });

            var rs = new Database().ExeCute(sql, lstPara);//truyền câu lệnh sql và ds các tham số
            if(rs == 1)//nếu thành công
            {
                if(string.IsNullOrEmpty(msv))//thêm mới
                {
                    MessageBox.Show("Succesfully added student");
                }    
                else//cập nhật
                {
                    MessageBox.Show("Successfully updated student");
                }
                this.Dispose();//đóng form sau khi thực hiện
            }
            else//nếu failed
            {
                MessageBox.Show("Failed to execute");
            }
        }
    }
}
