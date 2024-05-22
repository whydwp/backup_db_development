-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Mei 2024 pada 10.02
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
-- Database: `tracking_resto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_loacd`
--

CREATE TABLE `dokumen_loacd` (
  `id` int(10) NOT NULL,
  `kode_lahan` varchar(255) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `luas_area` varchar(255) NOT NULL,
  `tgl_berlaku` date NOT NULL,
  `penanggungjawab` varchar(255) NOT NULL,
  `status_approvowner` varchar(255) NOT NULL,
  `status_approvlegal` varchar(255) NOT NULL,
  `lamp_land` varchar(255) NOT NULL,
  `lamp_loacd` varchar(1000) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokumen_loacd`
--

INSERT INTO `dokumen_loacd` (`id`, `kode_lahan`, `nama_lahan`, `lokasi`, `luas_area`, `tgl_berlaku`, `penanggungjawab`, `status_approvowner`, `status_approvlegal`, `lamp_land`, `lamp_loacd`, `start_date`, `end_date`) VALUES
(6, 'MLG-001', 'm', 'm', 'm', '2024-05-06', 'mmm', 'Approve', 'Approve', '../uploads/Sertifikat Bem 2021.pdf', '../uploads/Sertifikat Panitia PKKMB 2021 Dini Naylul Izzah.pdf', '2024-05-06 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `draft`
--

CREATE TABLE `draft` (
  `id` int(10) NOT NULL,
  `kode_lahan` varchar(255) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `status_approvowner` varchar(255) NOT NULL,
  `status_approvlegal` varchar(255) NOT NULL,
  `lamp_draf` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `land`
--

CREATE TABLE `land` (
  `id` int(10) NOT NULL,
  `kode_lahan` varchar(255) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL,
  `alamat_pemilik` varchar(255) NOT NULL,
  `no_tlp` varchar(50) NOT NULL,
  `luas_area` varchar(255) NOT NULL,
  `lamp_land` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `land`
--

INSERT INTO `land` (`id`, `kode_lahan`, `nama_lahan`, `lokasi`, `nama_pemilik`, `alamat_pemilik`, `no_tlp`, `luas_area`, `lamp_land`) VALUES
(11, 'SBY-001', 's', 's', 's', 's', 's', 's', '../uploads/WhatsApp Image 2024-04-23 at 12.10.56.jpeg,../uploads/WhatsApp Image 2024-04-23 at 12.10.58 (1).jpeg'),
(12, 'MLG-001', 'm', 'm', 'm', 'm', 'm', 'm', '../uploads/Uts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg,../uploads/uts dini.jpeg'),
(13, 'BL-001', 'b', 'b', 'b', 'b', 'b', 'b', '../uploads/UTS SISTEM OPERASI.jpeg'),
(14, '1', '1', '2', '2', '2', '2', '2', '../uploads/');

-- --------------------------------------------------------

--
-- Struktur dari tabel `re`
--

CREATE TABLE `re` (
  `id` int(10) NOT NULL,
  `kode_lahan` varchar(50) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `luas_area` varchar(255) NOT NULL,
  `lamp_land` varchar(1000) NOT NULL,
  `catatan_owner` varchar(1000) NOT NULL,
  `status_approvowner` varchar(255) NOT NULL,
  `catatan_legal` varchar(1000) DEFAULT NULL,
  `status_approvlegal` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sla_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `re`
--

INSERT INTO `re` (`id`, `kode_lahan`, `nama_lahan`, `lokasi`, `luas_area`, `lamp_land`, `catatan_owner`, `status_approvowner`, `catatan_legal`, `status_approvlegal`, `start_date`, `end_date`, `sla_date`) VALUES
(32, 'MLG-001', 'm', 'm', 'm', '../uploads/Sertifikat Bem 2021.pdf', 'mmm', 'Approve', 'mmm', 'Approve', '2024-05-06', '2024-05-06', '2024-05-11'),
(33, 'SBY-001', 's', 's', 's', '../uploads/MSI_PRO.jpg', 'nnn', 'Pending', NULL, NULL, NULL, NULL, '2024-05-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Admin PPA', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
(2, 'Departemen Legal', 'legal', '2fbd4ee396cdac223059952a7fe01e54', 'Legal'),
(3, 'Departemen Real Estate', 're', '12eccbdd9b32918131341f38907cbbb5', 'Re');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokumen_loacd`
--
ALTER TABLE `dokumen_loacd`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `land`
--
ALTER TABLE `land`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `re`
--
ALTER TABLE `re`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokumen_loacd`
--
ALTER TABLE `dokumen_loacd`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `draft`
--
ALTER TABLE `draft`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `land`
--
ALTER TABLE `land`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `re`
--
ALTER TABLE `re`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
