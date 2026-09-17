-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2024 at 07:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stokgudang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_kode` int(10) NOT NULL,
  `id_barang` int(10) NOT NULL,
  `namabarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_kode`, `id_barang`, `namabarang`) VALUES
(1, 11, 'APLIKASI KSM'),
(1, 12, 'APLIKASI KUM'),
(1, 13, 'MAP KUM'),
(1, 14, 'PLASTIK JAMINAN'),
(2, 21, 'CEK @ 10 LEMBAR');

-- --------------------------------------------------------

--
-- Table structure for table `keluar`
--

CREATE TABLE `keluar` (
  `idkeluar` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `qty` int(11) NOT NULL,
  `petugas` varchar(50) NOT NULL,
  `penerima` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keluar`
--

INSERT INTO `keluar` (`idkeluar`, `idbarang`, `kodebarang`, `tanggal`, `qty`, `petugas`, `penerima`) VALUES
(10, 8, 'FBO-005A', '2023-12-21 08:44:29', 350, 'wisnu', 'budi'),
(11, 8, 'FBO-005A', '2023-12-21 08:58:25', 850, 'him', 'tina'),
(13, 12, 'FBO-005A', '2023-12-22 03:00:05', 500, 'wisni', 'tina'),
(14, 12, 'FBO-005A', '2023-12-22 03:29:26', 10, 'hima', 'buda'),
(21, 22, '-', '2024-01-17 01:43:34', 100, 'wisnu', 'budi'),
(22, 12, 'FBO-005A', '2024-02-22 01:29:28', 10, 'wisnu', 'budi'),
(23, 12, 'FBO-005A', '2024-02-22 01:34:03', 10, 'mina', 'a'),
(24, 13, '', '2024-02-23 01:02:40', 120, 'mommom', 'rere'),
(25, 55, '', '2024-02-23 06:16:55', 100, 'wisnu', 'buda');

-- --------------------------------------------------------

--
-- Table structure for table `kode`
--

CREATE TABLE `kode` (
  `id_kode` int(10) NOT NULL,
  `kodebarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kode`
--

INSERT INTO `kode` (`id_kode`, `kodebarang`) VALUES
(1, '-'),
(2, 'FBO-004A'),
(3, 'FBO-004B'),
(4, 'FBO-005A'),
(5, 'FBO-005B'),
(6, 'FBO-009'),
(7, 'FBO-010');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `iduser` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`iduser`, `email`, `password`) VALUES
(3, 'sasa@gmail.com', '1234567'),
(4, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `masuk`
--

CREATE TABLE `masuk` (
  `idmasuk` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `petugas` varchar(50) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(5000) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `masuk`
--

INSERT INTO `masuk` (`idmasuk`, `idbarang`, `kodebarang`, `petugas`, `tanggal`, `keterangan`, `qty`) VALUES
(20, 10, 'FBO-004B', 'mina', '2023-12-21 04:07:34', '', 800),
(22, 11, 'FBO-005B', 'muni', '2023-12-21 04:37:03', '', 100),
(23, 11, 'FBO-005B', 'muni', '2023-12-21 04:41:42', '', 650),
(24, 8, 'FBO-005A', 'wisnu', '2023-12-21 08:40:45', '', 100),
(25, 8, 'FBO-005A', 'him', '2023-12-22 02:46:16', '', 500),
(28, 12, 'FBO-005A', 'gigi', '2023-12-22 02:50:12', 'test', 710),
(33, 14, 'FFO-007', 'mina', '2023-12-22 04:13:31', 'test', 600),
(37, 22, '-', 'wisnu', '2024-01-17 01:43:15', 'test', 20),
(38, 0, '', 'wisnu', '2024-02-22 01:27:01', 'tes', 10),
(39, 0, '', 'him', '2024-02-22 01:27:41', 'tesssssssssssss', 10),
(40, 12, 'FBO-005A', 'himi', '2024-02-22 01:33:40', 'tesssssssssssss', 10),
(41, 55, '', 'mimi', '2024-02-23 01:00:13', 'teesssss', 100),
(42, 13, '', 'mimi', '2024-02-23 01:01:42', 'tes tes tes tes', 120);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `idbarang` int(11) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `namabarang` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`idbarang`, `kodebarang`, `namabarang`, `stok`) VALUES
(12, 'FBO-005A', 'FBO-005A-BILYET GIRO @10 LEMBAR', 10),
(13, 'FBO-004A', 'FBO-004A-CEK @10 LEMBAR', 10),
(14, 'FFO-007', 'FFO-007-DEPOSITO', 10),
(19, '-', 'APLIKASI KSM', 10),
(20, '-', 'APLIKASI KUM', 10),
(21, '-', 'MAP KUM', 10),
(22, '-', 'PLASTIK JAMINAN', 10),
(23, 'FBO-004B', 'FBO-004B-CEK @25 LEMBAR', 10),
(24, 'FBO-005B', 'FBO-005B-BILYET GIRO @25 LEMBAR', 10),
(25, 'FBO-009', 'FBO-009-FORMULIR ADVIS DEBET', 10),
(26, 'FBO-010', 'FBO-010-FORMULIR ADVIS KREDIT', 10),
(27, 'FBO-011', 'FBO-011-FORMULIR INTERN SLIP DEBET', 10),
(28, 'FBO-011A', 'FBO-011A-FORMULIR INTERN SLIP KREDIT', 10),
(29, 'FFO-002F', 'FFO-002F-APLK PEMB REKENING DANA PERORANGAN B.IND', 10),
(30, 'FFO-003', 'FFO-003-APLIKASI DEPOSITO', 10),
(31, 'FFO-005', 'FFO-005-FORM PERMOHONAN SERBAGUNA/APLIKASI UMUM', 10),
(32, 'FFO-006', 'FFO-006-BUKU TABUNGAN RUPIAH MANDIRI', 10),
(33, 'FFO-006A', 'FFO-006A-BUKU TABUNGAN KU', 10),
(34, 'FFO-006D', 'FFO-006D-BUKU TABUNGAN SIMPEL', 10),
(35, 'FFO-006E', 'FFO-006E-BUKU TABUNGAN MU', 10),
(36, 'FFO-011', 'FFO-011-FORMULIR PENARIKAN', 10),
(37, 'FFO-017A', 'FFO-017A-SYARAT-SYARAT UMUM PEMBUKAAN REKENING', 10),
(38, 'FFO-018', 'FFO-018-FORM REK. KORAN GIRO&PINJAMAN AD HOC', 10),
(39, 'FFO-020', 'FFO-020-KARTU CONTOH TTD', 10),
(40, 'FFO-036', 'FFO-036-LAPORAN TELLER PAGI HARI', 10),
(41, 'FFO-037', 'FFO-037-LAPORAN TELLER SORE HARI', 10),
(42, 'FFO-041', 'FFO-041-BUKU TABUNGAN BISNIS', 10),
(43, 'FFO-047', 'FFO-047-PEMBAYARAN KARTU KREDIT MANDIRI VISA', 10),
(44, 'FFO-052', 'FFO-052-SLIP SETORAN SOPP', 10),
(45, 'FFO-056', 'FFO-056-FORMULIR KELUHAN NASABAH', 10),
(46, 'FFO-058', 'FFO-058-KETENTUAN&SYARAT KHUSUS REK. TABUNGAN', 10),
(47, 'FFO-063', 'FFO-063-FORMULIR TRANSAKSI REKSADANA', 10),
(48, 'FFO-069A', 'FFO-069A-APLIKASI MANDIRI INTERNET BISNIS', 10),
(49, 'FFO-071', 'FFO-07-APLK PEMBUKAAN TAB RENCANA MANDIRI', 10),
(50, 'FFO-078', 'FFO-078-FORM SYARAT-SYARAT REK GABUNGAN \"ATAU\"', 10),
(51, 'FFO-079', 'FFO-079-FORMULIR SETORAN/TRANSFER/KLIRING/INKASO', 10),
(52, 'FFO-084', 'FFO-084-FORMULIR DATA/INFORMASI WALK IN CUSTOMER', 10),
(53, 'FFO-085', 'FFO-085-APLIKASI PEMBUKAAN MANDIRI GIRO', 10),
(54, 'FFO-086', 'FFO-086-KETENTUAN&SYARAT KHUSUS MANDIRI GIRO', 10),
(55, 'PAC-003A', 'PAC-003A-BAN UANG @2.000', 10),
(56, 'PAC-003A', 'PAC-003A-BAN UANG @1.000', 10),
(57, 'PAC-004', 'PAC-004-BAN UANG @5.000', 10),
(58, 'PAC-005', 'PAC-005-BAN UANG @10.000', 10),
(59, 'PAC-006', 'PAC-006-BAN UANG @20.000', 10),
(60, 'PAC-007', 'PAC-007-BAN UANG @50.000', 10),
(61, 'PAC-008', 'PAC-008-BAN UANG @100.000', 10),
(62, 'PAC-009', 'PAC-009-COVER PLASTIK DEPOSITO', 10),
(63, 'PAC-010', 'PAC-010-OVERLAY&SIGNATURE VERIFICATION', 10),
(64, 'PAC-013', 'PAC-013-KOTAK ARSIP', 10),
(65, 'BG-02', 'BG-02-BANK GARANSI', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`idkeluar`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`idmasuk`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`idbarang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluar`
--
ALTER TABLE `keluar`
  MODIFY `idkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `masuk`
--
ALTER TABLE `masuk`
  MODIFY `idmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
