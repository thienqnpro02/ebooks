USE [master]
GO
/****** Object:  Database [QL_LINHKIEN]    Script Date: 12/16/2019 8:01:39 AM ******/
CREATE DATABASE [QL_LINHKIEN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_LINHKIEN', FILENAME = N'D:\CDK11-CNTT\Setup\QL_LINHKIEN.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_LINHKIEN_log', FILENAME = N'D:\CDK11-CNTT\Setup\QL_LINHKIEN_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_LINHKIEN] SET COMPATIBILITY_LEVEL = 120
GO 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_LINHKIEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_LINHKIEN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_LINHKIEN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_LINHKIEN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_LINHKIEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_LINHKIEN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_LINHKIEN] SET  MULTI_USER 
GO
ALTER DATABASE [QL_LINHKIEN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_LINHKIEN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_LINHKIEN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_LINHKIEN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QL_LINHKIEN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_LINHKIEN', N'ON'
GO
USE [QL_LINHKIEN]
GO
/****** Object:  Table [dbo].[CHITIETPHIEUNHAP]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUNHAP](
	[MAPHIEUNHAP] [int] NOT NULL,
	[MAHANG] [int] NOT NULL,
	[SOLUONG] [int] NULL,
	[GIANHAP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPHIEUNHAP] ASC,
	[MAHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETPHIEUXUAT]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUXUAT](
	[MAPHIEUXUAT] [int] NOT NULL,
	[MAHANG] [int] NOT NULL,
	[SOLUONG] [int] NULL,
	[GIAXUAT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPHIEUXUAT] ASC,
	[MAHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MADM] [int] IDENTITY(1,1) NOT NULL,
	[TENDANHMUC] [nvarchar](50) NULL,
	[NGAYTAO] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MADM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANG]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANG](
	[MAHANG] [int] IDENTITY(1,1) NOT NULL,
	[TENHANG] [varchar](200) NULL,
	[THONGSO] [nvarchar](max) NULL,
	[BAOHANH] [int] NULL,
	[SOLUONG] [int] NULL,
	[GIA] [int] NULL,
	[HINH] [varchar](100) NULL DEFAULT ('default.png'),
	[NHASANXUAT] [varchar](50) NULL,
	[NGAYTAO] [date] NULL DEFAULT (getdate()),
	[MADANHMUC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MAKH] [int] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[NAMSINH] [date] NULL,
	[NGAYTAO] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MANCC] [int] IDENTITY(1,1) NOT NULL,
	[TENNCC] [nvarchar](50) NULL,
	[DIACHI] [nvarchar](80) NULL,
	[FAX] [char](10) NULL,
	[EMAIL] [varchar](50) NULL,
	[NGAYTAO] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MANCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](50) NULL,
	[PASSWORD] [varchar](80) NULL,
	[HOTEN] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[DIACHI] [nvarchar](80) NULL,
	[NAMSINH] [date] NULL,
	[LOAINHANVIEN] [tinyint] NULL,
	[GIOITINH] [bit] NULL,
	[NGAYTAO] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAP](
	[MAPHIEUNHAP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYTAO] [date] NULL,
	[MANCC] [int] NULL,
	[MANV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPHIEUNHAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUXUAT]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUXUAT](
	[MAPHIEUXUAT] [int] IDENTITY(1,1) NOT NULL,
	[MAKH] [int] NULL,
	[NGAYTAO] [date] NULL,
	[MANV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPHIEUXUAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (1, N'Mainboard - Bo mạch chủ', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (2, N'CPU - Bộ vi xử lý', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (3, N'RAM - Bộ nhớ trong', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (4, N'Ổ cứng HDD', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (5, N'Ổ cứng SSD', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (6, N'ODD - Ỗ đĩa quang', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (7, N'VGA - Card màn hình', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (8, N'Card âm thanh', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (9, N'Case - Vỏ máy tính', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (10, N'PSU - Nguồn máy tính', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[DANHMUC] ([MADM], [TENDANHMUC], [NGAYTAO]) VALUES (11, N'Bàn phím - Chuột', CAST(N'2019-10-16' AS Date))
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
SET IDENTITY_INSERT [dbo].[HANG] ON 

INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (1, N'Mainboard ASUS WS C621E SAGE', N'Mainboard Asus WS C621E SAGE, 
s? d?ng chipset C621 c?a Intel dành cho Workstations.
 Mainboard này h? tr? t?i 2 b? vi x? lý Intel Xeon Scalable 
 s? d?ng socket LGA-3647, kèm theo kh? nang ép xung cao c?p. 
 Asus WS C621E SAGE dáp ?ng x? lý công vi?c l?n dành cho doanh nghi?p, 
 ngu?i làm trong các linh v?c thi?t k? d? h?a, video, render, 
 phân tích d? li?u, ?o hóa hay AI - Trí tu? nhân t?o c?n t?i.', 33, 410, 1800000, N'b9rrdmzjio.jpg', N'ASUS', CAST(N'2019-10-16' AS Date), 1)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (2, N'Mainboard Gigabyte H310M-DS2', N'CPU: Support for 8th Generation Intel® Core™ i7 processors/
 Intel® Core™ i5 processors/Intel® Core™ i3 processors/
 Intel® Pentium® processors/Intel® Celeron® processors in the LGA1151 package
L3 cache varies with CPU
Chipset	Intel® H310 Express Chipset
B? nh?	• 2 x DDR4 DIMM sockets supporting up to 32 GB of system memory
• Dual channel memory architecture
• Support for DDR4 2666/2400/2133 MHz memory modules', 37, 730, 1679000, N'8kh9jrw3sn.png', N'GIGABYTE', CAST(N'2019-10-16' AS Date), 1)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (3, N'CPU Intel Core i5 9600K', N'Bộ vi xử lý Intel Core i5 9600K, 6 nhân 6 luồng, 9MB cache
Là s?n ph?m d?a trên ki?n trúc Coffee Lake Refresh th? h? m?i nh?t
B? vi x? lý này có t?n s? co b?n là 3.7 GHz turbo lên t?i 4.6 GHz. M?c TDP 95W
H? tr? RAM DDR4 2666 / Dual Channel', 36, 970, 6299000, N'8mc370pksh.jpg', N'INTEL', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (4, N'CPU Intel Core i5 9400', N'B? vi xử lý Intel Core i5 9400, 6 nhân 6 luợng, 9MB cache L3
Là s?n ph?m d?a trên ki?n trúc Coffee Lake Refresh th? h? m?i nh?t
B? vi x? lý này có t?n s? co b?n là 2.9 GHz Turbo lên t?i 4.1GHz. M?c TDP 65W
H? tr? RAM DDR4 2666 / Dual Channel', 36, 784, 4599000, N'bif0c9v39l.jpg', N'INTEL', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (5, N'CPU Intel Core i7 - 7800X', N'S? d?ng socket 2066 ch?y trên mainboard X299 m?i nh?t và r?t nhi?u nâng c?p. 
 Nh? công ngh? này, xung nh?p don và dôi nhân c?a CPU có th? du?c tang lên dáng k?.

B? nh? d?m du?c chia s? t?i uu và cân b?ng, 
Intel Core i7 - 7800X b? d?m t?i da trên m?i nhân là 1.375 MB
 và s? d?ng công ngh? b? nh? MLC s? mang l?i hi?u nang x? lý cao hon v?i d? tr? th?p.

S? lane PCIe h? tr? là 28, 
cùng 4 kênh RAM DDR4 t?i 2400. M?c tiêu th? di?n nang ch? 140W.
S?n ph?m này nh?m t?i phân khúc ngu?i d?ng máy tr?m làm vi?c 
s?n xu?t n?i dung s?, game th? và c?ng d?ng OC.', 36, 735, 8999000, N'default.png', N'INTEL', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (6, N'CPU Intel Core i7 9700K', N'Bộ vi xử lý Intel Core i7 9700K, 8 nhân 8 luồng, 12MB cache
Là sản phẩm dựa trên kiến trúc Coffee Lake Refresh thế hệ mới nhất
Bộ vi xử lý này có tần số cơ bản là 3.6 GHz turbo lên tới 4.9 GHz. Mức TDP 95W
Hỗ trợ RAM DDR4 2666 / Dual Channel', 37, 868, 9699000, N'default.png', N'INTEL', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (7, N'CPU Intel Core i9 9900K', N'Bộ vi xử lý Intel Core i9 9900K, 8 nhân 16 luồng, 16MB cache
Là sản phẩm dựa trên kiến trúc Coffee Lake Refresh thế hệ mới nhất
Bộ vi xử lý này có tần số cơ bản là 3.6 GHz turbo lên tới 5.0 GHz. Mức TDP 95W
Hỗ trợ RAM DDR4 2666 / Dual Channel', 36, 847, 12999000, N'default.png', N'INTEL', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (8, N'CPU AMD Ryzen 5 3600X 3.8 GHz (4.4GHz Max Boost) / 36MB Cache / 6 cores / 12 threads / 95W', N'CPU Ryzen thế hệ thứ 3, tiến trình sản xuất 7nm
6 nhân, 12 luồng, xung nhịp mặc định 3.8 GHz, xung nhịp boost tối đa 4.4 GHz
Hỗ trợ PCI-e 4.0
Có hỗ trợ ép xung
Đi kèm tản nhiệt Wraith Spire', 36, 372, 6490000, N'default.png', N'AMD', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (9, N'CPU AMD Ryzen 7 3800X 3.9 GHz (4.5GHz Max Boost) / 36MB Cache / 8 cores / 16 threads / 105W', N'CPU Ryzen thế hệ thứ 3, tiến trình sản xuất 7nm
8 nhân, 16 luồng, xung nhịp mặc định 3.9 GHz, xung nhịp boost tối đa 4.5 GHz
Hỗ trợ PCI-e 4.0
Có hỗ trợ ép xung
Đi kèm tản nhiệt Wraith Prism với RGB LED', 36, 653, 9990000, N'default.png', N'AMD', CAST(N'2019-10-16' AS Date), 2)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (10, N'DDRam 4 Kingston Predator RGB 8GB/2933-HX429C15PB3A/8', N'Chủng loại	Predator RGB
Dung lượng	8GBx1
Kiểu Ram	DDR4
Bus Ram hỗ trợ	2933 Mhz
Độ trễ	17 CL(IDD)
Tản nhiệt	Led RGB
Điện áp	1.2V', 36, 163, 3149000, N'default.png', N'Kingston', CAST(N'2019-10-16' AS Date), 3)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (11, N'Ram Cosair 32GB/3200 (2x16G)  CMW32GX4M2C3200C16  - Vengeance RGB Pro', N'Chủng loại: Bộ nhớ trong
Hãng sản xuất: Corsair
Series: Vengeance PRO RGB
Loại RAM: DDR4
Đóng gói: 32GB (2x16GB)
Bus: 3200MHz
Độ trễ: 16-18-18-36
Điện áp: 1.35V
Tản nhiệt: Nhôm truyền thống', 36, 770, 6999000, N'default.png', N'Cosair', CAST(N'2019-10-16' AS Date), 3)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (12, N'Kit Ram 4 Gskill Trident Z Royal 16GB/3600 (2x8GB) F4-3600C18D-16GTRS', N'Chủng loại Trident Z Royal
Dung lượng	16GB
Kiểu Ram	DDR4
Bus Ram hỗ trợ	3600 Mhz
Độ trễ	18-22-22-42', 36, 480, 4, N'default.png', N'Gskill', CAST(N'2019-10-16' AS Date), 3)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (13, N'HDD Western Purple 2TB/5400 Sata 3 64Mb', N'Ổ cứng gắn trong Western Purple 2TB chuyên dụng cho thiết bị giám sát, 
đầu ghi camera, thích hợp sử dụng cho các cá nhân, 
văn phòng hoặc các doanh nghiệp với hệ thống lên đến 64 camera.
Thông số kỹ thuật: dung lượng 2TB; giao tiếp SATA 3 (6Gb/s max); 
64MB Cache, tốc độ quay 5400RPM. Công nghệ AllFrame tối ưu hóa, cải thiện hiệu suất, giảm tỉ lệ lỗi/khung.
HDD WD PURPLE 2TB là dòng ổ cứng sản xuất ra để chuyên dùng cho thiết bị ghi hình Camera giám sát, c
hạy rất êm, giải nhiệt tốt bằng 70% so với ổ cứng PC thông thường, 
thích hợp trong hệ thống camera giám sát tại nhà và doanh nghiệp vừa và nhỏ.', 36, 607, 1590000, N'default.png', N'Western Digital', CAST(N'2019-10-16' AS Date), 4)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (14, N'HDD Seagate SkyHawk SURVEILLANCE 6TB/7200, Sata 3, 256MB Cache', N'Tối ưu hóa cho DVR và NVRs, ổ cứng giám sát Skyhawk được điều chỉnh

để làm việc 24x7 với dung lượng tới 10 TB. trang bị tăng cường firmware

ImagePerfect giảm thiểu thời gian chết đồng thời xử lý công việc nhanh 

hơn 3 lần so với ổ cứng máy tính để bàn và hỗ trợ lên đến 64 camera HD.', 36, 372, 5570000, N'default.png', N'SEAGATE', CAST(N'2019-10-16' AS Date), 4)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (15, N'SSD Samsung 860 EVO 500GB SATA3 6Gb/s 2.5" ( Ð?c 550MB/s, Ghi 520MB/s)', N'Hãng sản xuất
Samsung

Chủng loại
860 EVO

Dung lượng
500GB

Chuẩn kết nối
SATA III 6Gb/s.

Kích thước
2.5"

Tốc độ Đọc
lên tới 550MB/s

Tốc độ Ghi
lên tới 520MB/s

Chíp nhớ
3D V-NAND', 60, 372, 2789000, N'default.png', N'SAMSUNG', CAST(N'2019-10-16' AS Date), 5)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (16, N'SSD Plextor PX-256M8VC Series 256GB SATA3 6Gb/s 2.5" (Doc 560MB/s, Ghi 510MB/s)', N'Hãng sản xuất	Plextor
Chủng loại	M8VC
Dung lượng	256GB
Chuẩn cắm	Sata 3
Tốc độ đọc	lên tới 560MB/s', 36, 188, 1099000, N'default.png', N'PLEXTOR', CAST(N'2019-10-16' AS Date), 5)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (17, N'SSD Kingston SSDNow UV500 240GB Sata3 2.5', N'Chủng loại	UV500
Dung lượng	240GB
Chuẩn cắm	Sata 3
Tốc độ	Đọc 520MB/s, Ghi 500MB/s
Loại ổ cứng	3D NAND
Kích thước	2.5”', 60, 612, 1190000, N'default.png', N'Kingston', CAST(N'2019-10-16' AS Date), 5)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (18, N'Vga Card Gigabyte N107TGAMING-8GD', N'Chủng loại
NVIDIA® GeForce® GTX 1070 Ti

Core Clock
1721 MHz / 1632 MHz (OC Mode)
1683 MHz / 1607 MHz (Gaming Mode)

Cuda Cores
2432 Units

Memory Clock Speed
8008 MHz

Bộ nhớ/ băng thông
8GB DDR5 / 256-bit

Chuẩn giao tiếp
PCI Express 3.0 x16

Cổng giao tiếp
DisplayPort x 2 (v1.4) / HDMI x 2 (v2.0) / DL-DVI-D

Kích thước
H=41 L=280 W=114 mm

DirectX
DirectX 12

Độ phân giải tối đa
7680x4320

Điện năng tiêu thụ
180 W

Đề nghị sử dụng nguồn
500 W hoặc hơn

Nguồn phụ
8-pin x 1

Hỗ trợ SLI
Có', 36, 745, 10690000, N'default.png', N'GIGABYTE', CAST(N'2019-10-16' AS Date), 7)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (19, N'VGA Card nVidia Quadro P2200 5GB GDDR6', N'Hãng sản xuất
MSI

Chủng loại
Radeon™ RX 5700 XT

GPU
NAVI 10 XT

Chuẩn giao tiếp
PCI Express 4.0

Bộ nhớ VGA
GDDR6 8GB

Băng thông
256-bit

Memory Speed
14 Gbps

Engine Clock
1925 MHz (OC Mode)
1815 MHz (Gaming Mode)

Cổng giao tiếp
HDMI Output 2.0b: Yes x 1
Display Port 1.4 : Yes x 3 
HDCP Support 2.2: Yes

Nguồn yêu cầu
750 W

Kích thước
232 x 126 x 46 mm', 36, 690, 9999000, N'default.png', N'MSI', CAST(N'2019-10-16' AS Date), 7)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (20, N'VGA Card NVidia Quadro P2200 5GB GDDR66', N'NVIDIA Quadro P2200
Pascal GPU
1,280 NVIDIA® CUDA® Cores
5GB GDDR5x Memory
Display Resolution:
4x 4096x2160 @ 120Hz
4x 5120x2880 @ 60Hz', 36, 832, 11999000, N'default.png', N'NVidia', CAST(N'2019-10-16' AS Date), 7)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (21, N'Case Asus TUF Gaming GT501VC - Tempered Glass Mid-Tower', N'Hãng sản xuất
ASUS

Model
TUF Gaming GT501VC

Loại case
Mid Tower

Màu sắc
Đen

Hỗ trợ mainboard
E-ATX(12”x10.9”), ATX, Micro ATX, Mini ITX

Khay lắp ổ 3.5''
4 x 3.5’’ or 2.5’’

Khay lắp ổ 2.5''
3 x 2.5''

Khe mở rộng
7 +2 (khe dựng dọc)

Cổng kết nối
2 x USB 3.1 Gen1
1 x Headphone
1 x Microphone

Hệ thống làm mát
Front: 2 x 140mm/ 3 x 120mm
Top: 2 x 140mm/ 3 x 120mm
Rear: 1 x 140mm/120mm

Chiều dài tối đa GPU
420mm

Chiều cao tối đa tản nhiệt CPU
180mm

Kích thước
251 x 545 x 552 mm

Trọng lượng
9.9kg

Hỗ trợ radiator
Front: 120, 140, 240, 280, 360 mm
Top 120, 140, 240, 280, 360 mm
Rear: 120, 140mm', 36, 434, 2990000, N'default.png', N'ASUS', CAST(N'2019-10-16' AS Date), 9)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (22, N'Case Golden Field G20 Full Tower- Sói B?c', N'Hãng sản xuất
GOLDEN FIELD

Chủng loại
GOLDEN FIELD G20

Kích thước (rộng x dài x cao)
558(L) x 531(H) x 261(W)

Chất liệu
Khung Thép (SECC) + Mặt lưới sắt tản nhiệt siêu mạnh.

Màu
Trắng

Chuẩn Mainboard
ATX/Micro ATX

Khe cắm mở rộng
N/A

Khay 5.25”
0

Khay 3.5''
2

Khay 2.5”
2

Cổng giao tiếp bên ngoài
USB 3.0, usb 2.0, và tai nghe  + microphone

Hệ thống làm mát
Hỗ trợ 3 quạt
     + Sau: 120 x 120mm fan LED x 1 (Có sẵn)
     + Nóc: 120 x 120 mm fan LED x 1 (Có sẵn)

Tản nước tương thích
N/A

Phụ kiện đi kèm
Ốc vít, vỏ thùng

Khả năng tương thích
Hỗ trợ VGA 260mm, CPU: 135MM', 36, 460, 4299000, N'default.png', N'Golden Field', CAST(N'2019-10-16' AS Date), 9)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (23, N'Case Thermaltake View 91 RGB Tempered Glass (CA-1I9-00F1WN-00)', N'Hãng sản xuất
THERMALTAKE

Chủng loại
Case Thermaltake View 91 RGB Tempered Glass )CA-1I9-00F1WN-00)

Kích thước (rộng x dài x cao)
691 x 344 x 645 mm

Chất liệu
Thép cao cấp, nhôm cao cấp, kính cường lực

Màu
Đen

Chuẩn Mainboard
Mini-ITX, Micro-ATX, ATX, E-ATX, XL-ATX

Khe cắm mở rộng
10+2

Khay 5.25”
N/A

Khay 3.5''
12

Khay 2.5”
12

Cổng giao tiếp bên ngoài
USB3.0 × 4, USB3.1 Type-C × 1, Audio × 1, Mic × 1 (hỗ trợ HD Audio)

Hệ thống làm mát
Phía trước: 120mm x 4 fan / 140mm x 3 fan
Phía trên: 120mm x 4 fan / 140mm x 3 fan / 200mm x 2 fan
Phía hông (sau tray MB): 120mm x 8 fan / 140mm x 8 fan / 200mm x 6 fan
Phía sau: 120mm x 1 fan / 140mm x 1 fan
Phía đáy: 120mm x 3 fan / 140mm x 3 fan

Tản nước tương thích
Phía trước: 120 / 140 / 240 / 280 / 360 / 420 / 480 radiator 
Phía trên: 120 / 140 / 240 / 280 / 360 / 420 / 480 radiator 
Phía hông(sau tray MB): 120 / 140 / 240 / 280 / 360 / 420 / 480 radiator
Phía sau: 120 / 140 radiator
Phía đáy: 120 / 140 / 240 / 280 / 360 / 420 radiator 

Phụ kiện đi kèm
Ốc vít, vỏ thùng

Chuẩn nguồn
ATX PS2

Khả năng tương thích
Chiều dài VGA tối đa: 470mm
Chiều cao tản CPU tối đa: 200mm', 36, 504, 11899000, N'default.png', N'Thermaltake', CAST(N'2019-10-16' AS Date), 9)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (24, N'PSU SeaSonic 750W M12II EVO - 80 PLUS®BRONZE - FULL MODULAR (M12II-750 EVO) (750GM2)', N'Hãng sản xuất
Seasonic

Chủng loại
750W M12II Bronze Evo Edition

Chuẩn nguồn
ATX

Tiêu chuẩn chất lượng
80 PLUS® Bronze

Mầu
Sơn tĩnh điện đen toàn bộ

Công suất danh định
750w

Công suất thực
đạt mức tải 100% / công suất danh định

Đầu cấp điện cho main
20+4Pin

Đầu cấp điện cho hệ thống
1 x 20+4-pin.
1 x 8-pin CPU
1 x (4+4)-pin CPU
4 x 8(6+2)-pin PCI-E
8 x SATA
5 x Molex
2 x Floppy

Quạt
120mm chống ồn

Đường điện vào
100-240V

Phụ kiện đi kèm
Hộp, Sách, Dây nguồn', 60, 301, 2599000, N'default.png', N'SeaSonic', CAST(N'2019-10-16' AS Date), 10)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (25, N'PSU Raidmax RX-735AP-R 80 plus Bronze', N'Hãng sản xuất
RAIDMAX

Chủng loại
Nguồn máy tính Raidmax RX-735AP-R 80 plus Bronze

Chuẩn nguồn
Support with Intel ATX12V V2.3

Tiêu chuẩn chất lượng
Chứng chỉ 80 Plus Bzone   - Tuổi thọ 100,000 giờ

Màu
Sơn tĩnh điện đen toán bộ LED RGB

Công suất danh định
735W

Công suất thực
>79%

Đầu cấp điện cho main
M/B 20+4pin * 1
CPU4 +4pin * 1
PCI-E 6+2 PIN *4
SATA * 8
Molex 4pin * 3
Đĩa mềm * 1

Đầu cấp điện cho hệ thống
- Output :
+5V 20A
+3.3V 20A
+12V1 53A
-12V 0.3A
-5Vsb 2.5A

Bảo vệ đầy đủ với OVP, UVP, OPP, và SCP
Quạt

Quạt hệ thống : 13,5cm Fan * 1
Đường điện vào
Input: 100-240VAC, 15 / 7A, 50 / 60HZ

Phụ kiện đi kèm
Hộp, Dây nguồn, sách hướng dẫn', 60, 310, 4999000, N'default.png', N'Raidmax', CAST(N'2019-10-16' AS Date), 10)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (26, N'PSU Thermaltake Toughpower iRGB 1200W - Platinum (PS-TPI-1200F2FDPE-1)', N'Model
 Thermaltake Toughpower iRGB PLUS 1200W

Type
ATX 12V v2.4 and EPS v2.92

PFC
Active PFC
80 PLUS Certification
Platinum

Input Voltage
100-240 Vac

Input Curent
14 A

Input Frequency
50-60 Hz

Max Power
1200 W

Color
Black

Fan Type
hydraulic bearing fan, 140 mm

Efficiency
>94%

Dimensions(W x H x L)
150 × 86 × 180 mm', 60, 246, 6189000, N'default.png', N'Thermaltake', CAST(N'2019-10-16' AS Date), 10)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (27, N'Mouse Fuhlen G300L Optical USB - Gaming', N'Thương hiệu
Fuhlen

Chủng loại
Chuột máy tính có dây gaming

Chuẩn kết nối
USB 2.0

Màu sắc
Đen

Đèn led
N/A

Độ phân giải
2000/4000/6000/8000 DPI

Mắt đọc
Optical

Kích thước
13.5 x 7.2 x 4.0 cm

Trọng lượng
95gr

Hệ điều hành hỗ trợ
Windows (XP, Vista, 7&8), Mac OS

Phụ kiện
Đĩa driver, sách', 24, 100, 1509000, N'default.png', N'Fuhlen', CAST(N'2019-10-16' AS Date), 11)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (28, N'Mouse Logitech G302 USB Black', N'Chuột được thiết kế cho Game thủ chuyên nghiệp. G302 MOBA Gaming Mouse.
Chuột Logitech G302 sử dụng cảm biến quang học công nghệ Logitech Delta Zero™.
Tích hợp 6 nút có thể lập trình được, gán các tác vụ khác ', 24, 188, 1509000, N'default.png', N'Logitech', CAST(N'2019-10-16' AS Date), 11)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (29, N'Keyboard Vortex 3 Limited Edition Cherry Red switch', N'Thương hiệu bàn phím cơ cao cấp của Đài Loan
Phiên bản Limited của dòng Poker 3
Toàn bộ phím được gia cố bằng nhôm nguyên khối
Độ bền siêu bền bỉ theo thời gian
Thiết kế Mini cực kì nhỏ gọn', 24, 550, 4199000, N'default.png', N'Vortex', CAST(N'2019-10-16' AS Date), 11)
INSERT [dbo].[HANG] ([MAHANG], [TENHANG], [THONGSO], [BAOHANH], [SOLUONG], [GIA], [HINH], [NHASANXUAT], [NGAYTAO], [MADANHMUC]) VALUES (30, N'Keyboard Durgod V104S RGB Mechanical Cherry Brown Switch Black', N'Thương hiệu bàn phím cơ Durgod hoàn toàn mới
Được sản xuất và lắp ráp tại nhà máy uy tín tại Trung Quốc
Chất lượng tổng thể cứng cáp, chắc chắn
Switch sử dụng 100% Cherry MX from Germany
Anti-Ghosting 100% và NKRO qua cổng USB', 24, 838, 2499000, N'default.png', N'Durgod', CAST(N'2019-10-16' AS Date), 11)
SET IDENTITY_INSERT [dbo].[HANG] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [SDT], [NAMSINH], [NGAYTAO]) VALUES (1, N'tesst', N'0123456789', CAST(N'2019-11-03' AS Date), CAST(N'2019-11-03' AS Date))
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [SDT], [NAMSINH], [NGAYTAO]) VALUES (2, N'cascas', N'0123456789', CAST(N'2019-11-03' AS Date), CAST(N'2019-11-03' AS Date))
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [SDT], [NAMSINH], [NGAYTAO]) VALUES (3, N'khach moi', N'0123456789', CAST(N'2019-11-03' AS Date), CAST(N'2019-11-03' AS Date))
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [SDT], [NAMSINH], [NGAYTAO]) VALUES (4, N'nguyen vân a', N'0123456789', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI], [FAX], [EMAIL], [NGAYTAO]) VALUES (1, N'FPT Trading', N'Quận 3 - TP.Ho Chi Minh', N'0987654321', N'FPTTradinh@gmail.com', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI], [FAX], [EMAIL], [NGAYTAO]) VALUES (2, N'Smart Tech', N'Quận 7 - TP.Ho Chi Minh', N'0987654324', N'SmartTech@gmail.com', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI], [FAX], [EMAIL], [NGAYTAO]) VALUES (3, N'Dream Viet Trading', N'Quận Sơn Trà - TP.Đà Nẵng', N'0987654326', N'DreamViet@gmail.com', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI], [FAX], [EMAIL], [NGAYTAO]) VALUES (4, N'Fast Trading', N'Quận 1 - TP.Ho Chi Minh', N'0987654330', N'FastTrading@gmail.com', CAST(N'2019-10-16' AS Date))
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI], [FAX], [EMAIL], [NGAYTAO]) VALUES (6, N'Trading Trading', N'TradingTrading', N'0123456789', N'Trading', CAST(N'2019-10-29' AS Date))
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([MANV], [USERNAME], [PASSWORD], [HOTEN], [SDT], [DIACHI], [NAMSINH], [LOAINHANVIEN], [GIOITINH], [NGAYTAO]) VALUES (1, N'hoainam', N'hoainam19988', N'Nguyễn Khoa Hoài Nam', N'0987564321', N'Hùng Vương - Quy Nhơn', CAST(N'1998-01-01' AS Date), 0, 0, CAST(N'2019-10-16' AS Date))
INSERT [dbo].[NHANVIEN] ([MANV], [USERNAME], [PASSWORD], [HOTEN], [SDT], [DIACHI], [NAMSINH], [LOAINHANVIEN], [GIOITINH], [NGAYTAO]) VALUES (2, N'thanhthien', N'thanhthien1998', N'Từ Thanh Thiện', N'0987564322', N'Ngô Mây - Quy Nhon', CAST(N'1998-02-01' AS Date), 1, 0, CAST(N'2019-10-27' AS Date))
INSERT [dbo].[NHANVIEN] ([MANV], [USERNAME], [PASSWORD], [HOTEN], [SDT], [DIACHI], [NAMSINH], [LOAINHANVIEN], [GIOITINH], [NGAYTAO]) VALUES (3, N'hoahau', N'hoahau2000', N'Nguyễn Thị Hoa Hậu', N'0987564324', N'An Dương Vương - Quy Nhơn', CAST(N'1998-02-04' AS Date), 2, 1, CAST(N'2019-10-16' AS Date))
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
ALTER TABLE [dbo].[PHIEUNHAP] ADD  DEFAULT (getdate()) FOR [NGAYTAO]
GO
ALTER TABLE [dbo].[PHIEUXUAT] ADD  DEFAULT (getdate()) FOR [NGAYTAO]
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP]  WITH CHECK ADD FOREIGN KEY([MAHANG])
REFERENCES [dbo].[HANG] ([MAHANG])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP]  WITH CHECK ADD FOREIGN KEY([MAPHIEUNHAP])
REFERENCES [dbo].[PHIEUNHAP] ([MAPHIEUNHAP])
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUAT]  WITH CHECK ADD FOREIGN KEY([MAHANG])
REFERENCES [dbo].[HANG] ([MAHANG])
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUAT]  WITH CHECK ADD FOREIGN KEY([MAPHIEUXUAT])
REFERENCES [dbo].[PHIEUXUAT] ([MAPHIEUXUAT])
GO
ALTER TABLE [dbo].[HANG]  WITH CHECK ADD FOREIGN KEY([MADANHMUC])
REFERENCES [dbo].[DANHMUC] ([MADM])
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD FOREIGN KEY([MANCC])
REFERENCES [dbo].[NHACUNGCAP] ([MANCC])
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHIEUXUAT]  WITH CHECK ADD FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
GO
ALTER TABLE [dbo].[PHIEUXUAT]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
/****** Object:  StoredProcedure [dbo].[PHANTRANG_DANHMUC]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PHANTRANG_DANHMUC] (@currentPage int, @pageSize int)
AS
BEGIN
	DECLARE @rowSelect int =(@currentPage * @pageSize)
	DECLARE @rowExcept int=(@currentPage -1)*@pageSize;

	SELECT TOP(@rowSelect) *from danhmuc
	EXCEPT
	SELECT TOP(@rowExcept) *from danhmuc
END


GO
/****** Object:  StoredProcedure [dbo].[PHANTRANG_KHACHHANG]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PHANTRANG_KHACHHANG](@currentPage int,@pageSize int)
as 
begin
	
	declare @rowSelect int=(@currentPage * @pageSize);
	declare @rowExcept int=(@currentPage -1) * @pageSize;

	select top(@rowSelect) *from khachhang
	except
	select top(@rowExcept) * from khachhang

end;	 


GO
/****** Object:  StoredProcedure [dbo].[PHANTRANG_NCC]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PHANTRANG_NCC](@currentPage int, @pageSize int)
as 
begin
	
	declare @rowSelect int=(@currentPage * @pageSize);
	declare @rowExcept int=(@currentPage -1)*@pageSize;

	select top(@rowSelect) *from nhacungcap
	except
	select top(@rowExcept) *from nhacungcap

end;


GO
/****** Object:  StoredProcedure [dbo].[PHANTRANG_NHANVIEN]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PHANTRANG_NHANVIEN](@currentPage int,@pageSize int)
as
begin

	declare @rowSelect int=(@currentPage*@pageSize);
	declare @rowExcept int=(@currentPage-1) *@pageSize;

	select top(@rowSelect) *from nhanvien
	except 
	select top(@rowExcept) *from nhanvien

end;


GO
/****** Object:  StoredProcedure [dbo].[USP_PagingHang]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_PagingHang]
(@currentPage int, @pageSize int)
as
begin
	
	DECLARE @rowSelect INT = (@currentPage * @pageSize)
	DECLARE @rowExcept INT = (@currentPage -1) * @pageSize

	select TOP (@rowSelect) hang.*, DANHMUC.TENDANHMUC from hang, DANHMUC
	where DANHMUC.MADM = hang.MADANHMUC
	except
	select TOP (@rowExcept) hang.*, DANHMUC.TENDANHMUC from hang, DANHMUC
	where DANHMUC.MADM = hang.MADANHMUC
end

GO
/****** Object:  StoredProcedure [dbo].[USP_PagingHangByMaDM]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_PagingHangByMaDM]
(@currentPage int, @pageSize int, @maDM int)
as
begin
	
	DECLARE @rowSelect INT = (@currentPage * @pageSize)
	DECLARE @rowExcept INT = (@currentPage -1) * @pageSize

	select TOP (@rowSelect) hang.*, DANHMUC.TENDANHMUC from hang, DANHMUC
	where DANHMUC.MADM = hang.MADANHMUC
	AND HANG.MADANHMUC = @maDM
	except
	select TOP (@rowExcept) hang.*, DANHMUC.TENDANHMUC from hang, DANHMUC
	where DANHMUC.MADM = hang.MADANHMUC
	AND HANG.MADANHMUC = @maDM
end

GO
/****** Object:  StoredProcedure [dbo].[USP_ReportKhachHang]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ReportKhachHang] (@From nvarchar(30), @To nvarchar(30))
as
begin
	select * from KHACHHANG
	where NGAYTAO between @From and @To
end

GO
/****** Object:  StoredProcedure [dbo].[USP_ReportLoiNhuan]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ReportLoiNhuan]
as
begin
declare @TongThu INT = 0
declare @TongChi INT = 0

set @TongThu = (select sum(GIAXUAT) from CHITIETPHIEUXUAT)
set @TongChi = (select sum(GIANHAP) from CHITIETPHIEUNHAP)


select (ISNULL(@TongThu,0)) as TongThu, (ISNULL(@TongChi,0)) as TongChi, (@TongThu - ISNULL(@TongChi,0)) as LoiNhuan
end

GO
/****** Object:  StoredProcedure [dbo].[USP_ReportPhieuNhap]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_ReportPhieuNhap](@From nvarchar(30), @To nvarchar(30))
as
begin
	select Hang.TENHANG,PHIEUNHAP.NGAYTAO, CHITIETPHIEUNHAP.GIANHAP, CHITIETPHIEUNHAP.SOLUONG,
	(CHITIETPHIEUNHAP.GIANHAP * CHITIETPHIEUNHAP.SOLUONG ) as THANHTIEN
    from PHIEUNHAP,CHITIETPHIEUNHAP,HANG
	where PHIEUNHAP.NGAYTAO between @From  AND @To
	AND PHIEUNHAP.MAPHIEUNHAP = CHITIETPHIEUNHAP.MAPHIEUNHAP
	AND CHITIETPHIEUNHAP.MAHANG = HANG.MAHANG
end

GO
/****** Object:  StoredProcedure [dbo].[USP_ReportPhieuXuat]    Script Date: 12/16/2019 8:01:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ReportPhieuXuat](@From nvarchar(30), @To nvarchar(30))
as
begin
	select Hang.TENHANG,PHIEUXUAT.NGAYTAO, CHITIETPHIEUXUAT.GIAXUAT, CHITIETPHIEUXUAT.SOLUONG,
	(CHITIETPHIEUXUAT.GIAXUAT * CHITIETPHIEUXUAT.SOLUONG ) as THANHTIEN
    from PHIEUXUAT,CHITIETPHIEUXUAT,HANG
	where PHIEUXUAT.NGAYTAO between @From  AND @To
	AND PHIEUXUAT.MAPHIEUXUAT = CHITIETPHIEUXUAT.MAPHIEUXUAT
	AND CHITIETPHIEUXUAT.MAHANG = HANG.MAHANG
end

GO
USE [master]
GO
ALTER DATABASE [QL_LINHKIEN] SET  READ_WRITE 
GO
