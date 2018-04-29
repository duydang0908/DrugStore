use master

create database PhanPhoiThuoc
 Drop database PhanPhoiThuoc



 create table DON_VI_TINH
(
	MaDVT char(10) primary key,
	TenDVT nvarchar(30),
)
create table MAT_HANG
(
	MaMH char(10) primary key,
	TenMH nvarchar(30),
	MaDVT char(10) foreign key references DON_VI_TINH(MaDVT),
	DonGia float,
)
create table PHIEU_XUAT_HANG
(
	MaXH char(10) primary key,
	NgayLapPhieu datetime,
)

create table DON_DAT_HANG
(
	MaDDH char(10) primary key,
	MaKH char(10), 
	NgayLapDon datetime,	
)

create table CHI_TIET_DON_DAT_HANG
( 
	STT char(10) primary key,
	MaDDH char(10),
	TenMH nvarchar(30),
	MaDVT char(10),
	SoLuong int,
	DonGia float,
	ThanhTien float,
)

create table PHIEU_GIAO_HANG
(
	MaPGH char(10) primary key,
	MaNVGH char(10),
	MaKH char(10),
	NgayGiaoHang datetime,
)

create table CHI_TIET_PHIEU_GIAO_HANG
(
	MaPGH char(10),
	STT char(10) primary key,
	TenMH nvarchar(30),
	MaDVT char(10),
	SoLuong int,
	DonGia float,
	ThanhTien float,
)

create table HOA_DON
(
	MaHD char(10) primary key,
	NgayLapHD datetime,
	MaBPP char(10),
	MaKH char(10),
	HinhThucThanhToan nvarchar(20),
)
 create table CT_HOA_DON
 (
	STT char(10) primary key,
	TenMH nvarchar(30),
	MaDVT char(10),
	SoLuong int,
	DonGia float,
	ThanhTien float,
 )
