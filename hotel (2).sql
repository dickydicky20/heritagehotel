-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 10:03 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `status` enum('booking','check_in','check_out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jumlah_kamar` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `order_name`, `user_id`, `email`, `telephone`, `room_id`, `check_in`, `check_out`, `status`, `created_at`, `updated_at`, `jumlah_kamar`) VALUES
(25, 'y', 14, 'redhirega177@gmail.com', '787878787788', 2, '2022-05-18 08:54:00', '2022-05-24 08:54:00', 'check_out', '2022-05-16 18:54:50', '2022-05-16 18:57:32', 10);

--
-- Triggers `bookings`
--
DELIMITER $$
CREATE TRIGGER `trigger` AFTER UPDATE ON `bookings` FOR EACH ROW BEGIN
	IF new.status='check_in' THEN
    	UPDATE rooms set number_of_rooms = number_of_rooms-old.jumlah_kamar WHERE id = old.room_id;
    END IF;
    IF new.status='check_out' THEN
    	UPDATE rooms set number_of_rooms = number_of_rooms+old.jumlah_kamar WHERE id = old.room_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facility_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facility_type` enum('hotel','room') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `facility_name`, `facility_type`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, '• TV • AC • KAMAR MANDI • MEJA • LEMARI • WIFI', 'room', 'Jenis kamar hotel Single Room memiliki satu tempat tidur single untuk hunian satu orang.\r\nKamar yang dimaksudkan untuk ditinggali oleh satu orang ini menyediakan akomodasi untuk hanya untuk satu orang Umumnya Single Room memiliki ranjang standar.', 'uploaded-images/CEJWowBPmq13hQjYa8tK1fVkW7vSQHkh2dwmp8bL.jpg', '2022-04-01 01:21:45', '2022-04-18 06:21:27'),
(4, 'PLAYGROUND', 'hotel', 'Taman bermain, taman permainan, atau tempat permainan adalah sebuah tempat yang khusus dirancang agar anak-anak dapat bermain disana.', 'uploaded-images/wR9gP4aOgIeTGzI9W0kefZhPlAGhijaZvFMvQupN.jpg', '2022-04-11 23:16:57', '2022-04-17 23:28:36'),
(9, 'KOLAM RENANG', 'hotel', 'Kolam renang adalah sebuah petak yang memiliki banyak air didalamnya, sebuah sarana olahraga air yang biasa digunakan seseorang untuk berenang nantinya, dan biasanya terdapat disebuah rumah yang memiliki lahan luas maupun tempat hiburan.\r\nUntuk mempercantik tampilan dari kolam renang ini, maka diperlukan sebuah aksesoris yang tentunya wajib dipasang.\r\nSelain untuk mempercantik, beberapa aksesoris ini memiliki fungsi lain yang tentunya bermanfaat untuk pemilik kolam.', 'uploaded-images/rbBCYKmjFbA3f3Hw8Bm9ljCmvqCOSt94I2XxQM8s.jpg', '2022-04-17 23:25:03', '2022-04-17 23:25:03'),
(10, 'SEAFOOD RESTAURANT', 'hotel', 'Makanan hasil laut atau seafood merupakan sumber makanan yang kaya akan protein dan omega-3.\r\nBerbagai jenis ikan, udang, kepiting, tiram, dan kerang adalah beberapa contoh seafood yang sering dijumpai.\r\nMeski begitu, tak semua orang bisa mengonsumsi seafood karena makanan ini juga menyebabkan alergi pada tubuh.', 'uploaded-images/xYgKp7abPZmwLOZMQ6tOAGO9Ma00K54JamuuvOOI.png', '2022-04-17 23:27:58', '2022-04-17 23:27:58'),
(11, 'AIRPORT PARKING', 'hotel', 'parkir area', 'uploaded-images/pWQKet83qTXOmr24SBwosCPjWoEknPicQxMnBHHL.jpg', '2022-04-18 05:59:31', '2022-04-18 23:25:48'),
(12, 'BAR', 'hotel', 'bar area', 'uploaded-images/bUWfz3KdgL7f7KKkrYkYhqS5TQUjGIEpLDIZ58Cr.jpg', '2022-04-18 05:59:56', '2022-04-18 05:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_11_021350_create_facilities_table', 1),
(6, '2022_02_11_021351_create_rooms_table', 1),
(7, '2022_02_11_021352_create_bookings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_rooms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_type`, `number_of_rooms`, `facility_id`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'SINGLE', '100', 1, 'Sesuai namanya, jenis tempat tidur ini dirancang untuk satu orang, baik anak kecil maupun orang dewasa.\r\nSingle bed paling kecil biasanya tak dikhususkan untuk sharing, sementara yang lebih besar memungkinkan ditempati maksimal dua orang.', 'uploaded-images/gTnWDYdJ20tRKseYrwHZiQ0Uziit1Qyka8Bntljm.jpg', '2022-04-01 01:22:34', '2022-04-17 23:19:11'),
(2, 'DOUBLE BED', '100', 1, 'Kamar dengan double bed biasa dipesan untuk dua tamu dalam satu kamar dan tak keberatan tidur di ranjang yang sama.\r\nTipe tempat tidur ini terkadang juga disebut dengan queen bed.', 'uploaded-images/PAXLanDpk2Os7ZMYKOeqPAUazZp1Yz7PfaE4noQG.jpg', '2022-04-17 23:13:26', '2022-04-17 23:16:29'),
(3, 'Family Room', '100', 1, 'Twin room adalah tipe kamar yang memiliki dua ranjang di dalam setiap kamarnya.\r\nPada kamar tidur tipe twin, di dalamnya terdapat 2 buah kasur berukuran single bed yang diletakkan di ranjang yang terpisah. Jadi kamar ini boleh ditempati oleh 2 orang sekaligus, di mana setiap orang bakal mendapatkan tempat tidur sendiri. Oleh karena itu, tipe kamar ini paling ideal ditempati oleh anak-anak.\r\nDengan adanya 2 buah ranjang yang terpisah tersebut, maka diharapkan anak-anak akan tetap merasa nyaman kendati harus berbagi kamar tidurnya.\r\nTapi sebenarnya bukan cuma anak-anak saja yang dapat menempati kamar ini, remaja hingga dewasa juga cocok karena ukuran kasurnya memang cukup besar.', 'uploaded-images/1aFEfGu5jntbj3pG2aGNf20nJl0IeGdYqY98DlTL.jpg', '2022-04-17 23:15:50', '2022-05-11 23:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('hotel_guest','administrator','receptionist') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hotel_guest',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(10, 'administrator', 'administrator_1', '$2y$10$5OedNyEyN.MyUnI30KhpNeEfjW7swkgQ1K8SwpFFlgBr4Fo6gt3iu', 'administrator', '2022-04-06 05:52:10', '2022-04-06 05:52:10'),
(12, 'receptionist', 'receptionist@gmail.com', '$2y$10$Kg8Z/JkFXbH8kIj.hf2FcuIOxmntatZZvrQ/8x3EXfpZBK/GZRuFe', 'receptionist', '2022-04-06 09:50:22', '2022-04-06 09:50:22'),
(14, 'pengunjung', 'pengunjung1@gmail.com', '$2y$10$nzEif/HwOzdIAw2FeAqeK.0B5H1HNnBLltMcJv.PY7tdzmo.SSFOS', 'hotel_guest', '2022-04-09 20:06:32', '2022-04-09 20:06:32'),
(15, 'pengunjung2', 'pengunjung2@gmail.com', '$2y$10$XLndkr0Fe//9afNYRZh7qOzdQ5BFK85y32.56eS/Mrpg6SI1LU.ay', 'hotel_guest', '2022-04-13 06:13:29', '2022-04-13 06:13:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_email_unique` (`email`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_room_id_foreign` (`room_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
