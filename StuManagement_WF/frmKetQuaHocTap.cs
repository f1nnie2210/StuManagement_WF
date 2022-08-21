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
    public partial class frmKetQuaHocTap : Form
    {
        public frmKetQuaHocTap(string msv)//truyền msv
        {
            this.msv = msv;//gán lại msv được truyền qua
            InitializeComponent();
        }

        private string msv;

        private void frmKetQuaHocTap_Load(object sender, EventArgs e)
        {
            loadKQHT();

            //customize header dgvKQHT
            dgvKQHT.Columns["mamonhoc"].HeaderText = "Mã học phần";
            dgvKQHT.Columns["tenmonhoc"].HeaderText = "Tên học phần";
            dgvKQHT.Columns["lanhoc"].HeaderText = "Lần học";
            dgvKQHT.Columns["gvien"].HeaderText = "Giảng viên";
            dgvKQHT.Columns["diemlan1"].HeaderText = "Điểm thi lần 1";
            dgvKQHT.Columns["diemlan2"].HeaderText = "Điểm thi lần 2";
        }

        private void loadKQHT()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@masinhvien",
                value = msv//msv đã được truyền vào form ở trên
            });

            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text//msv đã được truyền vào form ở trên
            });
            dgvKQHT.DataSource = new Database().SelectData("tracuudiem", lstPara);
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            loadKQHT();
        }
    }
}
