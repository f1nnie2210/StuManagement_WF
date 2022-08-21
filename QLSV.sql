USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 21/08/2022 23:20:19 ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HOANGLONG\MSSQL\DATA\QLSV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HOANGLONG\MSSQL\DATA\QLSV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLSV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSV', N'ON'
GO
ALTER DATABASE [QLSV] SET QUERY_STORE = OFF
GO
USE [QLSV]
GO
USE [QLSV]
GO
/****** Object:  Sequence [dbo].[sinhvienSeq]    Script Date: 21/08/2022 23:20:19 ******/
CREATE SEQUENCE [dbo].[sinhvienSeq] 
 AS [bigint]
 START WITH 1100
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[tentaikhoan] [varchar](50) NOT NULL,
	[matkhau] [varchar](250) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiem]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiem](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[masinhvien] [varchar](50) NOT NULL,
	[malophoc] [bigint] NOT NULL,
	[lanhoc] [int] NULL,
	[diemlan1] [float] NULL,
	[diemlan2] [float] NULL,
 CONSTRAINT [PK_tblDiem] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC,
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGiaoVien]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiaoVien](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[magiaovien] [int] IDENTITY(1,1) NOT NULL,
	[matkhau] [varchar](50) NULL,
	[ho] [nvarchar](10) NOT NULL,
	[tendem] [nvarchar](20) NULL,
	[ten] [nvarchar](10) NOT NULL,
	[gioitinh] [tinyint] NULL,
	[ngaysinh] [date] NULL,
	[dienthoai] [varchar](30) NULL,
	[email] [varchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblGiaoVien] PRIMARY KEY CLUSTERED 
(
	[magiaovien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[malophoc] [bigint] IDENTITY(1,1) NOT NULL,
	[mamonhoc] [int] NOT NULL,
	[magiaovien] [int] NOT NULL,
	[daketthuc] [tinyint] NULL,
 CONSTRAINT [PK_tblLopHoc] PRIMARY KEY CLUSTERED 
(
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonHoc](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[mamonhoc] [int] IDENTITY(1,1) NOT NULL,
	[tenmonhoc] [nvarchar](150) NOT NULL,
	[sotinchi] [int] NULL,
 CONSTRAINT [PK_tblMonHoc] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[masinhvien] [varchar](50) NOT NULL,
	[ho] [nvarchar](10) NOT NULL,
	[tendem] [nvarchar](20) NULL,
	[ten] [nvarchar](10) NOT NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [tinyint] NULL,
	[quequan] [nvarchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
	[dienthoai] [varchar](30) NULL,
	[email] [varchar](150) NULL,
	[matkhau] [varchar](50) NULL,
 CONSTRAINT [PK_tblSinhVien] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_ngaytao_1]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_nguoitao_1]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_ngaycapnhat_1]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_nguoicapnhat_1]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_lanhoc]  DEFAULT ((1)) FOR [lanhoc]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_diemlan1]  DEFAULT ((0)) FOR [diemlan1]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_diemlan2]  DEFAULT ((0)) FOR [diemlan2]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_matkhau]  DEFAULT ((123)) FOR [matkhau]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblDiem_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblDiem_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblDiem_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblDiem_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_daketthuc_1]  DEFAULT ((0)) FOR [daketthuc]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF__tblSinhVi__matkh__70DDC3D8]  DEFAULT ((111)) FOR [matkhau]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblLopHoc] FOREIGN KEY([malophoc])
REFERENCES [dbo].[tblLopHoc] ([malophoc])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblLopHoc]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblSinhVien] FOREIGN KEY([masinhvien])
REFERENCES [dbo].[tblSinhVien] ([masinhvien])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblSinhVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblGiaoVien] FOREIGN KEY([magiaovien])
REFERENCES [dbo].[tblGiaoVien] ([magiaovien])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblDiem_tblGiaoVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblMonHoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[tblMonHoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblDiem_tblMonHoc]
GO
/****** Object:  StoredProcedure [dbo].[allLopHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[allLopHoc]
	@tukhoa nvarchar(50)
as
begin
	select
		l.malophoc,
		case when len(trim(g.tendem)) > 0 then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat (g.ho,' ',g.ten) end as giaovien,
		m.tenmonhoc
	from tblLopHoc l
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	where lower(m.tenmonhoc) like '%'+lower(@tukhoa)+'%'
	or lower(g.ten) like '%'+lower(@tukhoa)+'%'
	or lower(g.tendem) like '%'+lower(@tukhoa)+'%'
	or lower(g.ho) like '%'+lower(@tukhoa)+'%'
	or lower(concat(g.ho,' ',g.tendem,' ',g.ten)) like '%'+lower(@tukhoa)+'%';
end
GO
/****** Object:  StoredProcedure [dbo].[dangnhap]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[dangnhap]
	@loaitaikhoan varchar(10),
	@taikhoan varchar(50),
	@matkhau varchar(50)
as
begin
	if @loaitaikhoan = 'admin' 
				select * 
				from TaiKhoan 
				where tentaikhoan = @taikhoan
				and matkhau = @matkhau;
		else if @loaitaikhoan =  'gv' 
				select *
				from tblGiaoVien
				where CONVERT(varchar(50),magiaovien) = @taikhoan
				and matkhau = @matkhau;
		else 
			select *
			from tblSinhVien
			where masinhvien = @taikhoan
			and matkhau = @matkhau;
end
GO
/****** Object:  StoredProcedure [dbo].[dkyhoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--tạo hàm dky môn học
--dữ liệu trong tblLopHoc được tạo bởi admin
--khi sv đky môn học -> insert data vào tblDiem với 2 khoá ngoại: msv và mã lớp học --> điểm 1, 2 mặc định là 0
--lần học tự động được tính: chưa đky môn lần nào thì mặc định là 1
--nếu sv đky môn có trạng thái daketthuc là 0 thì không được đky nữa, ngược lại

create proc [dbo].[dkyhoc]
	@masinhvien varchar(50),
	@malophoc bigint
as
begin
	--vì tblDiem chỉ có cột mã lớp học (khoá ngoại) liết kết tới tblLopHoc -> không có thông tin môn học
	-->từ mã lớp cần tìm ra được mã môn học (nằm trong tblMonHoc) dựa vào inner join -> khai báo mã môn học để lấy thông tin môn học
	--vì số lần học được tính tự động -> cần khai báo 1 biến để đếm số lần học trước đó
	declare @v_lanhoc int,
			@v_mamonhoc int,
			@v_dadangky int;
	--lấy mã môn học dựa vào mã lớp
	select @v_mamonhoc = mamonhoc 
	from tblLopHoc
	where malophoc = @malophoc;

	--từ mã môn học + msv => tìm được số lần học trước đó
	select @v_lanhoc = count(*)
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	where l.daketthuc = 1 --> chỉ tính số lần học từ các lớp có trạng thái đã kết thúc
	and d.masinhvien = @masinhvien
	and l.mamonhoc = @v_mamonhoc;

	--ktra sv hiện có đky các lớp khác học cùng 1 môn
	select @v_dadangky = count(*)
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	where l.daketthuc = 0 --> lớp đang mở
	and l.mamonhoc = @v_mamonhoc --> môn học này đã đăng ký
	and d.masinhvien = @masinhvien; --> sinh viên xác định

	--> nếu kết quả trả về v_dadangky > 0 --> có nghĩa hiện tại sinh viên này đã đăng ký 1 lớp học cùng môn học này rồi
	if @v_dadangky>0 return -1;

	--lần học mới bằng lần trước đó +1
	set @v_lanhoc = @v_lanhoc + 1;

	--insert data vào bảng điểm -> dk môn học
	insert into tblDiem(nguoitao, masinhvien, malophoc, lanhoc)
	values(@masinhvien, @masinhvien, @malophoc,@v_lanhoc); --sv đky -> nguoitao = @masinhvien

	--ktra thực thi
	if @@ROWCOUNT > 0 return 1 else return 0;
end
GO
/****** Object:  StoredProcedure [dbo].[dsLopChuaDKy]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dsLopChuaDKy]
	@masinhvien varchar(50)
as
begin
	select
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		case when len(g.tendem)>0 then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien
	from tblLopHoc l
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	where l.daketthuc = 0 -- lấy các lớp đang mở
	and l.malophoc not in ( select malophoc from tblDiem where masinhvien = @masinhvien);
end
GO
/****** Object:  StoredProcedure [dbo].[InsertGV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertGV]
	@nguoitao varchar(30),
	@ho nvarchar(10),
	@tendem nvarchar(20),
	@ten nvarchar(10),
	@gioitinh tinyint,
	@ngaysinh date,
	@dienthoai varchar(30),
	@email varchar(150),
	@diachi nvarchar(150)
AS
BEGIN
	INSERT INTO tblGiaoVien
	(
		nguoitao,
		ho, tendem, ten,
		gioitinh, ngaysinh,
		dienthoai, email, diachi
	)
	VALUES
	(
		@nguoitao,
		@ho,@tendem,@ten,
		@gioitinh, @ngaysinh,
		@dienthoai, @email, @diachi
	);

	if @@ROWCOUNT > 0 begin return 1 end
	else begin return 0 end;
END
GO
/****** Object:  StoredProcedure [dbo].[insertLopHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertLopHoc]
	@nguoitao varchar(30),
	@mamonhoc int,
	@magiaovien int
as
begin
	insert into tblLopHoc(nguoitao,mamonhoc,magiaovien)
	values(@nguoitao,@mamonhoc,@magiaovien)
	if @@ROWCOUNT > 0 begin return 1 end
	else begin return 0 end
end
GO
/****** Object:  StoredProcedure [dbo].[insertMH]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertMH]
	@nguoitao varchar(30),
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	INSERT INTO tblMonHoc
	(
		nguoitao,
		tenmonhoc,
		sotinchi
	)VALUES(
		@nguoitao,
		@tenmonhoc,
		@sotinchi
	);

	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
/****** Object:  StoredProcedure [dbo].[monDaDky]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[monDaDky]
	@masinhvien varchar(50)
as
begin
	select 
		l.malophoc,
		m.tenmonhoc,
		case when(len(g.tendem) > 0 ) then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien,
		m.sotinchi,
		d.diemlan1,
		d.diemlan2
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	where l.daketthuc = 0 --môn đã dky -> lớp đang/chưa mở => trạng thái kết thúc là 0, nếu = 1 => học phần kết thúc
	and d.masinhvien = @masinhvien;
end
GO
/****** Object:  StoredProcedure [dbo].[selectAllGV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectAllGV]
	@tukhoa nvarchar(50)

AS
BEGIN
	select
		magiaovien,
		case 
			when len(tendem)>0 then concat(ho,' ',tendem,' ', ten)
			else CONCAT(ho,' ',ten)
			end as hoten,
			case when gioitinh = 1 then 'Nam'
			else N'Nữ' end as gioitinh,
			dienthoai,
			email,
			diachi
		from tblGiaoVien
		where 
		lower(concat(ho,' ', tendem,' ', ten)) like '%'+lower(trim(@tukhoa))+'%'
		or lower(ho) like '%'+lower(trim(@tukhoa))+'%'
		or lower(tendem) like '%'+lower(trim(@tukhoa))+'%'
		or lower(ten) like '%'+lower(trim(@tukhoa))+'%'
		or dienthoai like '%'+lower(trim(@tukhoa))+'%'
		or cast(magiaovien as varchar(30)) like '%'+lower(trim(@tukhoa))+'%'
		or lower(email) like '%'+lower(trim(@tukhoa))+'%'
		order by ten;
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllMonHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectAllMonHoc]
	@tukhoa nvarchar(30)
AS
BEGIN
	select
		mamonhoc,
		tenmonhoc,
		sotinchi
	from tblMonHoc
	where 
		mamonhoc like '%'+lower(trim(@tukhoa))+'%'
		or lower(tenmonhoc) like '%'+lower(trim(@tukhoa))+'%'
		order by tenmonhoc;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllSinhVien]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllSinhVien] --Tạo procedure get all sinh viên
	@tukhoa nvarchar(50) --Tìm kiếm sinh viên dựa vào từ khoá (tìm kiếm tương đối)
	--Theo msv
	--Theo họ, tên, tên đệm
	--Theo sđt
	--tìm theo email

AS
	select
		masinhvien,
		case
			when LEN(tendem) > 0 then --tendem > 0 => có tên đệm
				CONCAT(ho,' ',tendem,' ', ten) --nối họ + tên đệm + tên
			else CONCAT(ho, ' ', ten) --ngược lại
		end as hoten,
		CONVERT(varchar(10), ngaysinh,103) as namsinh, --dd/mm/yyyy
		case
			when gioitinh = 1 then N'Nam'
			else N'Nữ'
		end as gt, --1 = nam, 0 = nữ
		quequan,
		diachi,
		dienthoai,
		email
	from tblSinhVien
	where
		lower(concat(ho,' ', tendem,' ', ten)) like '%'+lower(trim(@tukhoa))+'%'
		or dienthoai like '%'+lower(trim(@tukhoa))+'%'
		or cast(masinhvien as varchar(30)) like '%'+lower(trim(@tukhoa))+'%'
		or email like '%'+lower(trim(@tukhoa))+'%'

	order by ten;--sắp xếp theo alphabet của tên
GO
/****** Object:  StoredProcedure [dbo].[selectGV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectGV]
	@magiaovien int
AS
BEGIN
	Select
		ho,
		tendem,
		ten,
		gioitinh,
		convert(varchar(10),ngaysinh,103) as ngaysinh,
		dienthoai,
		email,diachi
	from tblGiaoVien
	where magiaovien = @magiaovien;
END
GO
/****** Object:  StoredProcedure [dbo].[selectLopHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectLopHoc]
	@malophoc bigint
as
begin
	select magiaovien, mamonhoc from tblLopHoc where malophoc = @malophoc;
end 
GO
/****** Object:  StoredProcedure [dbo].[selectMH]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[selectMH]
		@mamonhoc int
	AS
	BEGIN
		SELECT
			tenmonhoc,
			sotinchi
		FROM tblMonHoc
		where mamonhoc = @mamonhoc;
	END
GO
/****** Object:  StoredProcedure [dbo].[selectSV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectSV]
	@masinhvien varchar(50)
AS
BEGIN
	SELECT
		ho,tendem,ten,convert(varchar(10), ngaysinh,103) as ngaysinh,
		gioitinh,
		quequan,diachi,dienthoai,email
	FROM tblSinhVien
	WHERE masinhvien = @masinhvien;

END
GO
/****** Object:  StoredProcedure [dbo].[ThemMoiSV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo stored procedure để thêm mới sv vào tblSinhVien

CREATE PROCEDURE [dbo].[ThemMoiSV]
	--Khai báo ds tham số truyền vào
	@Ho nvarchar(10),
	@TenDem nvarchar(20),
	@Ten nvarchar(10),
	@Ngaysinh date,
	@Gioitinh tinyint,
	@Quequan nvarchar(150),
	@DiaChi nvarchar(150),
	@DienThoai varchar(30),
	@Email varchar(150)
	--Kết thúc khai báo tham số truyền vào
AS
BEGIN

	--Thêm mới
	INSERT INTO tblSinhVien
	(
		masinhvien,
		ho,tendem,ten,
		ngaysinh,gioitinh,
		quequan,diachi,
		dienthoai,email
	)VALUES(
		'19SV'+CAST(NEXT VALUE FOR sinhvienSeq as varchar(30)),
		@Ho,@TenDem,@Ten,
		@Ngaysinh,
		@Gioitinh,
		@Quequan,@Diachi,
		@Dienthoai,@Email
	); --Kết thúc thêm mới

	--Kiểm tra
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END
GO
/****** Object:  StoredProcedure [dbo].[tracuudiem]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[tracuudiem]
	@masinhvien varchar(50),
	@tukhoa nvarchar(50) -- cái này dùng để lọc dữ liệu tìm kiếm
as
begin
	set @tukhoa = lower(@tukhoa); -- lower là cho toàn bộ kí tự in thường
	select 
		m.mamonhoc,
		m.tenmonhoc,
		d.lanhoc,
		case when len(g.magiaovien)>0 then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien,--kiểm tra nếu có tên đệm thì nối họ + tên đệm + tên ngược lại thì nối họ + tên
		d.diemlan1,
		d.diemlan2
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	where l.daketthuc = 1
	and d.masinhvien = @masinhvien
	and lower(m.tenmonhoc) like '%'+@tukhoa+'%'; -- lọc theo từ khóa tìm kiếm truyền vào
end
GO
/****** Object:  StoredProcedure [dbo].[updateGV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateGV]
	@nguoicapnhat varchar(30),
	@magiaovien int,
	@ho nvarchar(10),
	@tendem nvarchar(20),
	@ten nvarchar(10),
	@gioitinh tinyint,
	@ngaysinh date,
	@dienthoai varchar(30),
	@email varchar(150),
	@diachi nvarchar(150)
AS
BEGIN
	UPDATE tblGiaoVien
	SET
		nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = getdate(),
		ho = @ho, tendem = @tendem, ten = @ten,
		gioitinh = @gioitinh, ngaysinh = @ngaysinh,
		dienthoai = @dienthoai, email = @email, diachi = @diachi
	WHERE magiaovien = @magiaovien;
END
GO
/****** Object:  StoredProcedure [dbo].[updateLopHoc]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateLopHoc]
	@nguoicapnhat varchar(30),
	@malophoc bigint,
	@mamonhoc int,
	@magiaovien int
as
begin
	update tblLopHoc
	set nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = getdate(),
		magiaovien = @magiaovien,
		mamonhoc = @mamonhoc
	where malophoc = @malophoc;
	if @@ROWCOUNT > 0 begin return 1 end
	else begin return 0 end;
end
GO
/****** Object:  StoredProcedure [dbo].[updateMH]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateMH]
	@nguoicapnhat varchar(30),
	@mamonhoc int,
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	UPDATE tblMonHoc
	SET
		nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = GETDATE(),
		tenmonhoc = @tenmonhoc,
		sotinchi = @sotinchi
	WHERE mamonhoc = @mamonhoc;

	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END
GO
/****** Object:  StoredProcedure [dbo].[updateSV]    Script Date: 21/08/2022 23:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateSV]
	@masinhvien varchar(50),
	@ho nvarchar(10),
	@tendem nvarchar(20),
	@ten nvarchar(10),
	@ngaysinh date,
	@gioitinh tinyint,
	@quequan nvarchar(150),
	@diachi nvarchar(150),
	@dienthoai varchar(30),
	@email varchar(150)
	-- Kết thúc khai báo
AS
BEGIN
	UPDATE tblSinhVien
	SET
		ho = @ho,
		tendem = @tendem,
		ten = @ten,
		ngaysinh = @ngaysinh,
		gioitinh = @gioitinh,
		quequan = @quequan,
		diachi = @diachi,
		dienthoai = @dienthoai,
		email = @email
	WHERE masinhvien = @masinhvien;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 1 END;
END
GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
