use master

create database PhanPhoiThuoc
use PhanPhoiThuoc

 create table KHACH_HANG
 (
	MaKH varchar(50) primary key,
	TenKH nvarchar(50),
	DiaChi nvarchar(50),
	SDT varchar(50),
	Email nvarchar(50),
	IDLogin varchar(50),
	Pass varchar(50)
 )
 create table LOAI_NV
(
	MaLoaiNV int primary key,	
	LoaiNV nvarchar(50),
)
  create table NHAN_VIEN
 (
	MaNV int primary key,
	TenNV nvarchar(50),
	SDT varchar(50),
	MaLoaiNV int foreign key references LOAI_NV(MaLoaiNV),
 )
 
 create table DVT
(
	MaDVT int primary key,
	TenDVT nvarchar(50),
)

create table LOAI_SAN_PHAM
(
	MaLoaiSP int primary key,
	TenLoai nvarchar(50),
)

create table SAN_PHAM
(
	MaSP int primary key,
	TenSP nvarchar(50),
	MaLoaiSP int foreign key references LOAI_SAN_PHAM(MaLoaiSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuongTon int,
	DonGia money,
	NgayCapNhat datetime,
	Images nvarchar(50),
)

create table DON_DAT_HANG
(
	MaDDH int primary key,
	NgayLapDon date,	
)

create table CHI_TIET_DON_DAT_HANG
( 
	MaDDH int foreign key references DON_DAT_HANG(MaDDH),
	MaSP int foreign key references SAN_PHAM(MaSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuong int,
	constraint PK_CTDDH primary key(MaDDH,MaSP)
)

create table HOA_DON
(
	MaHD int primary key,
	MaKH varchar(50) foreign key references KHACH_HANG(MaKH),
	NgayLapHD date,
	HinhThucThanhToan nvarchar(50),
	TongTien money,
)

 create table CT_HOA_DON
 (
	--MaCTHD varchar(50) primary key,--
	MaHD int foreign key references HOA_DON(MaHD),
	MaSP int foreign key references SAN_PHAM(MaSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuong money,
	DonGia money,
	ThanhTien money,
	constraint PK_CTHD primary key(MaHD,MaSP)
 )
 
 create table PHIEU_GIAO_HANG
(
	MaPGH int primary key,
	MaDDH int foreign key references DON_DAT_HANG(MaDDH),
	MaNV int foreign key references NHAN_VIEN(MaNV),
	NgayGiaoHang date,
)

create table CHI_TIET_PHIEU_GIAO_HANG
(
	MaPGH int foreign key references PHIEU_GIAO_HANG(MaPGH),
	MaSP int foreign key references SAN_PHAM(MaSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuong money,
	DonGia money,
	ThanhTien money,
	constraint PK_CTPGH primary key(MaSP,MaPGH)
)
create table DangNhap
(
	id varchar(50) primary key,
	Username varchar(50),
	Pass varchar(max),
	PhanQuyen varchar(50),
)

