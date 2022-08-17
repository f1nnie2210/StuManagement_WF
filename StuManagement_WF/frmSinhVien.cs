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
            }
        }
    }
}
