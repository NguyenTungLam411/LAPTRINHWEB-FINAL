# Website Thông tin điện tử — Công ty CP Công nghệ TOANTECH

Bài tập lớn môn **Lập trình web** — Đề 10: *Xây dựng website Thông tin điện tử cho 1 công ty*
Khoa Công nghệ Thông tin — Trường Đại học Mở Hà Nội

| | |
|---|---|
| **Sinh viên** | Lưu Đức Toàn — 25C1001M4097 |
| **Công nghệ** | ASP.NET Core MVC 8.0 (C#) |
| **CSDL** | Microsoft SQL Server (Entity Framework Core 8) |
| **Giao diện** | Bootstrap 5.3 + Bootstrap Icons, chuẩn Responsive |

---

## 1. Yêu cầu môi trường

| Phần mềm | Phiên bản tối thiểu | Ghi chú |
|---|---|---|
| .NET SDK | 8.0 | https://dotnet.microsoft.com/download/dotnet/8.0 |
| SQL Server | 2016 trở lên (Express là đủ) | Bật xác thực Windows |
| Trình duyệt | Chrome / Edge / Firefox bản mới | |

Không bắt buộc cài Visual Studio. Có thể chạy hoàn toàn bằng dòng lệnh hoặc VS Code.

---

## 2. Cách chạy

### Cách 1 — Để chương trình tự tạo CSDL (khuyến nghị)

```bash
cd ToanTechWeb
dotnet restore
dotnet run
```

Lần chạy đầu tiên, chương trình tự động:
1. Tạo CSDL `ToanTechDB` và toàn bộ bảng (EF Core Migrations).
2. Nạp dữ liệu mẫu: 4 lĩnh vực, 21 danh mục, 26 sản phẩm, 6 bài viết, 18 đơn hàng, 3 tài khoản.

Mở trình duyệt tại **http://localhost:5217** (hoặc https://localhost:7217).

### Cách 2 — Nạp CSDL từ script SQL

Dùng khi cần dựng CSDL trên máy khác mà không chạy ứng dụng trước.

```bash
sqlcmd -S .\SQLEXPRESS -E -Q "CREATE DATABASE ToanTechDB"
sqlcmd -S .\SQLEXPRESS -d ToanTechDB -E -I -f 65001 -i Database\01_TaoBang.sql
sqlcmd -S .\SQLEXPRESS -d ToanTechDB -E -I -f 65001 -i Database\02_DuLieuMau.sql
```

> Tham số `-f 65001` bắt buộc để sqlcmd đọc đúng tiếng Việt có dấu (UTF-8).
> Hoặc mở 2 tệp bằng SQL Server Management Studio và bấm Execute lần lượt.

### Đổi chuỗi kết nối

Sửa `ToanTechWeb/appsettings.json` nếu tên máy chủ SQL khác:

```json
"DefaultConnection": "Server=.\\SQLEXPRESS;Database=ToanTechDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True"
```

---

## 3. Tài khoản dùng thử

| Vai trò | Email | Mật khẩu | Phạm vi quyền |
|---|---|---|---|
| Quản trị viên | `admin@toantech.vn` | `Admin@123` | Toàn quyền, kể cả quản lý tài khoản và xoá dữ liệu |
| Nhân viên | `nhanvien@toantech.vn` | `Staff@123` | Quản lý sản phẩm, đơn hàng, tin tức — **không** xoá được dữ liệu, **không** vào được mục Tài khoản |
| Khách hàng | `khachhang@gmail.com` | `Khach@123` | Mua hàng, xem đơn hàng của mình |

Trang quản trị: **/Admin/Dashboard** (tự động chuyển tới sau khi Quản trị viên / Nhân viên đăng nhập).

---

## 4. Cấu trúc thư mục

```
BTL_LTW/
├── ToanTechWeb/                     Mã nguồn ứng dụng
│   ├── Program.cs                   Cấu hình dịch vụ, bảo mật, định tuyến
│   ├── appsettings.json             Chuỗi kết nối, thông tin công ty
│   ├── Models/
│   │   ├── Entities/                Thực thể ánh xạ xuống CSDL
│   │   └── ViewModels/              Mô hình truyền dữ liệu ra View
│   ├── Data/
│   │   ├── ApplicationDbContext.cs  Ngữ cảnh EF Core, cấu hình quan hệ
│   │   ├── DbSeeder.cs              Nạp dữ liệu mẫu
│   │   └── Migrations/              Lịch sử thay đổi cấu trúc CSDL
│   ├── Services/                    Giỏ hàng, tải ảnh, làm sạch HTML, sinh slug
│   ├── Middleware/                  Gắn HTTP security header
│   ├── Controllers/                 Xử lý phía người dùng cuối
│   ├── Areas/Admin/                 Khu vực quản trị (Controller + View riêng)
│   ├── Views/                       Giao diện Razor phía người dùng
│   └── wwwroot/                     CSS, JavaScript, hình ảnh
├── Database/
│   ├── 01_TaoBang.sql               Script tạo toàn bộ bảng
│   └── 02_DuLieuMau.sql             Script nạp dữ liệu mẫu
└── README.md
```

---

## 5. Chức năng đã cài đặt

### Phía người dùng (Client)

| Nghiệp vụ theo đề bài | Đường dẫn | Ghi chú |
|---|---|---|
| Giới thiệu lĩnh vực hoạt động | `/BusinessField`, `/linh-vuc/{slug}` | 4 lĩnh vực, có trang chi tiết riêng |
| Giới thiệu hàng hoá, dịch vụ (nhiều chủng loại) | `/Product`, `/san-pham/{slug}` | Cây danh mục 2 cấp, lọc theo danh mục / giá / thương hiệu, sắp xếp, phân trang, tìm kiếm có gợi ý |
| Tiếp nhận đơn hàng, bán hàng trực tuyến | `/Cart`, `/Order/Checkout`, `/Order/Track` | Giỏ hàng AJAX, đặt hàng có/không cần tài khoản, tra cứu đơn |
| Đăng tải tin tức | `/News`, `/tin-tuc/{slug}` | 4 chuyên mục, tìm kiếm, phân trang |
| Khác | `/Home/GioiThieu`, `/Home/LienHe`, `/Account/*` | Giới thiệu công ty, gửi liên hệ, đăng ký / đăng nhập / hồ sơ |

### Phía quản trị (Server — `/Admin`)

- **Tổng quan**: 7 chỉ số, biểu đồ doanh thu 6 tháng, đơn hàng gần đây, sản phẩm sắp hết hàng.
- **Đơn hàng**: lọc theo trạng thái / khoảng ngày / từ khoá, xem chi tiết, chuyển trạng thái theo quy trình, in phiếu giao hàng.
- **Sản phẩm**: thêm / sửa / xoá, tải ảnh, bật-tắt kinh doanh bằng AJAX.
- **Danh mục**: quản lý cây danh mục 2 cấp.
- **Tin tức**: soạn bài, quản lý chuyên mục.
- **Lĩnh vực hoạt động**: quản lý nội dung giới thiệu.
- **Liên hệ**: xem và đánh dấu đã xử lý.
- **Tài khoản & phân quyền** *(chỉ Quản trị viên)*: gán vai trò, khoá tài khoản, đặt lại mật khẩu.

---

## 6. Các biện pháp bảo mật đã triển khai

| Kiểu tấn công | Biện pháp | Vị trí trong mã nguồn |
|---|---|---|
| SQL Injection | Toàn bộ truy vấn qua LINQ / EF Core → câu lệnh tham số hoá, không ghép chuỗi SQL | Tất cả Controller |
| XSS (lưu trữ) | Lọc HTML theo danh sách trắng bằng `HtmlSanitizer` trước khi lưu | `Services/HtmlSanitizerService.cs` |
| XSS (phản chiếu) | Razor tự mã hoá HTML; JavaScript dùng `textContent` thay cho `innerHTML` | Views, `wwwroot/js/site.js` |
| CSRF | Bắt buộc anti-forgery token cho **mọi** request POST (đăng ký filter toàn cục) | `Program.cs` |
| Lộ mật khẩu | ASP.NET Core Identity băm mật khẩu bằng PBKDF2 (HMAC-SHA256) | `Program.cs`, `AccountController` |
| Dò mật khẩu (brute force) | Khoá tài khoản 15 phút sau 5 lần sai + giới hạn 10 request/phút theo IP | `Program.cs` |
| Dò tài khoản | Thông báo đăng nhập sai chung chung, không tiết lộ email có tồn tại hay không | `AccountController.Login` |
| Leo thang đặc quyền | Phân quyền theo vai trò ở lớp cơ sở `AdminBaseController`; tài khoản tự đăng ký luôn chỉ là `Customer` | `Areas/Admin`, `AccountController.Register` |
| IDOR | Truy vấn đơn hàng luôn kèm điều kiện `UserId == người đang đăng nhập` | `OrderController.Details` |
| Tải tệp độc hại | Kiểm tra 5 lớp: phần mở rộng, MIME, dung lượng, chữ ký nhị phân, đổi tên bằng GUID | `Services/FileUploadService.cs` |
| Giả mạo giá bán | Giá luôn đọc lại từ CSDL khi thêm giỏ và khi đặt hàng, không tin dữ liệu từ trình duyệt | `CartController`, `OrderController` |
| Mass assignment | Chỉ gán từng trường được phép khi sửa, không dùng `TryUpdateModel` trên toàn thực thể | `Areas/Admin/Controllers/ProductsController` |
| Open Redirect | `returnUrl` chỉ được chấp nhận nếu là đường dẫn nội bộ (`Url.IsLocalUrl`) | `AccountController.RedirectToLocal` |
| Clickjacking, MIME sniffing | Các HTTP security header: CSP, X-Frame-Options, X-Content-Type-Options… | `Middleware/SecurityHeadersMiddleware.cs` |
| Đánh cắp cookie | Cookie đặt `HttpOnly`, `SameSite`, `Secure` | `Program.cs` |
| Lộ thông tin hệ thống | Trang lỗi thân thiện ở môi trường Production, không hiển thị stack trace | `Program.cs`, `Views/Shared/Error.cshtml` |

---

## 7. Lệnh hữu ích

```bash
# Biên dịch kiểm tra lỗi
dotnet build

# Chạy ở chế độ tự nạp lại khi sửa mã
dotnet watch run

# Tạo migration mới sau khi sửa Entity
dotnet ef migrations add TenThayDoi --output-dir Data/Migrations
dotnet ef database update

# Xoá CSDL để nạp lại từ đầu
dotnet ef database drop --force
```
