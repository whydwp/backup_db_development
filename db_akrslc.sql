-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Mei 2024 pada 10.03
-- Versi server: 11.4.0-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akrslc`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anydesk`
--

CREATE TABLE `anydesk` (
  `id` int(11) NOT NULL,
  `id_anydesk` varchar(255) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anydesk`
--

INSERT INTO `anydesk` (`id`, `id_anydesk`, `pass`, `user`) VALUES
(1, '938534991', NULL, 'Server Surabaya'),
(2, '139195864', NULL, 'Server Data Gresik'),
(3, '802261549', '', 'Sales GemCity Gresik'),
(4, 'akrland165@ad', NULL, 'Adi Pranoto'),
(5, '775034518', NULL, 'Zaidul Fanani'),
(6, '775034518', NULL, 'Tirta'),
(7, 'akrland161@ad', NULL, 'Frengky Bayu'),
(8, 'akrland186@ad', NULL, 'Ferdian Andra'),
(9, '522822531', NULL, 'Ariawira'),
(10, '930101224', NULL, 'Helen Tandya'),
(11, 'akrland177@ad', NULL, 'Maloa Dame'),
(12, '757640455', '', 'Sales GemCity Surabaya - AKRSLC163'),
(13, '259456042', NULL, 'Afannudin'),
(14, '842331286', '', 'Fang Nie'),
(15, '561235653', NULL, 'Nindya'),
(16, 'akrland176@ad', NULL, 'William Hansen'),
(17, 'desktop-nai2414@ad', NULL, 'Betlest Surenggono'),
(18, '840937216', NULL, 'Suryawan'),
(19, '756498129', NULL, 'Dwi Prasetyo'),
(20, 'akrland175@ad', NULL, 'Suci Ramadhania'),
(21, '513171316', NULL, 'Monica'),
(22, 'akrland192@ad', NULL, 'Angeline'),
(24, '805029793', NULL, 'Didik QC'),
(25, 'akrland173@ad', NULL, 'Hardani Surveyor'),
(26, '299548306', NULL, 'Irhantoro Adi'),
(27, '465307346', NULL, 'Wahyu Erga'),
(28, '697915976', NULL, 'Daniswara'),
(29, '917529175', NULL, 'Ivanna'),
(30, '221191009', NULL, 'Fiqih Suci'),
(31, '147392863', NULL, 'Sales GemCity Surabaya - Kiri'),
(32, '225161049', NULL, 'Ihsanul Fauzi'),
(33, 'akrland152@ad', NULL, 'Dewantoro'),
(34, 'akrland154@ad', '', 'PC Printer A3 Surabaya'),
(35, '914322428', NULL, 'Firman Ariadi'),
(36, '560 432 359', '', 'Michael Brian'),
(37, '262029928', NULL, 'Herman Sasongko'),
(38, '470476915', NULL, 'PC GLOW Beauty'),
(39, '967182750', '', 'Anjasmoro-03 Laptop Elfa'),
(40, '323338303', NULL, 'Wenny Margaretha'),
(41, '257877197', '', 'Anjasmoro-01 Bu IIN'),
(42, '642623268', NULL, 'Wiliam Mozzes'),
(43, '377862655', NULL, 'Laptop 157'),
(44, '1104565315', '', 'Sehat Triprasetyono'),
(45, '725331198', '', 'AKRSLC 158'),
(46, '552134103', '', 'AKRSLC 209'),
(47, '234381442', NULL, 'Laptop Willy'),
(48, '821 136 407', NULL, 'Faranisa'),
(49, '722529711', NULL, 'Fikri Alam'),
(50, '1731200228', NULL, 'Muhamad Hudan'),
(51, '1184220685', '', 'Anjasmoro-02 Bu Ratna');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_atk`
--

CREATE TABLE `barang_atk` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_atk_keluar`
--

CREATE TABLE `barang_atk_keluar` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Trigger `barang_atk_keluar`
--
DELIMITER $$
CREATE TRIGGER `kurangstok` AFTER INSERT ON `barang_atk_keluar` FOR EACH ROW BEGIN
UPDATE barang_atk set stok = stok - new.Jumlah
WHERE nama_barang = new.nama_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_atk_masuk`
--

CREATE TABLE `barang_atk_masuk` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Trigger `barang_atk_masuk`
--
DELIMITER $$
CREATE TRIGGER `tambahstok` AFTER INSERT ON `barang_atk_masuk` FOR EACH ROW BEGIN
UPDATE barang_atk set stok = stok + new.Jumlah
WHERE nama_barang = new.nama_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_it`
--

CREATE TABLE `barang_it` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `jumlah_barang` varchar(255) NOT NULL,
  `status_barang` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `barang_it`
--

INSERT INTO `barang_it` (`id`, `nama_barang`, `lokasi`, `jumlah_barang`, `status_barang`, `keterangan`, `photo`) VALUES
(1, 'AP E2500 Cisco', 'Ruang Server IT', '1', 'Active', '', ''),
(2, 'AP EAP300 Cisco', 'Diatas plafon Lobby Lantai 3', '1', 'Active', '', ''),
(3, 'AP EAP300 Cisco', 'Lantai 2 Ruang Sales GEM', '1', 'Active', '', ''),
(4, 'AP EAP350 Cisco', 'Lantai 2 Hall', '1', 'Active', '', ''),
(5, 'AP Ubiquity AC PRO', 'Diatas plafon purchasing', '1', 'Active', '', ''),
(7, 'Logitect CC3000 Video Conference', 'Ruang Meeting Lantai 3', '1', 'Active', '', ''),
(8, 'NAS Storage QNAP TS-653B-8G', 'Ruang Server IT', '1', 'Active', 'Storage 192.168.101.252', ''),
(9, 'NAS Storage TVS-473 AMD', 'Ruang Server IT', '1', 'Active', 'Storage 192.168.101.253', ''),
(10, 'Printer LX 310 Dotmatrix', 'Ruang Server IT', '15', 'Non Active', '', ''),
(11, 'PROYEKTOR ', 'Marcom', '1', 'Active', '', ''),
(12, 'PROYEKTOR ', 'Gresik Project', '1', 'Active', '', ''),
(13, 'Router RB1100', 'Ruang Server IT', '2', 'Active', '', ''),
(14, 'Printer Epson L210 - Ex SAD', 'Gudang Lantai 2', '1', 'Rusak', 'Rusak Scan dan Printer', ''),
(15, 'Monitor LCD 19&#34; Lenovo', 'Ruang IT', '1', 'Rusak', 'Layar Garis Vertikal', ''),
(16, 'Monitor LCD 22&#34; Samsung', 'Ruang IT', '1', 'Rusak', 'Warna Pudar', ''),
(17, 'Hardisk WD 500 GB', 'Ruang IT', '2', 'Rusak', 'BadSector', ''),
(18, 'Hardisk Dell 500 GB', 'Ruang IT', '1', 'Rusak', 'Badsector', ''),
(19, 'Hardisk WD 2 TB', 'Ruang IT', '1', 'Rusak', 'Badsetor', ''),
(20, 'UPS 600VA', 'Gudang Lantai 2', '15', 'Rusak', 'Komponen UPS Karat/Berair karena air accu', ''),
(21, 'Printer HP CP5225', 'Ruang IT', '1', 'Rusak', 'ITB Rusak, Ganti Sparepart Mahal', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan`
--

CREATE TABLE `catatan` (
  `id` int(11) NOT NULL,
  `judul_catatan` varchar(255) NOT NULL,
  `configurasi` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `catatan`
--

INSERT INTO `catatan` (`id`, `judul_catatan`, `configurasi`, `photo`) VALUES
(1, 'CCTV HIKVision', '192.168.101.30 NVR – admin/Admin888 (Setting di HP / anis.maslahan@akrland.com=@kr-cctv123)\r\nuser : admin\r\npass : Admin888\r\nKey : QWERTY\r\nIP : 192.168.101.30 – NVR\r\nCAM1 : 192.168.101.31 - 192.168.101.35\r\n', NULL),
(2, 'IP NAS', 'IP NAS QNAP / admin / @kr-storage123\r\n192.168.101.252 – 192.168.101.253\r\nIP NAS JKT 192.168.201.223 / it / @kr-it\r\n\r\n', NULL),
(3, 'IP SERVER SURABAYA', 'IP Server : 192.168.101.5 administrator/arifin = akrLand10', NULL),
(4, 'IP Net Surabaya', 'IP ISP MODEM FM : Dynamic berubah 192.168.0.5(24)/255.255.255.0/192.168.0.1\r\n\r\nIP ISP MODEM LINTASARTA : 182.23.7.226(28)/255.255.255.240/182.23.7.225\r\nDNS : 202.152.0.2/202.152.5.36\r\n', NULL),
(5, 'IP Net Gresik', 'Icon Net : 119.252.167.98/29\r\n\r\nFibernet : 103.157.83.145/24', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_security`
--

CREATE TABLE `catatan_security` (
  `id` int(11) NOT NULL,
  `kantor` varchar(255) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact_vendor`
--

CREATE TABLE `contact_vendor` (
  `id` int(11) NOT NULL,
  `nama_vendor` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `contact_vendor`
--

INSERT INTO `contact_vendor` (`id`, `nama_vendor`, `contact`, `keterangan`) VALUES
(1, 'First Media Surabaya', 'AKRSL CS :\r\n(031) 2950 700	\r\n(031) 1500595 Surabaya\r\nID Pelanggan - 10089450	', 'Kantor via bu Indri (Maloa Finance)\r\nRumah via Suci Purchasing\r\n\r\nCustomer.Service@linknet.co.id'),
(2, 'Lintasarta AKR Surabaya Land', 'Team Support : \r\n021-7503456 / 0857 7639 6167\r\nLintas Sby\r\n(031) 5679456\r\n\r\nEmail : Support Lintasarta \r\nanc-sby@lintasarta.co.id\r\nsupport@lintasarta.co.id\r\n\r\n', 'Aktif 29 Januari 2018\r\n10Mbps\r\nDedicated'),
(3, 'HP Android Surabaya', '1. User Fangnie  / fangnie.akrland@gmail.com/surabaya123\r\n2. User Cicillia Dolvina / info.akrsurabaya@gmail.com/rayagubeng44\r\n3. User Yunita Prabawati /\r\n4. Old HP Fangnie / it.akrland@gmail.com = itakrland123\r\n5. User HRGA / hrga.akrland@gmail.com / sura', '1. User Fangnie  / fangnie.akrland@gmail.com/surabaya123\r\n2. User Cicillia Dolvina / info.akrsurabaya@gmail.com/rayagubeng44\r\n3. User Yunita Prabawati /\r\n4. Old HP Fangnie / it.akrland@gmail.com = itakrland123\r\n5. User HRGA / hrga.akrland@gmail.com / sura'),
(4, 'Icon Net', 'Firmanda : 082225603992\r\nMbak Ayu : 0816659550\r\nNOC : 08113506677\r\nEmail : cs@iconpln.co.id \r\nfirmanda.kholiq@iconpln.co.id\r\n\r\n', 'Internet Gresik\r\nDedicated 10:10\r\n/29'),
(5, 'Fibernet', 'Khofian : 085730878966\r\nAndy Kusuma : 081230809600\r\n\r\n', 'Internet Gresik\r\nBroadband : 10:5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_karyawan`
--

CREATE TABLE `data_karyawan` (
  `id` int(11) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `tempat_tanggal_lahir` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `alamat_ktp` varchar(255) NOT NULL,
  `alamat_domisili` varchar(255) NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `nama_keluarga` varchar(255) NOT NULL,
  `tlp_keluarga` varchar(255) NOT NULL,
  `status_karyawan` varchar(255) NOT NULL,
  `npwp_karyawan` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `extension`
--

CREATE TABLE `extension` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `extension` varchar(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `Jenis` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `extension`
--

INSERT INTO `extension` (`id`, `nama`, `extension`, `email`, `Jenis`, `ip_address`) VALUES
(2, 'Security', '333', '', 'IP_Phone', ''),
(3, 'Pantry Lantai 3', '376', '', 'Analog', ''),
(4, 'Ruang Meeting Besar Lt.3', '374', '', 'Analog', ''),
(5, 'Ruang Meeting Kecil Lt3', '375', '', 'Analog', ''),
(6, 'Tiffany Putri', '345', 'tiffany.putri@akrland.com', 'Analog', ''),
(7, 'Suci Ramadhania', '301', 'suci.ramadhania@akrland.com', 'Analog', ''),
(8, 'Monica', '342', 'monica@akrland.com', 'IP_Phone', ''),
(9, 'Anis Maslahan', '311', 'anis.maslahan@akrland.com', 'IP_Phone', ''),
(10, 'Stevanus Andra', '352', 'ferdian.andra@akrland.com', 'IP_Phone', ''),
(11, 'Maloa Dame', '335', 'maloa.dame@akrland.com', 'IP_Phone', ''),
(12, 'Fang Nie', '308', 'fang.nie@akrland.com', 'Analog', ''),
(13, 'Fiqih Suci', '351', 'suci@akrland.com', 'Analog', ''),
(14, 'Frengky Bayu', '357', 'frengky.bayu@akrland.com', 'Analog', ''),
(15, 'Angeline', '370', 'angeline@akrland.com', 'Analog', ''),
(16, 'Desy Budimulyati', '355', 'desy.budimulyati@akrland.com', 'IP_Phone', ''),
(17, 'Nindya', '346', 'nindia.putri@akrland.com', 'IP_Phone', ''),
(18, 'Dwi Prasetyo', '348', 'dwi.prasetyo@akrland.com', 'Analog', ''),
(19, 'Sehat Triprasetyono', '350', 'sehat.triprasetyono@akrland.com', 'IP_Phone', ''),
(20, 'I Ketut Suparta', '339', 'ketut.suparta@gkicmanado.com', 'IP_Phone', ''),
(21, 'Herman ', '344', 'herman.sasongko@akrland.com', 'Analog', ''),
(22, 'Adi Pranoto', '304', 'adi.pranoto@akrland.com', 'Analog', ''),
(23, 'Indriyanti', '341', 'indriyanti@akrland.com', 'IP_Phone', ''),
(24, 'Didik Hertanto', '', 'didik.hertanto@akrland.com', '', ''),
(25, 'Sales Lantai 2', '364', 'sales.gemcity@akrland.com', 'Analog', ''),
(26, 'Sales Lantai 2', '363', 'sales.gemcity@akrland.com', 'Analog', ''),
(27, 'Sales Lantai 2', '362', 'sales.gemcity@akrland.com', 'Analog', ''),
(28, 'Sales Lantai 2 Ruang Ex Marcom', '310', 'sales.gemcity@akrland.com', 'Analog', ''),
(29, 'Sales Lantai 2 Ruang Ex Marcom', '347', 'sales.gemcity@akrland.com', 'Analog', ''),
(31, 'Willy Brata', '373', 'willy.brata@akrland.com', 'Analog', ''),
(32, 'Michael Brian', '315', 'michael.brian@akrland.com', 'IP_Phone', ''),
(33, 'Firman Ariadi', '366', 'firman.ariadi@akrland.com', 'Analog', ''),
(34, 'Margaretha Wenny', '353', 'margaretha.wenny@akrland.com', 'IP_Phone', ''),
(35, 'Denny Andrianto', '361', 'denny.andrianto@akrland.com', 'IP_Phone', ''),
(36, 'William Hansen', '360', 'william.hansen@akrland.com', 'Analog', ''),
(37, 'Retno Dewantoro', '320', 'dewantoro@akrland.com', 'Analog', ''),
(38, 'Daniswara', '387', 'daniswara@akrland.com', 'IP_Phone', ''),
(39, 'Wahyu Erga', '358', 'wahyu.erga@akrland.com', 'IP_Phone', ''),
(40, 'Ronny Mongkar', '325', 'ronny.mongkar@akrland.com', 'IP_Phone', ''),
(41, 'Ivanna Tandiono', '321', 'ivanna.tandiono@akrland.com', 'Analog', ''),
(42, 'Recepsionis', '300', '', 'Analog', ''),
(44, 'Afanudin', '386', 'afannudin@akrland.com', 'Analog', ''),
(45, 'Willem Richard', '319', 'willem.mozes@akrland.com', 'Analog', ''),
(46, 'Wendy Franata ', '305', 'wendy.franata@akrland.com', 'IP_Phone', ''),
(47, 'Ariawira', NULL, 'ariawira@akrland.com', 'IP_Phone', ''),
(48, 'Helen Tandya', '329', 'helen.tandya@akrland.com', 'Analog', ''),
(49, 'Erwin Tirta', NULL, 'erwin.tirta@akrland.com', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `helpdesk`
--

CREATE TABLE `helpdesk` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_ext` varchar(50) DEFAULT NULL,
  `by_support` varchar(255) NOT NULL,
  `trouble_description` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `helpdesk`
--

INSERT INTO `helpdesk` (`id`, `nama`, `email`, `phone_ext`, `by_support`, `trouble_description`, `photo`, `date`, `status`) VALUES
(2, 'Daniswara', '', '', 'IT - Anis Maslahan', 'Aplikasi Adobe Cloud Error', '', '2023-04-18 09:00:00', 'Open'),
(3, 'Afanuddin', '', '', 'IT - Anis Maslahan', 'Tidak bisa print ke server printer', '', '2023-04-18 10:00:00', 'Close');

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_ifca`
--

CREATE TABLE `id_ifca` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username_ifca` varchar(255) NOT NULL,
  `pass_ifca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `id_ifca`
--

INSERT INTO `id_ifca` (`id`, `nama`, `username_ifca`, `pass_ifca`) VALUES
(1, 'ANIS', 'ANIS', 'ANIS'),
(2, 'BETLEST', 'BETLEST', 'IFCA'),
(3, 'WENDYF', 'WENDYF', ''),
(4, 'DANISWARA', 'DANISWARA', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris_it`
--

CREATE TABLE `inventaris_it` (
  `id` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `departement` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `mac_address` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `domain` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jenis_perangkat` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `monitor` varchar(255) NOT NULL,
  `processor` varchar(255) NOT NULL,
  `memory_ram` varchar(255) NOT NULL,
  `hardisk` varchar(255) NOT NULL,
  `operating_system` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `software` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `hardware` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `inventaris_it`
--

INSERT INTO `inventaris_it` (`id`, `nama_user`, `departement`, `ip_address`, `mac_address`, `hostname`, `user_pass`, `domain`, `email`, `jenis_perangkat`, `brand`, `monitor`, `processor`, `memory_ram`, `hardisk`, `operating_system`, `serial_number`, `software`, `status`, `hardware`, `lokasi`) VALUES
(1, 'Anis Maslahan', 'IT', '192.168.101.188', '-', 'AKRSLCIT', 'Admin', '-', 'anis.maslahan@akrland.com', 'LAPTOP', 'Lenovo Y40', '-', 'Core I5', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'office 2016: GP3DK-N2WDR-8C7VK-4RW4G-3V67X', 'Office Home & Business 2016 FPP', 'Active', '', 'Surabaya'),
(2, 'Daniswara Team', 'MARCOM', '', '', 'MacBook-Pro', '', '', 'daniswara@akrland.com', 'LAPTOP', 'Macbook Pro 2016', '', 'Core I7', '16 GB', '500 GB SSD', '', '', 'Ms Office Home Student 2016', 'Active', '', 'Surabaya'),
(3, 'Tiffany Putri', 'PROJECT', '', '', 'MacBook-Air', '', '', 'tiffany.putri@akrland.com', 'LAPTOP', 'MacBook Air 2017', '', 'Core I5', '8 GB', '256 GB SSD', '', '', 'Ms Office Home Student 2016', 'Active', '', 'Surabaya'),
(4, 'PC Meeting ', '', '192.168.101.150', '', 'AKRSLC150', '', '', '', 'PC', 'PC', '', 'Core I7', '8 GB', '1 TB DISK', 'Windows 10 Pro', 'Windows : 9GWJV-YBGWX-3JP7V-D73JJ-FJ2B4 VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home Business 2016 FPP (QRRMN-HMW68-FBRQB-X6XMT-PDKVX', 'Ms Office Home Business 2016', 'Active', '', 'Surabaya'),
(5, 'Ex Monica', 'PURCHASING', '192.168.101.151', '', '', '', '', '', 'PC', 'PC', '', 'Intel Pentium Dual Core G2020', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'windows : 4D93M-487Q4-2JRBD-QYH8G-4WGV7\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 (FPP- YXGNJ-H9QXF-GJ9VT-G4MR7-M4DTQ)', 'Ms Office Home Business 2013', 'Non Active', '', 'Surabaya'),
(6, 'Dewantoro', 'SAD', '192.168.101.151', '', '', '', '', 'dewantoro@akrland.com', 'PC', 'PC', 'Samsung 17&#34;', 'Intel Dual Core G2020', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : BTR9J-8PG68-844HR-WRQTH-GGDGB\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP-CVQ7K-98NHF-492F4-XFM28-W4Y23', 'Office Home & Business 2013 FPP', 'Active', 'Scanner Lide110, LX300', 'Surabaya'),
(7, 'Fiqih Suci', 'FINANCE', '192.168.101.153', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'BRHYC-Y6HC9-X9RPD-6MRDR-JJJ2C\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP-TNCYK-9XJCV-WM8KQ-7DR64-HQTKD', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(8, 'PC Printer L1300', '', '192.168.101.154', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Dual Core G2020', '6 GB', '500 GB DISK', 'Windows 10 Pro', '', '', 'Active', '', 'Surabaya'),
(9, 'Denny Andrianto', 'SALES', '192.168.101.155', '', '', '', '', 'denny.andrianto@akrland.com', 'LAPTOP', 'Lenovo G480', '', 'Intel Core I5', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'C2W9C-332KF-9MPYX-978MJ-XGXVB\r\nWIN10: VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nHome & Business 2016 FPP / \r\nVBMQH-TGNYH-H84DV-D7FQX-RM6BK', 'Ms Office Home Business 2016', 'Active', '', 'Surabaya'),
(10, 'Ex Willy Brata', 'SALES', '192.168.101.156', '', '', '', '', '', 'LAPTOP', 'LENOVO  G400S', '', 'Core I5', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : XC344-H6TRT-DYMRY-4FKG2-3B26M\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home Businnes 2013 (W4C3G-N93XH-VY26D-G7GGM-F889D)', 'Ms Office Home Business 2013', 'Non Active', '', 'Surabaya'),
(11, 'AKRSLC 157', '', '192.168.101.157', '', '', '', '', '', 'LAPTOP', 'LENOVO S410P', '', 'Core I5', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : 2MCF7-J9TDJ-PC9P7-XHHFR-GWJMJ\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP (Q6NGK-XV6PV-P6DP8-TTHF4-8B2XD)', 'Ms Office Home Business 2013', 'Non Active', '', 'Surabaya'),
(12, 'Sales GemCity Lokasi Gresik', 'SALES', '192.168.20.1/24', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Update 10 : VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice 2013 : H6NP8-CDJ3J-MHWFY-XXGJV-HXJC3', 'Ms Office Home Business 2013', 'Active', '', 'Gresik'),
(13, 'Indriyanti', 'HRGA', '192.168.101.160', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core i3-3240', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : FDPY6-XYY67-M7RK3-FWTKX-CFRMT\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice :  DGJ9D', 'Office Home & Business 2013 FPP,Att', 'Active', 'Webcam Logitect', 'Surabaya'),
(14, 'Frengky Bayu', 'FINANCE', '192.168.101.161', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : BKCVR-HPH3G-993B2-FWYXP-3TRV8\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T.\r\nOffice : M96KD', 'Office Home & Business 2013 FPP', 'Active', 'Microphone USB', 'Surabaya'),
(15, 'Ex Erwin Tirta', 'PROJECT', '192.168.101.162', '', '', '', '', '', 'LAPTOP', 'ASUS A451', '', 'Core I5', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice = 2QPDW-B6KFB-QRHTT-KQ69P-9JK77', 'Office Home & Business 2010 FPP', 'Active', '', 'Surabaya'),
(16, 'Sales GemCity Lokasi Surabaya', 'SALES', '192.168.101.163', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Update 10 : VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice 2010  : W8DH9-7M6JB-XCKDX-KQTRY-HG9KT', 'Microsoft Office Home & Business 2010', 'Active', '', 'Surabaya'),
(17, 'Dwi Prasetyo', 'LEGAL', '192.168.101.164', '', '', '', '', '', 'LAPTOP', 'Lenovo Ideapad320', '', 'Core I5', '12 GB', '1 TB DISK', 'Windows 10 Pro', 'FN9R2-CQWJK-MMV48-MWY39-H6DGR\r\nOffice 2016: H2KMM-NTF7M-XGRG4-9TRFC-HH67X', 'Home&Business 2016 FPP', 'Active', '', 'Surabaya'),
(18, 'Adi Pranoto', 'HRGA', '192.168.101.165', '', '', '', '', 'adi.pranoto@akrland.com', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : GK3WQ-JXDVV-DWBKC-WXB7H-3F9C9\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\n\r\nOffice Home Bussiness 2010 (PM8YV-9P3GM-6GCC6-X9HKH-VD3XY)', 'Office Home Bussiness 2010', 'Active', 'Printer,Webcam Logitect', 'Surabaya'),
(19, 'Sales GemCity Lokasi Surabaya (Rusak)', 'SALES', '192.168.101.166', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'Windows : V6D4K-4W77G-BVJ98-QVKW7-386YP\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\n\r\n', '', 'Rusak Mainboard', '', 'Surabaya'),
(20, 'Recepsionis', 'HRGA', '192.168.101.167', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'Windows : C238K-RWFVV-CX9HK-4B6M6-FYVXV\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\n', '', 'Rusak Mainboard', '', 'Surabaya'),
(21, 'Surveyor', 'PROJECT', '192.168.101.168', '', '', '', '', '', 'LAPTOP', 'ASUS X451C', '', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'Windows : 24CMC-3F2QD-R7XRW-FWPX9-BX29R\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T', '', 'Rusak Mainboard', '', 'Gresik'),
(22, 'Willem Richard', 'ESTATE', '192.168.101.169', '', '', '', '', 'willem.mozes@akrland.com', 'LAPTOP', 'ASUS X451C', '', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows 7 Pro : PWKVW-JFMJJ-44TRV-T337F-R6JJT\r\nOffice 2013 : NKFRJ-DVKM8-XC864-CHF2V-T28C3', 'Ms Office Home Business 2013', 'Active', '', 'Surabaya'),
(23, 'Nindia Putri', 'LEGAL', '192.168.101.170', '', '', '', '', 'nindia.putri@akrland.com', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : RDQMD-3WVBP-B8C3R-PVM87-6JJ74\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : FJM23', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(24, 'Tiffany Putri', 'PROJECT', '192.168.101.171', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Core I5', '12 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP \r\nJ7QHF-HMNBV-XBPQW-6CV2J- QC8C3\r\n\r\nAutocad LT 2015 556-93726471 / 057G1', 'Office Home & Business 2013 FPP, Autocad LT 2015', 'Active', 'Microphone USB', 'Surabaya'),
(25, 'Ex. Jimmy Sugiarto', '', '192.168.101.172', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows :VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : RGXVP-BNMDF-GQK77-J2FFH-YY2XD', 'Office Home & Business 2013 FPP', 'Non Active', '', 'Surabaya'),
(26, 'Hardani', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '12 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : GG9QV-V777T-GW4QV-BYGMW-78KRT\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : 2GWC3\r\n\r\nAutocad LT 2016 559-90771947 / 057H1', 'Office Home & Business 2013 FPP - Autocad LT 2016', 'Active', '', 'Gresik'),
(27, 'Margaretha Wenny', 'SALES', '192.168.101.174', '', '', '', '', 'margaretha.wenny@akrland.com', 'LAPTOP', 'ASUS A451L', '', 'Intel Core I5', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : PTFMV-9BTTV-2TPGM-HPX4H-HMQTF\r\nOffice : DBPPX-PNFQF-PV2T7-J7386-C9VGQ', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(28, 'Maria Katarina', 'PURCHASING', '192.168.101.175', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Windows : BT9W6-686WR-Q9CHC-9XTVR-FBCDT\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : 4CW9D', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(29, 'William Hansen', 'SAD', '192.168.101.176', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB DISK', 'Windows 10 Pro', '', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(30, 'Maloa Dame', 'FINANCE', '192.168.101.177', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '4 GB ', '500 GB SSD', 'Windows 10 Pro', 'Windows : TVRVY-VWJ7M-MMDK8-RX2HF-PTVJF\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : YR96Q', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(31, 'Irhantoro Adi', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '12 GB', '500 GB DISK', 'Windows 10 Pro', 'windows : VY4CY-4Y483-M9WYT-M298W-G6CRD\r\nOffice Home & Business 2013 FPP :  NDTTW-27FK7-43JTK-8W433-7T7GQ', 'Office Home & Business 2013 FPP - Autocad LT 2023 Subsribe', 'Active', '', 'Gresik'),
(32, 'Sales GemCity Lokasi Surabaya', 'SALES', '192.168.101.179', '', '', '', '', 'sales.gemcity@akrland.com', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : C7G8P-N7M9Q-GP9GB-GXD3M-7MFP3', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(33, 'Suryadani', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : CMQWQ-XYTR4-XVQQB-GKQRB-4HM89\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home&Buss 2013: 6P9FP-N6PCQ-Q4WTB-G96TY-2PK6Q\r\n\r\nAutocad LT 2015 545-44145027 / 057G1', 'Ms Office Home Business 2013 - Autocad LT 2015 ', 'Active', '', 'Gresik'),
(34, 'Zaidul Fanani', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'LENOVO  M73', 'Lenovo 19&#34;', 'Intel Core I3', '12 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows 10 \r\nOLP VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP :  NPTFP-687QJ-9CT4B-F73P7-B7RP3', 'Office Home & Business 2013 FPP - Autocad LT 2023 Subsribe', 'Active', '', 'Gresik'),
(35, 'Fang Ni', 'FINANCE', '192.168.101.182', '', '', '', '', '', 'PC', 'LENOVO  M73', 'Samsung 19&#34;', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'Windows : 237XB-GDJ7B-MV8MH-98QJM-24367\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : \r\nD6VND-T74HM-TVRDK-8TYXT-VCB23', 'Office Home & Business 2013 FPP', 'Active', '', 'Surabaya'),
(36, 'Ex OSG William', 'SALES', '192.168.101.183', '', '', '', '', '', 'PC', 'LENOVO  M73', 'Lenovo 19&#34;', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'windows : 237XB-GDJ7B-MV8MH-98QJM-24367\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP (367GQ-NC4WW-W2XYQ-4237F-367GQ)', 'Office Home & Business 2013 FPP', 'Non Active', '', 'Surabaya'),
(37, 'PC Storage Gresik', 'SALES', '192.168.30.5', '', '', '', '', '', 'PC', 'LENOVO  M73', 'Lenovo 19&#34;', 'Intel Core I3', '8 GB', '1 TB DISK', 'Windows 10 Pro', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP : NQKK6-9QCTY-RM87H-492W4-YR96Q', 'Office Home & Business 2013 FPP', 'Active', '', 'Gresik'),
(38, 'Suryawan', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'LENOVO  M73', 'Lenovo 19&#34;', 'Intel Core I3', '16 GB', '1 TB DISK', 'Windows 10 Pro', 'Windows 7 OEM : 7VYF8-FXGJP-3FJ4F-QFXWH-HWCYV\r\nOffice Home & Business 2016 : HWYXN-MH29R-2MQHW-WGDKP-76DHX', 'Office Home & Business 2016 - Autocad LT 2015 ', 'Active', 'Webcam Logitect', 'Gresik'),
(39, 'Ferdian Andra', 'FINANCE', '192.168.101.186', '', '', '', '', '', 'PC', 'Lenovo', 'Lenovo 19&#34;', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'Windows : 237XB-GDJ7B-MV8MH-98QJM-24367\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2016 FPP : 9D739', 'Office Home & Business 2016 FPP', 'Active', '', 'Surabaya'),
(40, 'Sales GemCity Lokasi Gresik', 'SALES', '192.168.101.187', '', '', '', '', '', 'PC', 'Lenovo', 'Lenovo 19&#34;', 'Intel Core I3', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'Windows : 237XB-GDJ7B-MV8MH-98QJM-24367\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\n\r\nOffice Home & Business 2016 FPP\r\n88GBK', 'Office Home & Business 2016 FPP', 'Rusak Mainboard', '', 'Gresik'),
(41, 'Desy Budimulyati', 'FINANCE', '192.168.101.189', '', '', '', '', '', 'LAPTOP', ' Lenovo E31-80', '', 'Core I5', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2016 FPP : JDQND-F6DF9-M3KT3-DJV8R-TVJYK', 'Office Home & Business 2016 FPP', 'Active', '', 'Surabaya'),
(42, 'Ivanna Tandiono', 'MARCOM', '192.168.101.190', '', '', '', '', '', 'PC', 'Lenovo', 'Samsung 19&#34;', 'Core I7', '16 GB', '1 TB SSD', 'Windows 10 Pro', 'Windows : 237XB-GDJ7B-MV8MH-98QJM-24367\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2013 FPP (4H8QN-M983D-VQ9D2-QKJ7C-8W89D)', 'Office Home & Business 2013 FPP - Creative Cloud', 'Active', '', 'Surabaya'),
(43, 'Monica', 'PURCHASING', '192.168.101.191', '', '', '', '', '', 'PC', 'LENOVO  M73', 'Samsung 19&#34;', 'Core I5', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice 2016 : ND4VD-66YT2-B22CQ-TF9QK-9HJYK', 'Office Home & Business 2016 FPP', 'Active', 'Microphone USB', 'Surabaya'),
(44, 'Angeline', 'FINANCE', '192.168.101.192', '', '', '', '', '', 'PC', 'Lenovo', 'Samsung 19&#34;', 'Intel Core I3', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows : CMWWF-BYF7B-2MM3V-P2WGR-974WG\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2016 FPP : 369VX', 'Office Home & Business 2016 FPP', 'Active', '', 'Surabaya'),
(45, 'Afannuddin', 'MARCOM', '192.168.101.193', '', '', '', '', 'afannudin@akrland.com', 'PC', 'Dell', 'Dell 22&#34;', 'Core I7', '16 GB', '1 TB SSD', 'Windows 10 Pro', 'Windows10: VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2016 FPP : 4M3NW-83QMR-JDFFK-CT22F-369VX\r\n', 'Office Home & Business 2016 FPP - Creative Cloud', 'Active', '', 'Surabaya'),
(46, 'Herman Sasongko', 'HRGA', '192.168.101.194', '', '', '', '', 'herman.sasongko@akrland.com', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows :CRJ8H-MYXVF-HV7K3-64MYR-FVKMB\r\nOffice Home & Business 2010 FPP : XHXWX-8BVYY-9RQP7-3Q6BK-WDHVX', 'Office Home & Business 2010 FPP', 'Active', '', 'Surabaya'),
(47, 'Didik Hertanto', 'PROJECT', '192.168.101.195', '', '', '', '', 'didik.hertanto@akrland.com', 'LAPTOP', 'Lenovo E540', '', 'Core I5', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows: B3XVG-8NYKQ-72KFT-YP273-4GDPP\r\nOffice Home & Business 2016 FPP : NFMH7-2XQGV-8GYTJ-JKTDQ-G83HX', 'Office Home & Business 2016 FPP', 'Active', '', 'Gresik'),
(48, 'Ex Fikri Alam', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'Lenovo Thinkcentre M700', 'Samsung 19&#34;', 'Core I5', '16 GB', '1 TB DISK', 'Windows 10 Pro', 'Windows10 : VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOFFICE 2016 : 7NQVT-PH7KG-R333F-8HD2B-7MH39', 'Office Home & Business 2016 - Autocad LT 2023 Subsribe', 'Non Active', '', 'Gresik'),
(49, 'Sales GemCity Lokasi Surabaya', 'SALES', '192.168.101.197', '', '', '', '', '', 'PC', 'PC', 'Samsung 19&#34;', 'Intel Core I3', '6 GB', '500 GB DISK', 'Windows 10 Pro', 'Windows10: VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nOffice Home & Business 2016 : DDJ83-QCNTJ-DPV6H-YF3JX-C7JYK', 'Office Home & Business 2016', 'Active', '', 'Surabaya'),
(50, 'Ihsanul Fauzi', 'PROJECT', '192.168.30.1/24', '', '', '', '', '', 'PC', 'Lenovo M710T', 'Lenovo 19&#34;', 'Core I5', '16 GB', '1 TB DISK', 'Windows 10 Pro', 'DJYJN-GKPMW-JPY9C-6Q2RR-MWRC4\r\nOffice Home & Business 2016 FPP : G6Y2B-NPT8Q-BM9MT-4BGG3-9D739', 'Office Home & Business 2016 FPP - Autocad 2023 Subsribe', 'Active', 'Webcam Logitect', 'Gresik'),
(51, 'Wahyu Erga', 'MARCOM', '192.168.101.199', '', '', '', '', 'wahyu.erga@akrland.com', 'PC', 'Lenovo M710T', 'Lenovo 19&#34;', 'Core I5', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'GN933-2D38R-DFGQF-WWBG3-B98XF\r\nOffice Home & Business 2016 FPP : QKNWX-XW74C-WRQD9-CBJ8Y-JK8YK', 'Office Home & Business 2016 FPP', 'Active', '', 'Surabaya'),
(52, 'Betlest Surenggono', 'PROJECT', '', '', '', '', '', '', 'LAPTOP', 'Lenovo Ideapad320', '', 'Core I5', '12 GB', '1 TB DISK', 'Windows 10 Pro', 'Windows10 : TH6FM-RMNGP-WMVM4-V849X-KQBP4\r\nOffice Home & Business 2016 FPP : 297NH-CWRGV-8KWM7-JWM9K-8QKVX', 'Office Home & Business 2016 FPP - Ms Project 2019 FPP', 'Active', '', 'Surabaya'),
(53, 'Dimas Daniswara', 'MARCOM', '192.168.101.201', '', '', '', '', 'daniswara@akrland.com', 'PC', 'PC', 'Samsung 19&#34;', 'Core I7', '16 GB', '1 TB SSD', 'Windows 10 Pro', 'Windows : N4X6B-FG9YQ-CD36J-V66RC-DDBP4\r\nOffice Home & Business 2016 FPP : J3NPQ-826TQ-J6MD9-GXT3T-6F4D9', 'Office Home & Business 2016 FPP - Adobe Creative', 'Active', '', 'Surabaya'),
(54, 'Sehat Triprasetyono (Exchange)', 'LEGAL', '192.168.101.202', '', '', '', '', '', 'LAPTOP', 'Asus A450L', '', 'Core I5', '8 GB', '500 GB DISK', 'Windows 10 Pro', 'V82HB-KC23X-3M9GQ-MHFTW-VXBG9\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T\r\n\r\nOffice Home & Business 2010 FPP : V3493-HWP7W-H22XD-W9F4B-6KPB8', 'Office Home & Business 2010 FPP', 'Non Active', '', 'Surabaya'),
(55, 'Ronny Eduard Mongkar', 'HEAD REGION', '192.168.101.203', '', '', '', '', 'ronny.mongkar@akrland.com', 'LAPTOP', 'Lenovo - Ideapad3 14ALC6', '', 'Ryzen 3500', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Key Office : WKP9C-PY676-QWR2Q-WVF47-XJ3WZ', 'Office Home and Business 2019 FPP', 'Active', 'Numerik Keyboard', 'Surabaya'),
(56, 'Helen Tandya', 'PROJECT', '192.168.101.204', '', '', '', '', 'helen.tandya@akrland.com', 'LAPTOP', 'Lenovo IdeaPad3 14ALC6', '', 'Ryzen 5500', '8 GB', '500 GB SSD', 'Windows 11 Pro', '', 'Office Home Student 2019 - Autocad LT 2023 Subsribe', 'Active', 'NumerikPad', 'Surabaya'),
(57, 'Ariawira', 'PROJECT', '192.168.101.205', '', '', '', '', 'ariawira@akrland.com', 'LAPTOP', 'Lenovo IdeaPad3 14ALC6', '', 'AMD Ryzen 5500', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Autocad 2016 LT  559-90771749 / 057H1\r\nOffice Home Business 2013\r\nDBPPX-PNFQF-PV2T7-J7386-C9VGQ', 'Office Home Business 2013 (ex 168 Laptop), Autocad LT 2022', 'Active', '', 'Gresik'),
(58, 'Firman Ariadi', 'MARCOM', '192.168.101.206', '', '', 'Administrator / Alif', '', 'firman.ariadi@akrland.com', 'LAPTOP', 'HP 14S', '', 'Ryzen 6500', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Office: akrslc206@outlook.com/@kr-D0m41n123', 'Office Home & Business 2021 FPP', 'Active', '', 'Surabaya'),
(59, 'Ex Eka Alim', 'SALES', '192.168.101.158', '', '', '', '', '', 'LAPTOP', 'Lenovo IdeaPad S410P', '', 'Core I5', '4 GB ', '500 GB DISK', 'Windows 10 Pro', 'WIN10: VK7JG-NPHTM-C97JM-9MPGT-3V66T\r\nWIN7 : MFC6V-HPWFK-KFXQY-GK9P9-26D84\r\n', '', 'Wifi Rusak', '', 'Surabaya'),
(60, 'Michael Brian', 'SALES', '192.168.101.207', '', 'AKRSLC207', 'Bios : F1 tanpa FN | Boot Menu F12', '', 'michael.brian@akrland.com', 'LAPTOP', 'Lenovo K14', '', 'Intel Core I5 Gen 11', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Account: akrslc207@outlook.com/@kr-D0m41n123\r\nOffice Home Bussiness 2013\r\nQ2DWN-94MXT-KGY2V-7DDMC-Q3TKD', 'Office Home & Business 2013 FPP (ex PC Sales 166)', 'Active', '', 'Surabaya'),
(61, 'Sehat Triprasetyono', 'LEGAL', '192.168.101.208', '', '', 'Bios : F1 tanpa FN | Boot Menu F12', '', 'sehat.triprasetyono@akrland.com', 'LAPTOP', 'Lenovo K14', '', 'Intel Core I5 Gen 11', '8 GB', '500 GB SSD', 'Windows 11 Home Single', 'Account: akrslc207@outlook.com/@kr-D0m41n123\r\n\r\nOffice Home & Business 2013 FPP : \r\nXWWHV-W7NWV-VWHQH-8XR2W-6MQTQ', 'Office Home&Business 2013 FPP (ex reception 167)', 'Active', '', 'Surabaya'),
(62, 'Ex Willy Brata', 'SALES', '192.168.101.209', '', 'AKRSLC209', 'Bios : F1 tanpa FN | Boot Menu F12', '', '', 'LAPTOP', 'Lenovo K14', '', 'Intel Core I5 Gen 11', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Account: akrslc-208@outlook.com/@kr-D0m41n123\r\nOffice Home & Business 2013 FPP \r\n(TNCYK-9XJCV-WM8KQ-7DR64-HQTKD)', 'Office Home & Business 2013 FPP (ex laptop 158)', 'Active', '', 'Surabaya'),
(63, 'Erwin Tirta', 'PROJECT', '192.168.101.158', '', '', '', '', 'erwin.tirta@akrland.com', 'LAPTOP', 'Lenovo IdeaPad 14 ITL', '', 'Core I3 Gen11', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Account: akrslc158@outlook.com/@kr-D0m41n123\r\n\r\nOffice 2021 : office.com\r\nMR2KM-JCPQ4-9FXDF-QKRRM-XHY9Z', 'Office Home adn Bussiness 2021 FPP', 'Active', 'NumerikPad', 'Surabaya'),
(64, 'Indriyanti Laptop', 'HRGA', '192.168.101.168', '', '', '', '', 'indriyanti@akrland.com', 'LAPTOP', 'Lenovo IdeaPad 14IAU', '', 'Core I5 Gen 12', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'Account: akrslc168@outlook.com/@kr-D0m41n123\r\n\r\nOFFICE\r\nPQ3RR-M4FTF-M2YT4-PFPJQ-6GHJZ', 'Office Home adn Bussiness 2021 FPP', 'Active', '', 'Surabaya'),
(65, 'Muhammad Hudan', 'PROJECT', '192.168.101.210', '', 'AKRSLC210', '', '', '', 'LAPTOP', 'Lenovo IdeaPad3 14IAU7', '', 'Core I5 Gen 12', '8 GB', '500 GB SSD', 'Windows 10 Pro', 'office.com : \r\nakrslc210@outlook.com/@kr-D0m41n123\r\nOffice : GDYVY-7YRHQ-34KQG-T2QDM-M66GZ', 'Office Home adn Bussiness 2021 FPP', 'Active', '', 'Gresik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `network`
--

CREATE TABLE `network` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `spesifikasi` varchar(255) NOT NULL,
  `configurasi` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `network`
--

INSERT INTO `network` (`id`, `type`, `ipaddress`, `spesifikasi`, `configurasi`, `user_password`, `attachment`, `lokasi`, `hostname`) VALUES
(1, 'Wireless', '192.168.30.20', 'AP TPLink', '192.168.30.20 - Wifi Sales\r\n192.168.20.20 - Wifi Project\r\n192.168.40.10 - Wifi Guest/HP', '', '', 'Gresik', 'AKRLAND PROJECT'),
(2, 'Router', '192.168.101.215', 'AP Router TPLink', 'DHCP\r\nChanel 7', '', '', 'Surabaya', 'AKRSLC STAFF'),
(3, 'Wireless', '192.168.103.1/24', 'Ubiquity AP Atas Purchasing', 'User : it Pass : @kr-wifi123 SSID : AKRLAND GUEST/freewifi SSID : AKRLAND STAFF/ signature\r\n\r\nUbiquity AP : https://unifi.akrland.com:8443/manage/account/login\r\n', '', '', 'Surabaya Lantai 3 Atas Purchasing', 'AKRLAND STAFF LT3'),
(4, 'Wireless', '192168104.2', '', '', 'admin/arifin@akr', '', 'Surabaya', 'AKRSLC STAFF ONLY'),
(5, 'Router', '192.168.102.1/24', 'Router Mikrotik RB750', 'hotspot 192.168.102.0/24 SSID : STAFF ONLY Lt.1 Security pass : signature', 'it/@kr-router123', '', 'Surabaya Atas POS Security', 'STAFF ONLY Lt.1 Security'),
(6, 'Wireless', '192.168.104.3', 'Engenius EAP 350', 'STAFF ONLY / signature', 'admin/ @kr-wifi123', '', 'Surabaya Ruang Sales', 'AKRLAND STAFF ( Lt.2)'),
(7, 'Wireless', '192.168.105.3', 'Engenius EAP 350', 'SSID : AKRLAND Lobby Lt.3 - Pass : signature', 'admin/@kr-wifi123', '', 'Surabaya Lobby Lt.3', 'AKRLAND Lobby Lantai 3'),
(8, 'Wireless', '192.168.105.2', 'Engenius EAP 350', 'SSID : AKRSLC ENGENIUS) / signature', 'admin/@kr-wifi123', '', 'Surabaya Lantai 3 R.IT', 'AKRSLC ENGENIUS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `printer`
--

CREATE TABLE `printer` (
  `id` int(11) NOT NULL,
  `merek_printer` varchar(255) NOT NULL,
  `pengguna_printer` varchar(255) NOT NULL,
  `keterangan` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `printer`
--

INSERT INTO `printer` (`id`, `merek_printer`, `pengguna_printer`, `keterangan`) VALUES
(1, 'Epson L210', 'Fiqih Suci - Kasir', 'SN : RAEK163889\r\nFirmware : SM30DA\r\nQP100C05'),
(2, 'Epson 350', 'Nindia - Legal', 'SN : VGEK029142\r\nFirmware : RM07EA\r\nQP110C05'),
(3, 'Epson L360', 'Marcom', 'SN : RAEK1585529\r\nFirmware : SM30DA\r\nQP100C05'),
(4, 'Epson L1300 A3', 'Printer Bersama', NULL),
(5, 'Epson L3110', 'Printer Sales GemCity Surabaya', ''),
(6, 'Epson L360', 'Printer Sales GemCity Gresik', NULL),
(7, 'Epson L210', 'Head Of Region', NULL),
(8, 'Epson 350', 'Adi Pranoto - GA', NULL),
(9, 'Epson L210', 'SAD', 'Network : 192.168.101.15'),
(10, 'Epson 350', 'Project Gresik', 'Network : 192.168.30.2'),
(11, 'Epson Multi 1455 A3 Series', 'Project Gresik', 'Network : 192.168.30.4\r\n\r\nFirmware Version :\r\nAI12JC 24.08\r\nRoot Certificate Version :\r\n02.00\r\nSerial Number :\r\nX2SK040267\r\nWi-Fi/Network MAC Address :\r\n00:00:48:D4:00:E6'),
(12, 'Epson L3210', 'Sales Network Lantai 2', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `software`
--

CREATE TABLE `software` (
  `id` int(11) NOT NULL,
  `nama_software` varchar(255) NOT NULL,
  `produk_software` varchar(255) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `keterangan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `software`
--

INSERT INTO `software` (`id`, `nama_software`, `produk_software`, `jumlah`, `start_date`, `end_date`, `keterangan`) VALUES
(1, 'Windows 7 Profesional 32 Bit', 'Microsoft', '6', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(2, 'Windows 7 Profesional 64 Bit', 'Microsoft', '26', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(3, 'Windows 10 Profesional 64 Bit', 'Microsoft', '6', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(4, 'Windows 11 Profesional 64 Bit', 'Microsoft', '5', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(5, 'Windows Server 2012', 'Microsoft', '1', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(6, 'Office Home Student 2016 for MAC', 'Microsoft', '2', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(7, 'Office Home Bussiness 2016', 'Microsoft', '17', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(8, 'Office Home Bussiness 2013', 'Microsoft', '30', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(9, 'Office Home Bussiness 2010', 'Microsoft', '6', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(10, 'Microsoft Project 2019 Profesional FPP', 'Microsoft', '2', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time\r\n\r\nPak Ariawira Gresik: \r\nDHGN8-C284K-Y9XKG-8FGDW-J8HM9\r\n\r\nPak Betles: \r\nFF3XN-QB9TK-3HHXG-JJ9QH-94VM9'),
(11, 'Office Home Bussiness 2019', 'Microsoft', '1', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time'),
(12, 'Adobe Creative Cloud', 'Adobe', '3', '2023-03-13 12:00:00', '2024-03-13 12:00:00', 'SELLER: PT.ARTHA INFOTAMA\r\nCONTRACT OWNER: Admin Licensing\r\nVIP NUMBER	D792CE1381E43016580A\r\n\r\ndaniswara@akrland.com/Akrland1*\r\nriza.ihtazza@akrland.com/Akrland1*\r\nivanna.tandiono@akrland.com/Akrland1*\r\n\r\nadmin.licensing@akrland.com/@kr-D0m41n123'),
(13, 'Autocad LT 2023 Subsribe', 'Autodesk', '2', '2023-02-26 12:00:00', '2024-02-25 12:00:00', 'Autodesk Order # 7064887267\r\nContract # 110002994004 \r\nTerm Start Date: February 26, 2022\r\nEnd Date: February 25, 2023\r\nPurchase Order #: PO/AI/S.22-00036\r\nCompany Name: PT. AKR Surabaya Land Corporindo\r\nReseller: Synnex Metrodata Indonesia, PT\r\n\r\nUser : Laptop Helen QS &Laptop Tirta QC - Irhantoro Adi\r\n(sukiman@akrland.com & irhantoro.adi@akrland.com) / Akrland1*\r\nadmin.licensing@akrland.com / @kr-D0m41n\r\n'),
(14, 'Autocad LT 2023 Subsribe', 'Autodesk', '3', '2019-03-14 12:00:00', '2024-03-13 12:00:00', 'Autodesk Order # 7064886998\r\nContract # 110002537683 \r\nTerm Start Date: March 14, 2023\r\nEnd Date: March 13, 2024\r\nPurchase Order #: PO/AI/S.22-00035\r\nCompany Name: PT. AKR Surabaya Land Corporindo\r\nReseller: Synnex Metrodata Indonesia, PT\r\n\r\nUser : Mohamad Hudan (Arsitek),Ariawira(Gresik),Ihsanul Fauzi (Gresik)\r\nSyafiuddin@akrland.com, ariawira@akrland.com, ihsanul.fauzi@akrland.com / Akrland1*\r\nadmin.licensing@akrland.com / @kr-D0m41n'),
(15, 'Autocad LT 2023 Subsribe', 'Autodesk', '1', '2022-09-07 12:00:00', '2023-09-06 12:00:00', 'Autodesk Order # 7066379684\r\nContract # 110004114038 \r\nTerm Start Date: September 7, 2022\r\nEnd Date: September 6, 2023\r\nPurchase Order #: PO.TC.0922/0799\r\nCompany Name: PT. AKR Surabaya Land Corporindo\r\nReseller: Synnex Metrodata Indonesia, PT\r\n\r\nUser : (zaidul.fanani@akrland.com / Akrland1*)\r\nadmin.licensing@akrland.com / @kr-D0m41n'),
(16, 'Autocad LT 2016', 'Autodesk', '2', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time\r\nHardani: 559-90771947 / 057H1\r\nPC Suryawan: 559-90771749 / 057H1'),
(17, 'Autocad LT 2015', 'Autodesk', '3', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'Life Time\r\n\r\nProject\r\nTiffany  : 556-93726471 / 057G1\r\nIrhantoro Adi  : 556-93726372 / 057G1\r\nSuryadani : 545-44145027 / 057G1'),
(18, 'SketchUp Pro 2016', 'Autodesk', '2', '2022-12-16 12:00:00', '2022-12-16 12:00:00', 'User : \r\nSN = RA-00093021-EMR\r\nAuth Code = 54b9636989d75\r\nSupport Number  = 1915279\r\nRegister Email : arifin@akrland.com\r\n\r\nUser :\r\nSN = RA-00093020-EMR\r\nAuth Code = ebcb2b3989d75'),
(22, 'CorelDRAW Graphics Suite 2017 ', 'Corel', '2', '2022-12-01 12:00:00', '2022-12-01 12:00:00', '1pcs - Anis Maslahan\r\nDR18C22-NFQUDKL-XQ769KN-QJ3VTKF-TZXLW\r\n1pcs- Jimmy Sugiarto\r\nDR19C22-RS5EZLD-TRB36AH-MXHQ7LL-SNG7A'),
(23, 'Zoom Meeting', 'Zoom Meeting', '2', '2023-04-18 12:00:00', '2024-04-17 12:00:00', 'By Zoom\r\nsbyakrland@gmail.com / P@sswordku1\r\nzoom.sby@akrland.com / @kr-Zoom123 \r\nzoom.sby2@akrland.com / @kr-Zoom123 \r\nzoom.sby3@akrland.com / @kr-Zoom123 \r\n(Email :zoom.sby@akrland.com/zoom.sbyEm41l)\r\n(Email :zoom.sby2@akrland.com/zoom.sby2Em41l)'),
(24, 'Microsoft Teams', 'Microsoft Teams', '1', '2022-12-01 12:00:00', '2022-12-01 12:00:00', 'user : akrs@ptakrlanddev.onmicrosoft.com\r\npassword : @kr-Teams123'),
(25, 'SketchUp Pro 2019', 'Autodesk', '1', '2020-03-16 12:00:00', '2020-03-16 12:00:00', 'PT AKR Surabaya Land\r\nSN : UA-00000599\r\nAuth Code : a982fe7e92a6c5\r\nSupport Number : 2994054\r\nEnd Date : 16 Maret 2020\r\nanis.maslahan@akrland.com/Akrland1*\r\nhttps://www.sketchup.com\r\n\r\nUser : Andri Arya'),
(26, 'Office Home Bussiness 2021', 'Microsoft Office', '5', '2023-05-01 12:00:00', '2023-05-01 12:00:00', 'FPP'),
(27, 'Account Microsoft', 'Microsoft', '1', '', '', 'admin@ptakrlanddev.onmicrosoft.com / @kr-D0m41n123\r\n\r\nakrs@ptakrlanddev.onmicrosoft.com'),
(28, 'Windows Server 2022 Standart', 'Windows', '1', '', '', 'QFP9B-TJN8Y-M94GP-J8PXD-FM8DW');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `login_session_key` varchar(255) DEFAULT NULL,
  `email_status` varchar(255) DEFAULT NULL,
  `password_expire_date` datetime DEFAULT '2023-03-15 00:00:00',
  `password_reset_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `photo`, `level`, `login_session_key`, `email_status`, `password_expire_date`, `password_reset_key`) VALUES
(1, 'admin', '$2y$10$IMNEvMd4grOoca2t6pbChuvzFL.T7RIJ.nJuqIRNkeITIhOBM7oSi', 'admin@gmail.com', '', 'Admin', 'cdeec7f5e63f9832480d079c7960bd1a', NULL, '2023-03-15 00:00:00', NULL),
(2, 'user', '$2y$10$lqTgv1PBoz8j0Ncd8KlEQ.DKQ6S/7h1RLVtaUTnr4q.FoZeSIRdWW', 'user@gmail.com', '', 'User', NULL, NULL, '2023-03-15 00:00:00', NULL),
(6, 'hrga', '$2y$10$MRUETDf.vZ9LhH.BQUBpFO8gEtyshsyJbO40uHBHnet3dO3OPrECS', 'hrga@akrland.com', '', 'Admin', NULL, NULL, '2023-03-15 00:00:00', NULL),
(7, 'administrator', '$2y$10$Eek2sfIHUY2J2oVnbDbfbeuPi7jHvZO966diBdjG/WJ.CK2gMN1S2', 'anis.maslahan@gmail.com', '', 'Admin', 'ddd36546303c5985693e6d176cc50509', NULL, '2023-03-15 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_password_it`
--

CREATE TABLE `user_password_it` (
  `id` int(11) NOT NULL,
  `nama_software` varchar(255) NOT NULL,
  `pass` varchar(800) DEFAULT NULL,
  `keterangan` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `user_password_it`
--

INSERT INTO `user_password_it` (`id`, `nama_software`, `pass`, `keterangan`) VALUES
(2, 'IP Server : 192.168.101.5', 'IP Server : 192.168.101.5 administrator/arifin = akrLand10', ''),
(3, 'Billing Pabx', 'IP PABX 192.168.101.98 port 35300 password 111222333\r\n\r\nBilling Pabx user arifin / akrLanD10\r\nUser password billing : Installer / 1\r\n', 'Password Registrasi Yealink \r\n123456'),
(4, 'Remote Kaspersky Jkt', 'remote ke 192.168.201.226 / av.akrland.com\r\nUser : akrland.com\\administrator\r\nPass : AKRland2016', ''),
(6, 'CCTV : 192.168.101.30 NVR', 'User: admin\r\nPass: Admin888\r\nQWERTY\r\nemail : anis.maslahan@akrland.com\r\n', 'IP Camera\r\n192.168.101.31-35'),
(7, 'Disable Update Selamanya', '1. service - update windows = disable\r\n2. regedit - HKEY_LOCAL_MACHINE\\SOFTWARE\\MICROSOFT\\WindowsUpdate\\AU(key)\\NoAutoUpdate(1)', '3. HKEY_LOCAL_MACHINE\\SYSTEM\\CurentControlSet\\Services\\wuauserv\\dependOnServic(rpcss0)\r\n4. HKEY_LOCAL_MACHINE\\SYSTEM\\CurentControlSet\\Services\\wuauserv\\ImagePath(svchost0.exe)\r\n'),
(9, 'Usable Memory RAM', '1. msconfig-advance option-maximum memory unlist)\r\n2. peformance option-advance-change-autocahnge (centang)', ''),
(10, 'Disable Bitloker', '1. Setting\r\n2. Privacy Security\r\n3. Device Encreption\r\n4. Turn Off', ''),
(11, 'Disable PIN Account Win11', '1. Setting\r\n2. Account\r\n3. Account Setting\r\n4. Sign In With Local', ''),
(12, 'Key Generik Windows 10Pro', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T win 10 pro\r\nVK7JG-NPHTM-C97JM-9MPGT-3V66T win 11 pro\r\nBT79Q-G7N6G-PGBYW-4YWX6-6F4BT win 10 home SL\r\n\r\n', 'https://winpoin.com/generic-key-untuk-installasi-windows-10-may-2020-update/\r\n\r\nhttps://www.youtube.com/watch?v=a5sJDwwnIrI\r\n--------------------------------\r\nhttps://winaero.com/windows-11-generic-keys-for-all-editions/\r\n\r\nhttps://www.youtube.com/watch?v=N4L-m2evFZI\r\n\r\nFirst Command: DISM /online /Get-TargetEditions\r\nSecond Command: wmic path softwarelicensingservice get OA3xOriginalProductKey\r\n\r\n1 No Command: sc config LicenseManager start= auto & net start LicenseManager\r\n2 No Command: sc config wuauserv start= auto & net start wuauserv\r\n3 No Command: changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T'),
(14, 'PT Aktif Tengah Malam (Virtual PBX)', '- MDN ==> 1 (03121001734) dan 2 Ext\r\nanis.maslahan@akrland.com\r\n- Masa Aktif => 1 Tahun 13-06-2023-12-06-2024\r\n- Layanan => SmartVPBX', 'account.1.auth_name = hVmWvnAH2vEWc0p2\r\naccount.1.password = 5wTDBaM7ywkt14uG\r\naccount.1.user_name = 100 - Project\r\naccount.1.sip_server.1.address = 103.48.128.18\r\n\r\naccount.1.auth_name = hQ6IVgIRfPlR5j6H\r\naccount.1.password = OEUCjuUfngeV055W\r\naccount.1.user_name = 101 - Sales\r\naccount.1.sip_server.1.address = 103.48.128.18\r\n\r\nIP YEALINK : \r\n192.168.30.13 - Project\r\n192.168.20.13 - Sales'),
(15, 'Disable Wifi Instalation Windows 11', 'Shift + F10\r\nKetik :taskmgr\r\ncari network conection &#34;end task&#34;', ''),
(16, 'Disable VND', 'Disable VND Bios\r\nSecure Boot Disable', ''),
(17, 'How to Move Thunderbird Local Folders to Another Computer', '1. Masuk Ke Trobleshoting Information\r\n2. Copy Folder Thunderbird\r\n3. Pindahkan ke PC Baru dengan cara paste di folder yang sama', ''),
(18, 'Platform Trust Technology/TPM', 'Disable jika tidak mau update win11', ''),
(19, 'Login Server SR650', 'Login Windows\r\nAdministrator\r\n@kr--Server-R2-2022-admin\r\nIP : 10.20.1.7 / 255.255.255.192 / 10.20.1.1\r\nDNS : 10.0.1.10 / 10.0.2.10\r\nLogin BMC\r\nUSERID/@krserver2022', 'Hostname BMC : MBC-SR650-R2-1\r\nIP BMC : 10.255.20.6 / 255.255.255.252 / 10.255.20.5\r\nUSERID/@krserver2022'),
(20, 'Catatan Windows Server 2022', 'GPO\r\nFSRM\r\n', 'Gunakan aplikasi Profwiz untuk migrasi account lokal user ke domain\r\n\r\n1. Join domain terlebih dahulu\r\n2. Rename user account lokal dengan account domain\r\n3. Jalankan aplikasi Profwiz dan pilih account sesuai nama account local domain\r\n4. Unlist untuk pilihan account\r\n'),
(21, 'Login RDP Server VM', '10.20.1.70 (rdc-2.r2.domain.akrland.com)\r\n10.20.1.71 (ldc-2.dc2.domain.akrland.com) Domain sby\r\n', 'Password : \r\nAdministrator / @kr--Server-R2-2022-admin'),
(22, 'Catatan Untuk Join Domain User', 'Domain : dc2.r2.domain.akrland.com\r\nIP : 10.20.1.71', '1. Ganti Account Lokal dengan Nama User (domain)\r\n2. Ganti DNS\r\n3. Workgroup diganti domain\r\n4. Password Awal / admin.it / @kr-itR2123 (restart)\r\n5. Login lokal (.\\account lokal) / password lokal\r\n6. Install Profiwz (uncentang account)\r\n7. Password domain / admin.it/@kr-itR2123\r\n8. Restart');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anydesk`
--
ALTER TABLE `anydesk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_atk`
--
ALTER TABLE `barang_atk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_atk_keluar`
--
ALTER TABLE `barang_atk_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_atk_masuk`
--
ALTER TABLE `barang_atk_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_it`
--
ALTER TABLE `barang_it`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catatan_security`
--
ALTER TABLE `catatan_security`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `contact_vendor`
--
ALTER TABLE `contact_vendor`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `extension`
--
ALTER TABLE `extension`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `helpdesk`
--
ALTER TABLE `helpdesk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `id_ifca`
--
ALTER TABLE `id_ifca`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `inventaris_it`
--
ALTER TABLE `inventaris_it`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `network`
--
ALTER TABLE `network`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `user_password_it`
--
ALTER TABLE `user_password_it`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anydesk`
--
ALTER TABLE `anydesk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `barang_atk`
--
ALTER TABLE `barang_atk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4335;

--
-- AUTO_INCREMENT untuk tabel `barang_atk_keluar`
--
ALTER TABLE `barang_atk_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `barang_atk_masuk`
--
ALTER TABLE `barang_atk_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `barang_it`
--
ALTER TABLE `barang_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `catatan_security`
--
ALTER TABLE `catatan_security`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `contact_vendor`
--
ALTER TABLE `contact_vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `data_karyawan`
--
ALTER TABLE `data_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `extension`
--
ALTER TABLE `extension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `helpdesk`
--
ALTER TABLE `helpdesk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `id_ifca`
--
ALTER TABLE `id_ifca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `inventaris_it`
--
ALTER TABLE `inventaris_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `network`
--
ALTER TABLE `network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `software`
--
ALTER TABLE `software`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user_password_it`
--
ALTER TABLE `user_password_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
