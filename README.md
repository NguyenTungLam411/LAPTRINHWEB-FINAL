# LAPTRINHWEB-FINAL
LAPTRINHWEB-FINAL
# 🌐 E-Commerce & Corporate Information System (ASP.NET MVC)

> **Bài tập lớn môn:** Lập trình Web  
> **Đề tài 10:** Xây dựng website Thông tin điện tử và Bán hàng trực tuyến cho Công ty  
> **Công nghệ sử dụng:** ASP.NET MVC 5, MS SQL Server, Entity Framework, Bootstrap 5, jQuery  

---

## 📌 1. Giới thiệu Dự án

Hệ thống được thiết kế và phát triển nhằm đáp ứng nhu cầu giới thiệu thông tin doanh nghiệp, các dòng sản phẩm/dịch vụ, hỗ trợ khách hàng đặt hàng trực tuyến và đăng tải tin tức sự kiện. Website hỗ trợ giao diện **Responsive** hoàn toàn tương thích trên Desktop, Tablet và Mobile, đồng thời đảm bảo các tiêu chuẩn về bảo mật ứng dụng web.

### 📷 Giao diện minh họa hệ thống

#### Giao diện Client (Hiển thị Responsive đa thiết bị)
![Hiển thị Responsive trên Desktop, Tablet và Mobile](https://raw.githubusercontent.com/username/repository/main/docs/images/responsive-preview.png)

#### Giao diện Bố cục Trang chủ & Sản phẩm
![Bố cục trang thông tin điện tử công ty](https://raw.githubusercontent.com/username/repository/main/docs/images/layout-preview.png)

---

## 🔥 2. Các Tính Năng Chính

### 🛍️ Phía Khách hàng (Client-side)
- **Trang chủ & Giới thiệu:** Cung cấp thông tin tổng quan, năng lực và các lĩnh vực hoạt động của công ty.
- **Danh mục Sản phẩm/Dịch vụ:** Phân loại sản phẩm theo chủng loại, hỗ trợ lọc và tìm kiếm theo từ khóa.
- **Giỏ hàng & Đặt hàng:** 
  - Thêm, bớt, cập nhật số lượng sản phẩm linh hoạt (sử dụng AJAX).
  - Tiếp nhận đơn hàng trực tuyến và lưu thông tin người nhận.
- **Tin tức & Sự kiện:** Đăng tải thông tin hoạt động, bài viết chia sẻ liên quan đến doanh nghiệp.

### 🛡️ Phía Quản trị viên (Admin Dashboard)
- **Quản lý Sản phẩm:** Thêm mới, sửa, xóa (CRUD) và quản lý trạng thái hiển thị của sản phẩm/danh mục.
- **Quản lý Đơn hàng:** Tiếp nhận, xem chi tiết giỏ hàng của khách và cập nhật trạng thái xử lý đơn hàng (*Chờ xử lý, Đã duyệt, Đang giao...*).
- **Quản lý Tin tức:** Viết và xuất bản tin tức mới cho công ty.
- **Phân quyền người dùng:** Cơ chế **Role-based Authorization** phân tách rõ quyền truy cập giữa `Admin` và `Customer`.

---

## 🔒 3. Giải Pháp Bảo Mật Triển Khai

- **Mã hóa Mật khẩu:** Sử dụng thuật toán Hash **BCrypt / SHA256** để lưu trữ mật khẩu an toàn.
- **Chống SQL Injection:** Sử dụng **Entity Framework ORM** và Parameterized Queries.
- **Chống XSS (Cross-Site Scripting):** Tự động mã hóa HTML (Razor Encoding) và Sanitizer dữ liệu đầu vào.
- **Chống CSRF:** Sử dụng `Anti-Forgery Token` (`@Html.AntiForgeryToken()`) cho tất cả các form thao tác.

---

## 📁 4. Cấu Trúc Thư Mục Dự Án (Solution Structure)

```text
WebCompany Solution/
├── App_Data/                # Chứa file cơ sở dữ liệu MS SQL Server (.mdf) & Script SQL
├── Controllers/             # Logic xử lý Server-side (Admin, Cart, Product, Home...)
├── Models/                  # Entity Framework DbContext và Data Models
├── ViewModels/              # Các ViewModel phục vụ truyền dữ liệu Form (Checkout, Login)
├── Views/                   # Razor Views (Client & Admin Layout)
├── Content/                 # CSS, Fonts, Bootstrap 5
├── Scripts/                 # JavaScript, jQuery, AJAX handlers
└── Web.config               # Cấu hình chuỗi kết nối Database và bảo mật


Các bước cài đặt:
Clone Repository về máy:

Bash
git clone [https://github.com/username/repository.git](https://github.com/username/repository.git)
cd repository
Khởi tạo Cơ sở Dữ liệu (MS SQL Server):

Mở phần mềm SQL Server Management Studio (SSMS).

Mở tệp Database.sql nằm trong thư mục App_Data/ (hoặc thư mục gốc).

Thực thi lệnh Execute (F5) để tạo Database CompanyDB cùng toàn bộ các bảng và dữ liệu mẫu.

Cấu hình Chuỗi Kết Nối (Connection String):

Mở file Web.config trong dự án và chỉnh sửa lại chuỗi kết nối phù hợp với SQL Server trên máy bạn:
<connectionStrings>
  <add name="CompanyDbContext" 
       connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=CompanyDB;Integrated Security=True;TrustServerCertificate=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>

Biên dịch và Chạy Dự án:

Mở file solution (WebCompany.sln) bằng Visual Studio.

Nhấn Ctrl + Shift + B để Rebuild Solution và restore các gói NuGet.

Nhấn F5 hoặc nút IIS Express để khởi chạy website trên trình duyệt.
