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
    public partial class frmQuanLyLop : Form
    {
        public frmQuanLyLop(string mgv)//khai báo tham số để truyền mgv (tk đăng nhập) giữa frmMain và frmQuanLyLop
        {
            this.mgv = mgv;
            InitializeComponent();
        }

        private string mgv;//khai báo biến để lưu tham số mgv được truyền vào
        private void LoadDSLop()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@magiaovien",
                value = mgv
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text
            });
            dgvDSLop.DataSource = new Database().SelectData("tracuulop", lstPara);
        }

        private void frmQuanLyLop_Load(object sender, EventArgs e)
        {
            LoadDSLop();//cho load danh sách lớp ngay khi form được mở
            //đặt lại tiêu đề cột cho datagridview dgvDSLop
            dgvDSLop.Columns["malophoc"].HeaderText = "Mã lớp";
            dgvDSLop.Columns["mamonhoc"].HeaderText = "Mã học phần";
            dgvDSLop.Columns["tenmonhoc"].HeaderText = "Tên học phần";
            dgvDSLop.Columns["sotinchi"].HeaderText = "Số TC";
            dgvDSLop.Columns["siso"].HeaderText = "Sĩ số";
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            LoadDSLop();//gọi lại hàm  LoadDSLop(); khi btn tra cứu được click
        }
    }
}
