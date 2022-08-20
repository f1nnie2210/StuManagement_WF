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
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }

        public string tendangnhap = "";
        public string loaitk;

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            #region check ràng buộc
            //check ràng buộc
            if (cbbLoaiTaiKhoan.SelectedIndex < 0)
            {
                MessageBox.Show("Please choose account type");
                return;
            }

            if (string.IsNullOrEmpty(txtTenDangNhap.Text))
            {
                MessageBox.Show("Please enter your account");
                txtTenDangNhap.Select();
                return;
            }

            if (string.IsNullOrEmpty(txtMatKhau.Text))
            {
                MessageBox.Show("Please enter your password");
                return;
            }
            #endregion

            tendangnhap = txtTenDangNhap.Text;
            loaitk = "";

            #region swtk
            switch (cbbLoaiTaiKhoan.Text)
            {
                case "Quản trị viên":
                    loaitk = "admin";
                    break;
                case "Giáo viên":
                    loaitk = "gv";
                    break;
                case "Sinh viên":
                    loaitk = "sv";
                    break;
            }
            #endregion

            List<CustomParameter> lst = new List<CustomParameter>()
            {
                new CustomParameter()
                {
                    key = "@loaitaikhoan",
                    value = loaitk
                },
                new CustomParameter()
                {
                    key = "@taikhoan",
                    value = txtTenDangNhap.Text
                },
                new CustomParameter()
                {
                    key = "@matkhau",
                    value = txtMatKhau.Text
                },
            };

            var rs = new Database().SelectData("dangnhap", lst);
            if (rs.Rows.Count > 0)
            {
                MessageBox.Show("Logged in successfully");
                this.Hide();
            }
            else
            {
                MessageBox.Show("Login Failed: Your user ID or password is incorrect");
            }
        }
    }
}
