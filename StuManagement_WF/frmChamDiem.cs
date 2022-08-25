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
    public partial class frmChamDiem : Form
    {
        public frmChamDiem(string malophoc, string magv)
        {
            this.malophoc = malophoc;// lưu malophoc được truyền qua
            this.magv = magv;
            InitializeComponent();
        }

        private string malophoc;// khai báo biến để lưu malophoc được truyền vào
        private string magv;

        private void LoadDSSV()
        {
            List<CustomParameter> lstPara = new List<CustomParameter>();
            lstPara.Add(new CustomParameter()
            {
                key = "@malophoc",
                value = malophoc
            });
            lstPara.Add(new CustomParameter()
            {
                key = "@tukhoa",
                value = txtTuKhoa.Text
            });

            dgvChamDiem.DataSource = new Database().SelectData("dssv", lstPara);
        }

        private void frmChamDiem_Load(object sender, EventArgs e)
        {
            //cho gọi hàm load dssv ngay khi form đc load
            LoadDSSV();
            //đặt lại tên cột
            dgvChamDiem.Columns["masinhvien"].HeaderText = "MSV"; //column index = 0 -- chỉ số cột
            dgvChamDiem.Columns["hoten"].HeaderText = "Họ và tên";//column index = 1
            dgvChamDiem.Columns["lanhoc"].HeaderText = "Lần học";//columnindex = 2
            dgvChamDiem.Columns["diemlan1"].HeaderText = "Điểm lần 1";//column index = 3
            dgvChamDiem.Columns["diemlan2"].HeaderText = "Điểm lần 2";//column index = 4

            ////set thuộc tính cho phép chỉnh sửa cho 2 cột điểm lần 1 và lần 2
            for (int i = 0; i <= 2; i++)// không cho sửa 3 cột phía trước
            {
                dgvChamDiem.Columns[i].ReadOnly = true;// 
            }
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            LoadDSSV();//cho gọi lại hàm này khi button tra cứu được click
        }

        private void btnLuuBangDiem_Click(object sender, EventArgs e)
        {
            //khi click vào button này thì các điểm được chấm trên datagridview dgvDSSV sẽ được cập nhật vào csdl (bảng tblDiem)
            if (DialogResult.Yes ==
                    MessageBox.Show(
                            "Do you want to save?",
                            "Confirm",
                            MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question
                        )
               )
            {
                //storedprocedure chamdiem chỉ chấm cho 1 sinh viên
                //nhưng trên datagridview có nhiều sinh viên
                //để có thể lưu hết bảng điểm
                //cần duyệt hết các dòng dữ liệu trên datagridview <=> dùng vòng lặp
                var db = new Database();
                List<CustomParameter> lstPara;

                //bắt đầu duyệt
                int chk = 1;
                foreach (DataGridViewRow r in dgvChamDiem.Rows)
                {
                    lstPara = new List<CustomParameter>();


                    lstPara = new List<CustomParameter>();
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@magiaovien",
                        value = magv
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@malop",
                        value = malophoc
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@masinhvien",
                        value = r.Cells["masinhvien"].Value.ToString()
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@diemlan1",
                        value = r.Cells["diemlan1"].Value.ToString()
                    });
                    lstPara.Add(new CustomParameter()
                    {
                        key = "@diemlan2",
                        value = r.Cells["diemlan2"].Value.ToString()
                    });
                    //thực thi truy vấn
                    chk = db.ExeCute("chamdiem", lstPara);
                    if (chk != 1)//nếu chấm điểm thất bại
                    {
                        MessageBox.Show("Failed");
                        break;//thoát khỏi vòng lặp luôn mà không chạy các lần còn lại
                    }
                }//kết thúc duyệt

                if (chk == 1)
                {
                    MessageBox.Show("Saved successfully");
                }
            }
        }

        private void btnKetThucLopHoc_Click(object sender, EventArgs e)
        {
            //khi click vào button này sẽ kết thúc lớp học phần này (sau khi chấm điểm xong)
            //kết thúc lớp học phần <=> trạng thái daketthuc của tblLopHoc sẽ chuyển từ 0 -> 1
            if (
                DialogResult.Yes ==
                MessageBox.Show(
                                    "Do you really want to close this section? ",
                                    "Confirm",
                                    MessageBoxButtons.YesNo,
                                    MessageBoxIcon.Question
                                 )
                )
            {
                var lstPara = new List<CustomParameter>()
                {
                    new CustomParameter()
                    {
                        key = "@magiaovien",
                        value= magv,
                    },
                    new CustomParameter()
                    {
                        key = "@malop",
                        value= malophoc,
                    }
                };

                var rs = new Database().ExeCute("ketthuchocphan", lstPara);
                if (rs == 1)
                {
                    MessageBox.Show("Successful ending");
                    this.Dispose();//đóng form 
                }
            }
        }
    }
}
