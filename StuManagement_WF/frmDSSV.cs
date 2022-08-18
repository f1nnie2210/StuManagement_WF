using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StuManagement_WF
{
    public partial class frmDSSV : Form
    {
        public frmDSSV()
        {
            InitializeComponent();
        }

        private string tukhoa = "";
        private void frmDSSV_Load(object sender, EventArgs e)
        {
            LoadDSSV();//gọi hàm LoadDSSV() khi form load
        }

        private void LoadDSSV()
        {
            //load all sinh viên khi form load

            //khai báo list customparameter
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = tukhoa
            });

            dgvSinhVien.DataSource = new Database().SelectData("SelectAllSinhVien", lstPara);

            //đặt tên cột
            dgvSinhVien.Columns["masinhvien"].HeaderText = "Mã SV";
            dgvSinhVien.Columns["hoten"].HeaderText = "Họ tên";
            dgvSinhVien.Columns["namsinh"].HeaderText = "Năm sinh";
            dgvSinhVien.Columns["gt"].HeaderText = "Giới tính";
            dgvSinhVien.Columns["quequan"].HeaderText = "Quê quán";
            dgvSinhVien.Columns["diachi"].HeaderText = "Địa chỉ";
            dgvSinhVien.Columns["dienthoai"].HeaderText = "Điện thoại";
            dgvSinhVien.Columns["email"].HeaderText = "Email";
        }

        private void dgvSinhVien_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //Double click vào Cell trên Datagridview để hiện form update sinh viên
            //Lấy mã sinh viên để cập nhật
            if(e.RowIndex>=0)
            {
                var msv = dgvSinhVien.Rows[e.RowIndex].Cells["masinhvien"].Value.ToString();
                //truyền mã sv vào form sinh viên
                new frmSinhVien(msv).ShowDialog();

                //Load lại DSSV khi frmSinhVien được đóng
                LoadDSSV();
            }
        }

        private void btnThemmoi_Click(object sender, EventArgs e)
        {
            new frmSinhVien(null).ShowDialog(); //thêm mới => msv = null
            LoadDSSV();//load lại DSSV khi thêm thành công - form sv được đóng
        }

        private void btnTimkiem_Click(object sender, EventArgs e)
        {
            tukhoa = txtTukhoa.Text;
            LoadDSSV();
        }
    }
}
