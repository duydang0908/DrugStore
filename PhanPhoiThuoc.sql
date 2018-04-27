use master

create database PhanPhoiThuoc
use PhanPhoiThuoc
 Drop database PhanPhoiThuoc


 create table KHACH_HANG
 (
	CMND varchar(10) primary key,
	TenKH nvarchar(30),
	DiaChi nvarchar(30),
	SDT varchar(15),
	Email nvarchar(50),
 )
  create table NHAN_VIEN
 (
	MaNV varchar(20) primary key,
	TenNV nvarchar(50),
	SDT varchar(15),
	CaTruc nvarchar(50),
	MaLoaiNV varchar(10) foreign key references LOAI_NV(MaLoaiNV),
 )

create table LOAI_NV
(
	MaLoaiNV varchar(10) primary key,	
	LoaiNV nvarchar(50),
)


 create table DON_VI_TINH
(
	MaDVT varchar(10) primary key,
	TenDVT nvarchar(30),
)

create table LOAI_SAN_PHAM
(
	MaLoaiSP varchar(10) primary key,
	TenLoai nvarchar(30),
)

create table SAN_PHAM
(
	MaSP varchar(10) primary key,
	TenSP nvarchar(30),
	LoaiSP varchar(10) foreign key references LOAI_SAN_PHAM(MaLoaiSP),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuongCon int,
	DonGia float,
	Images nvarchar(50),
)


create table DON_DAT_HANG
(
	MaDDH varchar(10) primary key,
	MaKH varchar(10) foreign key references KHACH_HANG(CMND), 
	NgayLapDon datetime,	
)

create table CHI_TIET_DON_DAT_HANG
( 
	MaCTDDH varchar(10) primary key,
	MaDDH varchar(10) foreign key references DON_DAT_HANG(MaDDH),
	MaSP varchar(10) foreign key references SAN_PHAM(MaSP),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuong float,
	DonGia float,
	ThanhTien float,
)

create table PHIEU_GIAO_HANG
(
	MaPGH varchar(10) primary key,
	MaNV varchar(20) foreign key references NHAN_VIEN(MaNV),
	MaKH varchar(10) foreign key references KHACH_HANG(CMND),
	NgayGiaoHang date,
)

create table CHI_TIET_PHIEU_GIAO_HANG
(
	MaCTPGH varchar(10) primary key,
	MaPGH varchar(10) foreign key references PHIEU_GIAO_HANG(MaPGH),
	MaSP varchar(10) foreign key references SAN_PHAM(MaSP),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuong float,
	DonGia float,
	ThanhTien float,
)

create table HOA_DON
(
	MaHD varchar(10) primary key,
	NgayLapHD datetime,
	MaKH varchar(10) foreign key references KHACH_HANG(CMND),
	HinhThucThanhToan nvarchar(20),
)
 create table CT_HOA_DON
 (
	MaCTHD varchar(10) primary key,
	MaHD varchar(10) foreign key references HOA_DON(MaHD),
	MaSP varchar(10) foreign key references SAN_PHAM(MaSP),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuong float,
	DonGia float,
	ThanhTien float,
 )

create table DangNhap
(
	email varchar(50) primary key,
	pass varchar(max),
)