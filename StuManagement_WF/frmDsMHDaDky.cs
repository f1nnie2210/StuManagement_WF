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
    public partial class frmDsMHDaDky : Form
    {

        private string masv;
        public frmDsMHDaDky(string masv)
        {
            this.masv = masv;
            InitializeComponent();
        }

        private void frmDsMHDaDky_Load(object sender, EventArgs e)
        {
            loadMonDky();
            dgvDSMHDky.Columns["malophoc"].HeaderText = "Mã lớp";
            dgvDSMHDky.Columns["tenmonhoc"].HeaderText = "Tên học phần";
            dgvDSMHDky.Columns["gvien"].HeaderText = "Giảng viên";
            dgvDSMHDky.Columns["sotinchi"].HeaderText = "Số tín chỉ";
            dgvDSMHDky.Columns["diemlan1"].HeaderText = "Điểm lần 1";
            dgvDSMHDky.Columns["diemlan2"].HeaderText = "Điểm lần 2";

        }

        private void loadMonDky()
        {
            List<CustomParameter> lst = new List<CustomParameter>()
            {
                new CustomParameter()
                {
                    key = "@masinhvien",
                    value = masv
                }
            };
            dgvDSMHDky.DataSource = new Database().SelectData("monDaDky", lst);
        }

        private void btnDkyMoi_Click(object sender, EventArgs e)
        {
            new frmDangKyMonHoc(masv).ShowDialog();
            loadMonDky();
        }
    }
}
