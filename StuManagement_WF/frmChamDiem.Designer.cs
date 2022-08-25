namespace StuManagement_WF
{
    partial class frmChamDiem
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvChamDiem = new System.Windows.Forms.DataGridView();
            this.btnTraCuu = new System.Windows.Forms.Button();
            this.txtTuKhoa = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnLuuBangDiem = new System.Windows.Forms.Button();
            this.btnKetThucLopHoc = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvChamDiem)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvChamDiem
            // 
            this.dgvChamDiem.AllowUserToAddRows = false;
            this.dgvChamDiem.AllowUserToDeleteRows = false;
            this.dgvChamDiem.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvChamDiem.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvChamDiem.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvChamDiem.Location = new System.Drawing.Point(0, 78);
            this.dgvChamDiem.MultiSelect = false;
            this.dgvChamDiem.Name = "dgvChamDiem";
            this.dgvChamDiem.RowHeadersWidth = 51;
            this.dgvChamDiem.RowTemplate.Height = 24;
            this.dgvChamDiem.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvChamDiem.Size = new System.Drawing.Size(1165, 424);
            this.dgvChamDiem.TabIndex = 18;
            // 
            // btnTraCuu
            // 
            this.btnTraCuu.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnTraCuu.Location = new System.Drawing.Point(1015, 32);
            this.btnTraCuu.Name = "btnTraCuu";
            this.btnTraCuu.Size = new System.Drawing.Size(124, 28);
            this.btnTraCuu.TabIndex = 16;
            this.btnTraCuu.Text = "Tra cứu";
            this.btnTraCuu.UseVisualStyleBackColor = true;
            this.btnTraCuu.Click += new System.EventHandler(this.btnTraCuu_Click);
            // 
            // txtTuKhoa
            // 
            this.txtTuKhoa.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTuKhoa.Location = new System.Drawing.Point(740, 35);
            this.txtTuKhoa.Name = "txtTuKhoa";
            this.txtTuKhoa.Size = new System.Drawing.Size(269, 22);
            this.txtTuKhoa.TabIndex = 15;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(678, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(56, 16);
            this.label1.TabIndex = 14;
            this.label1.Text = "Từ khoá";
            // 
            // btnLuuBangDiem
            // 
            this.btnLuuBangDiem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnLuuBangDiem.Location = new System.Drawing.Point(839, 517);
            this.btnLuuBangDiem.Name = "btnLuuBangDiem";
            this.btnLuuBangDiem.Size = new System.Drawing.Size(147, 28);
            this.btnLuuBangDiem.TabIndex = 19;
            this.btnLuuBangDiem.Text = "Lưu bảng điểm";
            this.btnLuuBangDiem.UseVisualStyleBackColor = true;
            this.btnLuuBangDiem.Click += new System.EventHandler(this.btnLuuBangDiem_Click);
            // 
            // btnKetThucLopHoc
            // 
            this.btnKetThucLopHoc.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnKetThucLopHoc.Location = new System.Drawing.Point(992, 517);
            this.btnKetThucLopHoc.Name = "btnKetThucLopHoc";
            this.btnKetThucLopHoc.Size = new System.Drawing.Size(147, 28);
            this.btnKetThucLopHoc.TabIndex = 20;
            this.btnKetThucLopHoc.Text = "Kết thúc lớp học";
            this.btnKetThucLopHoc.UseVisualStyleBackColor = true;
            this.btnKetThucLopHoc.Click += new System.EventHandler(this.btnKetThucLopHoc_Click);
            // 
            // frmChamDiem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1165, 557);
            this.Controls.Add(this.btnKetThucLopHoc);
            this.Controls.Add(this.btnLuuBangDiem);
            this.Controls.Add(this.dgvChamDiem);
            this.Controls.Add(this.btnTraCuu);
            this.Controls.Add(this.txtTuKhoa);
            this.Controls.Add(this.label1);
            this.Name = "frmChamDiem";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Chấm điểm";
            this.Load += new System.EventHandler(this.frmChamDiem_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvChamDiem)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvChamDiem;
        private System.Windows.Forms.Button btnTraCuu;
        private System.Windows.Forms.TextBox txtTuKhoa;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnLuuBangDiem;
        private System.Windows.Forms.Button btnKetThucLopHoc;
    }
}