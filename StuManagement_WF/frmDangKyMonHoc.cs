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
    public partial class frmDangKyMonHoc : Form
    {
        public frmDangKyMonHoc(string msv)
        {
            this.msv = msv;
            InitializeComponent();
        }

        private string msv;

        private void frmDangKyMonHoc_Load(object sender, EventArgs e)
        {
            loadDSLH();
            //custom lại tên cột
            dgvDSLH.Columns["malophoc"].HeaderText = "Mã lớp";
            dgvDSLH.Columns["tenmonhoc"].HeaderText = "Tên học phần";
            dgvDSLH.Columns["sotinchi"].HeaderText = "Số tín chỉ";
            dgvDSLH.Columns["gvien"].HeaderText = "Giảng viên";

            dgvDSLH.Columns["mamonhoc"].Visible = false;
        }

        private void loadDSLH()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@masinhvien",
                value = msv
            });
            dgvDSLH.DataSource = new Database().SelectData("dsLopChuaDky", lstPara);
        }

        private void dgbDSLH_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //Double click vào 1 dòng sẽ hiện hộp thoại xác nhận đky môn học
            if (dgvDSLH.Rows[e.RowIndex].Index >= 0)
            {
                if(DialogResult.Yes ==
                    MessageBox.Show(
                                    "Do you want to register for the course [" + dgvDSLH.Rows[e.RowIndex].Cells["tenmonhoc"].Value.ToString() + "]?",
                                    "Confirm",
                                    MessageBoxButtons.YesNo,
                                    MessageBoxIcon.Question))
                {
                    List<CustomParameter> lstPara = new List<CustomParameter>();
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@masinhvien",
                        value = msv
                    });

                    lstPara.Add(new CustomParameter()
                    {
                        key = "@malophoc",
                        value = dgvDSLH.Rows[e.RowIndex].Cells["malophoc"].Value.ToString()
                    });

                    var rs = new Database().ExeCute("[dkyHoc]", lstPara);
                    if (rs == -1)
                    {
                        MessageBox.Show("This course is already registered");
                        return;
                    }

                    if (rs == 1)
                    {
                        MessageBox.Show("Registered successfully");
                        loadDSLH();
                    }
                }
            }
        }
    }
}
