CREATE TABLE tbl_Admin
(
  Adm_Id       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Adm_Nama     VARCHAR(100),
  Adm_Username VARCHAR(50),
  Adm_Password VARCHAR(255),
  Adm_Level    ENUM ('SUPER ADMIN', 'ADMIN'),
  Adm_Active   CHAR(1)      DEFAULT 'Y'
);

CREATE TABLE tbl_Customer
(
  Cus_Id           INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Cus_NamaCustomer VARCHAR(100),
  Cus_NamaToko     VARCHAR(50),
  Cus_NomorContact VARCHAR(20),
  Cus_Email        VARCHAR(100),
  Cus_Password     VARCHAR(255),
  Cus_Tipe         ENUM ('Distributor', 'Toko'),
  Cus_Active       CHAR(1)      DEFAULT '1'
);

CREATE TABLE tbl_KategoriProduk
(
  Kp_Id           INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Kp_NamaKategori VARCHAR(100),
  Kp_Active       CHAR(1)      DEFAULT 'Y'
);

CREATE TABLE tbl_Produk
(
  Pro_Id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pro_IdKategori  INT NOT NULL,
  Pro_KodeProduk  VARCHAR(100) UNIQUE,
  Pro_NamaProduk  VARCHAR(255) NOT NULL,
  Pro_JumlahStock INT,
  Pro_Harga       INT,
  Pro_Deskripsi   TEXT,
  Pro_Active      CHAR(1)      DEFAULT 'Y',
  FOREIGN KEY (Pro_IdKategori) REFERENCES tbl_KategoriProduk (Kp_Id)
);

CREATE TABLE tbl_Pembelian
(
  Pem_Id               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pem_NoPembelian      VARCHAR (50),
  Pem_TanggalPembelian DATE

);

CREATE TABLE tbl_DetailPembelian
(
  Dpem_Id               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Dpem_IdProduk         INT NOT NULL,
  Dpem_IdPembelian      INT NOT NULL,
  Dpem_Imei             VARCHAR (255),
  Dpem_Harga            INT,
  Dpem_Jumlah            INT,
  Dpem_Status           VARCHAR (50),
  FOREIGN KEY (Dpem_IdProduk) REFERENCES tbl_Produk (Pro_Id),
  FOREIGN KEY (Dpem_IdPembelian) REFERENCES tbl_Pembelian (Pem_Id)
);

CREATE TABLE tbl_Penjualan
(
  Pen_Id               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pen_NoPenjualan      VARCHAR (50),
  Pen_TanggalPenjualan DATE

);

CREATE TABLE tbl_DetailPenjualan
(
  Dpen_Id               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Dpen_IdProduk         INT NOT NULL,
  Dpen_IdPenjualan      INT NOT NULL,
  Dpen_Imei             VARCHAR (255),
  Dpen_Harga            INT,
  Dpen_Jumlah           INT,
  FOREIGN KEY (Dpen_IdProduk) REFERENCES tbl_Produk (Pro_Id),
  FOREIGN KEY (Dpen_IdPenjualan) REFERENCES tbl_Penjualan (Pen_Id)
);




