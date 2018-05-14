use master
--drop database PhanPhoiThuoc
create database PhanPhoiThuoc
use PhanPhoiThuoc

 create table KHACH_HANG
 (
	MaKH int identity(1,1) primary key,
	TenKH nvarchar(50),
	DiaChi nvarchar(50),
	SDT varchar(50),
	Email nvarchar(50),
	IDLogin varchar(50),
	Pass varchar(50)
 )
 create table LOAI_NV
(
	MaLoaiNV int identity(1,1) primary key,	
	LoaiNV nvarchar(50),
)
  create table NHAN_VIEN
 (
	MaNV int identity(1,1) primary key,
	TenNV nvarchar(50),
	SDT varchar(50),
	MaLoaiNV int foreign key references LOAI_NV(MaLoaiNV),
 )
 
 create table DVT
(
	MaDVT int identity(1,1) primary key,
	TenDVT nvarchar(50),
)

create table LOAI_SAN_PHAM
(
	MaLoaiSP int identity(1,1) primary key,
	TenLoai nvarchar(50),
)

create table SAN_PHAM
(
	MaSP int identity(1,1) primary key,
	TenSP nvarchar(50),
	MaLoaiSP int foreign key references LOAI_SAN_PHAM(MaLoaiSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuongTon int,
	DonGia money,
	NgayCapNhat date,
	MoTa nvarchar(max),
	Images nvarchar(50),
)

create table DON_DAT_HANG
(
	MaDDH int identity(1,1) primary key,
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
	MaHD int identity(1,1) primary key,
	MaKH int foreign key references KHACH_HANG(MaKH),
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
	MaPGH int identity(1,1) primary key,
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

set identity_insert DVT on
insert into DVT (MaDVT, TenDVT) values (1, N'Hộp');
insert into DVT (MaDVT, TenDVT) values (2, N'Lọ');
insert into DVT (MaDVT, TenDVT) values (3, N'Chai');
insert into DVT (MaDVT, TenDVT) values (4, N'Thùng');
set identity_insert DVT off

set identity_insert LOAI_NV on
insert into LOAI_NV(MaLoaiNV, LoaiNV) values (1, N'Giao hàng sỉ');
insert into LOAI_NV(MaLoaiNV, LoaiNV) values (2, N'Giao hàng lẻ');
set identity_insert LOAI_NV off

set identity_insert KHACH_HANG on
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (1, 'Ronny Eytel', '72885 Ludington Drive', '3534574215', 'reytel0@squidoo.com', 'reytel0', 'rjtBUexg4w');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (2, 'Krysta Keble', '5437 Grasskamp Avenue', '4082087959', 'kkeble1@pinterest.com', 'kkeble1', 'CZOzjdu');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (3, 'Margaux Bougen', '7382 Hintze Pass', '5875538494', 'mbougen2@bloglovin.com', 'mbougen2', 'znrSZ1');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (4, 'Wenona O'' Dornan', '8726 Del Sol Park', '2241373941', 'wo3@globo.com', 'wo3', 'bfqLYFtOx');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (5, 'Elladine Reavell', '93 Milwaukee Terrace', '2934085401', 'ereavell4@arizona.edu', 'ereavell4', 'yFxYE1Jxok');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (6, 'Tobin Guillond', '61281 International Circle', '6043826930', 'tguillond5@businesswire.com', 'tguillond5', 'BBbe1Ut7S6D');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (7, 'Fowler Pywell', '15049 Chive Road', '9924590896', 'fpywell6@blogger.com', 'fpywell6', '7gJSHMyG7tm');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (8, 'Matthew Scothron', '1851 Judy Crossing', '3995609680', 'mscothron7@google.com.au', 'mscothron7', 'LJujkRvx2');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (9, 'Conroy Andryunin', '1910 Elka Pass', '3414934263', 'candryunin8@sogou.com', 'candryunin8', 'uK3iH2');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (10, 'Laurent Tiery', '140 West Point', '2783786947', 'ltiery9@google.com', 'ltiery9', 'F8hb4Q');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (11, 'Gerladina Burden', '54803 Quincy Way', '6116034790', 'gburdena@msn.com', 'gburdena', 'VCCOgar2s');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (12, 'Giuditta Gask', '7 Warrior Plaza', '5469195455', 'ggaskb@discovery.com', 'ggaskb', 'Cmfgz3x');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (13, 'Kendrick Frede', '84 Main Court', '3094540940', 'kfredec@sohu.com', 'kfredec', '4euSf8VtsS');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (14, 'Brendon Aspin', '052 Kim Trail', '7618284958', 'baspind@angelfire.com', 'baspind', '7Jynwn');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (15, 'Avram Slipper', '379 Ridgeview Court', '7778000018', 'aslippere@state.gov', 'aslippere', 'YcQzlTl');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (16, 'Jonie Ogles', '3 Eastlawn Trail', '2047274662', 'joglesf@telegraph.co.uk', 'joglesf', '8GVSaUHCtS7');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (17, 'Edi Gonnely', '01 Eagan Way', '2704329158', 'egonnelyg@hp.com', 'egonnelyg', 'OsXUm64igK');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (18, 'Louie Bool', '1 Comanche Avenue', '8015306151', 'lboolh@omniture.com', 'lboolh', 'xmcrya5VjV');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (19, 'Yovonnda Cottle', '08624 Vera Lane', '6734177896', 'ycottlei@nba.com', 'ycottlei', 'jhkH73T');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (20, 'Pacorro Seebright', '521 Autumn Leaf Plaza', '9183140380', 'pseebrightj@alibaba.com', 'pseebrightj', 'nVlYxIjdLp7');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (21, 'Druci Maceur', '5778 Cherokee Alley', '1962630185', 'dmaceurk@ustream.tv', 'dmaceurk', 'IoVuuL');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (22, 'Joya Du Hamel', '098 Vidon Plaza', '1568281740', 'jdul@cnn.com', 'jdul', 'ZaIn0pr');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (23, 'Layton Frost', '3421 Grim Pass', '7313694421', 'lfrostm@goo.ne.jp', 'lfrostm', '1WU5JUP1w0Z');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (24, 'Jay Lashmar', '4769 Northview Road', '2853985998', 'jlashmarn@un.org', 'jlashmarn', 'HIDGzu5Z2R');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (25, 'Christabella Sumption', '2949 Magdeline Plaza', '6713734897', 'csumptiono@xing.com', 'csumptiono', 'GXSCzk');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (26, 'Chere Pellman', '331 Loftsgordon Circle', '6462925626', 'cpellmanp@ehow.com', 'cpellmanp', 'yjekqg');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (27, 'Quintin Bridgstock', '20435 Pearson Street', '5253895505', 'qbridgstockq@washington.edu', 'qbridgstockq', '4VJnsF');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (28, 'Janenna O''Criane', '4412 Porter Drive', '2791331932', 'jocrianer@is.gd', 'jocrianer', 'GjXl6lvL6Ton');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (29, 'Gayla Metzke', '75 Mendota Point', '3131966741', 'gmetzkes@blogspot.com', 'gmetzkes', 'dg6NwvRjRB');
insert into KHACH_HANG (MaKH, TenKH, DiaChi, SDT, Email, IDLogin, Pass) values (30, 'Emmerich Hearnah', '11 Caliangt Parkway', '9859011199', 'ehearnaht@adobe.com', 'ehearnaht', 'nFP3JG29Q0');
set identity_insert KHACH_HANG off

set identity_insert LOAI_SAN_PHAM on
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (1, 'ACETAMINOPHEN, DIPHENHYDRAMINE HYDROCHLORIDE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (2, 'PECTIN');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (3, 'Bismuth subsalicylate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (4, 'Insects (whole body) cockroach mix');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (5, 'Ethyl Alcohol');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (6, 'OCTINOXATE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (7, 'Levonorgestrel and Ethinyl Estradiol');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (8, 'Alcohol');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (9, 'potassium chloride');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (10, 'ALPHA-TOCOPHEROL ACETATE');
set identity_insert LOAI_SAN_PHAM off

set identity_insert SAN_PHAM on
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (1, 'berkley and jensen adult tussin dm', 1, 1, 62, '$98.91', '05/06/2017', 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt', 'sapien_cursus.tiff');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (2, 'Glycopyrrolate', 2, 4, 42, '$89.43', '08/17/2017', 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque', 'etiam.png');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (3, 'BAC-D Foaming Antibacterial Wound sanitizer', 3, 1, 98, '$28.47', '08/12/2017', 'enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', 'amet_sem_fusce.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (4, 'Torsemide', 4, 3, 82, '$25.41', '01/01/2018', 'porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac', 'tristique_in.gif');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (5, 'Bio Glyoxal Phase', 5, 2, 78, '$86.20', '10/18/2017', 'ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis', 'felis_sed.gif');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (6, 'Survanta', 6, 3, 27, '$38.48', '06/23/2017', 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 'nulla.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (7, 'Oxycodone Hydrochloride', 7, 3, 30, '$88.94', '02/22/2018', 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 'est_et_tempus.tiff');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (8, 'STOOL SOFTENER', 8, 2, 94, '$71.81', '10/19/2017', 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', 'hac_habitasse_platea.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (9, 'Clozapine', 9, 3, 86, '$74.06', '01/06/2018', 'odio condimentum id luctus nec molestie sed justo pellentesque viverra', 'pulvinar.tiff');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (10, 'Fluconazole', 10, 4, 5, '$14.31', '12/15/2017', 'viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero', 'sed_sagittis_nam.gif');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (11, 'Metoprolol Tartrate', 1, 1, 98, '$63.89', '04/06/2018', 'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea', 'iaculis_justo.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (12, 'SELENIUM SULFIDE', 2, 1, 3, '$24.10', '05/04/2017', 'ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', 'amet_consectetuer.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (13, 'New Terocin', 3, 1, 80, '$74.78', '03/07/2018', 'ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 'pharetra.tiff');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (14, 'ChloraPrep One-Step', 4, 2, 17, '$67.13', '06/16/2017', 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', 'amet.tiff');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (15, 'clobetasol propionate', 5, 4, 90, '$64.90', '01/22/2018', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et', 'rhoncus_mauris_enim.gif');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (16, 'Oxygen', 6, 3, 53, '$71.15', '01/26/2018', 'ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'porttitor.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (17, 'Pore Rescue Acne', 7, 2, 94, '$39.71', '10/17/2017', 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', 'vel_augue_vestibulum.gif');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (18, 'Kit for the Preparation of Technetium Tc99m Sestamibi', 8, 2, 38, '$33.40', '12/05/2017', 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', 'sit_amet.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (19, 'CVS Maximum Strength Boil Relief', 9, 2, 40, '$38.25', '04/02/2018', 'semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', 'lacinia_aenean_sit.jpeg');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongTon, DonGia, Ngaycapnhat, Mota, Images) values (20, 'Clonazepam', 10, 4, 100, '$14.37', '12/11/2017', 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci', 'ut_volutpat.jpeg');
set identity_insert SAN_PHAM off

set identity_insert NHAN_VIEN on
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (1, 'Alasdair Witherow', '7633612789', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (2, 'Bondy Elford', '7766603332', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (3, 'Forester Archbutt', '3119716975', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (4, 'Talya Choffin', '2032432618', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (5, 'Sheffield Brunicke', '6787329047', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (6, 'Laird Stoggles', '8552599418', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (7, 'Gunner Merioth', '4059690251', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (8, 'Mark Jannaway', '4615388563', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (9, 'Morgan Rillstone', '4217088084', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (10, 'Konstantin Gallafant', '1881370556', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (11, 'Sammie Bourne', '9541883058', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (12, 'Florrie Bonefant', '7819661341', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (13, 'Mil Jeayes', '7541062074', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (14, 'Ralina Nadin', '4087816411', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (15, 'Cody Wharton', '5043172755', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (16, 'Hatti Bascomb', '3506956486', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (17, 'Nevile Samsworth', '9424772476', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (18, 'Che Oxtaby', '7523635513', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (19, 'Sib Aire', '1425910488', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (20, 'Karolina Dominec', '7077553799', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (21, 'Junette Scotchmer', '3859301837', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (22, 'Celeste Copperwaite', '6794237383', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (23, 'Cesare Sproul', '6753605694', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (24, 'Mikaela De Santos', '7131150829', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (25, 'Lucias Tambling', '6545945702', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (26, 'Doro Palmer', '3998443877', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (27, 'Anson Starbuck', '7856259800', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (28, 'Ellary Faires', '4048889551', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (29, 'Hanni Baggett', '5007423981', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (30, 'Margy Hollerin', '4028751091', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (31, 'Tildi Curreen', '2827833162', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (32, 'Marlon Churchyard', '2284080911', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (33, 'Janeczka Bambrick', '4206525392', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (34, 'Analise Gurnett', '3451055238', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (35, 'Shelba Haynes', '4967494984', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (36, 'Arleyne Joyson', '5468375361', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (37, 'Nedi Ramelet', '7988937809', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (38, 'Cathleen Anscombe', '3227044061', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (39, 'Sherry Bosson', '3569326195', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (40, 'Jeri Sousa', '8708214024', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (41, 'Townie McGeaney', '8671616150', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (42, 'Janela Artz', '4113317243', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (43, 'Lauryn Ledrane', '9235760991', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (44, 'Kitti Polly', '9723109774', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (45, 'Goldarina Paulillo', '8232025272', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (46, 'Lorene Vanyashkin', '3962884382', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (47, 'Byran Shore', '7121508086', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (48, 'Cesya McCauley', '9177507049', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (49, 'Frank Yukhnin', '1973920797', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (50, 'Symon Boyles', '9037993641', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (51, 'Lisle Hinemoor', '1277411623', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (52, 'Oren Osgordby', '6561049409', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (53, 'Lucas Slixby', '4605364314', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (54, 'Willi Tuerena', '8702373762', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (55, 'Guinna Howchin', '4995220934', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (56, 'Klaus Priddle', '6507589189', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (57, 'Hall Vinas', '3249191900', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (58, 'Pail Rankin', '4438408367', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (59, 'Codi Crowson', '3724165919', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (60, 'Camilla Jedraszczyk', '9303098121', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (61, 'Charis Highnam', '9978310681', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (62, 'Hunt Bampfield', '5218362091', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (63, 'Colby Crocken', '5719981429', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (64, 'Barnabe Sargint', '9081617160', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (65, 'Tabitha Edon', '1168306923', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (66, 'Demetre Sexty', '2665540310', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (67, 'Nickey Sichardt', '4105444228', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (68, 'Stacia Cregin', '5804139093', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (69, 'Valeria Bockin', '3634670220', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (70, 'Therine Fern', '9808005413', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (71, 'Dalli Danigel', '9417948111', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (72, 'Irena Melloi', '6776610704', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (73, 'Danielle Strethill', '9979355347', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (74, 'Giacinta Goodreid', '5647162403', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (75, 'Gasper Ikins', '4276295240', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (76, 'Tabby Knell', '5454796328', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (77, 'Elisha Klulisek', '2161013018', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (78, 'Shannen Yashaev', '2864542989', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (79, 'Cara Dowd', '9919875032', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (80, 'Audry Menicomb', '9609123037', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (81, 'Sargent Andreassen', '7629267511', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (82, 'Jaime Flement', '6522577722', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (83, 'Corrina Kimmins', '9111966444', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (84, 'Anna-diana Conybear', '4756876925', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (85, 'Rhonda Drakeley', '5511554886', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (86, 'Willa Medforth', '2006901962', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (87, 'Laurette Lloyds', '8411449638', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (88, 'Farrah Bozward', '3252289607', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (89, 'Nellie Bartot', '4641587314', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (90, 'Danit Weekland', '8882480921', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (91, 'Wolfie Rodolf', '6739810124', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (92, 'Neilla Ower', '6366039869', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (93, 'Jamie Kitchinham', '5187738682', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (94, 'Augustus Caffrey', '9468257919', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (95, 'Vanya Brosnan', '9479763813', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (96, 'Archy Dursley', '7725970190', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (97, 'Ellissa Scudder', '8228393194', 1);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (98, 'Perri Boyfield', '9408665543', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (99, 'Moore Skettles', '6414030239', 2);
insert into NHAN_VIEN (MaNV, TenNV, SDT, MaLoaiNV) values (100, 'Hannah Woolacott', '7508297599', 1);
set identity_insert NHAN_VIEN off

use PhanPhoiThuoc
go
CREATE TRIGGER GiamSoLuongHang ON dbo.CHI_TIET_DON_DAT_HANG FOR INSERT
AS
    DECLARE @maHang nvarchar(5)
    DECLARE @soLuong INT
    SELECT @maHang=MaSP,@soLuong=SoLuong FROM inserted  
    UPDATE SAN_PHAM SET SoLuongTon-=@soLuong WHERE MaSP=@maHang
 
GO
CREATE TRIGGER SoLuongAm
ON SAN_PHAM
FOR INSERT, UPDATE
as 
	declare @SoLuong float
	select @SoLuong=SoLuongTon from inserted
	if(@SoLuong < 0) 
		begin
		print 'hang da het khong the dat hang' 
		rollback tran
		end
 
select * from CHI_TIET_DON_DAT_HANG
select * from SAN_PHAM
select * from DON_DAT_HANG

insert into DON_DAT_HANG values ('8/4/2017') 
insert into CHI_TIET_DON_DAT_HANG(MaDDH,MaSP,SoLuong) values (10,14,1)