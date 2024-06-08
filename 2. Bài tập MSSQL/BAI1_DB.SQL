/* Tạo và sử dụng database */
USE MASTER
CREATE DATABASE BAI1_DB
USE BAI1_DB

/* Câu 1: Viết câu lệnh SQL tạo 2 bảng trên */
CREATE TABLE T01_SINHVIEN
(
	MaSinhVien nvarchar(6) NOT NULL,
	HoTenSinhVien nvarchar(100),
	GioiTinh nvarchar(10),
	NgaySinh smalldatetime,
	MaKhoa nvarchar(5)
)

CREATE TABLE T02_KHOA
(
	MaKhoa nvarchar(5) NOT NULL,
	TenKhoa nvarchar(50)
)


/* Tạo khóa chính cho các table */
ALTER TABLE T01_SINHVIEN
ADD CONSTRAINT T01_SINHVIEN_PK
PRIMARY KEY (MaSinhVien)

ALTER TABLE T02_KHOA
ADD CONSTRAINT T02_KHOA_PK
PRIMARY KEY (MaKhoa)


/* Tạo khóa ngoại cho các table */
ALTER TABLE T01_SINHVIEN
ADD CONSTRAINT T01_SINHVIEN_FK
FOREIGN KEY (MaKhoa)
REFERENCES T02_KHOA (MaKhoa)


/* Câu 2: Thêm các thuộc tính DiaChi, HoKhau 
có kiểu dữ liệu chuỗi với độ dài 100 ký tự vào bảng SINHVIEN */
ALTER TABLE T01_SINHVIEN
ADD DiaChi nvarchar(100)

ALTER TABLE T01_SINHVIEN
ADD HoKhau nvarchar(100)


/* Câu 3: Xóa thuộc tính HoKhau trong bảng SINHVIEN */
ALTER TABLE T01_SINHVIEN
DROP COLUMN HoKhau


/* Câu 4: Thêm dữ liệu sau vào bảng KHOA:
		Mã khoa: HTTT
		Tên khoa: Hệ thống thông tin */
INSERT INTO T02_KHOA
Values('HTTT','He thong thong tin')


/* Câu 5:Thêm dữ liệu sau vào bảng SINHVIEN:
		Mã sinh viên: 100001
		Họ và tên sinh viên: Hoàng Kim Chi
		Giới tính: Nữ
		Ngày sinh: 12/09/1990
		Mã khoa: HTTT
		Địa chỉ: 84 Cư Xá Lữ Gia */
INSERT INTO T01_SINHVIEN
Values('10001','Hoang Kim Chi','Nu','1990/09/12','HTTT','84 Cu Xa Lu Gia')


/* Câu 6: Xóa bảng KHOA */
ALTER TABLE T01_SINHVIEN
DROP CONSTRAINT T01_SINHVIEN_FK /* Phải drop FK trước */

DROP TABLE T02_KHOA /* Rồi mới drop table T02_KHOA được */





