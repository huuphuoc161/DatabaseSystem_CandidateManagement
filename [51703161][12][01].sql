use master
create database GiongHatViet
go
use GiongHatViet
go

--1
create table Nguoi
(
	ID varchar(12) not null,
	CMND int not null,
	Ten nvarchar(50) not null,
	GioiTinh bit not null,
	NgaySinh date not null,
	NoiSinh nvarchar(50) not null,
	primary key(ID)
)

--2
create table ThiSinh
(
	MaThiSinh varchar(12) not null,
	DiaChi nvarchar(50) not null,
	DienThoai char(15) not null,
	GioiThieu nvarchar(max) not null,
	primary key(MaThiSinh)
)

--3
create table NgheSy
(
	MaNgheSy varchar(12) not null,
	NgheDanh nvarchar(50) not null,
	ThanhTich varchar(max) not null,
	MCFlag bit not null, 
	CSFlag bit not null,
	NSFlag bit not null,
	primary key(MaNgheSy)
)

--4
create table ChuongTrinhMCDan
(
	MaMC varchar(12) not null,
	CTDaDan nvarchar(200) not null,
	primary key(MaMC,CTDaDan)
)

--5
create table AlbumCS
(
	MaCaSy varchar(12) not null,
	Album nvarchar(50) not null,
	primary key(MaCaSy,Album)
)

--6
create table BaiHat
(
	MaBaiHat char(8) not null,
	TuaBaiHat nvarchar(100) not null,
	primary key(MaBaiHat)
)

--7
create table Theloai
(
	MaTheLoai char(5),
	TenTheLoai nvarchar(50) not null unique,
	primary key(MaTheLoai)
)

--8
create table BaiHatThuocTheLoai
(
	MaBaiHat char(8) not null,
	MaTheLoai char(5) not null
	primary key(MaBaiHat,MaTheLoai)
)

--9
create table NhacSySangTac
(
	MaNhacSy varchar(12) not null,
	MaBaiHat char(8) not null,
	ThongTinSangTac char(1) not null,
	primary key(MaNhacSy,MaBaiHat)
)

--10
create table TinhThanh
(
	MaTinhThanh char(4) not null,
	TenTinhThanh char(50) not null unique,
	primary key(MaTinhThanh)
)

--11
create table NhaSanXuat
(
	MaNSX char(6) not null,
	TenNSX nvarchar(50) not null,
	primary key(MaNSX) 
)

--12
create table KenhTruyenHinh
(
	MaKenh char(5) not null,
	TenKenh char(15) not null,
	primary key(MaKenh)
)

--13
create table MuaThi
(
	MaMuaThi char(6) not null,
	NgayBatDau date not null,
	NgayKetThuc date not null, 
	GiaiThuong varchar(max) not null,
	DDNhaHat nvarchar(50) not null,
	DDBanKet nvarchar(50) not null,
	DDGala nvarchar(50) not null,
	MaGiamDoc nvarchar(12) not null,
	MaGK1 nvarchar(12) not null,
	MaGK2 nvarchar(12) not null,
	MaGK3 nvarchar(12) not null,
	MaMC nvarchar(12) not null,
	primary key(MaMuaThi)
)

--14
create table GiuBanQuyenMuaThi
(
	MaMuaThi char(6) not null,
	MaNSX char(6) not null,
	primary key(MaMuaThi,MaNSX)
)

--15
create table PhatSong
(
	MaMuaThi char(6) not null, 
	MaKenh char(5) not null,
	ThongTinPhatSong char(1) not null,	
	primary key(MaMuaThi,MaKenh)
)


--16
create table VongThi
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	TenVongThi nchar(50) not null,
	ThoiGianBatDau date,
	ThoiGianKetthuc date,
	LoaivongThi char(1) ,
	primary key(STTVongThi,MaMuaThi)
)

--17
create table ThiSinhThamGiaVongThi
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaThiSinh varchar(12) not null,
	KetQua char(1) not null,
	primary key(STTVongThi,MaMuaThi,MaThiSinh)
)

--18
create table VongThuGiong
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaTinhThanh char(4) not null,
	DiaDiem nchar(150) not null,
	primary key(STTVongThi,MaMuaThi)
)

--19
create table ThiSinhThamGiaVongThuGiong
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaThiSinh varchar(12) not null,
	GK1 char(1) not null,
	GK2 char(1) not null,
	GK3 char(1) not null,
	primary key(STTVongThi,MaMuaThi,MaThiSinh)
)

--20
create table ThiSinhHatTaiVongThuGiong
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaThiSinh varchar(12) not null,
	MaBaiHat char(8) not null,
	primary key(STTVongThi,MaMuaThi,MaThiSinh,MaBaiHat)
)

--21
create table VongNhaHat
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	HatNhomFlag bit not null,
	primary key(STTVongThi,MaMuaThi)
)

--22
create table ThiSinhHatTaiVongNhaHat
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaThiSinh varchar(12) not null,
	MaBaiHat char(8) not null,
	primary key(STTVongThi,MaMuaThi,MaThiSinh,MaBaiHat)
)

--23
create table NhomCa
(
	MaNhom char(8) not null,
	TenNhom nvarchar(50) not null,
	MaThiSinh1 varchar(12) not null unique,
	MaThiSinh2 varchar(12) not null unique,
	MaThiSinh3 varchar(12) not null unique, 
	MaThiSinh4 varchar(12) not null unique,
	primary key(MaNhom)
)

--24
create table NhomCaHatBaiHat
(
	MaNhom char(8) not null,
	MaBaiHat char(8) not null,
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	primary key(MaNhom,MaBaiHat)
)

--25
create table VongBanKet
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	Nam_Nu char(1) not null,
	primary key(STTVongThi,MaMuaThi)
)

--26
create table ThiSinhThamGiaVongBanKet
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaThiSinh varchar(12) not null,
	MSBC char(1) not null,
	TongSoTinNhan int not null,
	primary key(STTVongThi,MaMuaThi,MaThiSinh)
)

--27
create table ThiSinhHatTaiVongBanKet
(
	MaThiSinh varchar(12) not null,
	MaBaiHat char(8) not null unique,
	STTVongThi int  not null,
	MaMuaThi char(6) not null unique,
	primary key(MaThiSinh,MaBaiHat)
)

--28
create table VongGala
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	ChuDe nchar(100) not null unique,
	MaNguoiHuongDan varchar(12) not null,
	HatDoiFlag bit not null,
	primary key(STTVongThi,MaMuaThi)
)

--29
create table ThiSinhThamGiaVongGala
(
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	MaThiSinh varchar(12) not null,
	MSBC char(1) not null,
	TongSoTinNhan int not null,
	primary key(STTVongThi,MaMuaThi,MaThiSinh)
)
--30
create table ThiSinhHatTaiVongGala
(
	MaThiSinh varchar(12) not null,
	MaBaiHat char(8) not null,
	STTVongThi int  not null,
	MaMuaThi char(6) not null,
	primary key(MaThiSinh,MaBaiHat)
)

--2
alter table ThiSinh add constraint ThiSinh_Nguoi foreign key(MaThiSinh) references Nguoi(ID)
--3
alter table NgheSy add constraint NgheSy_Nguoi foreign key(MaNgheSy) references Nguoi(ID)
--4
alter table ChuongTrinhMCDan add constraint MC_NgheSy foreign key(MaMC) references NgheSy(MaNgheSy)
--5
alter table AlbumCS add constraint Album_NgheSy foreign key(MaCaSy) references NgheSy(MaNgheSy)
--8
alter table BaiHatThuocTheLoai add constraint BHThuocTL_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)
alter table BaiHatThuocTheLoai add constraint BHThuocTL_TheLoai foreign key(MaTheLoai) references TheLoai(MaTheLoai)
--9
alter table NhacSySangTac add constraint NhacSy_NgheSy foreign key(MaNhacSy) references NgheSy(MaNgheSy)
alter table NhacSySangTac add constraint NhacSy_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)
--14 khoa 14b co van de
alter table GiuBanQuyenMuaThi add constraint GiuBanQuyenMuaThi_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
alter table GiuBanQuyenMuaThi add constraint GiuBanQuyenMuaThi_NhaSanXuat foreign key(MaNSX) references NhaSanXuat(MaNSX)
--15
alter table PhatSong add constraint PhatSong_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
alter table PhatSong add constraint PhatSong_MaKenh foreign key(MaKenh) references KenhTruyenHinh(MaKenh)
--16
alter table VongThi add constraint VongThi_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
--17
alter table ThiSinhThamGiaVongThi add constraint TSVongThi_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
alter table ThiSinhThamGiaVongThi add constraint TSVongThi_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
--18
alter table VongThuGiong add constraint VongThuGiong_VongThi foreign key(STTVongThi,MaMuaThi) references VongThi(STTVongThi,MaMuaThi)
alter table VongThuGiong add constraint VongThuGiong_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
--19
alter table ThiSinhThamGiaVongThuGiong add constraint TSVongThuGiong_VongThuGiong foreign key(STTVongThi,MaMuaThi) references VongThuGiong(STTVongThi,MaMuaThi)
alter table ThiSinhThamGiaVongThuGiong add constraint TSVongThuGiong_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
--20 
alter table ThiSinhHatTaiVongThuGiong add constraint TSHatVongThuGiong_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
alter table ThiSinhHatTaiVongThuGiong add constraint TSHatVongThuGiong_VongThuGiong foreign key(STTVongThi,MaMuaThi) references VongThuGiong(STTVongThi,MaMuaThi)
alter table ThiSinhHatTaiVongThuGiong add constraint TSHatVongThuGiong_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)
--21
alter table VongNhaHat add constraint VongNhaHat_VongThi foreign key(STTVongThi,MaMuaThi) references VongThi(STTVongThi,MaMuaThi)
--22
alter table ThiSinhHatTaiVongNhaHat add constraint TSVongNhaHat_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
alter table ThiSinhHatTaiVongNhaHat add constraint TSVongNhaHat_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)
alter table ThiSinhHatTaiVongNhaHat add constraint TSVongNhaHat_VongNhaHat foreign key(STTVongThi,MaMuaThi) references VongNhaHat(STTVongThi,MaMuaThi)

--24
alter table NhomCaHatBaiHat add constraint NhomCaHatBaiHat_VongNhaHat foreign key(STTVongThi,MaMuaThi) references VongNhaHat(STTVongThi,MaMuaThi)
alter table NhomCaHatBaiHat add constraint NhomCaHatBaiHat_NhomCa foreign key(MaNhom) references NhomCa(MaNhom)
alter table NhomCaHatBaiHat add constraint NhomCaHatBaiHat_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)
--25
alter table VongBanKet add constraint VongBanKet_VongThi foreign key(STTVongThi,MaMuaThi) references VongThi(STTVongThi,MaMuaThi)
alter table VongBanKet add constraint VongBanKet_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
--26
alter table ThiSinhThamGiaVongBanKet add constraint TSVongBanKet_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
alter table ThiSinhThamGiaVongBanKet add constraint TSVongBanKet_VongBanKet foreign key(STTVongThi,MaMuaThi) references VongBanKet(STTVongThi,MaMuaThi)
--27
alter table ThiSinhHatTaiVongBanKet add constraint TSHatVongBanKet_VongBanKet foreign key(STTVongThi,MaMuaThi) references VongBanKet(STTVongThi,MaMuaThi)
alter table ThiSinhHatTaiVongBanKet add constraint TSHatVongBanKet_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
alter table ThiSinhHatTaiVongBanKet add constraint TSHatVongBanKet_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)
--28
alter table VongGala add constraint VongGala_NgheSy foreign key(MaNguoiHuongDan) references NgheSy(MaNgheSy)
alter table VongGala add constraint VongGala_VongThi foreign key(STTVongThi,MaMuaThi) references VongThi(STTVongThi,MaMuaThi)
alter table VongGala add constraint VongGala_MuaThi foreign key(MaMuaThi) references MuaThi(MaMuaThi)
--29
alter table ThiSinhThamGiaVongGala add constraint TSVongGala_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
alter table ThiSinhThamGiaVongGala add constraint TSVongGala_VongGala foreign key(STTVongThi,MaMuaThi) references VongGala(STTVongThi,MaMuaThi)
--30
alter table ThiSinhHatTaiVongGala add constraint TSHatVongGala_VongGala foreign key(STTVongThi,MaMuaThi) references VongGala(STTVongThi,MaMuaThi)
alter table ThiSinhHatTaiVongGala add constraint TSHatVongGala_ThiSinh foreign key(MaThiSinh) references ThiSinh(MaThiSinh)
alter table ThiSinhHatTaiVongGala add constraint TSHatVongGala_BaiHat foreign key(MaBaiHat) references BaiHat(MaBaiHat)

insert into Nguoi values 
--00
('TS2012000001',00001111,N'Phạm',0,'12/12/1992',N'HỒ CHÍ MINH'),
('TS2014000001',00001111,N'Phạm',0,'11/12/1995',N'HỒ CHÍ MINH'),
('TS2014000002',00001112,N'Hoàng',0,'03/29/1990',N'HUẾ'),
('TS2014000003',00001113,N'Hương',1,'05/01/1990',N'QUẢNG NINH'),
('TS2012000003',00001113,N'Hương',1,'05/01/1990',N'QUẢNG NINH'),
('TS2014000004',00001114,N'Ly',1,'12/05/1999',N'BẾN TRE'),
--11
('TS2014000011',00111111,N'Tiến',0,'12/28/1995',N'HỒ CHÍ MINH'),
('TS2012000011',00111111,N'Tiến',0,'12/28/1995',N'HỒ CHÍ MINH'),
('TS2014000012',00111112,N'Linh',0,'12/03/1990',N'HUẾ'),
('TS2014000013',00111113,N'Phương',1,'08/01/1990',N'QUẢNG NINH'),
('TS2014000014',00111114,N'Thùy',1,'12/05/1999',N'BẾN TRE'),
--22
('TS2014000021',00221111,N'Công',0,'12/11/1995',N'HỒ CHÍ MINH'),
('TS2014000022',00221112,N'Hà',1,'12/05/1990',N'HUẾ'),
('TS2014000023',00221113,N'Nghĩa',0,'06/06/1990',N'QUẢNG NINH'),
('TS2014000024',00221114,N'Lan',1,'12/07/1999',N'BẾN TRE'),
--33
('TS2014000031',00331111,N'Tú',0,'11/10/1995',N'HỒ CHÍ MINH'),
('TS2014000032',00331112,N'Sang',0,'11/05/1990',N'HUẾ'),
('TS2014000033',00331113,N'Thanh',1,'05/05/1990',N'QUẢNG NINH'),
('TS2012000033',00331113,N'Thanh',1,'05/05/1990',N'QUẢNG NINH'),
('TS2014000034',00331114,N'Liên',1,'12/05/1999',N'BẾN TRE'),
--NS
('NS000001',00009991,N'Sơn',0,'01/01/1970',N'DAK NÔNG'),
('NS000002',00009992,N'Sa',0,'09/05/1962',N'HÀ NỘI'),
('NS000003',00009993,N'Trí',0,'12/5/1962',N'HẢI PHÒNG'),
('NS000004',00009994,N'Tiến',0,'12/05/1962',N'HẢI DƯƠNG'),
--CS
('NS000005',00009995,N'Anh',1,'09/02/1980',N'HỒ CHÍ MINH'),
('NS000006',00009996,N'Huy',0,'05/12/1980',N'BÌNH THUẬN'),
('NS000007',00009997,N'Thy',1,'02/03/1980',N'KHÁNH HÒA'),
('NS000008',00009998,N'Thái',0,'05/09/1980',N'PHÚ YÊN'),
--MC
('NS000009',00009999,N'Thịnh',0,'01/10/1969',N'BÌNH ĐỊNH'),
('NS000010',00009980,N'Giang',0,'12/03/1969',N'TRÀ VINH'),
('NS000011',00009981,N'Thành',0,'01/03/1969',N'BÌNH PHƯỚC'),
('NS000012',00009982,N'Trâm',1,'04/07/1969',N'TÂY NGUYÊN')


insert into ThiSinh values
--00
('TS2014000001',N'HỒ CHÍ MINH','0909111122',N'Đã từng tham gia vòng thi 2012 nhưng bị loại ở vòng tứ kết vì vậy năm nay Phạm quyết định thi lại để thỏa đam mê ca hát và muốn mọi người biết đến giọng hát của mình'),
('TS2014000002',N'HUẾ','0909556677',N'Hoàng xuất thân từ một gia đình có truyền thống âm nhạc cho nên rất thích hát và chơi nhạc cụ rất giỏi'),
('TS2014000003',N'QUẢNG NINH','0908223344',N'Hương là một cô gái thích nghe nhạc và hát nhạc ballad vì vậy Hương muốn trình bày những bản nhạc ballad mà mình thích cho mọi người được thưởng thức'),
('TS2014000004',N'BẾN TRE','0928172737',N'Ly sinh ra trong một gia đình nghèo với một giọng hát tuyệt vời từ đó cô muốn trở thành một ca sĩ để giúp đỡ kinh tế gia đình và biến ước mơ thành sự thật'),
--11
('TS2014000011',N'HỒ CHÍ MINH','0905671122',N'Tiến quyết định thi để thỏa đam mê ca hát và muốn mọi người biết đến giọng hát của mình'),
('TS2014000012',N'HUẾ','0905556677',N'Linh rất thích hát và chơi nhạc cụ rất giỏi nên muốn thi'),
('TS2014000013',N'QUẢNG NINH','0922223344',N'Phương muốn mọi người được nghe những bài hát tuyệt vời'),
('TS2014000014',N'BẾN TRE','092833337',N'Thùy có ước mơ là trờ thành một ca sĩ'),
--22
('TS2014000021',N'HỒ CHÍ MINH','0914771122',N'Công quyết định thi để chứng tỏ giọng hát mình có thể chinh phục được mọi người'),
('TS2014000022',N'HUẾ','0905574177',N'Hà rất thích hát và được bô mẹ khích lệ để tham gia cuộc thi'),
('TS2014000023',N'QUẢNG NINH','0879223344',N'Nghĩa muốn trở thành một người nổi tiếng'),
('TS2014000024',N'BẾN TRE','097773337',N'Lan có ước mơ là trờ thành một người có thể hát nhiều thể loại nhạc'),
--33
('TS2014000031',N'HỒ CHÍ MINH','0905258122',N'Tú muốn tấc cả mọi người biết đến giọng hát của mình'),
('TS2014000032',N'HUẾ','0905585277',N'Sang chơi nhạc cụ rất giỏi cà sở hữu giọng ca trầm ấm vì vậy sang muốn truyền giọng hát của mình đến cho mọi người'),
('TS2014000033',N'QUẢNG NINH','02159223344',N'Thanh yêu âm nhạc và muốn sống với âm nhạc trong cuộc đời của mình'),
('TS2014000034',N'BẾN TRE','092951337',N'Liên muốn có được những thử thách mới')

insert into NgheSy values
('NS000001',N'Thái Sơn',N'Giải thưởng cánh diều vàng cống hiến năm 2000',0,0,1),
('NS000002',N'Hoài Sa',N'Nghệ sĩ của năm 2006',0,1,1),
('NS000003',N'Đức Trí',N'Nghệ sĩ của năm 2007',0,0,1),
('NS000004',N'Trần Tiến',N'Nghệ sĩ của năm 1990',0,0,1),
('NS000005',N'Anh Anh',N'Ca sĩ của năm 2012',0,1,0),
('NS000006',N'Kiến Huy',N'Ca sĩ của năm 2010',0,1,0),
('NS000007',N'Thy Thy',N'Ca sĩ của năm 2013',0,1,0),
('NS000008',N'Issac Thái',N'Ca sĩ của năm 2014',0,1,0),
('NS000009',N'Nguyên Thịnh',N'MC của năm 2010',1,1,0),
('NS000010',N'Trường Giang',N'MC của năm 2009',1,0,0),
('NS000011',N'Trấn Thành',N'MC của năm 2008',1,0,0),
('NS000012',N'Ngọc Trâm',N'MC của năm 2005',1,0,0)


insert into ChuongTrinhMCDan values
('NS000009',N'Cánh diều vàng 2000'),
('NS000010',N'Cánh diều vàng 2005'),
('NS000011',N'Giọng hát việt 2012'),
('NS000012',N'Giong hát việt 2010')


insert into AlbumCS values 
('NS000005',N'Tuổi trẻ xưa'),
('NS000006',N'Điều đã quên'),
('NS000007',N'Vẫn còn'),
('NS000008',N'Điều ý Nghĩa')


insert into BaiHat values
('BH000001',N'Thanh xuân'),
('BH000002',N'Quên'),
('BH000003',N'Còn đó'),
('BH000004',N'Điều tuyệt vời'),
('BH000005',N'Chí Phèo'),
('BH000006',N'My Love'),
('BH000007',N'Gần'),
('BH000008',N'Trong sáng'),
('BH000009',N'Hãy đi'),
('BH000010',N'Mùa gặt'),
('BH000011',N'Còn những vết thương'),
('BH000012',N'amazing ')


insert into TheLoai values
('TL001',N'Pop'),
('TL002',N'Ballad'),
('TL003',N'Tuổi Trẻ'),
('TL004',N'ý nghĩa cuộc sống'),
('TL005',N'Rock'),
('TL006',N'Giao Hưởng'),
('TL007',N'Trịnh'),
('TL008',N'Cách mạng')

insert into BaihatThuocTheLoai values
('BH000001','TL002'),
('BH000002','TL002'),
('BH000003','TL003'),
('BH000004','TL004'),
('BH000005','TL002'),
('BH000006','TL002'),
('BH000007','TL001'),
('BH000008','TL004'),
('BH000009','TL006'),
('BH000010','TL004'),
('BH000011','TL005'),
('BH000012','TL008')

insert into NhacSySangTac values
('NS000001','BH000004',3),
('NS000002','BH000001',1),
('NS000003','BH000002',1),
('NS000004','BH000003',2),
('NS000001','BH000005',3),
('NS000002','BH000006',1),
('NS000003','BH000007',1),
('NS000004','BH000008',2),
('NS000001','BH000009',3),
('NS000002','BH000010',1),
('NS000003','BH000011',1),
('NS000004','BH000012',2)

insert into TinhThanh values
('TT01',N'HÀ NỘI'),
('TT02',N'HỒ CHÍ MINH'),
('TT03',N'HUẾ'),
('TT04',N'QUẢNG NINH'),
('TT05',N'BẾN TRE'),
('TT06',N'DAK NÔNG'),
('TT07',N'HẢI PHÒNG'),
('TT08',N'HẢI DƯƠNG'),
('TT09',N'BÌNH THUẬN'),
('TT10',N'KHÁNH HÒA'),
('TT11',N'PHÚ YÊN'),
('TT12',N'BÌNH ĐỊNH'),
('TT13',N'TRÀ VINH'),
('TT14',N'BÌNH PHƯỚC'),
('TT15',N'TÂY NGUYÊN')

insert into NhaSanXuat values
('NSX001',N'Ánh Sáng'),
('NSX002',N'Khởi Nguồn'),
('NSX003',N'Hi Vọng'),
('NSX004',N'Nissi')

insert into KenhTruyenHinh values
('TH001','vtv1'),
('TH002','vtv2'),
('TH003','vtv3'),
('TH004','vtv9')

insert into MuaThi values
('MT1','01/05/2011','09/20/2011',N'100 triệu cho giải nhất, 50 triệu giải nhì, 10 giải ba','Sân Khấu Quận 1','Sân Khấu Trung Tâm Hà Nội','Sân Khấu Quận 1','NS000004','NS000001','NS000002','NS000003','NS000009'),
('MT2','01/05/2012','03/09/2012',N'200 triệu cho giải nhất, 100 triệu giải nhì, 20 giải ba','Sân Khấu Quận 1','Sân Khấu Trung Tâm Hà Nội','Sân Khấu Quận 1','NS000004','NS000001','NS000002','NS000003','NS000010'),
('MT3','01/05/2013','03/09/2013',N'300 triệu cho giải nhất, 150 triệu giải nhì, 30 giải ba','Sân Khấu Quận 1','Sân Khấu Trung Tâm Hà Nội','Sân Khấu Quận 1','NS000004','NS000001','NS000002','NS000003','NS000011'),
('MT4','01/05/2014','03/09/2014',N'400 triệu cho giải nhất, 150 triệu giải nhì, 50giải ba','Sân Khấu Quận 1','Sân Khấu Trung Tâm Hà Nội','Sân Khấu Quận 1','NS000004','NS000001','NS000002','NS000003','NS000012')

insert into GiuBanQuyenMuaThi values
('MT1','NSX001'),
('MT2','NSX003'),
('MT3','NSX004'),
('MT4','NSX004')

insert into PhatSong values
('MT1','TH001',3),
('MT2','TH002',3),
('MT3','TH003',3),
('MT4','TH004',3)

insert into VongThi values
--2011
(1,'MT1',N'Vòng Thử Giọng','01/05/2011','03/06/2011',1),
(2,'MT1',N'Vòng Nhà Hát','01/07/2011','12/08/2011',1),
(3,'MT1',N'Vòng Bán kết','01/09/2011','12/09/2011',1),
(4,'MT1',N'Gala','09/09/2011','03/09/2011',1),
--2012
(1,'MT2',N'Vòng Thử Giọng','01/05/2012','06/06/2012',1),
(2,'MT2',N'Vòng Nhà Hát','01/07/2012','08/08/2012',1),
(3,'MT2',N'Vòng Bán kết','01/09/2012','09/09/2012',1),
(4,'MT2',N'Gala','12/09/2012','03/09/2012',1),
--2013
(1,'MT3',N'Vòng Thử Giọng','01/05/2013','03/06/2013',1),
(2,'MT3',N'Vòng Nhà Hát','01/07/2013','03/08/2013',1),
(3,'MT3',N'Vòng Bán kết','01/09/2013','12/09/2013',1),
(4,'MT3',N'Gala','12/09/2013','03/09/2013',1),
--2014
(1,'MT4',N'Vòng Thử Giọng','01/05/2014','03/06/2014',1),
(2,'MT4',N'Vòng Nhà Hát','01/07/2014','12/08/2014',1),
(3,'MT4',N'Vòng Bán kết','02/09/2014','11/09/2014',1),
(4,'MT4',N'Gala','09/09/2014','11/09/2014',1)

insert into ThiSinhThamGiaVongThi values
(4,'MT4','TS2014000001',1),
(3,'MT4','TS2014000001',1),
(2,'MT4','TS2014000001',1),
(1,'MT4','TS2014000001',1),
(3,'MT4','TS2014000002',-1),
(2,'MT4','TS2014000002',1),
(1,'MT4','TS2014000002',1),
(2,'MT4','TS2014000003',-1),
(1,'MT4','TS2014000003',1),
(1,'MT4','TS2014000004',-1),
--11
(4,'MT4','TS2014000011',1),
(3,'MT4','TS2014000011',1),
(2,'MT4','TS2014000011',1),
(1,'MT4','TS2014000011',1),
(3,'MT4','TS2014000012',-1),
(2,'MT4','TS2014000012',1),
(2,'MT4','TS2014000013',-1),
(1,'MT4','TS2014000013',1),
(1,'MT4','TS2014000014',-1),
--22
(4,'MT4','TS2014000021',1),
(3,'MT4','TS2014000021',1),
(2,'MT4','TS2014000021',1),
(1,'MT4','TS2014000021',1),
(3,'MT4','TS2014000022',-1),
(2,'MT4','TS2014000022',1),
(1,'MT4','TS2014000022',1),
(2,'MT4','TS2014000023',-1),
(1,'MT4','TS2014000023',1),
(1,'MT4','TS2014000024',-1),
--33
(4,'MT4','TS2014000031',1),
(3,'MT4','TS2014000031',1),
(2,'MT4','TS2014000031',1),
(1,'MT4','TS2014000031',1),
(3,'MT4','TS2014000032',-1),
(2,'MT4','TS2014000032',1),
(1,'MT4','TS2014000032',1),
(2,'MT4','TS2014000033',-1),
(1,'MT4','TS2014000033',1),
(1,'MT4','TS2014000034',-1)

insert into VongThuGiong values
(1,'MT4','TT01',N'Sân Khấu Trung Tâm Hà Nội'),
(2,'MT4','TT01',N'Sân khấu quận 1'),
(3,'MT4','TT02',N'Sân Khấu Trung Tâm Hà Nội'),
(4,'MT4','TT01',N'Sân khấu quận 1')

insert into ThiSinhThamGiaVongThuGiong values
(1,'MT4','TS2014000001',1,1,1),
(1,'MT4','TS2014000002',1,1,1),
(1,'MT4','TS2014000003',1,1,1),
(1,'MT4','TS2014000004',0,0,0),
--11
(1,'MT4','TS2014000011',1,1,1),
(1,'MT4','TS2014000012',1,1,1),
(1,'MT4','TS2014000013',1,1,1),
(1,'MT4','TS2014000014',0,0,0),
--22
(1,'MT4','TS2014000021',1,1,1),
(1,'MT4','TS2014000022',1,1,1),
(1,'MT4','TS2014000023',1,1,1),
(1,'MT4','TS2014000024',0,0,0),
--33
(1,'MT4','TS2014000031',1,1,1),
(1,'MT4','TS2014000032',1,1,1),
(1,'MT4','TS2014000033',1,1,1),
(1,'MT4','TS2014000034',0,0,0)

insert into ThiSinhHatTaiVongThuGiong values
(1,'MT4','TS2014000001','BH000001'),
(1,'MT4','TS2014000002','BH000002'),
(1,'MT4','TS2014000003','BH000003'),
(1,'MT4','TS2014000004','BH000004'),
--11
(1,'MT4','TS2014000011','BH000005'),
(1,'MT4','TS2014000012','BH000006'),
(1,'MT4','TS2014000013','BH000007'),
(1,'MT4','TS2014000014','BH000007'),
--22
(1,'MT4','TS2014000021','BH000008'),
(1,'MT4','TS2014000022','BH000008'),
(1,'MT4','TS2014000023','BH000009'),
(1,'MT4','TS2014000024','BH000010'),
--33
(1,'MT4','TS2014000031','BH000011'),
(1,'MT4','TS2014000032','BH000012'),
(1,'MT4','TS2014000033','BH000001'),
(1,'MT4','TS2014000034','BH000004')

insert into VongNhahat values
(1,'MT4',0),
(2,'MT2',0),
(1,'MT3',0),
(2,'MT4',0)

insert into ThiSinhHatTaiVongNhaHat values
(2,'MT4','TS2014000001','BH000004'),
(2,'MT4','TS2014000002','BH000003'),
(2,'MT4','TS2014000003','BH000002'),
--11
(2,'MT4','TS2014000011','BH000005'),
(2,'MT4','TS2014000012','BH000007'),
(2,'MT4','TS2014000013','BH000009'),
--22
(2,'MT4','TS2014000021','BH000007'),
(2,'MT4','TS2014000022','BH000008'),
(2,'MT4','TS2014000023','BH000009'),
--33
(2,'MT4','TS2014000031','BH000010'),
(2,'MT4','TS2014000032','BH000011'),
(2,'MT4','TS2014000033','BH000012')

insert into NhomCa values
('NC201401',N'Buổi Sáng','TS2014000001','TS2014000002','TS2014000003','TS2014000011'),
('NC201402',N'Buổi Chiều','TS2014000012','TS2014000013','TS2014000021','TS2014000022'),
('NC201403',N'Buổi Tối','TS2014000023','TS2014000024','TS2014000031','TS2014000032'),
('NC201201',N'Xin Chào','TS2014000005','TS2014000011','TS2014000033','TS2014000003')

insert into NhomCaHatBaiHat values
('NC201401','BH000001',2,'MT4'),
('NC201402','BH000005',2,'MT4'),
('NC201403','BH000007',2,'MT4'),
('NC201201','BH000009',2,'MT2')

insert into VongBanKet values
(2,'MT4',-1),
(3,'MT4',1),
(1,'MT4',0),
(2,'MT2',-1)

insert into ThiSinhThamGiaVongBanKet values
(3,'MT4','TS2014000001',01,100000),
(3,'MT4','TS2014000002',02,90000),
--11
(3,'MT4','TS2014000011',03,95000),
(3,'MT4','TS2014000012',04,80000),
--22
(3,'MT4','TS2014000021',05,20000),
(3,'MT4','TS2014000022',06,70000),
--33
(3,'MT4','TS2014000031',07,10000),
(3,'MT4','TS2014000032',08,66000)

insert into ThiSinhHatTaiVongBanKet values
('TS2014000001','BH000001',3,'MT4'),
('TS2014000002','BH000002',3,'MT3'),
--11
('TS2014000011','BH000003',3,'MT1'),
('TS2014000012','BH000004',3,'MT2'),
--22
('TS2014000021','BH000005',3,'MT5'),
('TS2014000022','BH000006',3,'MT6'),
--33
('TS2014000031','BH000007',3,'MT7'),
('TS2014000032','BH000008',3,'MT8')

insert into VongGala values
(4,'MT4',N'Ý Nghĩa Cuộc Sống','NS000001',1),
(4,'MT3',N'Tuổi Trẻ','NS000002',0),
(4,'MT2',N'Gia Đình','NS000003',1),
(4,'MT1',N'Tự Chọn','NS000003',0)

insert into ThiSinhThamGiaVongGala values
(4,'MT4','TS2014000001',01,1000000),
(4,'MT4','TS2014000011',02,100000),
(4,'MT4','TS2014000021',03,10000),
(4,'MT4','TS2014000031',04,1000)

insert into ThiSinhHatTaiVongGala values
('TS2014000001','BH000008',4,'MT4'),
('TS2014000011','BH000008',4,'MT4'),
('TS2014000021','BH000010',4,'MT4'),
('TS2014000031','BH000010',4,'MT4')

