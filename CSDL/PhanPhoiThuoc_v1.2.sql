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
 create table NHAN_VIEN_GIAO_HANG
 (
	MaNVGH varchar(10) primary key,
	TenNV nvarchar(10),
	SDT varchar(15),
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
	SoLuongCon varchar(10),
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
	STT varchar(10) primary key,
	MaDDH varchar(10) foreign key references DON_DAT_HANG(MaDDH),
	TenSP nvarchar(30),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuong int,
	DonGia float,
	ThanhTien float,
)

create table PHIEU_GIAO_HANG
(
	MaPGH varchar(10) primary key,
	MaNVGH varchar(10) foreign key references NHAN_VIEN_GIAO_HANG(MaNVGH),
	MaKH varchar(10) foreign key references KHACH_HANG(CMND),
	NgayGiaoHang datetime,
)

create table CHI_TIET_PHIEU_GIAO_HANG
(
	STT varchar(10) primary key,
	MaPGH varchar(10) foreign key references PHIEU_GIAO_HANG(MaPGH),
	TenSP nvarchar(30),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuong int,
	DonGia float,
	ThanhTien float,
)

create table HOA_DON
(
	MaHD varchar(10) primary key,
	NgayLapHD datetime,
	MaKH varchar(10) foreign key references KHACH_HANG(CMND),
	TenKH nvarchar(30),
	HinhThucThanhToan nvarchar(20),
)
 create table CT_HOA_DON
 (
	STT varchar(10) primary key,
	MaHD varchar(10) foreign key references HOA_DON(MaHD),
	TenSP nvarchar(30),
	DVT varchar(10) foreign key references DON_VI_TINH(MaDVT),
	SoLuong int,
	DonGia float,
	ThanhTien float,
 )
