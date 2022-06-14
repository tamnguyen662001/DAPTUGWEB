
CREATE DATABASE ASP_QUAN_LY_SHOP_GIAY_6_6
GO

USE ASP_QUAN_LY_SHOP_GIAY_6_6
GO

CREATE TABLE KHACHHANG
(
	MAKH INT IDENTITY(1,1) PRIMARY KEY,
	TENKH NVARCHAR(200) NOT NULL,
	SDT NVARCHAR(15) NOT NULL,
	TENDN VARCHAR(15) NOT NULL,
	MK VARCHAR(15) NOT NULL,
	EMAIL VARCHAR(15) NOT NULL,
	DIACHI NVARCHAR(200) NOT NULL

)
GO

CREATE TABLE NHANVIEN
(
	MANV INT IDENTITY(1,1) PRIMARY KEY,
	TENNV NVARCHAR(200) NOT NULL,
	NGAYSINH DATE NOT NULL,
	SDT NVARCHAR(15) NOT NULL,
	QTV BIT DEFAULT 0 NOT NULL,
	TENDN VARCHAR(15) NOT NULL,
	MK VARCHAR(15) NOT NULL,
	ANHNV VARCHAR(1024) NOT NULL,
	EMAIL VARCHAR(15) NOT NULL
)
GO

CREATE TABLE NHACC
(
	MANCC VARCHAR(10) PRIMARY KEY,
	TENNCC NVARCHAR(200) NOT NULL,
	DIACHINCC NVARCHAR(200) NOT NULL,
	EMAIL VARCHAR(15) NOT NULL
)
GO

CREATE TABLE LOAISP
(
	MALSP VARCHAR(10) PRIMARY KEY,
	TENLSP NVARCHAR(200) NOT NULL,
	ANHLSP VARCHAR(1024) NOT NULL
)
GO

CREATE TABLE SANPHAM
(
	MASP VARCHAR(10) PRIMARY KEY,
	MALSP VARCHAR(10) NOT NULL,
	TENSP NVARCHAR(200) NOT NULL,
	DVT NVARCHAR(20) NOT NULL,
	KICHTHUOC SMALLINT NOT NULL,
	DONGIA DECIMAL(10,2) NOT NULL,
	MANCC VARCHAR(10) NOT NULL,
	SLTON INT NOT NULL,
	CHITIETSP NTEXT NOT NULL,
	ANHSP VARCHAR(1024) NOT NULL
	
)
GO

CREATE TABLE HOADON
(
	MAHD INT IDENTITY(1,1) PRIMARY KEY,
	MAKH INT NOT NULL,
	TGDAT DATETIME NOT NULL,
	TGGIAO DATETIME,
	IDTHANHTOAN INT NOT NULL,
	DATHANHTOAN BIT NOT NULL,
	DAGIAO BIT NOT NULL
)
GO


CREATE TABLE CTHD 
(
	SOLUONG SMALLINT NOT NULL,
	MAHD INT NOT NULL ,
	MASP VARCHAR(10) NOT NULL 
	CONSTRAINT PK_CTHD PRIMARY KEY (MAHD, MASP)
)
GO

CREATE TABLE THANHTOAN
(
	IDTHANHTOAN INT PRIMARY KEY,
	HTTHANHTOAN NVARCHAR(20) NOT NULL,
)
GO



-- Thanh toan
INSERT INTO THANHTOAN VALUES(0, N'Tiền mặt')
INSERT INTO THANHTOAN VALUES(1, N'Chuyển khoản')


-- Rang buoc

ALTER TABLE dbo.SANPHAM ADD CONSTRAINT FK_SANPHAM_LOAISP FOREIGN KEY (MALSP) REFERENCES dbo.LOAISP (MALSP)
ALTER TABLE dbo.SANPHAM ADD CONSTRAINT FK_SANPHAM_NHACC FOREIGN KEY (MANCC) REFERENCES dbo.NHACC (MANCC)
ALTER TABLE dbo.CTHD ADD CONSTRAINT FK_CTHD_HOADON FOREIGN KEY (MAHD) REFERENCES dbo.HOADON (MAHD) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.CTHD ADD CONSTRAINT FK_CTHD_SANPHAM FOREIGN KEY (MASP) REFERENCES dbo.SANPHAM (MASP) ON DELETE CASCADE ON UPDATE CASCADE
--ALTER TABLE dbo.HOADON ADD CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN (MANV)
ALTER TABLE dbo.HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES dbo.KHACHHANG (MAKH)ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE dbo.HOADON ADD CONSTRAINT FK_HOADON_THANHTOANN FOREIGN KEY (IDTHANHTOAN) REFERENCES dbo.THANHTOAN (IDTHANHTOAN)



-- Loai san pham

INSERT INTO LOAISP VALUES('Sne', 'Sneakers','sp2.jpg')
INSERT INTO LOAISP VALUES('Cas', 'Casual Shoe','sp3.jpg')
INSERT INTO LOAISP VALUES('For', 'Formal Shoe','sp4.jpg')
INSERT INTO LOAISP VALUES('Boot', 'Boot NIKE','sp1.jpg')
INSERT INTO LOAISP VALUES('LSP001',N'Giày Sneaker','1.jpg') -- giay the thao
INSERT INTO LOAISP VALUES('LSP002',N'Giày Slip-on','2.jpg') -- giay luoi (khong co giay buoc, toi gian)
INSERT INTO LOAISP VALUES('LSP003',N'Giày Thể thao','3.jpg')
INSERT INTO LOAISP VALUES('LSP004',N'Giày Da thật','4.jpg')
INSERT INTO LOAISP VALUES('LSP005',N'Giày Boots','5.jpg')
INSERT INTO LOAISP VALUES('LSP003',N'Sandals','') -- dep, giay co quai hau
INSERT INTO LOAISP VALUES('LSP004',N'Boat Shoes','') -- giay thuyen
INSERT INTO LOAISP VALUES('LSP005',N'ESPADRILLES','') -- giong slip-on nhung duoc lam bang vai
INSERT INTO LOAISP VALUES('LSP006',N'DERBY','') --giay tay
INSERT INTO LOAISP VALUES('LSP007',N'BROGUE','') --giay tay
INSERT INTO LOAISP VALUES('LSP008',N'OXFORD','') --giay tay
INSERT INTO LOAISP VALUES('LSP009',N'MONK','') --giay tay
INSERT INTO LOAISP VALUES('LSP009',N'LOAFER','') --giay tay
INSERT INTO LOAISP VALUES('LSP010',N'BROGUE','') --giay Boots
INSERT INTO LOAISP VALUES('LSP011',N'CHELSEA','') --giay Boots
INSERT INTO LOAISP VALUES('LSP012',N'CHUKKA','') --giay Boots



-- Nha cung cap
INSERT INTO NHACC VALUES ('NCC001',N'Adidas',N'218A Ngô Gia Tự, Street, Thành phố Nha Trang, Khánh Hòa','Adi@gmail.com')
INSERT INTO NHACC VALUES ('NCC002',N'Nike',N' 733 Đ. Kha Vạn Cân, Linh Chiểu, Thủ Đức, Thành phố Hồ Chí Minh','Nike@gmail.com')
INSERT INTO NHACC VALUES ('NCC003',N'Supreme',N'719 21 Tháng 8, Phước Mỹ, Phan Rang-Tháp Chàm, Ninh Thuận','Sup@gmail.com')
INSERT INTO NHACC VALUES ('NCC004',N'Charles & Keith',N'74 Đ. Lê Duẩn, Thạch Thang, Hải Châu, Đà Nẵng','CK@gmail.com')
INSERT INTO NHACC VALUES ('NCC005',N'Jordan',N'46 Trịnh Phong, Tân Lập, Thành phố Nha Trang, Khánh Hòa','Jor@gmail.com')
INSERT INTO NHACC VALUES ('NCC006',N'Puma',N'274 Nguyễn Huy Tưởng, Thanh Xuân Trung, Thanh Xuân, Hà Nội','Pu@gmail.com')
INSERT INTO NHACC VALUES ('NCC007',N'Balenciaga',N'290 Đường Lê Hoàn, P. Lam Sơn, Thành phố Thanh Hóa, Thanh Hoá','Bal@gmail.com')
INSERT INTO NHACC VALUES ('NCC008',N'New Balance',N'192/2 Nguyen Thai Binh, Phường 12, Tân Bình, Thành phố Hồ Chí Minh','NB@gmail.com')
INSERT INTO NHACC VALUES ('NCC009',N'Converse',N'180C Lê Văn Sỹ, Phường 10, Phú Nhuận, Thành phố Hồ Chí Minh','Co@gmail.com')
INSERT INTO NHACC VALUES ('NCC010',N'Vans',N'60/18 Vạn Kiếp, Phường 3, Bình Thạnh, Thành phố Hồ Chí Minh','Va@gmail.com')
INSERT INTO NHACC VALUES ('NCC011',N'Christian Louboutin',N'345 Đại Lộ Đồng Khởi, P. Phú Khương, Bến Tre','Ch@gmail.com')
INSERT INTO NHACC VALUES ('NCC012',N'Valentino',N'10 Trần Hưng Đạo, Phường 5, Thành phố Cà Mau, Cà Mau','Va@gmail.com')
INSERT INTO NHACC VALUES ('NCC013',N'Jimmy Choo',N'119 Nguyễn Huệ, Phường 5, Tuy Hòa, Phú Yên','Ji@gmail.com')
INSERT INTO NHACC VALUES ('NCC014',N'Manolo Blahnik',N'Nguyễn Huệ, Phường7, Tuy Hòa, Phú Yên','Man@gmail.com')

--Khach hang
INSERT INTO KHACHHANG VALUES (N'Nguyễn Minh Trí',N'+84905011037','TK001','123456','tri@gmail.com',N'Thanh Xuân Trung, Thanh Xuân, Hà Nội')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Phan Hảo',N'+84985654259','TK002','78991011','hao@gmail.com',N'Tuy Hòa, Phú Yên')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Lê Thành Tâm',N'+84902355124','TK003','123','tam@gmail.com',N'Thành phố Cà Mau, Cà Mau')
INSERT INTO KHACHHANG VALUES (N'Lê Duy Tín',N'+84925633548','TK004','00000','tin@gmail.com',N'Phú Nhuận, Thành phố Hồ Chí Minh')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Khánh Duy',N'+84912546987','TK005','5689','duy@gmail.com',N'Thạch Thang, Hải Châu, Đà Nẵng')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Minh Khương',N'+84912548521','TK006','12345','khu@gmail.com',N'P. Phú Khương, Bến Tre')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Đức Trung',N'+84925622213','TK007','9999999','trung@gmail.com',N'Đ. Lê Duẩn, Thạch Thang, Hải Châu, Đà Nẵng')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Bảo Anh',N'+8497844511','TK008','78945','anh@gmail.com',N'P. Lam Sơn, Thành phố Thanh Hóa, Thanh Hoá')
INSERT INTO KHACHHANG VALUES (N'Huỳnh Thị Ngọc Nguyên',N'+84898368112','TK009','2121','ngu@gmail.com',N'Hải Châu, Đà Nẵng')
INSERT INTO KHACHHANG VALUES (N'Lê Thị Thu Trâm',N'+84921255465','TK010','3232','tram@gmail.com',N'Thành phố Cà Mau, Cà Mau')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Quốc Châu',N'+84921255852','TK011','323','chau@gmail.com',N'Tuy Hòa, Phú Yên')
INSERT INTO KHACHHANG VALUES (N'Trương Thị Diễm Quỳnh',N'+84921255121','TK012','147','qu@gmail.com',N'Tuy Hòa, Phú Yên')
INSERT INTO KHACHHANG VALUES (N'Nguyễn Việt Hưng',N'+84956555245','TK013','111','hug@gmail.com',N'Vạn Thọ, Nha Trang')


--Nhan vien 
INSERT INTO NHANVIEN VALUES(N'Nguyễn Lê Thành Tâm','20011201',N'+84905012354',0,'admin','0000','','tam@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Phan Châu Tần','20000201',N'+84902325654',1,'NV2','9999','','tan@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Nguyễn Bình Thạch','19991210',N'+84925648754',1,'NV3','nmt','','thac@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Phạm Ngũ Lão','20020405',N'+84902154875',1,'NV4','5689','','lao@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Trần Ngu','19980521',N'+84854652145',1,'NV5','1478','','ngu@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Bùi Văn Long','19991202',N'+84956799512',1,'NV6','3215','','long@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Toàn Chức','19990508',N'+84921548796',1,'NV7','zxc','','chuc@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Hayate','20011225',N'+84932659844',1,'NV8','asd','','te@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Jonh','20010605',N'+84903326598',0,'NV9','abc','','jonh@gmail.com')
INSERT INTO NHANVIEN VALUES(N'Đỗ Bảo Châu','20010803',N'+84933265963',1,'baochau','2583','','chau@gmail.com')



--San pham 
INSERT INTO SANPHAM VALUES('SP0001','LSP001',N'New Balance 574',N'Đôi',40,700000,'NCC001', 100,N'Giày sneaker New Balance574 là mẫu giày Unisex được các tín đồ cực kỳ yêu thích. Giày có lớp lót được làm từ Cotton giúp cho mọi vận động trở nên cực kỳ thoải mái và êm ái. Thiết kế Cổ thấp trendy thích hợp với những bạn trẻ cá tính và năng động. Đôi sneaker New Balance574 được làm từ Da mang lại sự bền bỉ trong nhiều năm liền. Phần dây được làm theo kiểu Dây khá gọn gàng và tiện dụng.','18.jpg')
INSERT INTO SANPHAM VALUES('SP0002','LSP003',N'Giày Thể Thao Lacoste Storda 120',N'Đôi',40,509000,'NCC003', 80,N'Giày Nike Blazer Mid 77 Vintage là giày sneaker Cổ cao Unisex có trọng lượng khá vừa phải, không khiến cho người dùng có cảm giác nặng gây mỏi cổ chân. Ngoài ra, giày được thiết kế mũi giày dáng Dài vừa thời trang vừa tạo sự thoải mái mà vẫn ôm chân. Lớp lót bên trong giày được làm từ Cao su mang lại cảm giác thoải mái, dễ chịu cho người đi giày dù là trong thời gian dài. Hãng sử dụng Da để làm mặt trên của giày vừa thời trang lại có độ bền cao. Giày Nike Blazer Mid 77 Vintage được sản xuất với đa dạng màu sắc và đủ size để mọi người có thể thoải mái lựa chọn cũng như dễ dàng phối đồ. ','24.jpg')
INSERT INTO SANPHAM VALUES('SP0003','LSP001',N'Nike Blazer Mid 77 Vintage',N'Đôi',40,509000,'NCC003', 80,N'Giày Nike Blazer Mid 77 Vintage là giày sneaker Cổ cao Unisex có trọng lượng khá vừa phải, không khiến cho người dùng có cảm giác nặng gây mỏi cổ chân. Ngoài ra, giày được thiết kế mũi giày dáng Dài vừa thời trang vừa tạo sự thoải mái mà vẫn ôm chân. Lớp lót bên trong giày được làm từ Cao su mang lại cảm giác thoải mái, dễ chịu cho người đi giày dù là trong thời gian dài. Hãng sử dụng Da để làm mặt trên của giày vừa thời trang lại có độ bền cao. Giày Nike Blazer Mid 77 Vintage được sản xuất với đa dạng màu sắc và đủ size để mọi người có thể thoải mái lựa chọn cũng như dễ dàng phối đồ. ','15.jpg')
INSERT INTO SANPHAM VALUES('SP0004','LSP002',N'Lacoste Slip On Tatalya 319',N'Đôi',39,2635000,'NCC004', 70,N'Giày Lacoste Slip on Tatalya 319 (Xanh Navy) sản phẩm đến từ thương hiệu Lacoste nổi tiếng. Với thiết kế trẻ trung, hiện đại đôi giày được nhiều tín đồ mê giày slip on yêu thích. Lót giày sử dụng công nghệ OrthoLite, dày dặn, êm ái, hút ẩm, lưu thông không khí cho bàn chân mát mẻ, ngăn chặn mùi và nấm, giúp chân luôn thoải mái ngay cả khi bạn mang giày cả ngày dài. Đường may của giày tinh tế, tỉ mỉ từng chi tiết, đảm bảo hài lòng ngay cả với khách hàng khó tính nhất. Đôi giày được làm từ chất liệu vải Canvas cao cấp.Phần đế giày được làm từ cao su lưu hóa có độ bền cao, ma sát tốt. Giày tiện lợi, dễ đi, dễ kết hợp với các trang phục khác nhau để thay đổi phong cách cho bản thân.','14.jpg')
INSERT INTO SANPHAM VALUES('SP0005','LSP002',N'Vans Asher Checkerboard Baby Blue',N'Đôi',39,1500000,'NCC005', 60,N'Giày Vans Asher Checkerboard Baby Blue Màu Trắng Xanh là đôi giày cao cấp đến từ thương hiệu Vans nổi tiếng của nước Mỹ. Với đôi giày Asher Checkerboard Baby Blue này chắc chắn bạn sẽ trở nên nổi bật và cuốn hút hơn. Đôi giày này được làm từ chất liệu da và vải cao cấp, bền đẹp trong suốt quá trình sử dụng. Form giày đi lên chân vừa vặn, các đường chỉ khâu vô cùng chắc chắn và tỉ mỉ đảm bảo hài lòng mọi khách hàng. Giày Vans Asher Checkerboard Baby Blue Màu Trắng Xanh dễ dàng kết hợp với nhiều trang phục khác nhau theo sở thích bản thân tạo nên 1 set đồ đẹp khi đi chơi, đi học hay dạo phố...','17.jpg')
INSERT INTO SANPHAM VALUES('SP0006','LSP003',N'Tommy Hilfiger Mans Sandals ',N'Đôi',41,120000,'NCC006', 150,N'Giày thể thao Tommy Hilfiger Mans Sandals Tommy Hilfiger Rafael Phối Màu được thiết kế đẹp mắt đến từ thương hiệu Tommy Hilfiger nổi tiếng. Sở hữu gam màu thanh lịch, cùng chất liệu cao cấp dép Tommy Hilfiger Mans Sandals Tommy Hilfiger Rafael mang đến cảm giác thoải mái khi đi lên chân. Thương hiệu Tommy Hilfiger do nhà thiết kế cùng tên sáng lập năm 1985 với các dòng sản phẩm như: quần áo, trang phục thể thao, đồ Jeans, giày, túi xách, nước hoa, đồng hồ và mắt kính phục vụ cho giới trẻ nam nữ.','24.jpg')
INSERT INTO SANPHAM VALUES('SP0007','LSP004',N'Classy Classic Brogues Derby - DB18',N'Đôi',40,1950000,'NCC007', 20,N'Giày Tây Be Classy Classic Brogues Derby - DB18 Màu Nâu là đôi giày thời trang nam thiết kế đẹp mắt đến từ thương hiệu Be Classy nổi tiếng. Be Classy Classic Brogues Derby - DB18  phù hợp với những trang phục lịch sự đứng đắn như áo sơ mi hay quần âu, phù hợp để diện đi làm, đi dự tiệc,... Giày Tây Be Classy Classic Brogues Derby - DB18 Màu Nâu được làm từ chất liệu 100% da bò thật và chất liệu được nhập khẩu hoàn toàn từ nước ngoài. Form giày với các đường may tỉ mỉ, sắc nét, tinh xảo bởi những người thợ thủ công lành nghề. Lót giầy độc đáo với phần gót da mềm giúp tăng ma sát giữ giày khó trượt khỏi chân, phần mu bàn chân, giúp việc đi giày dễ dàng.','1.jpg')
INSERT INTO SANPHAM VALUES('SP0008','LSP004',N'Be Classy Captoe Derby - DB22',N'Đôi',40,1850000,'NCC008', 16,N'Giày Tây Be Classy Captoe Derby - DB22 Màu Nâu là đôi giày thời trang nam thiết kế đẹp mắt đến từ thương hiệu Be Classy nổi tiếng. Be Classy Captoe Derby - DB22 phù hợp với những trang phục lịch sự đứng đắn như áo sơ mi hay quần âu, phù hợp để diện đi làm, đi dự tiệc,... Giày Tây Be Classy Captoe Derby - DB22 Màu Nâu được làm từ chất liệu 100% da bò thật và chất liệu được nhập khẩu hoàn toàn từ nước ngoài. Form giày với các đường may tỉ mỉ, sắc nét, tinh xảo bởi những người thợ thủ công lành nghề. Lót giầy độc đáo với phần gót da mềm giúp tăng ma sát giữ giày khó trượt khỏi chân, phần mu bàn chân, giúp việc đi giày dễ dàng.','2.jpg')
INSERT INTO SANPHAM VALUES('SP0009','LSP004',N'Be Classy Classic Brogues Derby - Limited',N'Đôi',42,1850000,'NCC009', 60,N'Giày Tây Be Classy Classic Brogues Derby - Limited Edition - DB19 Màu Nâu Vàng là đôi giày thời trang nam thiết kế đẹp mắt đến từ thương hiệu Be Classy nổi tiếng. Be Classy Classic Brogues Derby - Limited Edition - DB19  phù hợp với những trang phục lịch sự đứng đắn như áo sơ mi hay quần âu, phù hợp để diện đi làm, đi dự tiệc,... Form giày với các đường may tỉ mỉ, sắc nét, tinh xảo bởi những người thợ thủ công lành nghề. Lót giầy độc đáo với phần gót da mềm giúp tăng ma sát giữ giày khó trượt khỏi chân, phần mu bàn chân, giúp việc đi giày dễ dàng. Việc sử dụng da, loại vật liệu có thể “thở” làm lót giày giúp chống khuẩn, kháng mùi tốt.','22.jpg')
INSERT INTO SANPHAM VALUES('SP0010','LSP005',N'Brogues Nam Sledgers Nice ',N'Đôi',42,3300000,'NCC010', 50,N'Giày Boots Brogues Nam Sledgers Nice 0118A5107L Màu Đen Size 44 mặt hàng giày dép thời trang chất lượng chính hãng của nhà sản xuất Sledgers nổi tiếng thế giới dạng màu sắc trắng, đỏ, đen, xám, xanh navy... đủ kiểu dáng, hàng sale được Hạ Vàng phân phối với giá tốt,  ưu đãi nhất trên sàn thương mại điện tử Vua Hàng Hiệu. Giày Tây Brogues Nam Sledgers Nice 0118A5107L Màu Đen Size 44 với thiết kế sang trọng và lịch lãm, kết hợp cùng chất liệu da cao cấp, bền đẹp, cho phái mạnh thêm tự tin và khẳng định đẳng cấp của mình. Bên cạnh đó, giày được thiết kế theo công nghệ hiện đại, đem lại sự thoải mái, êm ái cho người mang.','8.jpg')
INSERT INTO SANPHAM VALUES('SP0011','LSP001',N'Sneaker MLB Big Ball',N'Đôi',38,1250000,'NCC003', 60,N'Giày Sneakers Ecko Unltd OF21-26006 Phối Màu sở hữu kiểu dáng thời trang, hiện đại đến từ thương hiệu Ecko Unltd nổi tiếng. Với đôi giày sneakers này bạn có thể dễ dàng kết hợp với nhiều trang phục khác nhau tạo nên set đồ đẹp mắt,  phù hợp với những trang phục lịch sự đứng đắn như áo sơ mi hay quần âu, phù hợp để diện đi làm, đi dự tiệc,... Form giày với các đường may tỉ mỉ, sắc nét, tinh xảo bởi những người thợ thủ công lành nghề. Lót giầy độc đáo với phần gót da mềm giúp tăng ma sát giữ giày khó trượt khỏi chân, phần mu bàn chân, giúp việc đi giày dễ dàng. Việc sử dụng da, loại vật liệu có thể “thở” làm lót giày giúp chống khuẩn, kháng mùi tốt.','19.jpg')
INSERT INTO SANPHAM VALUES('SP0012','LSP001',N'Sneakers Ecko Unltd OF21',N'Đôi',32,1450000,'NCC003', 50,N'Giày MLB Big Ball Chunky A New York Yankees Màu Trắng Logo Đen size 260 là đôi giày cao cấp với thiết kế hiện đại, thời trang đến từ thương hiệu MLB nổi tiếng của Hàn Quốc. MLB Big Ball Chunky A sẽ cho bạn trải nghiệm tuyệt vời nhất khi đi lên chân Đôi giày này được làm từ chất liệu da và vải cao cấp, bền đẹp trong suốt quá trình sử dụng. Form giày đi lên chân vừa vặn, các đường chỉ khâu vô cùng chắc chắn và tỉ mỉ đảm bảo hài lòng mọi khách hàng','24.jpg')
INSERT INTO SANPHAM VALUES('SP0013','LSP003',N'Sneakers Best Saller',N'Đôi',32,1450000,'NCC003', 50,N'Giày MLB Big Ball Chunky A New York Yankees Màu Trắng Logo Đen size 260 là đôi giày cao cấp với thiết kế hiện đại, thời trang đến từ thương hiệu MLB nổi tiếng của Hàn Quốc. MLB Big Ball Chunky A sẽ cho bạn trải nghiệm tuyệt vời nhất khi đi lên chân Đôi giày này được làm từ chất liệu da và vải cao cấp, bền đẹp trong suốt quá trình sử dụng. Form giày đi lên chân vừa vặn, các đường chỉ khâu vô cùng chắc chắn và tỉ mỉ đảm bảo hài lòng mọi khách hàng','10.jpg')


-- Tạo proc tìm kiếm
go
CREATE PROCEDURE SanPham_TimKiem
    @masp varchar(10)=NULL,
	@tensp nvarchar(200)=NULL,
	
	@giaMin varchar(30)=NULL,
	@giaMax varchar(30)=NULL,
	
	@mancc varchar(10)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM SANPHAM
       WHERE  (1=1)
       '
IF @masp IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MASP LIKE ''%'+@masp+'%'')
              '
IF @tensp IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TENSP LIKE ''%'+@tensp+'%'')
              '

             
IF @giaMin IS NOT NULL and @giaMax IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (DonGia Between Convert(int,'''+@giaMin+''') AND Convert(int, '''+@giaMax+'''))
             '
         
IF @mancc IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MANCC LIKE ''%'+@mancc+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr 
END

--drop proc SanPham_TimKiem

EXEC SanPham_TimKiem null , null, 509000, 1450000, null

