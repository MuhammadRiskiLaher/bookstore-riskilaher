-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Mar 2020 pada 06.41
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_buku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `judul` varchar(25) NOT NULL,
  `noisbn` varchar(17) NOT NULL,
  `penulis` varchar(25) NOT NULL,
  `penerbit` varchar(25) NOT NULL,
  `tahun` char(4) DEFAULT NULL,
  `stok` int(3) DEFAULT NULL,
  `harga_pokok` int(6) NOT NULL,
  `harga_jual` int(6) NOT NULL,
  `ppn` float NOT NULL,
  `diskon` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `noisbn`, `penulis`, `penerbit`, `tahun`, `stok`, `harga_pokok`, `harga_jual`, `ppn`, `diskon`) VALUES
(4, 'Matematika', '0122', 'Riski', 'grAmed', '2009', NULL, 75000, 100000, 1.2, 0),
(6, 'IPA', '0123', 'GRAHAA', 'PUSTAKA', '2020', NULL, 45000, 60000, 3, 0),
(7, 'Dongeng', '0812819', 'Riski Ramadan', 'Gramediiaaaa', '2008', NULL, 50000, 500000, 10, 0),
(9, 'Mandra Guna', '1212', 'PUtri', 'Erlangga', '2002', NULL, 20000, 25000, 1.5, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` int(3) NOT NULL,
  `nama_distributor` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `alamat`, `telepon`) VALUES
(1, 'PT MUHAMMAD RISKI LAHER', 'Bogor jln Cimanengah', '089601142805'),
(2, 'PT GUNUNG SALAK BOGOR', 'Puncak Gunung Bogor', '089601142806'),
(3, 'PT GUNUNG PUTRI', 'Jalan Kapten Muslihat', '0876732723'),
(4, 'CV JAYA WIJAYA2', 'Bandung Kidul', '0891272234'),
(8, 'PT AQUA', 'Bogor', '08345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `akses` enum('kasir','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama`, `alamat`, `telepon`, `status`, `username`, `password`, `akses`) VALUES
(3, 'Muhammad Riski Ramadhan', 'Jln Cimanengah Atas', '08782356823', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(4, 'Muhammad Riski Laher', 'Jln Cimanengah Bawah', '0893725798235', '1', 'kasir', 'c7911af3adbd12a035b289556d96470a', 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasok`
--

CREATE TABLE `pasok` (
  `id_pasok` int(5) NOT NULL,
  `id_distributor` int(3) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasok`
--

INSERT INTO `pasok` (`id_pasok`, `id_distributor`, `id_buku`, `jumlah`, `tanggal`) VALUES
(23, 1, 4, 10, '2020-03-23'),
(35, 1, 4, 12, '2020-03-25'),
(40, 1, 7, 21, '2020-03-27'),
(48, 4, 6, 10, '2020-03-27'),
(51, 1, 4, 20, '2020-03-27'),
(52, 1, 6, 23, '2020-03-27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(5) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `id_kasir` int(3) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `total` int(7) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indeks untuk tabel `pasok`
--
ALTER TABLE `pasok`
  ADD PRIMARY KEY (`id_pasok`),
  ADD KEY `id_distributor` (`id_distributor`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id_distributor` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pasok`
--
ALTER TABLE `pasok`
  MODIFY `id_pasok` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pasok`
--
ALTER TABLE `pasok`
  ADD CONSTRAINT `pasok_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `pasok_ibfk_2` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
