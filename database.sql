CREATE DATABASE CompanyDB;
GO
USE CompanyDB;
GO

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    FullName NVARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(200) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    Price DECIMAL(18,2) NOT NULL,
    Quantity INT NOT NULL DEFAULT 0,
    ImageUrl VARCHAR(255),
    Description NVARCHAR(MAX),
    IsActive BIT DEFAULT 1
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NULL FOREIGN KEY REFERENCES Users(UserID),
    CustomerName NVARCHAR(100) NOT NULL,
    CustomerPhone VARCHAR(20) NOT NULL,
    CustomerAddress NVARCHAR(255) NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT N'Chờ xử lý',
    TotalAmount DECIMAL(18,2)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL
);

CREATE TABLE News (
    NewsID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(250) NOT NULL,
    Summary NVARCHAR(500),
    Content NVARCHAR(MAX),
    ImageUrl VARCHAR(255),
    CreatedDate DATETIME DEFAULT GETDATE(),
    CreatedBy INT FOREIGN KEY REFERENCES Users(UserID)
);

-- Chèn dữ liệu vai trò mẫu
INSERT INTO Roles (RoleName) VALUES ('Admin'), ('Customer');