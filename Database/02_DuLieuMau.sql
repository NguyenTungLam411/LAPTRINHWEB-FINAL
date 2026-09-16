-- ============================================================================
--  TOANTECH - DU LIEU MAU
--  Bai tap lon mon Lap trinh web - Khoa CNTT, Truong Dai hoc Mo Ha Noi
--
--  Chay tep 01_TaoBang.sql TRUOC, sau do chay tep nay.
--  Sinh tu dong ngay 14/09/2026 22:09
-- ============================================================================
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
GO

USE [ToanTechDB];
GO

-- Xoa du lieu cu (neu co) theo thu tu nguoc cua khoa ngoai
DELETE FROM [ContactMessages];
DELETE FROM [OrderDetails];
DELETE FROM [Orders];
DELETE FROM [NewsArticles];
DELETE FROM [NewsCategories];
DELETE FROM [ProductImages];
DELETE FROM [Products];
DELETE FROM [Categories];
DELETE FROM [BusinessFields];
DELETE FROM [UserRoles];
DELETE FROM [Users];
DELETE FROM [Roles];
GO

-- ----------------------------------------------------------------------------
--  Bang [Roles] : 3 ban ghi
-- ----------------------------------------------------------------------------
INSERT INTO [Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES
(N'697809cd-03c7-4391-a70e-c3e8f067442d', N'Staff', N'STAFF', NULL),
(N'7c33e524-e0f5-4978-83a9-7594c143cc9a', N'Customer', N'CUSTOMER', NULL),
(N'abdb7d3e-f45b-4bf8-a2bb-15a0fb9a1db8', N'Administrator', N'ADMINISTRATOR', NULL);
GO

-- ----------------------------------------------------------------------------
--  Bang [Users] : 3 ban ghi
-- ----------------------------------------------------------------------------
INSERT INTO [Users] ([Id], [FullName], [Address], [DateOfBirth], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES
(N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, '2026-09-14T22:00:59.201', 1, N'khachhang@gmail.com', N'KHACHHANG@GMAIL.COM', N'khachhang@gmail.com', N'KHACHHANG@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB4iDAF7EP8YeqNhXHvQRRnIK4b2lPcJSHGLy7owvUSlNTYgKsHY4klWicA7TRQFxg==', N'O42G6WSONCKSEKXEY2LDJDPWACRIFMWH', N'abbcff7e-fa07-4c55-957f-1eb328819364', N'0901234567', 0, 0, NULL, 1, 0),
(N'471ca4d7-a6c2-49d5-85f5-7f370c69d4c9', N'Trần Thị Nhân Viên', N'Số 12 Trần Duy Hưng, Cầu Giấy, Hà Nội', NULL, '2026-09-14T22:00:59.078', 1, N'nhanvien@toantech.vn', N'NHANVIEN@TOANTECH.VN', N'nhanvien@toantech.vn', N'NHANVIEN@TOANTECH.VN', 1, N'AQAAAAIAAYagAAAAENrGJkK4sSShdLAT6AdK0QJkp7YyS2oMzeRyewsKkja6kbc23MfkylJLqzmuB2NuwQ==', N'BGBEU36FFCQHOF5QKZTE7ZBVLUHXDUVR', N'da8cedfc-ecfb-4a6c-944c-1f75b75dacf9', N'0987654321', 0, 0, NULL, 1, 0),
(N'b3cdfbef-845f-4a4c-b734-7b74c2effa65', N'Lưu Đức Toàn', N'Số 96 Định Công, Hoàng Mai, Hà Nội', NULL, '2026-09-14T22:00:58.481', 1, N'admin@toantech.vn', N'ADMIN@TOANTECH.VN', N'admin@toantech.vn', N'ADMIN@TOANTECH.VN', 1, N'AQAAAAIAAYagAAAAEOccshpsGujIDpGS1Z+boFa/1xa7j8aU9dKFgiqCfjVCv6Viuv2J17v+4SHhWS2UjA==', N'A5JSZTK3W5YZQL5GMTFAFRVYTZR2WUEP', N'a91476ca-3058-445c-a7f6-c628f4678571', N'0912345678', 0, 0, NULL, 1, 0);
GO

-- ----------------------------------------------------------------------------
--  Bang [UserRoles] : 3 ban ghi
-- ----------------------------------------------------------------------------
INSERT INTO [UserRoles] ([UserId], [RoleId]) VALUES
(N'471ca4d7-a6c2-49d5-85f5-7f370c69d4c9', N'697809cd-03c7-4391-a70e-c3e8f067442d'),
(N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'7c33e524-e0f5-4978-83a9-7594c143cc9a'),
(N'b3cdfbef-845f-4a4c-b734-7b74c2effa65', N'abdb7d3e-f45b-4bf8-a2bb-15a0fb9a1db8');
GO

-- ----------------------------------------------------------------------------
--  Bang [BusinessFields] : 4 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [BusinessFields] ON;
INSERT INTO [BusinessFields] ([Id], [Name], [Slug], [Summary], [Content], [ImageUrl], [IconClass], [DisplayOrder], [IsActive], [CreatedAt]) VALUES
(1, N'Phân phối thiết bị công nghệ', N'phan-phoi-thiet-bi-cong-nghe', N'Nhà phân phối uỷ quyền của Dell, HP, Lenovo, Asus, Samsung tại thị trường miền Bắc.', N'<p>TOANTECH là nhà phân phối uỷ quyền chính thức của nhiều thương hiệu công nghệ hàng đầu thế giới. Chúng tôi cung cấp máy tính xách tay, máy tính để bàn, màn hình, thiết bị mạng và phụ kiện chính hãng với chế độ bảo hành đầy đủ theo tiêu chuẩn của hãng.</p><h3>Cam kết của chúng tôi</h3><ul><li>100% hàng chính hãng, đầy đủ hoá đơn VAT</li><li>Bảo hành theo tiêu chuẩn của nhà sản xuất</li><li>Giá bán cạnh tranh nhờ nhập khẩu trực tiếp</li><li>Giao hàng toàn quốc trong 24 - 72 giờ</li></ul>', N'/images/fields/phan-phoi.svg', N'bi-laptop', 1, 1, '2026-09-14T22:00:59.353'),
(2, N'Giải pháp hạ tầng công nghệ thông tin', N'giai-phap-ha-tang-cntt', N'Tư vấn, thiết kế và triển khai hệ thống mạng, máy chủ, lưu trữ cho doanh nghiệp.', N'<p>Đội ngũ kỹ sư được chứng nhận quốc tế của TOANTECH cung cấp trọn gói giải pháp hạ tầng công nghệ thông tin cho doanh nghiệp vừa và lớn.</p><h3>Dịch vụ bao gồm</h3><ul><li>Khảo sát và thiết kế hệ thống mạng LAN/WAN</li><li>Triển khai máy chủ, ảo hoá, sao lưu và phục hồi dữ liệu</li><li>Xây dựng hệ thống camera giám sát, kiểm soát ra vào</li><li>Bảo trì định kỳ theo hợp đồng năm</li></ul>', N'/images/fields/ha-tang.svg', N'bi-hdd-network', 2, 1, '2026-09-14T22:00:59.354'),
(3, N'Dịch vụ bảo hành - sửa chữa', N'dich-vu-bao-hanh-sua-chua', N'Trung tâm bảo hành uỷ quyền với kỹ thuật viên giàu kinh nghiệm, linh kiện chính hãng.', N'<p>Trung tâm dịch vụ của TOANTECH tiếp nhận bảo hành và sửa chữa mọi thiết bị công nghệ, kể cả sản phẩm không mua tại công ty.</p><h3>Quy trình 4 bước</h3><ol><li>Tiếp nhận và kiểm tra tình trạng máy</li><li>Báo giá minh bạch trước khi sửa chữa</li><li>Thực hiện sửa chữa, thay thế linh kiện chính hãng</li><li>Bàn giao, bảo hành dịch vụ tối thiểu 3 tháng</li></ol>', N'/images/fields/bao-hanh.svg', N'bi-tools', 3, 1, '2026-09-14T22:00:59.354'),
(4, N'Phát triển phần mềm theo yêu cầu', N'phat-trien-phan-mem-theo-yeu-cau', N'Xây dựng website, ứng dụng quản lý và hệ thống thương mại điện tử cho doanh nghiệp.', N'<p>TOANTECH nhận phân tích, thiết kế và phát triển phần mềm theo đặc thù nghiệp vụ của từng khách hàng, trên nền tảng ASP.NET Core và MS SQL Server.</p><h3>Sản phẩm tiêu biểu</h3><ul><li>Website giới thiệu doanh nghiệp và thương mại điện tử</li><li>Phần mềm quản lý kho, bán hàng, nhân sự</li><li>Tích hợp cổng thanh toán và hoá đơn điện tử</li></ul>', N'/images/fields/phan-mem.svg', N'bi-code-slash', 4, 1, '2026-09-14T22:00:59.354');
SET IDENTITY_INSERT [BusinessFields] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [Categories] : 21 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [Categories] ON;
INSERT INTO [Categories] ([Id], [Name], [Slug], [Description], [IconClass], [ParentId], [Kind], [DisplayOrder], [IsActive]) VALUES
(1, N'Máy tính xách tay', N'may-tinh-xach-tay', N'Laptop văn phòng, đồ hoạ và gaming từ các thương hiệu lớn.', N'bi-laptop', NULL, 0, 1, 1),
(2, N'Máy tính để bàn', N'may-tinh-de-ban', N'PC nguyên bộ và máy trạm cho doanh nghiệp.', N'bi-pc-display', NULL, 0, 2, 1),
(3, N'Điện thoại - Máy tính bảng', N'dien-thoai-may-tinh-bang', N'Điện thoại thông minh và máy tính bảng chính hãng.', N'bi-phone', NULL, 0, 3, 1),
(4, N'Linh kiện - Phụ kiện', N'linh-kien-phu-kien', N'Bàn phím, chuột, tai nghe, ổ cứng và các phụ kiện khác.', N'bi-usb-drive', NULL, 0, 4, 1),
(5, N'Thiết bị mạng - Văn phòng', N'thiet-bi-mang-van-phong', N'Router, switch, máy in, camera giám sát.', N'bi-router', NULL, 0, 5, 1),
(6, N'Dịch vụ công nghệ', N'dich-vu-cong-nghe', N'Các gói dịch vụ kỹ thuật do TOANTECH cung cấp.', N'bi-tools', NULL, 1, 6, 1),
(7, N'Laptop văn phòng', N'laptop-van-phong', NULL, NULL, 1, 0, 1, 1),
(8, N'Laptop gaming', N'laptop-gaming', NULL, NULL, 1, 0, 2, 1),
(9, N'Laptop đồ hoạ - kỹ thuật', N'laptop-do-hoa-ky-thuat', NULL, NULL, 1, 0, 3, 1),
(10, N'PC đồng bộ', N'pc-dong-bo', NULL, NULL, 2, 0, 1, 1),
(11, N'Màn hình máy tính', N'man-hinh-may-tinh', NULL, NULL, 2, 0, 2, 1),
(12, N'Điện thoại thông minh', N'dien-thoai-thong-minh', NULL, NULL, 3, 0, 1, 1),
(13, N'Máy tính bảng', N'may-tinh-bang', NULL, NULL, 3, 0, 2, 1),
(14, N'Bàn phím - Chuột', N'ban-phim-chuot', NULL, NULL, 4, 0, 1, 1),
(15, N'Tai nghe - Loa', N'tai-nghe-loa', NULL, NULL, 4, 0, 2, 1),
(16, N'Ổ cứng - Bộ nhớ', N'o-cung-bo-nho', NULL, NULL, 4, 0, 3, 1),
(17, N'Router - Switch', N'router-switch', NULL, NULL, 5, 0, 1, 1),
(18, N'Máy in - Máy quét', N'may-in-may-quet', NULL, NULL, 5, 0, 2, 1),
(19, N'Camera giám sát', N'camera-giam-sat', NULL, NULL, 5, 0, 3, 1),
(20, N'Bảo trì hệ thống', N'bao-tri-he-thong', NULL, NULL, 6, 1, 1, 1),
(21, N'Thiết kế website', N'thiet-ke-website', NULL, NULL, 6, 1, 2, 1);
SET IDENTITY_INSERT [Categories] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [Products] : 26 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [Products] ON;
INSERT INTO [Products] ([Id], [Sku], [Name], [Slug], [CategoryId], [Brand], [ShortDescription], [Description], [Price], [OldPrice], [StockQuantity], [ImageUrl], [IsFeatured], [IsActive], [ViewCount], [CreatedAt], [UpdatedAt]) VALUES
(1, N'LTP-001', N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', N'laptop-dell-inspiron-15-3520-i5-1235u-16gb-512gb', 7, N'Dell', N'Màn hình 15.6" FHD, chip Intel Core i5 thế hệ 12, RAM 16GB, SSD 512GB - lựa chọn cân bằng cho công việc văn phòng.', N'<p>Dell Inspiron 15 3520 là mẫu laptop văn phòng bán chạy nhất của Dell trong phân khúc tầm trung.</p><h3>Thông số kỹ thuật</h3><ul><li>CPU: Intel Core i5-1235U (10 nhân, 12 luồng)</li><li>RAM: 16GB DDR4 3200MHz, nâng cấp tối đa 32GB</li><li>Ổ cứng: SSD NVMe 512GB</li><li>Màn hình: 15.6 inch Full HD 120Hz</li><li>Pin: 3 cell 41WHr, sạc nhanh ExpressCharge</li><li>Khối lượng: 1.65 kg</li></ul><p>Bảo hành chính hãng 12 tháng tại trung tâm của Dell Việt Nam.</p>', 16990000.00, 18990000.00, 25, N'/images/products/laptop-1.svg', 1, 1, 266, '2026-06-24T22:00:59.769', NULL),
(2, N'LTP-002', N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', N'laptop-hp-pavilion-14-dv2073tu-i5-1235u-8gb-256gb', 7, N'HP', N'Thiết kế mỏng nhẹ 1.41kg, màn hình 14" IPS, phù hợp nhân viên văn phòng thường xuyên di chuyển.', N'<p>HP Pavilion 14 mang thiết kế kim loại sang trọng trong thân máy chỉ 1.41 kg.</p><h3>Thông số kỹ thuật</h3><ul><li>CPU: Intel Core i5-1235U</li><li>RAM: 8GB DDR4, 1 khe trống để nâng cấp</li><li>Ổ cứng: SSD NVMe 256GB</li><li>Màn hình: 14 inch FHD IPS chống chói</li><li>Cổng kết nối: USB-C, 2x USB-A, HDMI 2.1</li></ul>', 15490000.00, 17290000.00, 18, N'/images/products/laptop-2.svg', 0, 1, 232, '2026-08-25T22:00:59.769', NULL),
(3, N'LTP-003', N'Laptop Gaming Asus TUF F15 i7-12700H RTX 4060', N'laptop-gaming-asus-tuf-f15-i7-12700h-rtx-4060', 8, N'Asus', N'Card đồ hoạ RTX 4060 8GB, màn hình 144Hz, chuẩn quân đội MIL-STD-810H.', N'<p>Asus TUF Gaming F15 là chiến binh bền bỉ dành cho game thủ và người làm đồ hoạ.</p><h3>Thông số kỹ thuật</h3><ul><li>CPU: Intel Core i7-12700H (14 nhân, 20 luồng)</li><li>GPU: NVIDIA GeForce RTX 4060 8GB GDDR6</li><li>RAM: 16GB DDR5 4800MHz</li><li>Ổ cứng: SSD NVMe PCIe 4.0 512GB</li><li>Màn hình: 15.6 inch FHD 144Hz, phủ 100% sRGB</li><li>Tản nhiệt: 2 quạt Arc Flow, 4 ống đồng</li></ul>', 32990000.00, 35990000.00, 12, N'/images/products/laptop-3.svg', 1, 1, 220, '2026-07-07T22:00:59.769', NULL),
(4, N'LTP-004', N'Laptop Lenovo LOQ 15IRH8 i5-12450HX RTX 3050', N'laptop-lenovo-loq-15irh8-i5-12450hx-rtx-3050', 8, N'Lenovo', N'Laptop gaming giá tốt với RTX 3050 6GB và màn hình 144Hz.', N'<p>Lenovo LOQ là dòng gaming phổ thông mới của Lenovo, kế thừa thiết kế tản nhiệt từ dòng Legion.</p><h3>Thông số kỹ thuật</h3><ul><li>CPU: Intel Core i5-12450HX</li><li>GPU: NVIDIA RTX 3050 6GB</li><li>RAM: 16GB DDR5</li><li>Màn hình: 15.6 inch FHD 144Hz</li></ul>', 21990000.00, 23990000.00, 9, N'/images/products/laptop-4.svg', 0, 1, 683, '2026-09-04T22:00:59.769', NULL),
(5, N'LTP-005', N'Laptop Dell Precision 3581 i7-13700H RTX A500 Workstation', N'laptop-dell-precision-3581-i7-13700h-rtx-a500-workstation', 9, N'Dell', N'Máy trạm di động đạt chứng chỉ ISV cho AutoCAD, SolidWorks, Revit.', N'<p>Dell Precision 3581 được chứng nhận tương thích bởi Autodesk, Dassault và Siemens.</p><h3>Thông số kỹ thuật</h3><ul><li>CPU: Intel Core i7-13700H</li><li>GPU: NVIDIA RTX A500 4GB (chuẩn đồ hoạ chuyên nghiệp)</li><li>RAM: 32GB DDR5 ECC</li><li>Ổ cứng: SSD NVMe 1TB</li><li>Màn hình: 15.6 inch FHD+ 400nits</li></ul>', 45990000.00, NULL, 6, N'/images/products/laptop-5.svg', 1, 1, 180, '2026-06-01T22:00:59.769', NULL),
(6, N'LTP-006', N'MacBook Air M2 13 inch 8GB 256GB', N'macbook-air-m2-13-inch-8gb-256gb', 9, N'Apple', N'Chip Apple M2, màn hình Liquid Retina, thời lượng pin tới 18 giờ.', N'<p>MacBook Air M2 kết hợp hiệu năng mạnh mẽ với thiết kế mỏng nhẹ chỉ 1.24 kg.</p><h3>Thông số kỹ thuật</h3><ul><li>Chip: Apple M2 8 nhân CPU, 8 nhân GPU</li><li>RAM: 8GB bộ nhớ hợp nhất</li><li>Ổ cứng: SSD 256GB</li><li>Màn hình: 13.6 inch Liquid Retina 500 nits</li><li>Pin: tới 18 giờ xem video</li></ul>', 24990000.00, 27990000.00, 14, N'/images/products/laptop-6.svg', 1, 1, 267, '2026-06-09T22:00:59.769', NULL),
(7, N'PCD-001', N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', N'pc-dong-bo-dell-optiplex-7010-sff-i5-13500-8gb-256gb', 10, N'Dell', N'Máy tính để bàn nhỏ gọn cho doanh nghiệp, bảo hành 3 năm tại chỗ.', N'<p>Dell OptiPlex 7010 SFF phù hợp triển khai đồng loạt cho văn phòng nhờ độ ổn định cao.</p><h3>Thông số kỹ thuật</h3><ul><li>CPU: Intel Core i5-13500 (14 nhân)</li><li>RAM: 8GB DDR4, hỗ trợ tối đa 64GB</li><li>Ổ cứng: SSD NVMe 256GB</li><li>Bảo hành: 3 năm ProSupport tại chỗ</li></ul>', 17990000.00, 19490000.00, 20, N'/images/products/pc-1.svg', 0, 1, 224, '2026-06-27T22:00:59.769', NULL),
(8, N'PCD-002', N'PC Gaming TOANTECH i5-13400F | RTX 4060 | 16GB', N'pc-gaming-toantech-i5-13400f-rtx-4060-16gb', 10, N'TOANTECH', N'Bộ máy chơi game do TOANTECH lắp ráp, đã cài sẵn Windows và driver.', N'<p>Cấu hình được kỹ thuật viên TOANTECH tối ưu để chơi tốt các tựa game phổ biến ở độ phân giải 2K.</p><h3>Cấu hình</h3><ul><li>CPU: Intel Core i5-13400F</li><li>Mainboard: ASUS PRIME B760M-K</li><li>VGA: RTX 4060 8GB</li><li>RAM: 16GB DDR4 3200MHz (2x8)</li><li>SSD: 500GB NVMe Gen4</li><li>Nguồn: 650W 80Plus Bronze</li></ul>', 23490000.00, 25990000.00, 8, N'/images/products/pc-2.svg', 1, 1, 196, '2026-06-27T22:00:59.769', NULL),
(9, N'MHI-001', N'Màn hình Dell P2422H 24 inch IPS FHD', N'man-hinh-dell-p2422h-24-inch-ips-fhd', 11, N'Dell', N'Màn hình 24" IPS, viền mỏng, chân đế nâng hạ xoay dọc.', N'<p>Dell P2422H là màn hình văn phòng tiêu chuẩn với khả năng bảo vệ mắt ComfortView Plus.</p><h3>Thông số kỹ thuật</h3><ul><li>Kích thước: 23.8 inch</li><li>Tấm nền: IPS, Full HD 1920x1080</li><li>Tần số quét: 60Hz, thời gian phản hồi 5ms</li><li>Cổng: HDMI, DisplayPort, VGA, 4x USB</li></ul>', 3990000.00, 4590000.00, 40, N'/images/products/monitor-1.svg', 0, 1, 627, '2026-06-10T22:00:59.769', NULL),
(10, N'MHI-002', N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', N'man-hinh-gaming-lg-ultragear-27gp850-27-inch-2k-165hz', 11, N'LG', N'Tấm nền Nano IPS 2K, 165Hz, 1ms, hỗ trợ G-Sync và FreeSync Premium.', N'<p>LG UltraGear 27GP850 phù hợp cho cả chơi game tốc độ cao lẫn công việc đồ hoạ.</p><h3>Thông số kỹ thuật</h3><ul><li>Độ phân giải: 2560x1440 (QHD)</li><li>Tần số quét: 165Hz (ép xung 180Hz)</li><li>Độ phủ màu: 98% DCI-P3</li><li>HDR: VESA DisplayHDR 400</li></ul>', 9490000.00, 10990000.00, 15, N'/images/products/monitor-2.svg', 1, 1, 323, '2026-06-01T22:00:59.769', NULL),
(11, N'DTH-001', N'Samsung Galaxy S24 5G 8GB 256GB', N'samsung-galaxy-s24-5g-8gb-256gb', 12, N'Samsung', N'Chip Snapdragon 8 Gen 3, màn hình Dynamic AMOLED 2X 120Hz, Galaxy AI.', N'<p>Galaxy S24 là thế hệ điện thoại đầu tiên của Samsung tích hợp sâu Galaxy AI.</p><h3>Thông số kỹ thuật</h3><ul><li>Màn hình: 6.2 inch Dynamic AMOLED 2X, 120Hz</li><li>Chip: Snapdragon 8 Gen 3 for Galaxy</li><li>Camera: 50MP + 12MP góc rộng + 10MP tele</li><li>Pin: 4000mAh, sạc nhanh 25W</li></ul>', 21990000.00, 23990000.00, 22, N'/images/products/phone-1.svg', 1, 1, 395, '2026-06-22T22:00:59.769', NULL),
(12, N'DTH-002', N'iPhone 15 128GB', N'iphone-15-128gb', 12, N'Apple', N'Chip A16 Bionic, camera chính 48MP, cổng USB-C, Dynamic Island.', N'<p>iPhone 15 mang nhiều nâng cấp đáng giá so với thế hệ trước, đặc biệt là cổng USB-C.</p><h3>Thông số kỹ thuật</h3><ul><li>Màn hình: 6.1 inch Super Retina XDR</li><li>Chip: Apple A16 Bionic</li><li>Camera: 48MP chính + 12MP siêu rộng</li><li>Kết nối: USB-C, 5G, Wi-Fi 6</li></ul>', 19990000.00, 22990000.00, 17, N'/images/products/phone-2.svg', 1, 1, 536, '2026-05-29T22:00:59.769', NULL),
(13, N'DTH-003', N'Xiaomi Redmi Note 13 Pro 8GB 256GB', N'xiaomi-redmi-note-13-pro-8gb-256gb', 12, N'Xiaomi', N'Camera 200MP, màn hình AMOLED 120Hz, sạc nhanh 67W.', N'<p>Redmi Note 13 Pro tiếp tục là lựa chọn hàng đầu trong phân khúc phổ thông.</p><h3>Thông số kỹ thuật</h3><ul><li>Màn hình: 6.67 inch AMOLED 120Hz</li><li>Chip: MediaTek Helio G99 Ultra</li><li>Camera: 200MP OIS</li><li>Pin: 5000mAh, sạc 67W</li></ul>', 6490000.00, 7490000.00, 35, N'/images/products/phone-3.svg', 0, 1, 361, '2026-08-25T22:00:59.769', NULL),
(14, N'MTB-001', N'iPad Gen 10 WiFi 64GB', N'ipad-gen-10-wifi-64gb', 13, N'Apple', N'Màn hình 10.9 inch Liquid Retina, chip A14 Bionic, hỗ trợ Apple Pencil.', N'<p>iPad Gen 10 là máy tính bảng phổ thông tốt nhất cho học tập và giải trí.</p><h3>Thông số kỹ thuật</h3><ul><li>Màn hình: 10.9 inch Liquid Retina</li><li>Chip: Apple A14 Bionic</li><li>Camera trước: 12MP đặt cạnh ngang</li><li>Kết nối: USB-C</li></ul>', 10990000.00, 12990000.00, 19, N'/images/products/tablet-1.svg', 0, 1, 660, '2026-07-12T22:00:59.769', NULL),
(15, N'BPC-001', N'Bàn phím cơ Akko 3068B Plus World Tour Tokyo', N'ban-phim-co-akko-3068b-plus-world-tour-tokyo', 14, N'Akko', N'Bàn phím cơ 65%, kết nối 3 chế độ Bluetooth / 2.4GHz / USB-C.', N'<p>Akko 3068B Plus nổi bật với bộ keycap PBT Double-shot bền màu.</p><h3>Thông số kỹ thuật</h3><ul><li>Layout: 68 phím (65%)</li><li>Switch: Akko CS Jelly Purple, hot-swap</li><li>Kết nối: Bluetooth 5.0 / 2.4GHz / USB-C</li><li>Pin: 3000mAh</li></ul>', 1690000.00, 1990000.00, 50, N'/images/products/keyboard-1.svg', 1, 1, 253, '2026-06-30T22:00:59.769', NULL),
(16, N'BPC-002', N'Chuột không dây Logitech MX Master 3S', N'chuot-khong-day-logitech-mx-master-3s', 14, N'Logitech', N'Cảm biến 8000 DPI, cuộn MagSpeed, click siêu êm, kết nối 3 thiết bị.', N'<p>MX Master 3S là chuột năng suất cao được giới lập trình viên và nhà thiết kế ưa chuộng.</p><h3>Thông số kỹ thuật</h3><ul><li>Cảm biến: Darkfield 8000 DPI</li><li>Kết nối: Bluetooth / Logi Bolt, tối đa 3 thiết bị</li><li>Pin: sạc 1 phút dùng 3 giờ, đầy dùng 70 ngày</li></ul>', 2390000.00, 2790000.00, 45, N'/images/products/mouse-1.svg', 1, 1, 370, '2026-07-04T22:00:59.769', NULL),
(17, N'TNL-001', N'Tai nghe Sony WH-1000XM5 Chống ồn', N'tai-nghe-sony-wh-1000xm5-chong-on', 15, N'Sony', N'Chống ồn chủ động hàng đầu thị trường, pin 30 giờ, sạc nhanh 3 phút dùng 3 giờ.', N'<p>Sony WH-1000XM5 sử dụng 8 micro và 2 vi xử lý để loại bỏ tiếng ồn môi trường.</p><h3>Thông số kỹ thuật</h3><ul><li>Driver: 30mm carbon fiber</li><li>Chống ồn: QN1 + V1 dual processor</li><li>Pin: 30 giờ (bật ANC)</li><li>Codec: LDAC, AAC, SBC</li></ul>', 6990000.00, 8490000.00, 23, N'/images/products/headphone-1.svg', 1, 1, 265, '2026-07-02T22:00:59.769', NULL),
(18, N'TNL-002', N'Loa Bluetooth JBL Charge 5', N'loa-bluetooth-jbl-charge-5', 15, N'JBL', N'Chuẩn chống nước IP67, pin 20 giờ, kiêm sạc dự phòng cho điện thoại.', N'<p>JBL Charge 5 cho âm bass mạnh mẽ và độ bền cao, phù hợp mang đi dã ngoại.</p><h3>Thông số kỹ thuật</h3><ul><li>Công suất: 40W RMS</li><li>Pin: 7500mAh, 20 giờ phát nhạc</li><li>Kháng nước: IP67</li></ul>', 3290000.00, 3990000.00, 30, N'/images/products/speaker-1.svg', 0, 1, 805, '2026-07-14T22:00:59.769', NULL),
(19, N'OCU-001', N'Ổ cứng SSD Samsung 980 PRO 1TB NVMe PCIe 4.0', N'o-cung-ssd-samsung-980-pro-1tb-nvme-pcie-4-0', 16, N'Samsung', N'Tốc độ đọc 7000MB/s, ghi 5000MB/s - lý tưởng cho dựng phim và chơi game.', N'<p>Samsung 980 PRO là một trong những SSD PCIe 4.0 nhanh nhất hiện nay.</p><h3>Thông số kỹ thuật</h3><ul><li>Chuẩn: M.2 2280 NVMe PCIe 4.0 x4</li><li>Tốc độ đọc/ghi: 7000 / 5000 MB/s</li><li>Độ bền: 600 TBW</li><li>Bảo hành: 5 năm</li></ul>', 2790000.00, 3290000.00, 60, N'/images/products/ssd-1.svg', 1, 1, 632, '2026-08-29T22:00:59.769', NULL),
(20, N'OCU-002', N'RAM Kingston Fury Beast 16GB DDR4 3200MHz', N'ram-kingston-fury-beast-16gb-ddr4-3200mhz', 16, N'Kingston', N'Tản nhiệt nhôm, hỗ trợ XMP 2.0, bảo hành trọn đời.', N'<p>Kingston Fury Beast là lựa chọn nâng cấp RAM phổ biến nhờ độ tương thích cao.</p><h3>Thông số kỹ thuật</h3><ul><li>Dung lượng: 16GB (1x16GB)</li><li>Bus: 3200MHz, CL16</li><li>Điện áp: 1.35V</li><li>Bảo hành: trọn đời</li></ul>', 1090000.00, 1290000.00, 70, N'/images/products/ram-1.svg', 0, 1, 624, '2026-06-12T22:00:59.769', NULL),
(21, N'RTS-001', N'Router WiFi 6 TP-Link Archer AX55', N'router-wifi-6-tp-link-archer-ax55', 17, N'TP-Link', N'WiFi 6 chuẩn AX3000, 4 ăng-ten, hỗ trợ OFDMA và MU-MIMO.', N'<p>Archer AX55 phù hợp cho hộ gia đình và văn phòng nhỏ dưới 30 thiết bị.</p><h3>Thông số kỹ thuật</h3><ul><li>Chuẩn: WiFi 6 AX3000 (2402 + 574 Mbps)</li><li>Cổng: 1 WAN + 4 LAN Gigabit</li><li>Bảo mật: WPA3, HomeShield</li></ul>', 1890000.00, 2290000.00, 38, N'/images/products/router-1.svg', 0, 1, 682, '2026-06-13T22:00:59.769', NULL),
(22, N'RTS-002', N'Switch Cisco SG250-26 24 cổng Gigabit', N'switch-cisco-sg250-26-24-cong-gigabit', 17, N'Cisco', N'Switch quản lý lớp 2, 24 cổng Gigabit + 2 cổng SFP, hỗ trợ VLAN.', N'<p>Cisco SG250-26 là switch quản lý thông minh cho hệ thống mạng doanh nghiệp vừa.</p><h3>Thông số kỹ thuật</h3><ul><li>Cổng: 24 x 10/100/1000 + 2 x SFP</li><li>Quản lý: Web GUI, VLAN, QoS, ACL</li><li>Công suất chuyển mạch: 52 Gbps</li></ul>', 6490000.00, NULL, 10, N'/images/products/switch-1.svg', 0, 1, 487, '2026-08-21T22:00:59.769', NULL),
(23, N'MIN-001', N'Máy in laser Canon LBP2900 (in đen trắng)', N'may-in-laser-canon-lbp2900-in-den-trang', 18, N'Canon', N'Tốc độ in 12 trang/phút, độ bền cao, chi phí vận hành thấp.', N'<p>Canon LBP2900 là máy in laser đen trắng bán chạy nhất tại Việt Nam nhiều năm liền.</p><h3>Thông số kỹ thuật</h3><ul><li>Tốc độ: 12 trang/phút A4</li><li>Độ phân giải: 600 x 600 dpi</li><li>Kết nối: USB 2.0</li><li>Hộp mực: Canon 303</li></ul>', 3490000.00, 3890000.00, 25, N'/images/products/printer-1.svg', 0, 1, 306, '2026-05-21T22:00:59.769', NULL),
(24, N'CAM-001', N'Camera IP Wifi Imou Ranger 2 4MP', N'camera-ip-wifi-imou-ranger-2-4mp', 19, N'Imou', N'Xoay 360 độ, đàm thoại 2 chiều, phát hiện chuyển động và theo dõi tự động.', N'<p>Imou Ranger 2 cho phép giám sát từ xa qua điện thoại với chất lượng 4MP sắc nét.</p><h3>Thông số kỹ thuật</h3><ul><li>Độ phân giải: 4MP (2560x1440)</li><li>Góc xoay: ngang 355°, dọc 90°</li><li>Hồng ngoại: 10m</li><li>Lưu trữ: thẻ nhớ tới 256GB hoặc đám mây</li></ul>', 990000.00, 1290000.00, 55, N'/images/products/camera-1.svg', 1, 1, 321, '2026-06-23T22:00:59.770', NULL),
(25, N'DV-001', N'Gói bảo trì hệ thống CNTT doanh nghiệp (12 tháng)', N'goi-bao-tri-he-thong-cntt-doanh-nghiep-12-thang', 20, N'TOANTECH', N'Bảo trì định kỳ hàng tháng cho hệ thống máy tính, mạng và máy chủ của doanh nghiệp.', N'<p>Gói dịch vụ dành cho doanh nghiệp có từ 20 đến 100 máy trạm.</p><h3>Nội dung dịch vụ</h3><ul><li>Kiểm tra và bảo dưỡng thiết bị định kỳ 1 lần/tháng</li><li>Hỗ trợ kỹ thuật từ xa không giới hạn trong giờ hành chính</li><li>Cử kỹ thuật viên tới nơi trong 4 giờ khi có sự cố nghiêm trọng</li><li>Sao lưu và kiểm tra khả năng phục hồi dữ liệu hàng quý</li></ul>', 12000000.00, NULL, 999, N'/images/products/service-1.svg', 0, 1, 98, '2026-09-01T22:00:59.770', NULL),
(26, N'DV-002', N'Thiết kế website giới thiệu doanh nghiệp trọn gói', N'thiet-ke-website-gioi-thieu-doanh-nghiep-tron-goi', 21, N'TOANTECH', N'Website chuẩn responsive, tối ưu SEO, bàn giao đầy đủ mã nguồn trong 30 ngày.', N'<p>TOANTECH thiết kế website theo nhận diện thương hiệu riêng của từng khách hàng.</p><h3>Gói dịch vụ bao gồm</h3><ul><li>Tư vấn và thiết kế giao diện riêng (không dùng theme có sẵn)</li><li>Lập trình trên nền ASP.NET Core, quản trị nội dung dễ dùng</li><li>Tặng 1 năm tên miền .com và hosting</li><li>Bàn giao mã nguồn và hướng dẫn sử dụng</li><li>Bảo hành 12 tháng</li></ul>', 15000000.00, NULL, 999, N'/images/products/service-2.svg', 0, 1, 168, '2026-08-14T22:00:59.770', NULL);
SET IDENTITY_INSERT [Products] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [ProductImages] : 0 ban ghi
-- ----------------------------------------------------------------------------
-- (khong co du lieu)

-- ----------------------------------------------------------------------------
--  Bang [NewsCategories] : 4 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [NewsCategories] ON;
INSERT INTO [NewsCategories] ([Id], [Name], [Slug], [DisplayOrder], [IsActive]) VALUES
(1, N'Tin công ty', N'tin-cong-ty', 1, 1),
(2, N'Khuyến mại', N'khuyen-mai', 2, 1),
(3, N'Công nghệ', N'cong-nghe', 3, 1),
(4, N'Hướng dẫn - Thủ thuật', N'huong-dan-thu-thuat', 4, 1);
SET IDENTITY_INSERT [NewsCategories] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [NewsArticles] : 6 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [NewsArticles] ON;
INSERT INTO [NewsArticles] ([Id], [Title], [Slug], [NewsCategoryId], [Summary], [Content], [ImageUrl], [Author], [IsPublished], [IsFeatured], [ViewCount], [PublishedAt], [CreatedAt]) VALUES
(1, N'TOANTECH khai trương chi nhánh thứ 5 tại Thành phố Hải Phòng', N'toantech-khai-truong-chi-nhanh-thu-5-tai-thanh-pho-hai-phong', 1, N'Sáng 12/8/2026, Công ty Cổ phần Công nghệ TOANTECH chính thức khai trương chi nhánh thứ 5 tại số 216 Lạch Tray, quận Ngô Quyền, TP. Hải Phòng.', N'<p>Sáng ngày 12/8/2026, Công ty Cổ phần Công nghệ TOANTECH chính thức khai trương chi nhánh thứ 5 tại số 216 Lạch Tray, quận Ngô Quyền, thành phố Hải Phòng.</p><p>Chi nhánh mới có diện tích 450m², bao gồm khu trưng bày sản phẩm, khu trải nghiệm thiết bị và trung tâm bảo hành uỷ quyền. Đây là bước đi nằm trong chiến lược mở rộng mạng lưới phân phối ra các tỉnh thành phía Bắc của công ty giai đoạn 2026 - 2028.</p><h3>Ưu đãi mừng khai trương</h3><ul><li>Giảm tới 15% toàn bộ laptop và máy tính để bàn</li><li>Tặng gói bảo hành mở rộng 6 tháng cho 100 khách hàng đầu tiên</li><li>Miễn phí vệ sinh, bảo dưỡng máy tính trong tháng 8</li></ul><p>Ông Lưu Đức Toàn - Tổng Giám đốc TOANTECH - chia sẻ: "Hải Phòng là thị trường trọng điểm với tốc độ chuyển đổi số rất nhanh. Chúng tôi muốn ở gần khách hàng hơn để rút ngắn thời gian phục vụ."</p>', N'/images/news/news-1.svg', N'Ban Truyền thông TOANTECH', 1, 1, 288, '2026-09-05T22:00:59.998', '2026-09-14T22:00:59.997'),
(2, N'Chương trình "Back to School 2026": giảm đến 25% cho học sinh, sinh viên', N'chuong-trinh-back-to-school-2026-giam-den-25-cho-hoc-sinh-sinh-vien', 2, N'Từ ngày 01/9 đến 30/9/2026, TOANTECH triển khai chương trình ưu đãi lớn nhất năm dành riêng cho học sinh, sinh viên.', N'<p>Từ ngày 01/9 đến hết 30/9/2026, TOANTECH triển khai chương trình <strong>Back to School 2026</strong> với nhiều ưu đãi hấp dẫn.</p><h3>Nội dung chương trình</h3><ul><li>Giảm đến 25% cho toàn bộ laptop văn phòng khi xuất trình thẻ học sinh/sinh viên</li><li>Tặng balo chống sốc và chuột không dây trị giá 890.000đ</li><li>Trả góp 0% lãi suất trong 12 tháng qua thẻ tín dụng</li><li>Thu cũ đổi mới, trợ giá tới 2.000.000đ</li></ul><h3>Điều kiện áp dụng</h3><p>Chương trình áp dụng tại tất cả chi nhánh và trên website chính thức. Mỗi khách hàng được hưởng ưu đãi tối đa 01 lần. Không áp dụng đồng thời với các chương trình khuyến mại khác.</p>', N'/images/news/news-2.svg', N'Ban Truyền thông TOANTECH', 1, 1, 1237, '2026-08-23T22:00:59.998', '2026-09-14T22:00:59.998'),
(3, N'Vì sao doanh nghiệp nên chuyển từ ổ cứng HDD sang SSD NVMe?', N'vi-sao-doanh-nghiep-nen-chuyen-tu-o-cung-hdd-sang-ssd-nvme', 3, N'Chi phí nâng cấp SSD đã giảm mạnh, trong khi hiệu quả làm việc tăng rõ rệt. Bài viết phân tích bài toán đầu tư dưới góc nhìn doanh nghiệp.', N'<p>Nhiều doanh nghiệp vẫn đang dùng máy tính với ổ cứng HDD từ 5 - 7 năm trước. Việc nâng cấp lên SSD NVMe hiện có chi phí thấp hơn nhiều so với thay máy mới.</p><h3>So sánh nhanh</h3><table><thead><tr><th>Tiêu chí</th><th>HDD 7200rpm</th><th>SSD NVMe PCIe 4.0</th></tr></thead><tbody><tr><td>Tốc độ đọc tuần tự</td><td>~120 MB/s</td><td>~7000 MB/s</td></tr><tr><td>Thời gian khởi động Windows</td><td>60 - 90 giây</td><td>8 - 12 giây</td></tr><tr><td>Độ ồn</td><td>Có tiếng quay đĩa</td><td>Hoàn toàn yên tĩnh</td></tr><tr><td>Chống sốc</td><td>Kém</td><td>Tốt (không có bộ phận chuyển động)</td></tr></tbody></table><h3>Bài toán chi phí</h3><p>Với chi phí khoảng 1.500.000đ cho mỗi máy, doanh nghiệp có thể kéo dài tuổi thọ thiết bị thêm 2 - 3 năm. Nếu mỗi nhân viên tiết kiệm 10 phút chờ máy mỗi ngày, khoản đầu tư này hoàn vốn chỉ sau vài tháng.</p>', N'/images/news/news-3.svg', N'Ban Truyền thông TOANTECH', 1, 0, 1968, '2026-07-18T22:00:59.998', '2026-09-14T22:00:59.998'),
(4, N'Hướng dẫn 7 bước bảo vệ máy tính doanh nghiệp khỏi mã độc tống tiền', N'huong-dan-7-buoc-bao-ve-may-tinh-doanh-nghiep-khoi-ma-doc-tong-tien', 4, N'Ransomware tiếp tục là mối đe doạ hàng đầu với doanh nghiệp vừa và nhỏ. Đội ngũ kỹ thuật TOANTECH tổng hợp 7 biện pháp cơ bản nhưng hiệu quả.', N'<p>Theo thống kê của các hãng bảo mật, số vụ tấn công bằng mã độc tống tiền nhắm vào doanh nghiệp vừa và nhỏ tại Việt Nam tăng đều qua từng năm. Dưới đây là 7 biện pháp cơ bản mà bất kỳ doanh nghiệp nào cũng nên áp dụng.</p><ol><li><strong>Sao lưu theo quy tắc 3-2-1:</strong> giữ 3 bản sao dữ liệu, trên 2 loại phương tiện khác nhau, trong đó 1 bản đặt ngoài văn phòng.</li><li><strong>Cập nhật hệ điều hành và phần mềm:</strong> phần lớn mã độc khai thác lỗ hổng đã có bản vá.</li><li><strong>Không dùng tài khoản quản trị cho công việc hàng ngày:</strong> áp dụng nguyên tắc đặc quyền tối thiểu.</li><li><strong>Bật xác thực hai yếu tố</strong> cho email và các dịch vụ đám mây.</li><li><strong>Đào tạo nhân viên nhận biết email lừa đảo:</strong> con người vẫn là mắt xích yếu nhất.</li><li><strong>Phân đoạn mạng (VLAN):</strong> hạn chế mã độc lây lan giữa các phòng ban.</li><li><strong>Lập sẵn kịch bản ứng phó sự cố</strong> và diễn tập ít nhất 1 lần mỗi năm.</li></ol><p>TOANTECH cung cấp dịch vụ đánh giá an toàn thông tin miễn phí cho doanh nghiệp dưới 50 máy trạm. Quý khách vui lòng liên hệ hotline để đặt lịch.</p>', N'/images/news/news-4.svg', N'Ban Truyền thông TOANTECH', 1, 1, 1263, '2026-08-07T22:00:59.998', '2026-09-14T22:00:59.998'),
(5, N'TOANTECH đạt chứng nhận Nhà phân phối uỷ quyền của Dell Technologies', N'toantech-dat-chung-nhan-nha-phan-phoi-uy-quyen-cua-dell-technologies', 1, N'Ngày 05/7/2026, Dell Technologies Việt Nam trao chứng nhận Authorized Distributor cho TOANTECH.', N'<p>Ngày 05/7/2026, tại Hà Nội, Dell Technologies Việt Nam đã trao chứng nhận <em>Authorized Distributor</em> cho Công ty Cổ phần Công nghệ TOANTECH.</p><p>Chứng nhận này ghi nhận năng lực phân phối và chất lượng dịch vụ hậu mãi của công ty trong suốt 3 năm hợp tác. Với vị thế mới, TOANTECH được tiếp cận trực tiếp nguồn hàng từ nhà máy, qua đó rút ngắn thời gian giao hàng và tối ưu giá bán cho khách hàng.</p><p>Trong quý IV/2026, công ty dự kiến mở rộng danh mục sang dòng máy chủ Dell PowerEdge và thiết bị lưu trữ Dell PowerVault.</p>', N'/images/news/news-5.svg', N'Ban Truyền thông TOANTECH', 1, 0, 707, '2026-08-06T22:00:59.998', '2026-09-14T22:00:59.998'),
(6, N'5 tiêu chí chọn laptop phù hợp cho nhân viên văn phòng', N'5-tieu-chi-chon-laptop-phu-hop-cho-nhan-vien-van-phong', 4, N'Không phải cứ cấu hình cao là tốt. Bài viết giúp bộ phận hành chính - nhân sự chọn đúng thiết bị với ngân sách hợp lý.', N'<p>Khi mua sắm laptop số lượng lớn cho doanh nghiệp, việc chọn đúng cấu hình giúp tiết kiệm đáng kể ngân sách mà vẫn đảm bảo hiệu quả công việc.</p><h3>1. Xác định đúng nhu cầu sử dụng</h3><p>Nhân viên kế toán, hành chính chỉ cần Core i3/i5 với 8 - 16GB RAM. Ngược lại, bộ phận thiết kế hoặc kỹ thuật cần card đồ hoạ rời và màn hình chuẩn màu.</p><h3>2. Ưu tiên RAM và SSD hơn là CPU</h3><p>Nâng RAM từ 8GB lên 16GB thường mang lại cảm nhận rõ rệt hơn việc nâng CPU lên một bậc.</p><h3>3. Chú ý khối lượng và thời lượng pin</h3><p>Với nhân viên hay đi công tác, máy dưới 1.5kg và pin trên 8 giờ là tiêu chí quan trọng hàng đầu.</p><h3>4. Kiểm tra chính sách bảo hành</h3><p>Gói bảo hành tại chỗ (onsite) giúp doanh nghiệp không bị gián đoạn công việc khi máy hỏng.</p><h3>5. Tính tổng chi phí sở hữu</h3><p>Nên tính cả chi phí bảo trì, thay pin và nâng cấp trong vòng đời 4 - 5 năm, thay vì chỉ nhìn vào giá mua ban đầu.</p>', N'/images/news/news-6.svg', N'Ban Truyền thông TOANTECH', 1, 0, 939, '2026-08-01T22:00:59.998', '2026-09-14T22:00:59.998');
SET IDENTITY_INSERT [NewsArticles] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [Orders] : 18 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [Orders] ON;
INSERT INTO [Orders] ([Id], [OrderCode], [UserId], [CustomerName], [CustomerPhone], [CustomerEmail], [ShippingAddress], [Note], [PaymentMethod], [Status], [SubTotal], [ShippingFee], [TotalAmount], [CancelReason], [CreatedAt], [UpdatedAt]) VALUES
(1, N'TT2607261000', NULL, N'Đỗ Minh Quân', N'0983308728', N'khach0@example.com', N'88 Trần Phú, Hà Đông, Hà Nội', NULL, 1, 3, 17990000.00, 0.00, 17990000.00, NULL, '2026-07-26T22:01:00.173', '2026-07-27T22:01:00.173'),
(2, N'TT2604281001', NULL, N'Lê Thị Mai', N'0988404165', N'khach1@example.com', N'216 Lạch Tray, Ngô Quyền, Hải Phòng', NULL, 1, 1, 118940000.00, 0.00, 118940000.00, NULL, '2026-04-28T22:01:00.198', '2026-04-29T22:01:00.198'),
(3, N'TT2606041002', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0950435923', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 1, 2, 17990000.00, 0.00, 17990000.00, NULL, '2026-06-04T22:01:00.198', '2026-06-05T22:01:00.198'),
(4, N'TT2607011003', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0961389811', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 1, 3, 74450000.00, 0.00, 74450000.00, NULL, '2026-07-01T22:01:00.198', '2026-07-02T22:01:00.198'),
(5, N'TT2606291004', NULL, N'Phạm Thu Hà', N'0948550010', N'khach4@example.com', N'12 Nguyễn Trãi, Thanh Xuân, Hà Nội', NULL, 1, 2, 62460000.00, 0.00, 62460000.00, NULL, '2026-06-29T22:01:00.199', '2026-06-30T22:01:00.199'),
(6, N'TT2605261005', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0957486156', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 1, 0, 30980000.00, 0.00, 30980000.00, NULL, '2026-05-26T22:01:00.199', NULL),
(7, N'TT2604091006', NULL, N'Đỗ Minh Quân', N'0923563509', N'khach6@example.com', N'88 Trần Phú, Hà Đông, Hà Nội', NULL, 0, 2, 90450000.00, 0.00, 90450000.00, NULL, '2026-04-09T22:01:00.199', '2026-04-10T22:01:00.199'),
(8, N'TT2605161007', NULL, N'Hoàng Anh Tuấn', N'0989673958', N'khach7@example.com', N'45 Lê Hồng Phong, TP. Nam Định', NULL, 0, 0, 15490000.00, 0.00, 15490000.00, NULL, '2026-05-16T22:01:00.199', NULL),
(9, N'TT2604191008', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0986109492', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 0, 3, 53470000.00, 0.00, 53470000.00, NULL, '2026-04-19T22:01:00.199', '2026-04-20T22:01:00.199'),
(10, N'TT2606201009', NULL, N'Phạm Thu Hà', N'0961358969', N'khach9@example.com', N'12 Nguyễn Trãi, Thanh Xuân, Hà Nội', NULL, 1, 2, 72940000.00, 0.00, 72940000.00, NULL, '2026-06-20T22:01:00.199', '2026-06-21T22:01:00.199'),
(11, N'TT2608281010', NULL, N'Lê Thị Mai', N'0929561866', N'khach10@example.com', N'216 Lạch Tray, Ngô Quyền, Hải Phòng', NULL, 0, 2, 53470000.00, 0.00, 53470000.00, NULL, '2026-08-28T22:01:00.199', '2026-08-29T22:01:00.199'),
(12, N'TT2609091011', NULL, N'Phạm Thu Hà', N'0974658656', N'khach11@example.com', N'12 Nguyễn Trãi, Thanh Xuân, Hà Nội', NULL, 0, 4, 61970000.00, 0.00, 61970000.00, N'Khách hàng đổi ý, không có nhu cầu nữa.', '2026-09-09T22:01:00.199', '2026-09-10T22:01:00.199'),
(13, N'TT2609021012', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0968935346', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 1, 3, 55470000.00, 0.00, 55470000.00, NULL, '2026-09-02T22:01:00.199', '2026-09-03T22:01:00.199'),
(14, N'TT2607021013', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0975078430', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 1, 3, 59470000.00, 0.00, 59470000.00, NULL, '2026-07-02T22:01:00.199', '2026-07-03T22:01:00.199'),
(15, N'TT2604161014', NULL, N'Đỗ Minh Quân', N'0949009682', N'khach14@example.com', N'88 Trần Phú, Hà Đông, Hà Nội', NULL, 0, 2, 101950000.00, 0.00, 101950000.00, NULL, '2026-04-16T22:01:00.199', '2026-04-17T22:01:00.199'),
(16, N'TT2608211015', NULL, N'Lê Thị Mai', N'0930368758', N'khach15@example.com', N'216 Lạch Tray, Ngô Quyền, Hải Phòng', NULL, 0, 4, 122940000.00, 0.00, 122940000.00, N'Khách hàng đổi ý, không có nhu cầu nữa.', '2026-08-21T22:01:00.199', '2026-08-22T22:01:00.199'),
(17, N'TT2606061016', NULL, N'Phạm Thu Hà', N'0953151581', N'khach16@example.com', N'12 Nguyễn Trãi, Thanh Xuân, Hà Nội', NULL, 1, 0, 43470000.00, 0.00, 43470000.00, NULL, '2026-06-06T22:01:00.199', NULL),
(18, N'TT2604281017', N'19a944e1-29ee-4cf8-b939-d9c2fb7fe7d6', N'Nguyễn Văn Khách', N'0995353210', N'khachhang@gmail.com', N'Số 5 Lê Duẩn, Hoàn Kiếm, Hà Nội', NULL, 0, 0, 108950000.00, 0.00, 108950000.00, NULL, '2026-04-28T22:01:00.199', NULL);
SET IDENTITY_INSERT [Orders] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [OrderDetails] : 40 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [OrderDetails] ON;
INSERT INTO [OrderDetails] ([Id], [OrderId], [ProductId], [ProductName], [UnitPrice], [Quantity], [LineTotal]) VALUES
(1, 1, 7, N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', 17990000.00, 1, 17990000.00),
(2, 2, 4, N'Laptop Lenovo LOQ 15IRH8 i5-12450HX RTX 3050', 21990000.00, 2, 43980000.00),
(3, 2, 11, N'Samsung Galaxy S24 5G 8GB 256GB', 21990000.00, 2, 43980000.00),
(4, 2, 2, N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', 15490000.00, 2, 30980000.00),
(5, 3, 7, N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', 17990000.00, 1, 17990000.00),
(6, 4, 2, N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', 15490000.00, 2, 30980000.00),
(7, 4, 10, N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', 9490000.00, 1, 9490000.00),
(8, 4, 1, N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', 16990000.00, 2, 33980000.00),
(9, 5, 7, N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', 17990000.00, 2, 35980000.00),
(10, 5, 1, N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', 16990000.00, 1, 16990000.00),
(11, 5, 10, N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', 9490000.00, 1, 9490000.00),
(12, 6, 2, N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', 15490000.00, 2, 30980000.00),
(13, 7, 1, N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', 16990000.00, 2, 33980000.00),
(14, 7, 10, N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', 9490000.00, 1, 9490000.00),
(15, 7, 8, N'PC Gaming TOANTECH i5-13400F | RTX 4060 | 16GB', 23490000.00, 2, 46980000.00),
(16, 8, 2, N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', 15490000.00, 1, 15490000.00),
(17, 9, 10, N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', 9490000.00, 1, 9490000.00),
(18, 9, 11, N'Samsung Galaxy S24 5G 8GB 256GB', 21990000.00, 2, 43980000.00),
(19, 10, 9, N'Màn hình Dell P2422H 24 inch IPS FHD', 3990000.00, 2, 7980000.00),
(20, 10, 2, N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', 15490000.00, 2, 30980000.00),
(21, 10, 1, N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', 16990000.00, 2, 33980000.00),
(22, 11, 10, N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', 9490000.00, 1, 9490000.00),
(23, 11, 4, N'Laptop Lenovo LOQ 15IRH8 i5-12450HX RTX 3050', 21990000.00, 2, 43980000.00),
(24, 12, 12, N'iPhone 15 128GB', 19990000.00, 2, 39980000.00),
(25, 12, 4, N'Laptop Lenovo LOQ 15IRH8 i5-12450HX RTX 3050', 21990000.00, 1, 21990000.00),
(26, 13, 12, N'iPhone 15 128GB', 19990000.00, 2, 39980000.00),
(27, 13, 2, N'Laptop HP Pavilion 14-dv2073TU i5-1235U 8GB 256GB', 15490000.00, 1, 15490000.00),
(28, 14, 8, N'PC Gaming TOANTECH i5-13400F | RTX 4060 | 16GB', 23490000.00, 1, 23490000.00),
(29, 14, 7, N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', 17990000.00, 2, 35980000.00),
(30, 15, 7, N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', 17990000.00, 1, 17990000.00),
(31, 15, 1, N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', 16990000.00, 2, 33980000.00),
(32, 15, 6, N'MacBook Air M2 13 inch 8GB 256GB', 24990000.00, 2, 49980000.00),
(33, 16, 8, N'PC Gaming TOANTECH i5-13400F | RTX 4060 | 16GB', 23490000.00, 2, 46980000.00),
(34, 16, 7, N'PC Đồng bộ Dell OptiPlex 7010 SFF i5-13500 8GB 256GB', 17990000.00, 2, 35980000.00),
(35, 16, 12, N'iPhone 15 128GB', 19990000.00, 2, 39980000.00),
(36, 17, 1, N'Laptop Dell Inspiron 15 3520 i5-1235U 16GB 512GB', 16990000.00, 2, 33980000.00),
(37, 17, 10, N'Màn hình Gaming LG UltraGear 27GP850 27 inch 2K 165Hz', 9490000.00, 1, 9490000.00),
(38, 18, 12, N'iPhone 15 128GB', 19990000.00, 2, 39980000.00),
(39, 18, 8, N'PC Gaming TOANTECH i5-13400F | RTX 4060 | 16GB', 23490000.00, 2, 46980000.00),
(40, 18, 11, N'Samsung Galaxy S24 5G 8GB 256GB', 21990000.00, 1, 21990000.00);
SET IDENTITY_INSERT [OrderDetails] OFF;
GO

-- ----------------------------------------------------------------------------
--  Bang [ContactMessages] : 2 ban ghi
-- ----------------------------------------------------------------------------
SET IDENTITY_INSERT [ContactMessages] ON;
INSERT INTO [ContactMessages] ([Id], [FullName], [Email], [Phone], [Subject], [Message], [IsHandled], [CreatedAt]) VALUES
(1, N'Trần Quốc Bảo', N'baotq@congtyabc.vn', N'0913456789', N'Báo giá 30 bộ máy tính văn phòng', N'Công ty chúng tôi cần trang bị 30 bộ máy tính để bàn cho văn phòng mới. Mong TOANTECH gửi báo giá và cấu hình đề xuất trong tuần này. Xin cảm ơn.', 0, '2026-09-12T22:01:00.264'),
(2, N'Nguyễn Thị Lan', N'lan.nguyen@gmail.com', N'0977123456', N'Hỏi về chính sách bảo hành laptop', N'Tôi mua laptop Dell tại cửa hàng tháng trước, máy bị lỗi bàn phím. Cho tôi hỏi thủ tục bảo hành cần mang theo giấy tờ gì ạ?', 1, '2026-09-05T22:01:00.264');
SET IDENTITY_INSERT [ContactMessages] OFF;
GO

PRINT N'Da nap xong du lieu mau cho CSDL ToanTechDB.';
GO
