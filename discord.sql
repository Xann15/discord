-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jul 2024 pada 19.04
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `discord`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `file` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inbox`
--

CREATE TABLE `inbox` (
  `inbox_id` int(11) NOT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `type` enum('visitProfile','sendingMessage','likedMessage','reportingAccount','reportingServer','reportedAccount','reportedServer','warningServer','warningAccount','bannedFromServer','kickedFromServer','suspendAccount','suspendServer','requestToJoinServer','joinedServer','leavingServer','easterEgg') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `inbox`
--

INSERT INTO `inbox` (`inbox_id`, `from_id`, `to_id`, `server_id`, `type`, `created_at`) VALUES
(2, 13, 12, 17, 'requestToJoinServer', '2024-07-28 10:29:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_to_join_server`
--

CREATE TABLE `request_to_join_server` (
  `id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `request_to_join_server`
--

INSERT INTO `request_to_join_server` (`id`, `server_id`, `user_id`, `reason`, `created_at`) VALUES
(37, 16, 12, 'join dong pookie', '2024-07-28 05:41:51'),
(38, 16, 12, 'acc woi', '2024-07-28 05:42:03'),
(39, 16, 12, 'bjillll', '2024-07-28 05:42:12'),
(40, 17, 13, 'hi pookie', '2024-07-28 10:29:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `servers`
--

CREATE TABLE `servers` (
  `server_id` int(11) NOT NULL,
  `server_profile` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `server_name` varchar(100) DEFAULT NULL,
  `server_description` varchar(100) DEFAULT NULL,
  `server_visibility` varchar(10) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `servers`
--

INSERT INTO `servers` (`server_id`, `server_profile`, `created_by`, `server_name`, `server_description`, `server_visibility`, `created_at`) VALUES
(14, NULL, 12, 'xan server', '', 'public', '28/07/2024'),
(15, NULL, 13, 'xan', '', 'public', '28/07/2024'),
(16, NULL, 13, 'yivii\'s server-7698', 'pookie', 'private', '28/07/2024'),
(17, NULL, 12, 'xan\'s private server-7053', 'vip', 'private', '28/07/2024'),
(18, NULL, 12, 'xan\'s public server-5331', '', 'public', '28/07/2024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `server_code`
--

CREATE TABLE `server_code` (
  `id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `server_code`
--

INSERT INTO `server_code` (`id`, `server_id`, `code`) VALUES
(28, 14, 46652),
(29, 15, 5227),
(30, 16, 35348),
(31, 17, 8229),
(32, 18, 47748);

-- --------------------------------------------------------

--
-- Struktur dari tabel `server_link`
--

CREATE TABLE `server_link` (
  `id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `server_link`
--

INSERT INTO `server_link` (`id`, `server_id`, `link`) VALUES
(113, 14, 'A80F11EA'),
(114, 15, '42709A31'),
(115, 16, '5B828AE1'),
(116, 17, '298BD688'),
(117, 18, '25E0B560');

-- --------------------------------------------------------

--
-- Struktur dari tabel `server_members`
--

CREATE TABLE `server_members` (
  `id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `server_members`
--

INSERT INTO `server_members` (`id`, `server_id`, `member_id`) VALUES
(110, 14, 12),
(111, 14, 13),
(112, 15, 13),
(113, 16, 13),
(114, 17, 12),
(115, 18, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` enum('online','offline') DEFAULT 'offline',
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `status`, `last_activity`) VALUES
(12, 'xan', '$2y$10$Gh3o3GxinglaFZKDIAVZ/.u0k8VC.N/7o6p0EHlfhyBn8DJV72Oyi', 'online', '2024-07-28 17:04:23'),
(13, 'yivii', '$2y$10$2RHvApKnFf1cKFCBVMVi2.YaBYi.rq3iIqrC7gBLqqA7SDZvbYpCm', 'offline', '2024-07-28 17:03:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `group_id` (`server_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`inbox_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `server_id` (`server_id`),
  ADD KEY `server_id_2` (`server_id`);

--
-- Indeks untuk tabel `request_to_join_server`
--
ALTER TABLE `request_to_join_server`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`server_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`server_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indeks untuk tabel `server_code`
--
ALTER TABLE `server_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`server_id`);

--
-- Indeks untuk tabel `server_link`
--
ALTER TABLE `server_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`server_id`);

--
-- Indeks untuk tabel `server_members`
--
ALTER TABLE `server_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`server_id`,`member_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `inbox`
--
ALTER TABLE `inbox`
  MODIFY `inbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `request_to_join_server`
--
ALTER TABLE `request_to_join_server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `servers`
--
ALTER TABLE `servers`
  MODIFY `server_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `server_code`
--
ALTER TABLE `server_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `server_link`
--
ALTER TABLE `server_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT untuk tabel `server_members`
--
ALTER TABLE `server_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `chats_ibfk_4` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `request_to_join_server`
--
ALTER TABLE `request_to_join_server`
  ADD CONSTRAINT `request_to_join_server_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `servers`
--
ALTER TABLE `servers`
  ADD CONSTRAINT `servers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `server_code`
--
ALTER TABLE `server_code`
  ADD CONSTRAINT `server_code_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `server_link`
--
ALTER TABLE `server_link`
  ADD CONSTRAINT `server_link_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `server_members`
--
ALTER TABLE `server_members`
  ADD CONSTRAINT `server_members_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `server_members_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
