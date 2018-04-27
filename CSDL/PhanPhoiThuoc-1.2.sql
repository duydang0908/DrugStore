use master

create database PhanPhoiThuoc1
use PhanPhoiThuoc1
Drop database PhanPhoiThuoc1


 create table KHACH_HANG
 (
	CMND varchar(50) primary key,
	TenKH nvarchar(50),
	DiaChi nvarchar(50),
	SDT varchar(50),
	Email nvarchar(50),
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
	SoLuongCon int,
	DonGia money,
	Images nvarchar(50),
	Ngaycapnhat date,
)


create table DON_DAT_HANG
(
	MaDDH int primary key,
	MaKH varchar(50) foreign key references KHACH_HANG(CMND), 
	NgayLapDon date,	
)

create table CHI_TIET_DON_DAT_HANG
( 
	MaCTDDH int primary key,
	MaDDH int foreign key references DON_DAT_HANG(MaDDH),
	MaSP int foreign key references SAN_PHAM(MaSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuong money,
)

create table HOA_DON
(
	MaHD int primary key,
	MaDDH int foreign key references DON_DAT_HANG(MaDDH),
	NgayLapHD date,
	HinhThucThanhToan nvarchar(50),
)
 create table CT_HOA_DON
 (
	MaCTHD varchar(50) primary key,
	MaHD int foreign key references HOA_DON(MaHD),
	MaSP int foreign key references SAN_PHAM(MaSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuong money,
	DonGia money,
	ThanhTien money,
	TongTien money,
 )
 create table PHIEU_GIAO_HANG
(
	MaPGH int primary key,
	MaHD int foreign key references HOA_DON(MaHD),
	MaNV int foreign key references NHAN_VIEN(MaNV),
	NgayGiaoHang date,
)

create table CHI_TIET_PHIEU_GIAO_HANG
(
	MaCTPGH int primary key,
	MaPGH int foreign key references PHIEU_GIAO_HANG(MaPGH),
	MaSP int foreign key references SAN_PHAM(MaSP),
	DVT int foreign key references DVT(MaDVT),
	SoLuong money,
	DonGia money,
	ThanhTien money,
)
create table DangNhap
(
	email varchar(50) primary key,
	pass varchar(max),
)

insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('874-58-2891', 'Sigfrid Billitteri', '46 New Castle Parkway', '4194680950', 'sbillitteri0@amazon.co.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('601-94-1791', 'Broderic Stirland', '9294 Thierer Road', '7891138881', 'bstirland1@go.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('209-56-7077', 'Roz Stansall', '17660 Kings Lane', '6162771030', 'rstansall2@comcast.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('821-88-4346', 'Alvis Magrannell', '96061 Mifflin Drive', '5833916508', 'amagrannell3@desdev.cn');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('878-22-0369', 'Carena Elven', '7 Annamark Court', '1872736049', 'celven4@hatena.ne.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('423-04-3143', 'Elysee McKerley', '62 Maywood Place', '5759174740', 'emckerley5@paypal.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('101-85-5819', 'Allissa Georgeson', '616 Sutherland Alley', '5667213487', 'ageorgeson6@rambler.ru');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('340-25-1807', 'Beale Llorente', '94 Hoard Center', '4917487452', 'bllorente7@harvard.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('889-87-8624', 'Ameline Ruperti', '7840 Lerdahl Pass', '3207341151', 'aruperti8@webnode.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('129-48-0465', 'Mozelle Barnham', '08308 Maryland Lane', '8272303493', 'mbarnham9@yale.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('531-43-6061', 'Angy Ficken', '5231 Esch Plaza', '9816082057', 'afickena@cafepress.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('575-99-7617', 'Rosalie Mawer', '170 Mesta Hill', '3069236288', 'rmawerb@example.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('405-93-3516', 'Llewellyn Degli Antoni', '9 Division Place', '1784512653', 'ldeglic@prweb.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('444-96-4796', 'Andrea Thyng', '99770 Old Gate Road', '4323464510', 'athyngd@senate.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('572-37-8425', 'Lettie Kimbury', '3943 Carioca Place', '3288336825', 'lkimburye@rediff.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('472-24-9092', 'Saundra Portwaine', '136 Emmet Junction', '5602036193', 'sportwainef@globo.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('434-57-1882', 'Verna Shaxby', '58516 Melrose Center', '8709052505', 'vshaxbyg@de.vu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('445-66-3685', 'Agnesse Titman', '04 Crest Line Point', '5281377229', 'atitmanh@surveymonkey.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('830-54-4806', 'Bessy Probate', '24 Dahle Circle', '1212916125', 'bprobatei@arizona.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('346-64-6938', 'Ruth Pett', '060 Hallows Circle', '8224811400', 'rpettj@msu.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('199-61-3952', 'Sophronia Wenham', '6877 South Street', '4351109217', 'swenhamk@xrea.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('648-91-4608', 'Tarrance Fipp', '998 Riverside Alley', '1568750896', 'tfippl@ehow.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('182-54-8509', 'Dunc Weedon', '019 Carioca Crossing', '9881121395', 'dweedonm@npr.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('218-27-8352', 'Sonnie Rossetti', '266 Montana Junction', '6009396396', 'srossettin@marriott.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('419-70-2413', 'Zelma Wolstencroft', '034 Mendota Street', '7275280613', 'zwolstencrofto@discovery.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('183-11-9708', 'Aurie Zanneli', '6468 Loeprich Junction', '5711966385', 'azannelip@blogger.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('478-76-7450', 'Enrique Mulvy', '5809 Dayton Crossing', '9436758202', 'emulvyq@chronoengine.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('215-05-3278', 'Davide Ketcher', '966 Dexter Hill', '7556612395', 'dketcherr@g.co');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('470-85-5365', 'Nerita Allanson', '07794 Arkansas Drive', '7282253216', 'nallansons@kickstarter.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('849-38-6481', 'Jessa Feeham', '7006 Messerschmidt Parkway', '8663942782', 'jfeehamt@sina.com.cn');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('328-59-9644', 'Shep Crossdale', '4184 Jay Trail', '7832825436', 'scrossdaleu@a8.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('474-20-9757', 'Karlotta Mougenel', '10289 Helena Way', '6407410676', 'kmougenelv@fema.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('743-91-6872', 'Melba Wescott', '30 Scofield Center', '6318527450', 'mwescottw@clickbank.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('585-31-9799', 'Lars Stiegar', '0742 Erie Way', '2362480414', 'lstiegarx@xinhuanet.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('603-32-9297', 'Ivette Teasey', '23263 Donald Terrace', '2481376266', 'iteaseyy@netlog.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('116-30-6341', 'Georges Trittam', '255 Pierstorff Drive', '2531771920', 'gtrittamz@ehow.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('364-37-1885', 'Bryna Huddleston', '19430 Fordem Court', '8498656918', 'bhuddleston10@ifeng.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('476-22-9050', 'Averyl Del Checolo', '32924 4th Road', '7295666087', 'adel11@joomla.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('858-51-0696', 'Any Pullen', '02 Milwaukee Avenue', '6578603108', 'apullen12@soup.io');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('369-52-9230', 'Eleen Batchelor', '18 Dakota Junction', '8584986149', 'ebatchelor13@mail.ru');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('458-56-9447', 'Valeria Hallawell', '8728 Londonderry Plaza', '7947010899', 'vhallawell14@answers.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('864-62-3183', 'Britteny Loffill', '5 1st Lane', '9855836097', 'bloffill15@friendfeed.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('536-17-8432', 'Dorothee Edens', '6610 Thackeray Junction', '7372591930', 'dedens16@hud.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('589-67-5383', 'Karissa Crucitti', '94 Transport Terrace', '5554175936', 'kcrucitti17@clickbank.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('425-15-8208', 'Hallsy Ganniclifft', '873 Surrey Alley', '2149518987', 'hganniclifft18@si.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('390-55-5094', 'Carolan Elcocks', '16082 Garrison Drive', '3185947167', 'celcocks19@creativecommons.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('877-95-6832', 'Gael Hawkey', '11 Florence Lane', '4977225856', 'ghawkey1a@icq.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('591-37-8937', 'Robb Penreth', '8934 Randy Road', '3148983467', 'rpenreth1b@time.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('594-30-6687', 'Arni Alben', '8 Melody Court', '2712632811', 'aalben1c@paypal.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('214-21-7628', 'Caresse Yorkston', '872 Bellgrove Terrace', '5784008370', 'cyorkston1d@smugmug.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('797-16-1124', 'Jacquetta Reinisch', '515 Almo Avenue', '8318360580', 'jreinisch1e@123-reg.co.uk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('385-90-9673', 'Frederica Larvent', '8451 Morrow Place', '5537371227', 'flarvent1f@opensource.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('717-48-6462', 'Yvonne Britto', '2341 Roth Park', '5465170140', 'ybritto1g@shinystat.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('586-65-4587', 'Gregorio MacMakin', '4 Mayfield Point', '1043738627', 'gmacmakin1h@ucla.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('132-63-9370', 'Quillan Bessent', '54 Bayside Way', '3364978633', 'qbessent1i@sciencedaily.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('682-38-2967', 'Andree McKibbin', '81 Bayside Pass', '4912685943', 'amckibbin1j@com.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('301-26-1782', 'Anallise Kiwitz', '53130 Hauk Point', '9129004897', 'akiwitz1k@craigslist.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('138-05-4954', 'Larine Ivy', '0180 Johnson Road', '2205879989', 'livy1l@fema.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('553-44-2802', 'Alyce Barens', '91 Kropf Hill', '2468106713', 'abarens1m@privacy.gov.au');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('679-64-3185', 'Parrnell Honeywood', '819 Havey Road', '7245649189', 'phoneywood1n@51.la');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('678-29-4473', 'Chelsey Cameron', '98554 Morning Pass', '2353249947', 'ccameron1o@spiegel.de');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('848-46-0129', 'Ethe Payley', '3032 Annamark Circle', '6941898382', 'epayley1p@ameblo.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('758-98-8141', 'Brian Perry', '244 Ruskin Terrace', '4837367991', 'bperry1q@ezinearticles.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('678-50-8394', 'Janeczka Pieche', '44494 Hooker Hill', '2625638834', 'jpieche1r@sogou.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('734-36-2409', 'Avie Jeyes', '85985 Moose Trail', '3008906023', 'ajeyes1s@ow.ly');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('583-45-4861', 'Reggie Hayfield', '22 Pearson Drive', '4113718960', 'rhayfield1t@house.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('380-67-8777', 'Marjy Tooher', '5490 Golf Avenue', '2627513342', 'mtooher1u@ameblo.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('616-35-0377', 'Glad Timson', '84 Namekagon Plaza', '2147040277', 'gtimson1v@wiley.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('124-04-2116', 'Bil Leahey', '4 Memorial Center', '4105238139', 'bleahey1w@flavors.me');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('850-80-4113', 'Aurel Devine', '3 Roth Crossing', '3852732144', 'adevine1x@techcrunch.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('718-13-4154', 'Denise Neill', '473 High Crossing Place', '2068457163', 'dneill1y@bbc.co.uk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('595-78-3730', 'Arielle Insall', '26392 Morningstar Trail', '4143031057', 'ainsall1z@macromedia.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('338-85-8357', 'Cecily Filasov', '83 Grover Center', '1022657419', 'cfilasov20@miibeian.gov.cn');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('565-37-0575', 'Prent Rizon', '98447 Haas Park', '1326492722', 'prizon21@posterous.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('401-01-5789', 'Alikee Concannon', '8461 Rockefeller Alley', '9299190216', 'aconcannon22@buzzfeed.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('748-55-8055', 'Ddene Danielczyk', '79 Randy Place', '2035801595', 'ddanielczyk23@prweb.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('443-36-1055', 'Kaile Llewelyn', '04 Elmside Hill', '3121232134', 'kllewelyn24@bravesites.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('399-54-0126', 'Thadeus Blint', '65882 Blaine Plaza', '3725641293', 'tblint25@vimeo.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('613-56-3657', 'Mikol Scemp', '0 Kinsman Pass', '9063726147', 'mscemp26@quantcast.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('628-11-7653', 'Zared Roycraft', '6 Independence Crossing', '2686595299', 'zroycraft27@pagesperso-orange.fr');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('758-69-2711', 'Bond Mathen', '84313 Corry Drive', '9491262197', 'bmathen28@constantcontact.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('623-54-5261', 'Seth Kinze', '869 Northland Center', '7739318891', 'skinze29@people.com.cn');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('772-60-0695', 'Ronnica Romme', '287 Orin Circle', '5621220575', 'rromme2a@tumblr.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('660-81-9485', 'Moshe Haddinton', '67766 Briar Crest Crossing', '4871970439', 'mhaddinton2b@cnbc.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('237-90-6729', 'Todd Tarr', '93006 Meadow Vale Point', '7988190580', 'ttarr2c@toplist.cz');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('624-73-4966', 'Georgine Allnatt', '51 Talisman Hill', '8576543571', 'gallnatt2d@imgur.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('471-56-9777', 'Fred Bridle', '22299 Ramsey Park', '6876995410', 'fbridle2e@comsenz.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('519-05-8191', 'Anita Faier', '6 Northport Avenue', '1809885466', 'afaier2f@domainmarket.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('514-58-8775', 'Huey Gilmour', '820 Eastwood Terrace', '8455060896', 'hgilmour2g@wsj.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('272-91-1537', 'Cathee Yanele', '33 1st Pass', '1291929575', 'cyanele2h@tumblr.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('369-30-0851', 'Lenka McKelvey', '9383 Prairieview Park', '1251715242', 'lmckelvey2i@purevolume.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('644-91-7698', 'Bob Elleton', '2 Dapin Plaza', '1996353485', 'belleton2j@timesonline.co.uk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('889-42-6284', 'Parsifal Scourge', '87 Evergreen Place', '4156641553', 'pscourge2k@earthlink.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('115-59-5553', 'Agace Villa', '015 Manitowish Plaza', '9666780722', 'avilla2l@cnbc.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('503-08-9721', 'Filia Reolfi', '046 Dwight Junction', '4597480396', 'freolfi2m@nationalgeographic.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('483-93-3853', 'Trever Paulich', '10543 Waywood Center', '9883010968', 'tpaulich2n@rakuten.co.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('539-51-8715', 'Marten Saunderson', '064 Mallard Street', '2298287964', 'msaunderson2o@t.co');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('592-18-3395', 'Bernadene Wandless', '44984 Redwing Junction', '4824774293', 'bwandless2p@usa.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('766-83-3643', 'Alecia Leuty', '470 Morningstar Way', '9513065334', 'aleuty2q@newyorker.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('847-06-6203', 'Grethel Prantoni', '837 Sommers Street', '9637982361', 'gprantoni2r@wsj.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('416-98-4419', 'Livia Takis', '233 Crest Line Hill', '1129998592', 'ltakis2s@ebay.co.uk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('169-92-4414', 'Timoteo Rowsel', '25979 Atwood Crossing', '7752569806', 'trowsel2t@ifeng.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('686-51-5694', 'Eleni Kelling', '634 Victoria Trail', '7719675205', 'ekelling2u@angelfire.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('842-30-7969', 'Bennett Paulillo', '43664 Starling Junction', '9911274404', 'bpaulillo2v@e-recht24.de');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('702-25-6874', 'Tracie Vigus', '23070 David Street', '4761194957', 'tvigus2w@cocolog-nifty.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('573-64-5899', 'Weider Killough', '0972 Rockefeller Hill', '3187481015', 'wkillough2x@hud.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('628-86-0014', 'Cora Yarnley', '8011 Havey Parkway', '6847184230', 'cyarnley2y@youtu.be');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('516-38-5951', 'Hali Dashkov', '5 John Wall Way', '4806053857', 'hdashkov2z@google.com.hk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('567-86-4274', 'Arvie Hodgon', '90362 Elgar Hill', '6648037983', 'ahodgon30@businessinsider.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('272-09-1212', 'Filia Ertel', '5967 Grim Road', '4461448830', 'fertel31@last.fm');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('651-55-4548', 'Kerianne Foxten', '35 Carpenter Lane', '5111102600', 'kfoxten32@sitemeter.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('658-77-5979', 'Kathryn Brazelton', '91 Lyons Center', '9735138641', 'kbrazelton33@hp.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('319-38-3910', 'Edwina Whittock', '908 Grayhawk Point', '6585596757', 'ewhittock34@bbb.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('619-41-1424', 'Abdel Hynam', '2 Bashford Junction', '4279981770', 'ahynam35@buzzfeed.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('211-65-6737', 'Bettina Freyne', '3336 Charing Cross Alley', '9106891778', 'bfreyne36@geocities.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('512-40-8166', 'Stevena Winslett', '43 Nancy Lane', '5583943772', 'swinslett37@soup.io');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('543-09-8444', 'Carlie Fullman', '40 Loeprich Crossing', '2533665927', 'cfullman38@vistaprint.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('715-61-6095', 'Lorry Mildmott', '92 Mcguire Lane', '8151397855', 'lmildmott39@msu.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('326-15-7823', 'Arley Heathorn', '0696 Linden Court', '4632306691', 'aheathorn3a@ox.ac.uk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('233-43-9801', 'Buddy Goodere', '1726 Walton Pass', '9458014002', 'bgoodere3b@joomla.org');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('630-70-3521', 'Alice Elcum', '85178 Bluestem Avenue', '4785669969', 'aelcum3c@indiegogo.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('222-69-5373', 'Bambi Zavattieri', '22214 Monument Place', '2794777914', 'bzavattieri3d@nhs.uk');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('118-33-8110', 'Frederic Cunio', '1432 Melrose Park', '2894140021', 'fcunio3e@reuters.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('366-89-6768', 'Juliette Laming', '6 Annamark Parkway', '7662323350', 'jlaming3f@engadget.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('763-38-2404', 'Darnell Grigoli', '6 Pennsylvania Terrace', '8024738823', 'dgrigoli3g@skype.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('628-32-2320', 'Perry Castaner', '1 Springview Place', '3689445034', 'pcastaner3h@slideshare.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('295-74-1916', 'Lynnelle Crellin', '26316 Parkside Hill', '7531511485', 'lcrellin3i@acquirethisname.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('191-06-3307', 'Vitoria Eschalotte', '22515 Kedzie Parkway', '6356483717', 'veschalotte3j@ucla.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('775-11-9359', 'Jared Elby', '9537 Almo Street', '9688419285', 'jelby3k@ca.gov');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('809-10-7540', 'Melita Goldbourn', '5 Norway Maple Terrace', '3399501615', 'mgoldbourn3l@cnn.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('300-88-7093', 'Timmy Crews', '3 Chive Drive', '8028334951', 'tcrews3m@bluehost.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('376-24-5649', 'Carlina Bovingdon', '323 Gale Place', '7153325456', 'cbovingdon3n@ehow.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('209-62-0720', 'Magda Olenikov', '739 Weeping Birch Park', '8455440620', 'molenikov3o@amazon.co.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('206-60-6593', 'Sharlene Scrimgeour', '93 Oak Way', '7399291932', 'sscrimgeour3p@arizona.edu');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('833-87-6513', 'Gavrielle Kidsley', '9984 Moulton Trail', '8517138097', 'gkidsley3q@deviantart.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('679-77-2830', 'Zebedee Ahearne', '6 Green Plaza', '1989312755', 'zahearne3r@taobao.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('816-99-9954', 'Danit Ladson', '1769 Bay Point', '9287409418', 'dladson3s@amazon.co.jp');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('772-57-9424', 'Donavon Blowfelde', '476 Bartelt Avenue', '9188848632', 'dblowfelde3t@vkontakte.ru');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('695-84-1552', 'Beatriz Colmer', '0 Sommers Circle', '7801516714', 'bcolmer3u@ezinearticles.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('889-48-3771', 'Romeo Shovelbottom', '96321 Aberg Center', '6324772940', 'rshovelbottom3v@apple.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('414-24-3598', 'Marlow Dumphy', '89300 Bellgrove Alley', '9322987687', 'mdumphy3w@vinaora.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('381-73-7020', 'Lanny Tiebe', '12 Jackson Junction', '6987309649', 'ltiebe3x@discuz.net');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('657-98-9592', 'Junie Christoffels', '1 Forest Dale Drive', '5293275458', 'jchristoffels3y@businesswire.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('545-77-7922', 'Aldo Neillans', '7749 Fremont Hill', '3255924187', 'aneillans3z@ibm.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('636-34-4693', 'Cherin Kilian', '40272 Packers Avenue', '3463307968', 'ckilian40@moonfruit.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('803-55-2513', 'Munmro Witton', '42960 Petterle Alley', '1989084863', 'mwitton41@miitbeian.gov.cn');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('421-67-4529', 'Allyson Luparti', '0 Quincy Drive', '7647003864', 'aluparti42@yahoo.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('312-89-7935', 'Anselm Korda', '05574 Hoepker Terrace', '2469660328', 'akorda43@deviantart.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('862-01-6702', 'Phyllis McRobb', '6380 Fallview Way', '9621492408', 'pmcrobb44@feedburner.com');
insert into KHACH_HANG (CMND, TenKH, DiaChi, SDT, Email) values ('239-89-5731', 'Brittani McCambrois', '19206 Graedel Plaza', '1047045217', 'bmccambrois45@mayoclinic.com');


insert into DVT (MaDVT, TenDVT) values (1, N'Hộp');
insert into DVT (MaDVT, TenDVT) values (2, N'Lọ');
insert into DVT (MaDVT, TenDVT) values (3, N'Chai');
insert into DVT (MaDVT, TenDVT) values (4, N'Thùng');

insert into LOAI_NV(MaLoaiNV, LoaiNV) values (1, N'Giao hàng sỉ');
insert into LOAI_NV(MaLoaiNV, LoaiNV) values (2, N'Giao hàng lẻ');


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

insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (1, 'Cimicifuga Racemosa, Hypericum Perforatum');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (2, 'ocriplasmin');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (3, 'MORPHINE SULFATE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (4, 'Menthol, zinc oxide');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (5, 'Fosphenytoin Sodium');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (6, 'Furosemide');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (7, 'Avobenzone Octinoxate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (8, 'Octinoxate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (9, 'zinc acetate and zinc gluconate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (10, 'OCTINOXATE, OXYBENZONE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (11, 'Colloidal Oatmeal');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (12, 'Dimenhydrinate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (13, 'Ketotifen Fumarate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (14, 'CETIRIZINE HYDROCHLORIDE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (15, 'Mineral oil, petrolatum, phenylephrine hcl');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (16, 'Aconitum Napellus, Allium Cepa, Eupatorium Perfoliatum, Ferrum Phosphoricum, Gelsemium Sempervirens, Kali Bichromicum,');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (17, 'calcitriol');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (18, 'Arnica Montana, Carduus Marianus, Hepar Suis, Korean Ginseng, Phosphoricum Acidum, Pituitaria Glandula Suis,');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (19, 'Bupropion hydrochloride');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (20, 'Hydrochlorothiazide');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (21, 'cyclobenzaprine hydrochloride');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (22, 'calendula officinalis, thuja occidentalis');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (23, 'GLYCERIN');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (24, 'Octinoxate, Octisalate, Avobenzone');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (25, 'CALCIUM SILICATE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (26, 'Candida albicans');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (27, 'Ranitidine HYdrochloride');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (28, 'cefpodoxime proxetil');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (29, 'Verapamil Hydrochloride');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (30, 'paclitaxel');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (31, 'Hydrocortisone');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (32, 'PRAVASTATIN SODIUM');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (33, 'Morphine Sulfate');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (34, 'ALPRAZOLAM');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (35, 'Ibuprofen');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (36, 'Gorse');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (37, 'PYRITHIONE ZINC');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (38, 'Camphor');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (39, 'candida albicans, candida parapsilosis, and penicillium roqueforti');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (40, 'Acetaminophen');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (41, 'TITANIUM DIOXIDE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (42, 'Benzocaine and Menthol');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (43, 'Octinoxate and Oxybenzone');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (44, 'Avobenzone, Homosalate, Octisalate, Octocrylene, Oxybenzone');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (45, 'amlodipine besylate and olmesartan medoxomil');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (46, 'Glimepiride');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (47, 'Docusate sodium');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (48, 'adapalene');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (49, 'OCTINOXATE OCTISALATE OXYBENZONE');
insert into LOAI_SAN_PHAM (MaLoaiSP, TenLoai) values (50, 'Acetaminophen, Diphenhydramine HCl');



insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (1, 'Lysol', 4, 4, 23, '$23.42', 'vestibulum ante ipsum.tiff', '12/6/2001');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (2, 'Musco', 40, 2, 47, '$90.83', 'bibendum.jpeg', '4/17/2011');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (3, 'Good Mood Enhancer', 45, 4, 29, '$99.86', 'turpis a.jpeg', '7/9/1999');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (4, 'Dicyclomine Hydrochloride', 19, 3, 20, '$96.07', 'volutpat.tiff', '5/6/2003');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (5, 'Carisoprodol', 5, 4, 81, '$85.54', 'faucibus orci.jpeg', '4/12/2011');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (6, 'Hand San', 28, 1, 89, '$96.44', 'fusce posuere felis.png', '10/31/1999');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (7, 'BANANA BOAT', 38, 2, 40, '$38.98', 'habitasse platea.jpeg', '10/17/2013');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (8, 'Bumetanide', 42, 3, 48, '$74.69', 'at nunc.jpeg', '8/18/2000');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (9, 'Benicar Hct', 40, 2, 75, '$10.61', 'luctus nec.gif', '4/11/2011');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (10, 'Azithromycin', 45, 4, 71, '$86.52', 'integer.tiff', '3/27/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (11, 'Jute', 29, 3, 74, '$59.26', 'magna bibendum imperdiet.jpeg', '7/20/2000');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (12, 'Lactated Ringers', 35, 2, 76, '$51.01', 'primis.jpeg', '11/27/2003');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (13, 'Naproxen Sodium', 7, 4, 60, '$40.82', 'lacinia eget.tiff', '5/30/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (14, 'Galantamine', 49, 2, 26, '$84.59', 'in blandit ultrices.jpeg', '7/3/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (15, 'LEADER Sugar Free Cough Drops Black Cherry', 50, 3, 59, '$42.48', 'aenean.gif', '7/7/2015');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (16, 'Cortizone 10 Intensive Healing', 39, 2, 32, '$39.87', 'potenti nullam.png', '3/4/2010');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (17, 'CARE ONE COOL HEAT PAIN RELIEVING', 19, 3, 23, '$92.38', 'luctus ultricies eu.tiff', '7/4/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (18, 'Ibuprofen', 46, 1, 13, '$14.42', 'at.jpeg', '8/13/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (19, 'Mayinglong Hemorrhoids', 35, 4, 38, '$72.50', 'etiam pretium.jpeg', '6/4/2012');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (20, 'Orsythia', 16, 3, 30, '$44.55', 'suspendisse ornare.tiff', '12/17/2010');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (21, 'Sore Throat', 15, 2, 14, '$35.95', 'ultrices.jpeg', '1/19/2011');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (22, 'NoHist DM', 27, 4, 89, '$78.16', 'sapien quis libero.tiff', '8/18/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (23, 'cold head congestion', 4, 1, 72, '$54.19', 'morbi non.jpeg', '12/15/2001');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (24, 'TRI-LO-MARZIA', 48, 3, 76, '$76.05', 'viverra eget congue.tiff', '4/6/2015');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (25, 'Metoprolol Tartrate', 32, 3, 63, '$60.95', 'curabitur gravida.tiff', '8/1/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (26, 'Etodolac', 36, 4, 55, '$41.66', 'molestie lorem quisque.tiff', '9/12/1997');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (27, 'Piranha Brand Alcohol Free Foaming Instant Hand Sanitizer with Aloe and Vitamin E', 42, 1, 97, '$26.31', 'odio in.tiff', '2/10/2015');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (28, 'Albuterol Sulfate', 31, 2, 9, '$15.28', 'id.jpeg', '5/25/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (29, 'TENUE DE PERFECTION TIMEPROOF FOUNDATION WITH SUNSCREEN ULTIMATE LASTING PERFECTION BROAD SPECTRUM SPF 20 13 ROSE NATUREL', 27, 1, 2, '$91.14', 'quam.jpeg', '8/15/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (30, 'Miconazole 7', 10, 1, 69, '$59.67', 'dui.jpeg', '1/7/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (31, 'Bronchial Cough', 21, 1, 81, '$32.06', 'non velit nec.jpeg', '2/28/2001');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (32, 'Divalproex Sodium Extended Release', 24, 3, 36, '$50.91', 'aenean auctor.jpeg', '2/19/2015');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (33, 'Lidocaine Hydrochloride', 32, 2, 21, '$57.35', 'integer ac neque.png', '6/20/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (34, 'Homeopathic Womens Libido', 22, 4, 81, '$62.76', 'aenean.png', '5/28/2009');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (35, 'TopCare Cough Relief Sugar Free Cherry Flavor', 30, 1, 81, '$93.18', 'at.jpeg', '8/15/2016');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (36, 'Metronidazole', 14, 3, 97, '$92.13', 'ultrices phasellus.tiff', '12/9/2005');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (37, 'Venofer', 15, 2, 35, '$93.86', 'libero quis orci.jpeg', '2/21/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (38, 'COLGATE', 7, 4, 32, '$54.67', 'duis mattis egestas.tiff', '10/5/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (39, 'LBEL COULEUR LUXE AMPLIFIER XP', 5, 1, 16, '$84.40', 'erat tortor sollicitudin.tiff', '9/16/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (40, 'PLACENTA EX ESSENCE BB', 46, 1, 59, '$76.78', 'augue aliquam.tiff', '7/14/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (41, 'Phenazo', 23, 1, 59, '$88.53', 'quis justo maecenas.png', '1/10/2016');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (42, 'pain relief', 9, 2, 58, '$16.86', 'vulputate elementum nullam.jpeg', '3/7/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (43, 'Plak Smacker', 22, 2, 78, '$44.61', 'ultrices.jpeg', '5/5/1997');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (44, 'ANTIBACTERIAL FOAMING HAND SP LEMONGRASS', 32, 4, 56, '$36.95', 'nulla ultrices aliquet.tiff', '10/25/2001');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (45, 'Isopropyl Rubbing Alcohol With Wintergreen', 6, 1, 42, '$54.59', 'vivamus.tiff', '9/24/2002');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (46, 'infants acetaminophen', 23, 2, 6, '$54.11', 'curae donec.jpeg', '6/22/2008');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (47, 'CLINIMIX', 11, 4, 77, '$39.77', 'auctor.png', '7/7/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (48, 'XtraCare Antibacterial Hand Cleanse', 38, 4, 15, '$17.03', 'curae mauris.tiff', '1/5/2018');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (49, 'Hair Regrowth Treatment for Men', 46, 1, 32, '$10.47', 'luctus et ultrices.jpeg', '7/15/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (50, 'Age Defense BB Cream', 29, 4, 41, '$15.93', 'sollicitudin mi sit.png', '11/24/2001');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (51, 'LEudine Anti-dandruff', 18, 3, 46, '$24.70', 'nisi at nibh.tiff', '10/21/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (52, 'Glipizide and Metformin HCl', 3, 2, 63, '$38.05', 'eget.tiff', '12/20/2009');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (53, 'Antifungal', 48, 4, 91, '$46.62', 'lorem ipsum dolor.jpeg', '7/11/2003');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (54, 'Losortan Potassium', 41, 3, 71, '$50.33', 'sapien.tiff', '12/4/2015');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (55, 'Nafcillin', 1, 2, 8, '$14.19', 'nunc vestibulum ante.png', '11/24/2013');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (56, 'Midazolam Hydrochloride', 5, 3, 50, '$76.09', 'in libero ut.jpeg', '1/20/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (57, 'Levetiracetam', 49, 2, 14, '$14.17', 'odio porttitor.jpeg', '7/19/2005');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (58, 'Amitriptyline Hydrochloride', 32, 2, 75, '$97.86', 'sapien arcu.tiff', '1/27/2003');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (59, 'Amantadine HCl', 27, 4, 100, '$57.22', 'aliquam quis.tiff', '7/15/2000');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (60, 'Total Protrector 15', 32, 1, 26, '$46.43', 'sodales sed tincidunt.jpeg', '7/28/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (61, 'Fever - Infection', 31, 3, 34, '$73.69', 'convallis.tiff', '2/9/2009');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (62, 'ECO 10 Mineral Sun Pro Automatic Brush Type', 28, 4, 93, '$37.89', 'rhoncus aliquam lacus.png', '1/3/2006');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (63, 'good sense allergy', 34, 2, 90, '$24.87', 'donec.gif', '12/10/2011');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (64, 'BenzEFoam Ultra', 35, 4, 63, '$98.97', 'varius.jpeg', '6/9/2004');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (65, 'Olanzapine', 29, 3, 88, '$53.89', 'donec quis.tiff', '12/4/2009');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (66, 'Cloderm', 50, 4, 90, '$88.43', 'dui.jpeg', '10/25/1999');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (67, 'Dexamethasone', 6, 4, 68, '$65.13', 'cursus id.jpeg', '4/9/2003');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (68, 'Velivet', 35, 4, 85, '$28.13', 'at turpis donec.tiff', '8/13/2013');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (69, 'Rocuronium Bromide', 37, 1, 25, '$55.37', 'convallis nunc proin.tiff', '4/3/1997');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (70, 'DawnMist Fluoride', 27, 1, 26, '$24.53', 'nunc vestibulum ante.png', '5/11/2015');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (71, 'FENTANYL', 11, 2, 51, '$97.40', 'quam a odio.tiff', '8/7/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (72, 'Lung Detox', 5, 2, 47, '$33.14', 'eget tempus vel.gif', '11/9/2002');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (73, 'CY BETTER LIPS BALM Humectante para Labios con color FPS 18', 44, 3, 55, '$57.22', 'posuere felis.jpeg', '9/17/2012');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (74, 'Tiger Balm', 47, 1, 33, '$53.02', 'erat id mauris.jpeg', '3/14/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (75, 'Thyro Tonic', 7, 3, 14, '$34.72', 'aliquam convallis.tiff', '1/21/2008');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (76, 'Chloraseptic Warming Sore Throat', 38, 4, 86, '$51.32', 'felis eu.jpeg', '9/10/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (77, 'Bambusa Stibium', 16, 2, 58, '$80.67', 'mauris.tiff', '12/2/2000');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (78, 'LBEL', 24, 4, 80, '$48.22', 'hendrerit at vulputate.tiff', '4/26/2009');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (79, 'Argentum 5', 10, 4, 38, '$69.01', 'ut.jpeg', '8/28/2014');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (80, 'Ranitidine', 50, 3, 26, '$51.94', 'vivamus.jpeg', '10/19/1997');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (81, 'Spironolactone', 29, 3, 29, '$53.58', 'volutpat in.tiff', '6/5/2017');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (82, 'Buckwheat Grain', 30, 4, 45, '$64.34', 'magnis.jpeg', '11/11/2016');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (83, 'Hypertension', 36, 4, 86, '$93.63', 'sed.png', '6/27/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (84, 'Acute Asthma Relief', 20, 3, 13, '$15.26', 'eu orci.tiff', '7/5/2010');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (85, 'Western Water Hemp', 19, 3, 88, '$57.68', 'vestibulum proin eu.tiff', '2/14/2008');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (86, 'Top Medicated', 46, 4, 24, '$31.71', 'donec odio.jpeg', '4/11/2011');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (87, 'Venlafaxine Hydrochloride', 39, 3, 41, '$91.93', 'morbi ut.tiff', '12/17/2007');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (88, 'THYMUS', 20, 3, 99, '$79.70', 'morbi porttitor lorem.png', '2/4/2008');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (89, 'Antibiotic and Pain Relief', 44, 3, 74, '$13.21', 'quisque.jpeg', '1/17/2001');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (90, 'Complete Beauty', 28, 1, 84, '$36.87', 'congue eget.tiff', '3/28/2008');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (91, 'SENSAI FLUID FINISH FF205', 2, 4, 25, '$80.69', 'magnis dis.gif', '11/2/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (92, 'Cyclobenzaprine Hydrochloride', 44, 2, 77, '$16.57', 'blandit.tiff', '6/29/1998');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (93, 'Proactiv Solution', 37, 3, 81, '$87.66', 'nulla ac enim.gif', '6/2/2002');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (94, 'Ranitidine', 5, 2, 38, '$73.67', 'lacus morbi.tiff', '9/12/2000');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (95, 'Isopropyl Alcohol', 7, 3, 45, '$60.04', 'donec pharetra.jpeg', '3/22/2005');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (96, 'SEA-CALM', 7, 3, 40, '$15.94', 'amet.jpeg', '12/17/2010');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (97, 'Quenalin Cough', 39, 4, 7, '$36.03', 'massa.tiff', '6/27/1997');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (98, 'Lens Scale Pollen', 35, 1, 10, '$33.36', 'magnis.gif', '11/5/2016');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (99, 'Zyvox', 18, 3, 93, '$47.69', 'mauris enim leo.tiff', '7/10/1999');
insert into SAN_PHAM (MaSP, TenSP, MaLoaiSP, DVT, SoLuongCon, DonGia, Images, Ngaycapnhat) values (100, 'Phenytoin Sodium', 24, 4, 64, '$55.22', 'convallis.png', '5/11/2017');
