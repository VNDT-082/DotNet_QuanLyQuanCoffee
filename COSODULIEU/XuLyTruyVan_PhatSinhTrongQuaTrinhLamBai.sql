select TENDANGNHAP,TENHIENTHI,MATKHAU from TAIKHOAN
where TENDANGNHAP='longlt';

select *from DANHMUCSANPHAM
select *from SANPHAM
select *from PHONG
select * from HOADON

USE Ql_PHONGKARAOKE
alter table SANPHAM
ADD HINHANH VARCHAR(10) NULL

select *from HOADON
where MADANHMUC=1;
insert into HOADON(GIOVAO,MAPHONG,TRANGTHAI,TENKHACHHANG) values
(GETDATE(),2,0,N'');
alter table HOADON
add TENKHACHHANG NVARCHAR(30) NULL
DELETE HOADON
WHERE MAHD=3 OR MAHD=4 OR MAHD=5
SELECT MAX(MAHD)
FROM HOADON

select *from HOADON

select *from CHITIETHOADON

insert into CHITIETHOADON values
(1,6,2,50000,100000)
delete CHITIETHOADON
where MAHD=1 and MASP=6;


insert into CHITIETHOADON values (10,20,1,12000,12000)
select*from SANPHAM
select*from PHONG
select *from HOADON
select *from CHITIETHOADON
select *from TAIKHOAN
update PHONG
set TRANGTHAI=3
where MAPHONG=4;
select *from PHONG where TRANGTHAI <> 3

select*from HOADON

select ct.MAHD,ct.MASP,sp.TENSP,ct.SOLUONG,ct.DONGIA,ct.THANHTIEN
from CHITIETHOADON ct, SANPHAM sp
where ct.MASP=sp.MASP
and ct.MAHD=13

select * from HOADON where MAPHONG=5 and TRANGTHAI=0

update HOADON
set GIORA=GETDATE()
where MAHD=1;
declare @gio time

set @gio= '06:43:38.0770000'
select @gio as'gio'
select LOAIPHONG from PHONG where MAPHONG=5;
select *from LOAIPHONG
SELECT *FROM PHONG
select*from HOADON
alter table HOADON
ADD TONGTIEN FLOAT NULL;

update PHONG
set TRANGTHAI=0 
where MAPHONG=4;
select *from PHONG where TRANGTHAI <> 3

select*from HOADON
SELECT*FROM PHONG
select *from LOAIPHONG

select DVT from SANPHAM group by(DVT);
insert into SANPHAM values
(N'ten',gia,madm,'Hanh','dvt')

update SANPHAM
set TENSP=N'',GIA=0,MADANHMUC=0,HINHANH='',DVT=''
where MASP=1;


delete SANPHAM where MASP=1;

update SANPHAM set TENSP = N'Bia Tiger',GIA = 24000.0000,MADANHMUC = 1,HINHANH = 'h1.png',DVT = 'Lon'
where MASP = 1; 

alter table SANPHAM
alter column Gia float null;
alter table SANPHAM
add SOLUONG INT;
create table PHIEUNHAPHANG
(
	MAPHIEUNHAP INT IDENTITY(1,1),
	NGAYNHAP DATE,


)

select *from CHITIETHOADON where MAHD=20
go

create proc  @mahd int
as
select *from HOADON where MAHD=@mahd
go

create proc XuatChiTietHoaDon
@MaHD int
as

	select hd.MAHD, hd.GIOVAO, hd.GIORA, hd.MAPHONG, hd.TENKHACHHANG, hd.TONGTIEN, hd.TIENPHONG,
	hd.TIENDICHVU, sp.TENSP, sp.MASP ,ct.SOLUONG,ct.DONGIA,ct.THANHTIEN 
	from CHITIETHOADON ct, SANPHAM sp,HOADON hd
	where ct.MASP=sp.MASP
	AND hd.MAHD= @MaHD
	and hd.MAHD=ct.MAHD
go


select*from HOADON
exec ChiTietHoaDon 20
exec XuatHoaDon 20
go
drop trigger QuanLySoLuong
create trigger QuanLySoLuong on CHITIETHOADON
for INSERT, UPDATE
AS
	BEGIN
		DECLARE @MaSP int, @soluong int
		SET @MaSP=(SELECT INSERTED.MASP from inserted)
		SET @soluong=(SELECT INSERTED.SOLUONG from inserted)
		if exists(select*from SANPHAM where SANPHAM.MASP=@MaSP)
			BEGIN
				UPDATE SANPHAM
				SET SOLUONG = SOLUONG- @soluong
				WHERE MASP= @MaSP
			end
		else
			BEGIN
				ROLLBACK TRAN
			end
	end
go




SELECT *FROM SANPHAM


INSERT INTO CHITIETHOADON VALUES
(23,14,10,200000,2000000)
go
drop proc DOANHSOBANHANG
go
CREATE PROC DOANHSOBANHANG
@NgayKiemTra varchar(100)
AS
	SET DATEFORMAT DMY
	SELECT SP.TENSP, SP.MASP, COUNT(SP.MASP) AS 'LUOTMUA',
	SUM(CT.SOLUONG) AS'TONGSOLUONG',SUM(CT.THANHTIEN)AS'TONGTHANHTIEN'
	FROM CHITIETHOADON CT,SANPHAM SP, HOADON HD
	WHERE CT.MASP=SP.MASP 
	AND HD.MAHD=CT.MAHD
	AND HD.GIOVAO >= @NgayKiemTra
	GROUP BY SP.MASP, SP.TENSP, SP.MASP
go
SELECT *FROM CHITIETHOADON
SELECT *FROM HOADON
select *from SANPHAM
select *from SANPHAM where MADANHMUC = 1; 
select MASP,TENSP, GIA, MADANHMUC,HINHANH, DVT, SOLUONG from SANPHAM where MADANHMUC=1
EXEC DOANHSOBANHANG '13/12/2022'
declare @ngay varchar(100)
set @ngay='10/12/2022'
declare @ngaydate date=@ngay

print @ngaydate
SET DATEFORMAT DMY
	SELECT SP.TENSP, SP.MASP, COUNT(SP.MASP) AS 'LUOTMUA',
	SUM(CT.SOLUONG) AS'TONGSOLUONG',SUM(CT.THANHTIEN)AS'TONGTHANHTIEN'
	FROM CHITIETHOADON CT,SANPHAM SP, HOADON HD
	WHERE CT.MASP=SP.MASP 
	AND HD.MAHD=CT.MAHD
	AND HD.GIOVAO >= '11/12/2022'	GROUP BY SP.MASP, SP.TENSP, SP.MASP

select *from CHITIETHOADON where MAHD=22
use Ql_PHONGKARAOKE
select *from SANPHAM
insert into CHITIETHOADON values (22,12,2,80000,160000)
