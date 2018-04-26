use master

create database PhanPhoiThuoc
use PhanPhoiThuoc
 Drop database PhanPhoiThuoc


 create table KHACH_HANG
 (
	MaKH char(10) primary key,
	TenKH nvarchar(30),
	DiaChi nvarchar(30),
	SDT char(15),
 )
 create table NHAN_VIEN_GIAO_HANG
 (
	MaNVGH char(10) primary key,
	TenNV nvarchar(10),
	SDT char(15),
 )


 create table DON_VI_TINH
(
	STT char(10) primary key,
	TenDVT nvarchar(30),
)

create table LOAI_SAN_PHAM
(
	STT char(10) primary key,
	TenLoai nvarchar(30),
)

create table SAN_PHAM
(
	MaSP char(10) primary key,
	TenSP nvarchar(30),
	LoaiSP nvarchar(30),
	TenDVT nvarchar(30),
	SoLuong char(10),
	DonGia float,
	image nvarchar(50),
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
	TenSP nvarchar(30),
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
	TenSP nvarchar(30),
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
	TenSP nvarchar(30),
	MaDVT char(10),
	SoLuong int,
	DonGia float,
	ThanhTien float,
 )
