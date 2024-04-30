
 CREATE DATABASE IF NOT EXISTS Restaurant;

USE Restaurant;

create table NguoiDung(
    ID_ND INT,
    Email varchar(50),
    Matkhau varchar(20),
    VerifyCode varchar(10)DEFAULT NULL,
    Trangthai varchar(10) DEFAULT '',
    Vaitro varchar(20)
);
-- -Th... SQLINES DEMO ***
alter table NguoiDung
    add constraint ND_Email_NNULL check ('Email' is not null),
    add constraint ND_Matkhau_NNULL check ('Matkhau' is not null),
    add constraint ND_Vaitro_Ten check (Vaitro in ('Khach Hang','Nhan Vien','Nhan Vien Kho','Quan Ly'));

-- -Th... SQLINES DEMO ***
alter table NguoiDung
    add constraint NguoiDung_PK PRIMARY KEY (ID_ND);
    
-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table NhanVien(
    ID_NV INT,
    TenNV VARCHAR(50),
    NgayVL DATETIME ,
    SDT VARCHAR(50),
    Chucvu VARCHAR(50),
    ID_ND INT DEFAULT NULL,
    ID_NQL INT,
    Tinhtrang VARCHAR(20)
);
--  SQLINES DEMO ***  bang NhanVien
--  SQLINES DEMO *** int
alter table NhanVien
    add constraint NV_TenNV_NNULL check ('TenNV' is not null),
    add constraint NV_SDT_NNULL check ('SDT' is not null),
    add constraint NV_NgayVL_NNULL check ('NgayVL' is not null),
    add constraint NV_Chucvu_Thuoc check (Chucvu IN ('Phuc vu','Tiep tan','Thu ngan','Bep','Kho','Quan ly')),
    add constraint NV_Tinhtrang_Thuoc check (Tinhtrang IN ('Dang lam viec','Da nghi viec'));

-- The... SQLINES DEMO ***
alter table NhanVien
    add constraint NV_PK PRIMARY KEY (ID_NV);

-- The... SQLINES DEMO ***
ALTER TABLE NhanVien
 ADD CONSTRAINT NV_fk_idND FOREIGN KEY 
 (ID_ND) REFERENCES NguoiDung(ID_ND),
 ADD CONSTRAINT NV_fk_idNQL FOREIGN KEY(ID_NQL) REFERENCES NhanVien(ID_NV);

-- Tao... SQLINES DEMO ***

create table KhachHang(
    ID_KH INT,
    TenKH varchar(50), 
    Ngaythamgia datetime, 
    Doanhso bigint DEFAULT 0, 
    Diemtichluy int DEFAULT 0,
    ID_ND INT
);
--  SQLINES DEMO *** int
alter table KhachHang
    add constraint KH_TenKH_NNULL check ('TenKH' is not null),
    add constraint KH_Ngaythamgia_NNULL check ('Ngaythamgia' is not null),
    add constraint KH_Doanhthu_NNULL check ('Doanhthu' is not null),
    add constraint KH_Diemtichluy_NNULL check ('Diemtichluy' is not null),
    add constraint KH_IDND_NNULL check ('ID_ND' is not null);

-- -Th... SQLINES DEMO ***
alter table KhachHang
    add constraint KhachHang_PK PRIMARY KEY (ID_KH);
    
-- -Th... SQLINES DEMO ***
ALTER TABLE KhachHang
 ADD CONSTRAINT KH_fk_idND FOREIGN KEY 
 (ID_ND) REFERENCES NguoiDung(ID_ND);

-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table MonAn(
    ID_MonAn INT,
    TenMon varchar(50), 
    DonGia int,
    Loai varchar(50),
    TrangThai varchar(30)
);
--  SQLINES DEMO *** int
alter table MonAn
    add constraint MA_TenMon_NNULL check ('TenMon' is not null),
    add constraint MA_DonGia_NNULL check ('Dongia' is not null),
    add constraint MA_Loai_Ten check (Loai in ('Aries','Taurus','Gemini','Cancer','Leo','Virgo'
                                                 ,'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces')),
    add constraint MA_TrangThai_Thuoc check (TrangThai in('Dang kinh doanh','Ngung kinh doanh'));                                             

-- The... SQLINES DEMO ***
alter table MonAn
    add constraint MonAn_PK PRIMARY KEY (ID_MonAn);


-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table Ban(
    ID_Ban INT,
    TenBan varchar(50), 
    Vitri varchar(50), 
    Trangthai varchar(50)
);
--  SQLINES DEMO *** int
alter table Ban
    add constraint Ban_TenBan_NNULL check ('TenBan' is not null),
    add constraint Ban_Vitri_NNULL check ('Vitri' is not null),
    add constraint Ban_Trangthai_Ten check (Trangthai in ('Con trong','Dang dung bua','Da dat truoc'));


-- The... SQLINES DEMO ***
alter table Ban
    add constraint Ban_PK PRIMARY KEY (ID_Ban);



-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table Voucher(
    Code_Voucher varchar(10),
    Mota varchar(50),
    Phantram smallint,
    LoaiMA varchar(50),
    SoLuong smallint,
    Diem int
);
--  SQLINES DEMO *** int
alter table Voucher
    add constraint V_Code_NNULL check ('Code_Voucher' is not null),
    add constraint V_Mota_NNULL check ('Mota' is not null),
    add constraint V_Phantram_NNULL check (Phantram > 0 AND Phantram <= 100),
    add constraint V_LoaiMA_Thuoc check (LoaiMA in ('All','Aries','Taurus','Gemini','Cancer','Leo','Virgo'
                                                 ,'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces'));

-- -Th... SQLINES DEMO ***
alter table Voucher
    add constraint Voucher_PK PRIMARY KEY (Code_Voucher);
    
-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***

-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table HoaDon(
    ID_HoaDon INT,
    ID_KH int,
    ID_Ban int,
    NgayHD datetime,
    TienMonAn int,
    Code_Voucher varchar(10),
    TienGiam int,
    Tongtien bigint,
    Trangthai varchar(50)
);

--  SQLINES DEMO *** int
alter table HoaDon
    add constraint HD_NgayHD_NNULL check ('TenMon' is not null),
    add constraint HD_TrangThai check (Trangthai in ('Chua thanh toan','Da thanh toan'));

-- The... SQLINES DEMO ***
alter table HoaDon
    add constraint HD_PK PRIMARY KEY (ID_HoaDon);

ALTER TABLE HoaDon
 ADD CONSTRAINT HD_fk_idKH FOREIGN KEY 
 (ID_KH) REFERENCES KhachHang(ID_KH),
 ADD CONSTRAINT HD_fk_idBan FOREIGN KEY(ID_Ban) REFERENCES Ban(ID_Ban);
 

-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table CTHD(
    ID_HoaDon INT,
    ID_MonAn int,
    SoLuong smallint,
    Thanhtien bigint
);

--  SQLINES DEMO *** int
alter table CTHD
    add constraint CTHD_SoLuong_NNULL check ('SoLuong' is not null);

-- The... SQLINES DEMO ***
alter table CTHD
    add constraint CTHD_PK PRIMARY KEY (ID_HoaDon,ID_MonAn);

ALTER TABLE CTHD
 ADD CONSTRAINT CTHD_fk_idHD FOREIGN KEY 
 (ID_HoaDon) REFERENCES HoaDon(ID_HoaDon),
 ADD CONSTRAINT CTHD_fk_idMonAn FOREIGN KEY(ID_MonAn) REFERENCES MonAn(ID_MonAn);

 
-- Tao... SQLINES DEMO ***

create table NguyenLieu(
    ID_NL INT,
    TenNL VARCHAR(50), 
    Dongia INT, 
    Donvitinh VARCHAR(50)
);
--  SQLINES DEMO *** int
alter table NguyenLieu
    add constraint NL_TenNL_NNULL check ('TenNL' is not null),
    add constraint NL_Dongia_NNULL check ('Dongia' is not null),
    add constraint NL_DVT_Thuoc check (Donvitinh in ('g','kg','ml','l'));

-- The... SQLINES DEMO ***
alter table NguyenLieu
    add constraint NL_PK PRIMARY KEY (ID_NL);

-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table Kho(
    ID_NL INT,
    SLTon SMALLINT DEFAULT 0
);
--  SQLINES DEMO *** int


-- The... SQLINES DEMO ***
ALTER TABLE Kho
    ADD CONSTRAINT Kho_pk PRIMARY KEY (ID_NL);

-- The... SQLINES DEMO ***
ALTER TABLE Kho
 ADD CONSTRAINT Kho_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);


create table PhieuNK(
    ID_NK INT,
    ID_NV int,
    NgayNK datetime,
    Tongtien bigint DEFAULT 0
);

--  SQLINES DEMO *** int
alter table PhieuNK
    add constraint PNK_NgayNK_NNULL check ('NgayNK' is not null);

-- The... SQLINES DEMO ***
alter table PhieuNK
    add constraint PNK_PK PRIMARY KEY (ID_NK);

ALTER TABLE PhieuNK
 ADD CONSTRAINT PNK_fk_idNV FOREIGN KEY 
 (ID_NV) REFERENCES NhanVien(ID_NV);



create table CTNK(
    ID_NK INT,
    ID_NL int,
    SoLuong smallint,
    Thanhtien bigint
);

--  SQLINES DEMO *** int
alter table CTNK
    add constraint CTNK_SL_NNULL check ('SoLuong' is not null);

-- The... SQLINES DEMO ***
alter table CTNK
    add constraint CTNK_PK PRIMARY KEY (ID_NK,ID_NL);
    
-- The... SQLINES DEMO ***
ALTER TABLE CTNK
 ADD CONSTRAINT CTNK_fk_idNK FOREIGN KEY 
 (ID_NK) REFERENCES PhieuNK(ID_NK),
 ADD CONSTRAINT CTNK_fk_idNL FOREIGN KEY(ID_NL) REFERENCES NguyenLieu(ID_NL);


-- Tao... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table PhieuXK(
    ID_XK INT,
    ID_NV int,
    NgayXK datetime
);

--  SQLINES DEMO *** int
alter table PhieuXK
    add constraint PXK_NgayXK_NNULL check ('NgayXK' is not null);

-- The... SQLINES DEMO ***
alter table PhieuXK
    add constraint PXK_PK PRIMARY KEY (ID_XK);

ALTER TABLE PhieuXK
 ADD CONSTRAINT PXK_fk_idNV FOREIGN KEY 
 (ID_NV) REFERENCES NhanVien(ID_NV);


-- The... SQLINES DEMO ***
-- dro... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
create table CTXK(
    ID_XK INT,
    ID_NL int,
    SoLuong smallint
);

--  SQLINES DEMO *** int
alter table CTXK
    add constraint CTXK_SL_NNULL check ('SoLuong' is not null);

-- The... SQLINES DEMO ***
alter table CTXK
    add constraint CTXK_PK PRIMARY KEY (ID_XK,ID_NL);

-- The... SQLINES DEMO ***
ALTER TABLE CTXK
 ADD CONSTRAINT CTNK_fk_idXK FOREIGN KEY 
 (ID_XK) REFERENCES PhieuXK(ID_XK),
 ADD CONSTRAINT CTXK_fk_idNL FOREIGN KEY(ID_NL) REFERENCES NguyenLieu(ID_NL);


-- - T... SQLINES DEMO ***

--  KH chi duoc co toi da mot hoa don co trang thai Chua thanh toan

DROP TRIGGER IF EXISTS Tg_SLHD_CTT;
DELIMITER //
CREATE TRIGGER Tg_SLHD_CTT_INSERT
BEFORE INSERT ON HoaDon
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*)
    FROM HoaDon
    WHERE ID_KH = NEW.ID_KH AND TrangThai ='Chua thanh toan') > 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Moi khach hang chi duoc co toi da mot hoa don co trang thai chua thanh toan';
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Tg_SLHD_CTT_UPDATE
BEFORE UPDATE ON HoaDon
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*)
    FROM HoaDon
    WHERE ID_KH = NEW.ID_KH AND TrangThai ='Chua thanh toan') > 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Moi khach hang chi duoc co toi da mot hoa don co trang thai chua thanh toan';
    END IF;
END//
DELIMITER ;


-- Trigger Thanh tien o CTHD bang SoLuong x Dongia cua mon an do

DROP TRIGGER IF EXISTS Tg_CTHD_Thanhtien;

DELIMITER //
CREATE TRIGGER Tg_CTHD_Thanhtien_insert
BEFORE INSERT ON CTHD
FOR EACH ROW
BEGIN
    DECLARE gia FLOAT;
    SELECT DonGia INTO gia FROM MonAn WHERE MonAn.ID_MonAn = NEW.ID_MonAn;
    SET NEW.ThanhTien = NEW.SoLuong * gia;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Tg_CTHD_Thanhtien_update
BEFORE UPDATE ON CTHD
FOR EACH ROW
BEGIN
    DECLARE gia FLOAT;
    SELECT DonGia INTO gia FROM MonAn WHERE MonAn.ID_MonAn = NEW.ID_MonAn;
    SET NEW.ThanhTien = NEW.SoLuong * gia;
END //
DELIMITER ;


-- Trigger Tien mon an o Hoa Don bang tong thanh tien o CTHD

DROP TRIGGER IF EXISTS Tg_HD_TienMonAn_Insert;
DELIMITER //
CREATE TRIGGER Tg_HD_TienMonAn_Insert
AFTER INSERT ON CTHD
FOR EACH ROW
BEGIN    
    UPDATE HoaDon SET TienMonAn = TienMonAn + NEW.ThanhTien WHERE HoaDon.ID_HoaDon=NEW.ID_HoaDon;
END;
//
DELIMITER ;

-- Trigger for UPDATE operations
DROP TRIGGER IF EXISTS Tg_HD_TienMonAn_Update;
DELIMITER //
CREATE TRIGGER Tg_HD_TienMonAn_Update
AFTER UPDATE ON CTHD
FOR EACH ROW
BEGIN   
    UPDATE HoaDon SET TienMonAn = TienMonAn + NEW.ThanhTien - OLD.ThanhTien WHERE HoaDon.ID_HoaDon=NEW.ID_HoaDon;
END;
//
DELIMITER ;

-- Trigger for DELETE operations
DROP TRIGGER IF EXISTS Tg_HD_TienMonAn_Delete;
DELIMITER //
CREATE TRIGGER Tg_HD_TienMonAn_Delete
AFTER DELETE ON CTHD
FOR EACH ROW
BEGIN
    UPDATE HoaDon SET TienMonAn = TienMonAn - OLD.ThanhTien WHERE HoaDon.ID_HoaDon=OLD.ID_HoaDon;
END;
//
DELIMITER ;


--  Trigger Tien giam o Hoa Don = tong thanh tien cua mon An duoc giam  x Phantram

DROP TRIGGER IF EXISTS Tg_HD_TienGiam_insert;
DELIMITER //
CREATE TRIGGER Tg_HD_TienGiam_insert
AFTER INSERT ON CTHD
FOR EACH ROW
BEGIN
    DECLARE v_code VARCHAR(4000);
    DECLARE v_loaiMA VARCHAR(4000);
    DECLARE MA_Loai VARCHAR(4000);

    SET @v_code = (SELECT HoaDon.Code_Voucher FROM HoaDon WHERE ID_HoaDon=NEW.ID_HoaDon);
    SET @v_loaiMA = (SELECT Voucher.LoaiMA FROM Voucher, HoaDon WHERE Voucher.Code_Voucher = HoaDon.Code_Voucher AND HoaDon.ID_HoaDon=NEW.ID_HoaDon);
    SET @MA_Loai = (SELECT Loai FROM MonAn WHERE ID_MonAn = NEW.ID_MonAn);

    IF @v_code IS NOT NULL THEN
        IF @v_loaiMA = 'All' OR @v_loaiMA = @MA_Loai THEN
            UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(NEW.ThanhTien,@v_code) WHERE HoaDon.ID_HoaDon=NEW.ID_HoaDon;
        END IF;
    END IF;
END
//
DELIMITER ;
--
DELIMITER //
CREATE TRIGGER Tg_HD_TienGiam_update
AFTER UPDATE ON CTHD
FOR EACH ROW
BEGIN
    DECLARE v_code VARCHAR(4000);
    DECLARE v_loaiMA VARCHAR(4000);
    DECLARE MA_Loai VARCHAR(4000);

    SET @v_code = (SELECT HoaDon.Code_Voucher FROM HoaDon WHERE ID_HoaDon=NEW.ID_HoaDon);
    SET @v_loaiMA = (SELECT Voucher.LoaiMA FROM Voucher, HoaDon WHERE Voucher.Code_Voucher = HoaDon.Code_Voucher AND HoaDon.ID_HoaDon=NEW.ID_HoaDon);
    SET @MA_Loai = (SELECT Loai FROM MonAn WHERE ID_MonAn = NEW.ID_MonAn);

    IF @v_code IS NOT NULL THEN
        IF @v_loaiMA = 'All' OR @v_loaiMA = @MA_Loai THEN
            UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(NEW.ThanhTien,@v_code) WHERE HoaDon.ID_HoaDon=NEW.ID_HoaDon;
        END IF;
    END IF;
END
//
DELIMITER ;

--

DELIMITER //
CREATE TRIGGER Tg_HD_TienGiam_delete
AFTER DELETE ON CTHD
FOR EACH ROW
BEGIN
    DECLARE v_code VARCHAR(4000);
    DECLARE v_loaiMA VARCHAR(4000);
    DECLARE MA_Loai VARCHAR(4000);

    SET @v_code = (SELECT HoaDon.Code_Voucher FROM HoaDon WHERE ID_HoaDon=NEW.ID_HoaDon);
    SET @v_loaiMA = (SELECT Voucher.LoaiMA FROM Voucher, HoaDon WHERE Voucher.Code_Voucher = HoaDon.Code_Voucher AND HoaDon.ID_HoaDon=NEW.ID_HoaDon);
    SET @MA_Loai = (SELECT Loai FROM MonAn WHERE ID_MonAn = NEW.ID_MonAn);

    IF @v_code IS NOT NULL THEN
        IF @v_loaiMA = 'All' OR @v_loaiMA = @MA_Loai THEN
            UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(NEW.ThanhTien,@v_code) WHERE HoaDon.ID_HoaDon=NEW.ID_HoaDon;
        END IF;
    END IF;
END
//
DELIMITER ;




-- Tong tien o Hoa Don = Tien mon an - Tien giam

DROP TRIGGER IF EXISTS Tg_HD_Tongtien;

DELIMITER //
CREATE TRIGGER Tg_HD_Tongtien_insert
AFTER INSERT ON HoaDon
FOR EACH ROW
    BEGIN
        IF NEW.TienMonAn <> OLD.TienMonAn OR NEW.TienGiam <> OLD.TienGiam THEN
            UPDATE HoaDon SET Tongtien = NEW.TienMonAn - NEW.TienGiam WHERE ID_HoaDon= NEW.ID_HoaDon;
        END IF;
    END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Tg_HD_Tongtien_update
AFTER UPDATE ON HoaDon
FOR EACH ROW
    BEGIN
        IF NEW.TienMonAn <> OLD.TienMonAn OR NEW.TienGiam <> OLD.TienGiam THEN
            UPDATE HoaDon SET Tongtien = NEW.TienMonAn - NEW.TienGiam WHERE ID_HoaDon= NEW.ID_HoaDon;
        END IF;
    END;
//
DELIMITER ;


-- SQLINES DEMO *** _Voucher o HoaDon, Tinh tien giam theo thong tin cua Voucher do va giam Diem tich luy cua KH

DROP TRIGGER IF EXISTS Tg_HD_DoiVoucher;

DELIMITER //
CREATE TRIGGER Tg_HD_DoiVoucher
BEFORE UPDATE ON HoaDon
FOR EACH ROW
BEGIN
    DECLARE TongtienLoaiMonAnduocgiam int;
    DECLARE v_Diemdoi double;
    DECLARE v_Phantram double;
    DECLARE v_LoaiMA VARCHAR(4000);

    IF NEW.Code_Voucher is not null THEN
        SELECT Diem,Phantram,LoaiMA
        INTO v_Diemdoi,v_Phantram,v_LoaiMA
        FROM Voucher
        WHERE Code_Voucher=NEW.Code_Voucher;

        CALL KH_TruDTL(NEW.ID_KH, v_diemdoi);
        CALL Voucher_GiamSL(NEW.Code_Voucher);

        IF(v_LoaiMA='All') THEN
            SET TongtienLoaiMonAnduocgiam = NEW.TienMonAn;
        ELSE 
            SELECT SUM(Thanhtien)
            INTO TongtienLoaiMonAnduocgiam
            FROM CTHD 
            JOIN MonAn ON MonAn.ID_MonAn = CTHD.ID_MonAn
            WHERE ID_HoaDon = NEW.ID_HoaDon AND LOAI = v_LoaiMA;
        END IF;

        SET NEW.Tiengiam = ROUND(TongtienLoaiMonAnduocgiam * v_Phantram / 100);
        SET NEW.Tongtien = NEW.Tienmonan - NEW.Tiengiam;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Voucher does not exist';
    END IF;
END//
DELIMITER ;


-- Trigger Doanh so cua Khach hang bang tong tien cua tat ca hoa don co trang thai 'Da thanh toan' cua khach hang do
-- Diem tich luy cua Khach hang duoc tinh bang 0.005% Tong tien cua hoa don (1.000.000d tuong duong 50 diem)
DROP TRIGGER IF EXISTS Tg_KH_DoanhsovaDTL;

DELIMITER //
CREATE TRIGGER Tg_KH_DoanhsovaDTL
AFTER UPDATE ON HoaDon
FOR EACH ROW
BEGIN
    IF NEW.Trangthai='Da thanh toan' THEN
        UPDATE KhachHang SET Doanhso = Doanhso + NEW.Tongtien WHERE ID_KH=NEW.ID_KH;
        UPDATE KhachHang SET Diemtichluy = Diemtichluy + ROUND(NEW.Tongtien*0.00005)
        WHERE ID_KH=NEW.ID_KH;
    END IF;
END;
//
DELIMITER ;


-- Trigger khi khach hang them hoa don moi, trang thai ban chuyen tu 'Con trong' sang 'Dang dung bua'
-- Khi trang thai don hang tro thanh 'Da thanh toan' trang thai ban chuyen tu 'Dang dung bua' sang 'Con trong'


DROP TRIGGER IF EXISTS Tg_TrangthaiBan;

DELIMITER //
CREATE TRIGGER Tg_TrangthaiBan_insert
AFTER INSERT ON HoaDon
FOR EACH ROW
BEGIN
    IF NEW.Trangthai = 'Chua thanh toan' THEN
        UPDATE Ban SET Trangthai='Dang dung bua' WHERE ID_Ban=NEW.ID_Ban;
    ELSE
        UPDATE Ban SET Trangthai='Con trong' WHERE ID_Ban=NEW.ID_Ban;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Tg_TrangthaiBan_update
AFTER UPDATE ON HoaDon
FOR EACH ROW
BEGIN
    IF NEW.Trangthai = 'Chua thanh toan' THEN
        UPDATE Ban SET Trangthai='Dang dung bua' WHERE ID_Ban=NEW.ID_Ban;
    ELSE
        UPDATE Ban SET Trangthai='Con trong' WHERE ID_Ban=NEW.ID_Ban;
    END IF;
END;
//
DELIMITER ;


--  Trigger Thanh tien o CTNK bang SoLuong x Dongia cua nguyen lieu do


DROP TRIGGER IF EXISTS Tg_CTNK_Thanhtien_Insert;

DELIMITER //
CREATE TRIGGER Tg_CTNK_Thanhtien_Insert
BEFORE INSERT ON CTNK
FOR EACH ROW
BEGIN
    DECLARE gia DECIMAL(10, 2);
    SELECT DonGia INTO gia
    FROM NguyenLieu
    WHERE NguyenLieu.ID_NL = NEW.ID_NL;
    
    SET NEW.ThanhTien = NEW.SoLuong * gia;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Tg_CTNK_Thanhtien_Update
BEFORE UPDATE ON CTNK
FOR EACH ROW
BEGIN
    DECLARE gia DECIMAL(10, 2);
    SELECT DonGia INTO gia
    FROM NguyenLieu
    WHERE NguyenLieu.ID_NL = NEW.ID_NL;
    
    SET NEW.ThanhTien = NEW.SoLuong * gia;
END;
//
DELIMITER ;


-- PhieuNK bang tong thanh tien cua CTNK

DROP TRIGGER IF EXISTS Tg_PNK_Tongtien;

DROP TRIGGER IF EXISTS Tg_PNK_Tongtien_Insert;

DELIMITER //
CREATE TRIGGER Tg_PNK_Tongtien_Insert
AFTER INSERT ON CTNK
FOR EACH ROW
BEGIN
    UPDATE PhieuNK SET Tongtien = Tongtien + NEW.ThanhTien WHERE PhieuNK.ID_NK = NEW.ID_NK;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS Tg_PNK_Tongtien_Update;

DELIMITER //
CREATE TRIGGER Tg_PNK_Tongtien_Update
AFTER UPDATE ON CTNK
FOR EACH ROW
BEGIN
    UPDATE PhieuNK SET Tongtien = Tongtien + NEW.ThanhTien - OLD.ThanhTien WHERE PhieuNK.ID_NK = NEW.ID_NK;
END;
//
DELIMITER ;


--  SQLINES DEMO *** TNK tang So luong ton cua nguyen lieu trong kho
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TRIGGER IF EXISTS Tg_Kho_ThemSLTon;

DELIMITER //

CREATE TRIGGER Tg_Kho_ThemSLTon
AFTER INSERT OR DELETE OR UPDATE OF SoLuong ON CTNK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE Kho SET SLTon = SLTon + NEW.SoLuong WHERE Kho.ID_NL = NEW.ID_NL;
    END IF;
    
    IF UPDATING THEN    
        UPDATE Kho SET SLTon = SLTon + NEW.SoLuong - OLD.SoLuong WHERE Kho.ID_NL = NEW.ID_NL;
    END IF;
    
    IF DELETING THEN    
        UPDATE Kho SET SLTon = SLTon - OLD.SoLuong WHERE Kho.ID_NL = OLD.ID_NL;
    END IF;
END;
//

DELIMITER ;


--  SQLINES DEMO *** TXK giam So luong ton cua nguyen lieu trong kho
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TRIGGER IF EXISTS Tg_Kho_GiamSLTon;

DELIMITER //

CREATE TRIGGER Tg_Kho_GiamSLTon
AFTER INSERT OR DELETE OR UPDATE OF SoLuong ON CTXK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE Kho SET SLTon = SLTon - NEW.SoLuong WHERE Kho.ID_NL = NEW.ID_NL;
    END IF;
    
    IF UPDATING THEN    
        UPDATE Kho SET SLTon = SLTon - NEW.SoLuong + OLD.SoLuong WHERE Kho.ID_NL = NEW.ID_NL;
    END IF;
    
    IF DELETING THEN    
        UPDATE Kho SET SLTon = SLTon + OLD.SoLuong WHERE Kho.ID_NL = OLD.ID_NL;
    END IF;
END;
//

DELIMITER ;


--  SQLINES DEMO *** ot Nguyen Lieu moi, them NL do vao Kho
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TRIGGER IF EXISTS Tg_Kho_ThemNL;

DELIMITER //

CREATE TRIGGER Tg_Kho_ThemNL
AFTER INSERT ON NguyenLieu
FOR EACH ROW
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    INSERT INTO Kho(ID_NL) VALUES(NEW.ID_NL);
END;
//

DELIMITER ;



-- Pro... SQLINES DEMO ***
--  SQLINES DEMO ***  khach hang moi voi cac thong tin tenKH , NgayTG va ID_ND
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS KH_ThemKH;

DELIMITER //

CREATE PROCEDURE KH_ThemKH(tenKH VARCHAR(4000) /* Use -meta option KHACHHANG.TenKH%TYPE */, NgayTG VARCHAR(4000) /* Use -meta option KHACHHANG.Ngaythamgia%TYPE */,
ID_ND VARCHAR(4000) /* Use -meta option KHACHHANG.ID_ND%TYPE */)
BEGIN
    DECLARE v_ID_KH VARCHAR(4000) /* Use -meta option KHACHHANG.ID_KH%TYPE */;
DECLARE IS 
BEGIN
    -- The... SQLINES DEMO ***
    SELECT MIN(ID_KH)+1
    INTO v_ID_KH
    FROM KHACHHANG
    WHERE ID_KH + 1 NOT IN(SELECT ID_KH FROM KHACHHANG);
//

DELIMITER ;


    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (v_ID_KH,tenKH,STR_TO_DATE(NgayTG,'%d-%m-%Y'),ID_ND);
    DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
        RAISE_APPLICATION_ERROR('Thong tin khong hop le');
 END;
END;
/
--  SQLINES DEMO ***  nhan vien moi voi cac thong tin tenNV, NgayVL, SDT, Chucvu, ID_NQL, Tinhtrang
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS NV_ThemNV;

DELIMITER //

CREATE PROCEDURE NV_ThemNV(tenNV VARCHAR(4000) /* Use -meta option NHANVIEN.TenNV%TYPE */, NgayVL VARCHAR(4000) /* Use -meta option NHANVIEN.NgayVL%TYPE */, SDT VARCHAR(4000) /* Use -meta option NHANVIEN.SDT%TYPE */,
Chucvu VARCHAR(4000) /* Use -meta option NHANVIEN.Chucvu%TYPE */,ID_NQL VARCHAR(4000) /* Use -meta option NHANVIEN.ID_NQL%TYPE */, Tinhtrang VARCHAR(4000) /* Use -meta option NHANVIEN.Tinhtrang%TYPE */)
BEGIN
    DECLARE v_ID_NV VARCHAR(4000) /* Use -meta option NHANVIEN.ID_NV%TYPE */;
DECLARE IS 
BEGIN
    -- The... SQLINES DEMO ***
    SELECT MIN(ID_NV)+1
    INTO v_ID_NV
    FROM NHANVIEN
    WHERE ID_NV + 1 NOT IN(SELECT ID_NV FROM NHANVIEN);
//

DELIMITER ;


    
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) 
    VALUES (v_ID_NV,tenNV,STR_TO_DATE(NgayVL,'%d-%m-%Y'),SDT,Chucvu,ID_NQL,Tinhtrang);
    DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
        RAISE_APPLICATION_ERROR('Thong tin khong hop le');
 END;
END;
/
-- SQLINES DEMO ***  NHANVIEN voi idNV
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS NV_XoaNV;

DELIMITER //

CREATE PROCEDURE NV_XoaNV(idNV VARCHAR(4000) /* Use -meta option NHANVIEN.ID_NV%TYPE */)
BEGIN
    DECLARE v_count DOUBLE;
    DECLARE idNQL VARCHAR(4000) /* Use -meta option NHANVIEN.ID_NQL%TYPE */;
DECLARE NOT_FOUND INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET NOT_FOUND = 1;
DECLARE cur_ID_NK VARCHAR(200); -- Use -meta option to resolve the data type
DECLARE cur_ID_XK VARCHAR(200); -- Use -meta option to resolve the data type
  
    SELECT COUNT(ID_NV),ID_NQL
    INTO v_count,ID_NQL
    FROM NHANVIEN
    WHERE ID_NV=idNV;
    
    IF(v_count>0) THEN
        IF (id_NV = idNQL) THEN
            RAISE_APPLICATION_ERROR(-20000,'Khong the xoa QUAN LY');
        ELSE
            DECLARE cur CURSOR FOR SELECT ID_NK FROM PHIEUNK
            WHERE ID_NV=idNV;
            OPEN cur;
            FETCH cur INTO;
            WHILE NOT_FOUND=0
            DO
                DELETE FROM CTNK WHERE ID_NK=cur_ID_NK;
            FETCH  INTO;
            END WHILE;
            CLOSE cur;
            
            DECLARE cur CURSOR FOR SELECT ID_XK FROM PHIEUXK
            WHERE ID_NV=idNV;
            OPEN cur;
            FETCH cur INTO;
            WHILE NOT_FOUND=0
            DO
                DELETE FROM CTXK WHERE ID_XK=cur_ID_XK;
            FETCH  INTO;
            END WHILE;
            CLOSE cur;
            
            DELETE FROM PHIEUNK WHERE ID_NV=idNV;
            DELETE FROM PHIEUNK WHERE ID_NV=idNV;
            DELETE FROM NHANVIEN WHERE ID_NV=idNV;
        END IF;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Nhan vien khong ton tai');
    END IF;
END;
//

DELIMITER ;


-- SQLINES DEMO ***  KHACHHANG voi idKH
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS KH_XoaKH;

DELIMITER //

CREATE PROCEDURE KH_XoaKH(idKH VARCHAR(4000) /* Use -meta option KHACHHANG.ID_KH%TYPE */)
BEGIN
    DECLARE v_count DOUBLE;
DECLARE NOT_FOUND INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET NOT_FOUND = 1;
DECLARE cur_ID_HoaDon VARCHAR(200); -- Use -meta option to resolve the data type
  
    SELECT COUNT(*)
    INTO v_count
    FROM KHACHHANG
    WHERE ID_KH=idKH;
    
    IF(v_count>0) THEN
        DECLARE cur CURSOR FOR SELECT ID_HoaDon FROM HOADON 
        WHERE ID_KH=idKH;
        OPEN cur;
        FETCH cur INTO;
        WHILE NOT_FOUND=0
        DO
            DELETE FROM CTHD WHERE ID_HoaDon=cur_ID_HoaDon;
        FETCH  INTO;
        END WHILE;
        CLOSE cur;
        DELETE FROM HOADON WHERE ID_KH=idKH;
        DELETE FROM KHACHHANG WHERE ID_KH=idKH;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Khach hang khong ton tai');
    END IF;
END;
//

DELIMITER ;



-- SQLINES DEMO *** ng tin KHACHHANG voi thong tin idKH
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS KH_XemTT;

DELIMITER //

CREATE PROCEDURE KH_XemTT(idKH VARCHAR(4000) /* Use -meta option KHACHHANG.ID_KH%TYPE */)
BEGIN DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
             RAISE_APPLICATION_ERROR(-20000,'Khach hang khong ton tai');
 END; 
    DECLARE cur CURSOR FOR SELECT TenKH,Ngaythamgia,Doanhso,Diemtichluy,ID_ND
    FROM KHACHHANG WHERE ID_KH=idKH;;
    )
    LOOP
        PUT_LINE(CONCAT('Ma khach hang: ',IFNULL(idKH, '')));
        PUT_LINE(CONCAT('Ten khach hang: ',IFNULL(cur_TenKH, '')));
        PUT_LINE(CONCAT('Ngay tham gia: ',IFNULL(DATE_FORMAT(cur_Ngaythamgia,'%d-%m-%Y'), ''));
        PUT_LINE(CONCAT('Doanh so: ',IFNULL(cur_Doanhso, '')));
        PUT_LINE(CONCAT('Diemtichluy: ',IFNULL(cur_Diemtichluy, '')));
        PUT_LINE(CONCAT('Ma nguoi dung: ',IFNULL(cur_ID_ND, '')));
        
    END LOOP;
FETCH  INTO;
END;
CLOSE cur;
/
-- SQLINES DEMO *** ng tin NHANVIEN voi thong tin idNV
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS NV_XemTT;

DELIMITER //

CREATE PROCEDURE NV_XemTT(idNV VARCHAR(4000) /* Use -meta option NHANVIEN.ID_NV%TYPE */)
BEGIN DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
             RAISE_APPLICATION_ERROR(-20000,'Nhan vien khong ton tai');
 END; 
    DECLARE cur CURSOR FOR SELECT TenKH,NgayVL,SDT,Chucvu,ID_NQL   
    FROM NHANVIEN WHERE ID_NV=idNV;;
    )
    LOOP
        PUT_LINE(CONCAT('Ma nhan vien: ',IFNULL(idNV, '')));
        PUT_LINE(CONCAT('Ten nhan vien: ',IFNULL(cur_TenNV, '')));
        PUT_LINE(CONCAT('Ngay vao lam: ',IFNULL(DATE_FORMAT(cur_NgayVL,'%d-%m-%Y'), ''));
        PUT_LINE(CONCAT('Chuc vu: ',IFNULL(cur_Chucvu, '')));
        PUT_LINE(CONCAT('Ma nguoi quan ly: ',IFNULL(cur_ID_NQL, '')));
        
    END LOOP;
FETCH  INTO;
END;
CLOSE cur;
/

-- SQLINES DEMO ***  danh sach hoa don tu ngay A den ngay B
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS DS_HoaDon_tuAdenB;

DELIMITER //

CREATE PROCEDURE DS_HoaDon_tuAdenB(fromA DATETIME, toB DATETIME)
BEGIN DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
             RAISE_APPLICATION_ERROR(-20000,'Khong co hoa don nao');
 END; 
    DECLARE cur CURSOR FOR SELECT ID_HOADON,ID_KH,ID_BAN,NGAYHD,TIENMONAN,TIENGIAM,TONGTIEN,TRANGTHAI   
    FROM HOADON WHERE NGAYHD BETWEEN fromA AND (DATE_ADD(toB, INTERVAL  1 DAY));;
    )
    LOOP
        PUT_LINE(CONCAT('Ma hoa don: ',IFNULL(cur_ID_HOADON, '')));
        PUT_LINE(CONCAT('Ma khach hang: ',IFNULL(cur_ID_KH, '')));
        PUT_LINE(CONCAT('Ma ban: ',IFNULL(cur_ID_BAN, '')));
        PUT_LINE(CONCAT('Ngay hoa don: ',IFNULL(DATE_FORMAT(cur_NgayHD,'%d-%m-%Y'), ''));
        PUT_LINE(CONCAT('Tien mon an: ',IFNULL(cur_TIENMONAN, '')));
        PUT_LINE(CONCAT('Tien giam: ',IFNULL(cur_TIENGIAM, '')));
        PUT_LINE(CONCAT('Tong tien: ',IFNULL(cur_TONGTIEN, '')));
        PUT_LINE(CONCAT('Trang thai: ',IFNULL(cur_TRANGTHAI, '')));
        
    END LOOP;
FETCH  INTO;
END;
CLOSE cur;
/
-- SQLINES DEMO ***  danh sach phieu nhap kho tu ngay A den ngay B
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS DS_PhieuNK_tuAdenB;

DELIMITER //

CREATE PROCEDURE DS_PhieuNK_tuAdenB(fromA DATETIME, toB DATETIME)
BEGIN DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
             RAISE_APPLICATION_ERROR(-20000,'Khong co hoa don nao');
 END; 
    DECLARE cur CURSOR FOR SELECT ID_NK,ID_NV,NGAYNK,TONGTIEN  
    FROM PHIEUNK WHERE NGAYNK BETWEEN fromA AND (DATE_ADD(toB, INTERVAL  1 DAY));;
    )
    LOOP
        PUT_LINE(CONCAT('Ma nhap kho: ',IFNULL(cur_ID_NK, '')));
        PUT_LINE(CONCAT('Ma nhan vien: ',IFNULL(cur_ID_NV, '')));
        PUT_LINE(CONCAT('Ngay nhap kho: ',IFNULL(DATE_FORMAT(cur_NGAYNK,'%d-%m-%Y'), ''));
        PUT_LINE(CONCAT('Tong tien: ',IFNULL(cur_TONGTIEN, '')));
        
    END LOOP;
FETCH  INTO;
END;
CLOSE cur;
/

-- SQLINES DEMO ***  danh sach phieu xuat kho tu ngay A den ngay B
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS DS_PhieuXK_tuAdenB;

DELIMITER //

CREATE PROCEDURE DS_PhieuXK_tuAdenB(fromA DATETIME, toB DATETIME)
BEGIN DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
             RAISE_APPLICATION_ERROR(-20000,'Khong co hoa don nao');
 END; 
    DECLARE cur CURSOR FOR SELECT ID_XK,ID_NV,NGAYXK
    FROM PHIEUXK WHERE NGAYXK BETWEEN fromA AND (DATE_ADD(toB, INTERVAL  1 DAY));;
    )
    LOOP
        PUT_LINE(CONCAT('Ma xuat kho: ',IFNULL(cur_ID_XK, '')));
        PUT_LINE(CONCAT('Ma nhan vien: ',IFNULL(cur_ID_NV, '')));
        PUT_LINE(CONCAT('Ngay xuat kho: ',IFNULL(DATE_FORMAT(cur_NGAYXK,'%d-%m-%Y'), ''));
        
    END LOOP;
FETCH  INTO;
END;
CLOSE cur;
/
-- SQLINES DEMO ***  tiet hoa don cua 1 hoa don
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS HD_XemCTHD;

DELIMITER //

CREATE PROCEDURE HD_XemCTHD(idHD VARCHAR(4000) /* Use -meta option HOADON.ID_HOADON%TYPE */)
BEGIN DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
             RAISE_APPLICATION_ERROR(-20000,'Khong co chi tiet hoa don nao');
 END; 
    DECLARE cur CURSOR FOR SELECT ID_MONAN,SOLUONG,THANHTIEN
    FROM CTHD WHERE ID_HOADON=idHD;;
    )
    LOOP
        PUT_LINE(CONCAT('Ma mon an: ',IFNULL(cur_ID_MONAN, '')));
        PUT_LINE(CONCAT('So luong: ',IFNULL(cur_SOLUONG, '')));
        PUT_LINE(CONCAT('Thanh tien: ',IFNULL(cur_THANHTIEN, '')));
        
    END LOOP;
FETCH  INTO;
END;
CLOSE cur;
/
-- SQLINES DEMO ***  Luong cua Voucher di 1 khi KH doi Voucher
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS Voucher_GiamSL;

DELIMITER //

CREATE PROCEDURE Voucher_GiamSL(code VARCHAR(4000) /* Use -meta option Voucher.Code_Voucher%TYPE */)
BEGIN
    DECLARE v_count DOUBLE;
 
    SELECT COUNT(*)
    INTO v_count
    FROM Voucher
    WHERE Code_Voucher=code;
    IF(v_count>0) THEN
        UPDATE Voucher SET SoLuong = SoLuong - 1 WHERE Code_Voucher=code;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Voucher khong ton tai');
    END IF;
END;
//

DELIMITER ;



-- SQLINES DEMO *** em tich luy cua KH khi doi Voucher
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP PROCEDURE IF EXISTS KH_TruDTL;

DELIMITER //

CREATE PROCEDURE KH_TruDTL(ID VARCHAR(4000) /* Use -meta option KHACHHANG.ID_KH%TYPE */,diemdoi DOUBLE)
BEGIN
    DECLARE v_count DOUBLE;
  
    SELECT COUNT(*)
    INTO v_count
    FROM KHACHHANG
    WHERE ID_KH=ID;
    IF(v_count>0) THEN
        UPDATE KHACHHANG SET Diemtichluy = Diemtichluy - diemdoi WHERE ID_KH=ID;
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Khach hang khong ton tai');
    END IF;
END;
//

DELIMITER ;



-- Fuc... SQLINES DEMO ***
--  SQLINES DEMO ***  thu hoa don theo ngay
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP FUNCTION IF EXISTS DoanhThuHD_theoNgay;

DELIMITER //

CREATE FUNCTION DoanhThuHD_theoNgay (ngHD DATETIME)
RETURNS DOUBLE
BEGIN 
    DECLARE v_Doanhthu DOUBLE;
 
    SELECT SUM(Tongtien)
    INTO v_Doanhthu
    FROM HOADON 
    WHERE NGAYHD=ngHD;
    
    SET v_Doanhthu = IFNULL(v_Doanhthu,0);
    RETURN v_Doanhthu;
END;
//

DELIMITER ;


--  SQLINES DEMO *** hi nhap kho theo ngay
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP FUNCTION IF EXISTS ChiPhiNK_theoNgay;

DELIMITER //

CREATE FUNCTION ChiPhiNK_theoNgay (ngNK DATETIME)
RETURNS DOUBLE
BEGIN 
    DECLARE v_Chiphi DOUBLE;
 
    SELECT SUM(Tongtien)
    INTO v_Chiphi
    FROM PHIEUNK 
    WHERE NGAYNK=ngNK;
    
    SET v_Chiphi = IFNULL(v_Chiphi,0);
    RETURN v_Chiphi;
END;
//

DELIMITER ;


--  SQLINES DEMO ***  so trung binh cua x KHACHHANG co doanh so cao nhat
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP FUNCTION IF EXISTS DoanhsoTB_TOPxKH;

DELIMITER //

CREATE FUNCTION DoanhsoTB_TOPxKH(x INT)
RETURNS DECIMAL(38,0)
BEGIN 
   DECLARE v_avg DECIMAL(38,0);
 
    SELECT AVG(Doanhso)
    INTO v_avg
    FROM (
        SELECT Doanhso 
        FROM KHACHHANG
        ORDER BY Doanhso DESC
        FETCH FIRST x ROWS ONLY
        );
    RETURN v_avg;
END;
//

DELIMITER ;



--  SQLINES DEMO *** ong KHACHANG moi trong thang chi dinh cua nam co it nhat mot hoa don co tri gia tren x vnd
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP FUNCTION IF EXISTS SL_KH_Moi;

DELIMITER //

CREATE FUNCTION SL_KH_Moi(thang DOUBLE, nam DOUBLE, trigiaHD DOUBLE)
RETURNS DOUBLE
BEGIN 
   DECLARE v_count DOUBLE;
 
    SET COUNT(ID_KH)
    INTO v_count;
    FROM KHACHHANG
    WHERE MONTH(Ngaythamgia)=thang AND YEAR(Ngaythamgia) = nam
    AND EXISTS(SELECT *
               FROM HOADON 
               WHERE HOADON.ID_KH=KHACHHANG.ID_KH AND TONGTIEN>trigiaHD
               );
    RETURN v_count;          
END;
//

DELIMITER ;


    
--  SQLINES DEMO *** mon an duoc giam khi them mot CTHD moi
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP FUNCTION IF EXISTS CTHD_Tinhtiengiam;

DELIMITER //

CREATE FUNCTION CTHD_Tinhtiengiam(Tongtien Double,Code VARCHAR(4000) /* Use -meta option Voucher.Code_Voucher%TYPE */)
RETURNS DOUBLE
BEGIN 
    DECLARE Tiengiam DOUBLE;
    DECLARE v_phantram DOUBLE;
 
    SELECT Phantram
    INTO v_Phantram
    FROM Voucher
    WHERE Code_Voucher=Code;
    SET Tiengiam = ROUND(Tongtien*v_Phantram/100);
    RETURN Tiengiam;
END;
//

DELIMITER ;


-- The... SQLINES DEMO ***
-- ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-YYYY';

--  SQLINES DEMO ***  NguoiDung
-- Nha... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (100,'NVHoangViet@gmail.com','123','Verified','Quan Ly');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (101,'NVHoangPhuc@gmail.com','123','Verified','Nhan Vien');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (102,'NVAnhHong@gmail.com','123','Verified','Nhan Vien Kho');

select * from NguoiDung where ID_ND = 100;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (103,'NVQuangDinh@gmail.com','123','Verified','Nhan Vien');
-- Kha... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (104,'KHThaoDuong@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (105,'KHTanHieu@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (106,'KHQuocThinh@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (107,'KHNhuMai@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (108,'KHBichHao@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (109,'KHMaiQuynh@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (110,'KHMinhQuang@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (111,'KHThanhHang@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (112,'KHThanhNhan@gmail.com','123','Verified','Khach Hang');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (113,'KHPhucNguyen@gmail.com','123','Verified','Khach Hang');

--  SQLINES DEMO ***  Nhan Vien
SELECT DATE_FORMAT(NgayVL, '%d-%m-%Y') as 'New Format' FROM NhanVien;
-- DATE_FORMAT('2023-03-28', '%M %d, %Y');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (100,'Nguyen Hoang Viet','2023-05-10','0848044725','Quan ly',100,100,'Dang lam viec');
-- select*from NhanVien where ID_NV = 100;
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (101,'Nguyen Hoang Phuc','2023-05-20','0838033334','Tiep tan',101,100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (102,'Le Thi Anh Hong','2023-05-19','0838033234','Kho',102,100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (103,'Ho Quang Dinh','2023-05-19','0838033234','Tiep tan',103,100,'Dang lam viec');
-- Kho... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (104,'Ha Thao Duong','2023-05-10','0838033232','Phuc vu',100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (105,'Nguyen Quoc Thinh','2023-05-11','0838033734','Phuc vu',100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (106,'Truong Tan Hieu','2023-05-12','0838033834','Phuc vu',100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (107,'Nguyen Thai Bao','2023-05-10','0838093234','Phuc vu',100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (108,'Tran Nhat Khang','2023-05-11','0838133234','Thu ngan',100,'Dang lam viec');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (109,'Nguyen Ngoc Luong','2023-05-12','0834033234','Bep',100,'Dang lam viec');

-- KhachHang

INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (100,'Ha Thao Duong','2023-05-10',104);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (101,'Truong Tan Hieu','2023-05-10',105);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (102,'Nguyen Quoc Thinh','2023-05-10',106);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (103,'Tran Nhu Mai','2023-05-10',107);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (104,'Nguyen Thi Bich Hao','2023-05-10',108);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (105,'Nguyen Mai Quynh','2023-05-11',109);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (106,'Hoang Minh Quang','2023-05-11',110);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (107,'Nguyen Thanh Hang','2023-05-12',111);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (108,'Nguyen Ngoc Thanh Nhan','2023-05-11',112);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (109,'Hoang Thi Phuc Nguyen','2023-05-12',113);

-- MonAn

insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(1,'DUI CUU NUONG XE NHO', 250000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(2,'BE SUON CUU NUONG GIAY BAC MONG CO', 230000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(3,'DUI CUU NUONG TRUNG DONG', 350000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(4,'CUU XOC LA CA RI', 129000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(5,'CUU KUNGBAO', 250000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(6,'BAP CUU NUONG CAY', 250000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(7,'CUU VIEN HAM CAY', 19000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(8,'SUON CONG NUONG MONG CO', 250000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(9,'DUI CUU LON NUONG TAI BAN', 750000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(10,'SUONG CUU NUONG SOT NAM', 450000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(11,'DUI CUU NUONG TIEU XANH', 285000,'Aries','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(12,'SUON CUU SOT PHO MAI', 450000,'Aries','Dang kinh doanh');

-- Tau... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(13,'Bit tet bo My khoai tay', 179000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(14,'Bo bit tet Uc',169000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(15,'Bit tet bo My BASIC', 179000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(16,'My Y bo bam', 169000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(17,'Thit suon Wagyu', 1180000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(18,'Steak Thit Vai Wagyu', 1290000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(19,'Steak Thit Bung Bo', 550000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(20,'Tomahawk', 2390000,'Taurus','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(21,'Salad Romaine Nuong', 180000,'Taurus','Dang kinh doanh');

-- Gem... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(22,'Combo Happy', 180000,'Gemini','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(23,'Combo Fantastic', 190000,'Gemini','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(24,'Combo Dreamer', 230000,'Gemini','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(25,'Combo Cupid', 180000,'Gemini','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(26,'Combo Poseidon', 190000,'Gemini','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(27,'Combo LUANG PRABANG', 490000,'Gemini','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(28,'Combo VIENTIANE', 620000,'Gemini','Dang kinh doanh');

-- Can... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(29,'Cua KingCrab Duc sot', 3650000,'Cancer','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(30,'Mai Cua KingCrab Topping Pho Mai', 2650000,'Cancer','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(31,'Cua KingCrab sot Tu Xuyen', 2300000,'Cancer','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(32,'Cua KingCrab Nuong Tu Nhien', 2550000,'Cancer','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(33,'Cua KingCrab Nuong Bo Toi', 2650000,'Cancer','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(34,'Com Mai Cua KingCrab Chien', 1850000,'Cancer','Dang kinh doanh');

-- Leo
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(35,'BOSSAM', 650000,'Leo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(36,'KIMCHI PANCAKE', 350000,'Leo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(37,'SPICY RICE CAKE', 250000,'Leo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(38,'SPICY SAUSAGE HOTPOT', 650000,'Leo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(39,'SPICY PORK', 350000,'Leo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(40,'MUSHROOM SPICY SILKY TOFU STEW', 350000,'Leo','Dang kinh doanh');
-- Vir... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(41,'Pavlova', 150000,'Virgo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(42,'Kesutera', 120000,'Virgo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(43,'Cremeschnitte', 250000,'Virgo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(44,'Sachertorte', 150000,'Virgo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(45,'Schwarzwalder Kirschtorte', 250000,'Virgo','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(46,'New York-Style Cheesecake', 250000,'Virgo','Dang kinh doanh');

-- Lib... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(47,'Cobb Salad', 150000,'Libra','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(48,'Salad Israeli', 120000,'Libra','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(49,'Salad Dau den', 120000,'Libra','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(50,'Waldorf Salad', 160000,'Libra','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(51,'Salad Gado-Gado', 200000,'Libra','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(52,'Nicoise Salad', 250000,'Libra','Dang kinh doanh');

-- Sco... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(53,'BULGOGI LUNCHBOX', 250000,'Scorpio','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(54,'CHICKEN TERIYAKI LUNCHBOX', 350000,'Scorpio','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(55,'SPICY PORK LUNCHBOX', 350000,'Scorpio','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(56,'TOFU TERIYAKI LUNCHBOX', 250000,'Scorpio','Dang kinh doanh');

-- Sag... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(57,'Thit ngua do tuoi', 250000,'Sagittarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(58,'Steak Thit ngua', 350000,'Sagittarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(59,'Thit ngua ban gang', 350000,'Sagittarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(60,'Long ngua xao dua', 150000,'Sagittarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(61,'Thit ngua xao sa ot', 250000,'Sagittarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(62,'Ngua tang', 350000,'Sagittarius','Dang kinh doanh');

-- Cap... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(63,'Thit de xong hoi', 229000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(64,'Thit de xao rau ngo', 199000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(65,'Thit de nuong tang', 229000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(66,'Thit de chao', 199000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(67,'Thit de nuong xien', 199000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(68,'Nam de nuong/chao', 199000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(69,'Thit de xao lan', 19000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(70,'Dui de tan thuoc bac', 199000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(71,'Canh de ham duong quy', 199000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(72,'Chao de dau xanh', 50000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(73,'Thit de nhung me', 229000,'Capricorn','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(74,'Lau de nhu', 499000,'Capricorn','Dang kinh doanh');


-- Aqu... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(75,'SIGNATURE WINE', 3290000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(76,'CHILEAN WINE', 3990000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(77,'ARGENTINA WINE', 2890000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(78,'ITALIAN WINE', 5590000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(79,'AMERICAN WINE', 4990000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(80,'CLASSIC COCKTAIL', 200000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(81,'SIGNATURE COCKTAIL', 250000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(82,'MOCKTAIL', 160000,'Aquarius','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(83,'JAPANESE SAKE', 1490000,'Aquarius','Dang kinh doanh');

-- Pis... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(84,'Ca Hoi Ngam Tuong', 289000,'Pisces','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(85,'Ca Ngu Ngam Tuong', 289000,'Pisces','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(86,'IKURA:Trung ca hoi', 189000,'Pisces','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(87,'KARIN:Sashimi Ca Ngu', 149000,'Pisces','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(88,'KEIKO:Sashimi Ca Hoi', 199000,'Pisces','Dang kinh doanh');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(89,'CHIYO:Sashimi Bung Ca Hoi', 219000,'Pisces','Dang kinh doanh');

--  SQLINES DEMO ***  Ban
-- Tan... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(100,'Ban T1.1','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(101,'Ban T1.2','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(102,'Ban T1.3','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(103,'Ban T1.4','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(104,'Ban T1.5','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(105,'Ban T1.6','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(106,'Ban T1.7','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(107,'Ban T1.8','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(108,'Ban T1.9','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(109,'Ban T1.10','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(110,'Ban T1.11','Tang 1','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(111,'Ban T1.12','Tang 1','Con trong');
-- Tan... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(112,'Ban T2.1','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(113,'Ban T2.2','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(114,'Ban T2.3','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(115,'Ban T2.4','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(116,'Ban T2.5','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(117,'Ban T2.6','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(118,'Ban T2.7','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(119,'Ban T2.8','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(120,'Ban T2.9','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(121,'Ban T2.10','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(122,'Ban T2.11','Tang 2','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(123,'Ban T2.12','Tang 2','Con trong');
-- Tan... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(124,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(125,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(126,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(127,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(128,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(129,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(130,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(131,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(132,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(133,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(134,'Ban T3.1','Tang 3','Con trong');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Ban(ID_Ban,TenBan,Vitri,Trangthai) values(135,'Ban T3.1','Tang 3','Con trong');

--  SQLINES DEMO ***  Voucher
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher,  Mota, Phantram,LoaiMA,SoLuong,Diem) values ('loQy','20% off for Aries Menu',20,'Aries',10,200);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('pCfI','30% off for Taurus Menu',30,'Taurus',5,300);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('pApo','20% off for Gemini Menu',20,'Gemini',10,200);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('ugQx','100% off for Virgo Menu',100,'Virgo',3,500);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('nxVX','20% off for All Menu',20,'All',5,300);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('Pwyn','20% off for Cancer Menu',20,'Cancer',10,200);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('bjff','50% off for Leo Menu',50,'Leo',5,600);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('YPzJ','20% off for Aquarius Menu',20,'Aquarius',5,200);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('Y5g0','30% off for Pisces Menu',30,'Pisces',5,300);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('7hVO','60% off for Aries Menu',60,'Aries',0,1000);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('WHLm','20% off for Capricorn Menu',20,'Capricorn',0,200);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into Voucher(Code_Voucher, Mota, Phantram,LoaiMA,SoLuong,Diem) values ('GTsC','20% off for Leo Menu',20,'Leo',0,200);


--  SQLINES DEMO ***  HoaDon
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (101,100,100,'2023-01-10',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (102,104,102,'2023-01-15',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (103,105,103,'2023-01-20',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (104,101,101,'2023-02-13',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (105,103,120,'2023-02-12',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (106,104,100,'2023-03-16',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (107,107,103,'2023-03-20',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (108,108,101,'2023-04-10',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (109,100,100,'2023-04-20',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (110,103,101,'2023-05-05',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (111,106,102,'2023-05-10',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (112,108,103,'2023-05-15',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (113,106,102,'2023-05-20',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (114,108,103,'2023-06-05',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (115,109,104,'2023-06-07',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (116,100,105,'2023-06-07',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (117,106,106,'2023-06-10',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (118,102,106,'2023-02-10',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (119,103,106,'2023-02-12',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (120,104,106,'2023-04-10',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (121,105,106,'2023-04-12',0,0,'Chua thanh toan');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO HoaDon(ID_HoaDon,ID_KH,ID_Ban,NgayHD,TienMonAn,TienGiam,Trangthai) VALUES (122,107,106,'2023-05-12',0,0,'Chua thanh toan');

-- The... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (101,1,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (101,3,1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (101,10,3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (102,1,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (102,2,1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (102,4,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (103,12,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (104,30,3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (104,59,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (105,28,1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (105,88,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (106,70,3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (106,75,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (106,78,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (107,32,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (107,12,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (108,12,1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (108,40,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (109,45,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (110,34,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (110,43,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (111,65,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (111,47,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (112,49,3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (112,80,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (112,31,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (113,80,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (113,80,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (114,30,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (114,32,3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (115,80,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (116,57,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (116,34,1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (117,67,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (117,66,3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (118,34,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (118,35,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (119,83,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (119,78,2);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (120,38,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (120,39,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (121,53,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (121,31,4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (122,33,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTHD(ID_HoaDon,ID_MonAn,SoLuong) VALUES (122,34,6);
UPDATE HOADON SET TrangThai='Da thanh toan';

--  SQLINES DEMO ***  NguyenLieu
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(100,'Thit ga',40000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(101,'Thit heo',50000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(102,'Thit bo',80000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(103,'Tom',100000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(104,'Ca hoi',500000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(105,'Gao',40000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(106,'Sua tuoi',40000,'l');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(107,'Bot mi',20000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(108,'Dau ca hoi',1000000,'l');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(109,'Dau dau nanh',150000,'l');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(110,'Muoi',20000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(111,'Duong',20000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(112,'Hanh tay',50000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(113,'Toi',30000,'kg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(114,'Dam',50000,'l');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(115,'Thit de',130000,'kg');

--  SQLINES DEMO *** uNK
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (100,102,'2023-01-10');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (101,102,'2023-02-11');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (102,102,'2023-02-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (103,102,'2023-03-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (104,102,'2023-03-15');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (105,102,'2023-04-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (106,102,'2023-04-15');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (107,102,'2023-05-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (108,102,'2023-05-15');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (109,102,'2023-06-05');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (110,102,'2023-06-07');

-- The... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,100,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,101,20);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,102,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,101,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,103,20);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,104,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,105,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,106,20);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,107,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,108,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,109,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,110,20);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,112,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,113,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,114,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (103,112,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (103,113,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (103,114,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (104,112,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (104,113,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (105,110,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (106,102,25);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (106,115,25);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (107,110,35);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (107,105,25);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (108,104,25);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (108,103,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (108,106,30);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (109,112,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (109,113,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (109,114,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,102,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,106,25);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,107,15);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (110,110,20);

--  SQLINES DEMO *** uXK
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (100,102,'2023-01-10');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (101,102,'2023-02-11');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (102,102,'2023-03-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (103,102,'2023-03-13');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (104,102,'2023-04-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (105,102,'2023-04-13');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (106,102,'2023-05-12');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (107,102,'2023-05-15');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (108,102,'2023-05-20');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (109,102,'2023-06-05');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (110,102,'2023-06-10');

-- The... SQLINES DEMO ***
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,100,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,101,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,102,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,101,7);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,103,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,104,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,105,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,106,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,109,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,110,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,112,10);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,113,8);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,114,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (103,114,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (103,104,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (104,101,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (104,112,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (105,113,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (105,102,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (106,103,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (106,114,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (107,105,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (107,106,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (108,115,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (108,110,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (109,110,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (109,112,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (110,113,5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (110,114,5);
