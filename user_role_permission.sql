-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 12:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_role_permission`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2025_01_09_233610_create_roles_table', 1),
(5, '2025_01_09_233728_create_users_table', 1),
(6, '2025_01_09_234630_change_role_id_to_role_in_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', '9ed5adce4103a0b5de7eb8c4ffc6e346ce7cf86ff34804d24a4c67d75c20cffd', '[\"*\"]', NULL, NULL, '2025-01-09 20:51:19', '2025-01-09 20:51:19'),
(2, 'App\\Models\\User', 1, 'API Token', 'db85fb1d97852303692e7908ac04d9cf88a9387c178935a0e59c74a16da19666', '[\"*\"]', NULL, NULL, '2025-01-09 21:02:01', '2025-01-09 21:02:01'),
(3, 'App\\Models\\User', 1, 'API Token', '237df1b4fb6031ec8f4085fb5589b8f61420f3087dd6dbe6dd780a25042dfb3a', '[\"*\"]', NULL, NULL, '2025-01-09 21:12:13', '2025-01-09 21:12:13'),
(4, 'App\\Models\\User', 1, 'API Token', '038921a6c249e8ac4ff5f1b703125a804b0d861c0519584c907fcdc6885b7b2e', '[\"*\"]', NULL, NULL, '2025-01-09 21:13:03', '2025-01-09 21:13:03'),
(5, 'App\\Models\\User', 1, 'API Token', '9895fee90097dd2432a48e83892f1a8c7cd46833fa9c7e353fce5220cb98c5c6', '[\"*\"]', NULL, NULL, '2025-01-09 21:18:52', '2025-01-09 21:18:52'),
(6, 'App\\Models\\User', 1, 'API Token', '8d77884aa5ef5141e12dd4ffb67b476d45d33f8e53c3638fb3ab3ef7f15dc6e5', '[\"*\"]', NULL, NULL, '2025-01-09 21:21:05', '2025-01-09 21:21:05'),
(7, 'App\\Models\\User', 1, 'API Token', 'd54c2daa6f10d6a5dbd1dc321f091d22a1d66d9e40cc00c01ca1b78f0ab26d55', '[\"*\"]', NULL, NULL, '2025-01-09 21:39:05', '2025-01-09 21:39:05'),
(8, 'App\\Models\\User', 1, 'API Token', '135a77d93ce924a6477b02a9abab37fc5efbf63157763d8f77d844a3a898abe6', '[\"*\"]', NULL, NULL, '2025-01-09 21:40:01', '2025-01-09 21:40:01'),
(9, 'App\\Models\\User', 1, 'API Token', '2ec251b245e075ba2feed2b59a3a259adc96fee93455b4b1fa77ba451113ead7', '[\"*\"]', NULL, NULL, '2025-01-09 21:40:07', '2025-01-09 21:40:07'),
(10, 'App\\Models\\User', 1, 'API Token', '99ccdc99b7bb4e22efaa63f4ef7b03c284fa4790d02cd4c353ecb2933a5ab7d7', '[\"*\"]', NULL, NULL, '2025-01-09 22:21:23', '2025-01-09 22:21:23'),
(11, 'App\\Models\\User', 1, 'API Token', '5deb5d665c374e1d6f61baa9cdbafcc3bb46ce74ed51e150cf1cf825e1de7541', '[\"*\"]', NULL, NULL, '2025-01-09 23:32:27', '2025-01-09 23:32:27'),
(12, 'App\\Models\\User', 1, 'API Token', 'c732b07d62aa653c576145f4915eb359e7318d7d35109f2406e3b511e839b453', '[\"*\"]', NULL, NULL, '2025-01-09 23:42:40', '2025-01-09 23:42:40'),
(13, 'App\\Models\\User', 1, 'API Token', '9fa192b63d980a4624743a87236f50628547abc702ad93f0916654b78fd61089', '[\"*\"]', NULL, NULL, '2025-01-09 23:42:55', '2025-01-09 23:42:55'),
(14, 'App\\Models\\User', 1, 'API Token', '19d727533f15baadef263bf7a7b725e9d8708c4363fb7c83980483f08c48c6e6', '[\"*\"]', NULL, NULL, '2025-01-09 23:49:26', '2025-01-09 23:49:26'),
(15, 'App\\Models\\User', 1, 'API Token', '618505fc3146c892eedfe30c305934fcc8ba7ca132c933c404ac2d6030744918', '[\"*\"]', NULL, NULL, '2025-01-09 23:49:29', '2025-01-09 23:49:29'),
(16, 'App\\Models\\User', 1, 'API Token', '0cbce99a76e2c0fe2f313344973248230b800dfd1c4316a092595978cb0f6b25', '[\"*\"]', NULL, NULL, '2025-01-09 23:50:15', '2025-01-09 23:50:15'),
(17, 'App\\Models\\User', 1, 'API Token', '5d6791b244ddfe2566fdf3d45599e59273b56a4cd1504ca487f6678dd0385874', '[\"*\"]', NULL, NULL, '2025-01-09 23:57:50', '2025-01-09 23:57:50'),
(18, 'App\\Models\\User', 1, 'API Token', '5126e5ff8fca84adb56f4068c65f7cdfb9da7585e628d227eab6df286f386a04', '[\"*\"]', NULL, NULL, '2025-01-09 23:59:30', '2025-01-09 23:59:30'),
(19, 'App\\Models\\User', 1, 'API Token', 'ed2408ff96120ce26ea1ea7a57daf4cc9e098784ba278b7b9c0f74213817973e', '[\"*\"]', NULL, NULL, '2025-01-10 00:27:01', '2025-01-10 00:27:01'),
(20, 'App\\Models\\User', 2, 'API Token', '1fc0f3079d726719e682d6ed5fdf80407e6d5c0e0dd154b6b4412ef7d4b8ffcb', '[\"*\"]', NULL, NULL, '2025-01-10 01:05:56', '2025-01-10 01:05:56'),
(21, 'App\\Models\\User', 2, 'API Token', '38cd06ffccd55ab1d1fb3b2d2ab8be821b7c90fcf7fe4ded07d1395841e6d415', '[\"*\"]', NULL, NULL, '2025-01-10 01:10:04', '2025-01-10 01:10:04'),
(22, 'App\\Models\\User', 1, 'API Token', 'bbda8a698a832a2557f2e4a3326dd8ba2c51c5949139c6e864a776a9378e5ee4', '[\"*\"]', NULL, NULL, '2025-01-10 01:21:02', '2025-01-10 01:21:02'),
(23, 'App\\Models\\User', 1, 'API Token', 'fce551e060f2471a9a9ca290e9b46416cad53d2a4a795a2d3712e84dbcdae152', '[\"*\"]', NULL, NULL, '2025-01-10 01:22:29', '2025-01-10 01:22:29'),
(24, 'App\\Models\\User', 1, 'API Token', 'c832524fa0d6e50ee693f62006b879dfc4c43a716fefbd9e158d37a0b20040e5', '[\"*\"]', NULL, NULL, '2025-01-10 01:23:04', '2025-01-10 01:23:04'),
(25, 'App\\Models\\User', 1, 'API Token', '914594e664fcb77ea4a279bca4590a396453261a4bea8371a8552c683d1d9b55', '[\"*\"]', NULL, NULL, '2025-01-10 01:23:12', '2025-01-10 01:23:12'),
(26, 'App\\Models\\User', 1, 'API Token', '1520564158a5854d265a91a681346a20484ab005543fb0aad68b80658cfcf714', '[\"*\"]', NULL, NULL, '2025-01-10 01:23:36', '2025-01-10 01:23:36'),
(27, 'App\\Models\\User', 1, 'API Token', 'acb2545915e672abfe2295ed942ef5fb154b26e81773a0ad7a21e328624bb1df', '[\"*\"]', NULL, NULL, '2025-01-10 01:24:06', '2025-01-10 01:24:06'),
(28, 'App\\Models\\User', 1, 'API Token', '3b42499f2dcbecf88c796449a7c015d7af25a887740df2cb37be79afe66e2044', '[\"*\"]', NULL, NULL, '2025-01-10 01:24:49', '2025-01-10 01:24:49'),
(29, 'App\\Models\\User', 1, 'API Token', '704b0be14df4526b0fc91e1ee22b9dc4736df8e29e4593e87fcb4b2eb1203d50', '[\"*\"]', NULL, NULL, '2025-01-10 01:32:31', '2025-01-10 01:32:31'),
(30, 'App\\Models\\User', 1, 'API Token', 'f3f5d3753b3d125c944e25a8a88d96f2a74b92cd7700fd59a88ef7b0833b7e23', '[\"*\"]', NULL, NULL, '2025-01-10 01:41:57', '2025-01-10 01:41:57'),
(31, 'App\\Models\\User', 1, 'API Token', '2560535f4add4450ebe5ec84e98f4942e29399ee4f9dcfeaf578eff7d3989666', '[\"*\"]', NULL, NULL, '2025-01-10 01:46:38', '2025-01-10 01:46:38'),
(32, 'App\\Models\\User', 1, 'API Token', '57b5d447836cc388490c25319e0322c376c17fe895f62af4a94409991bd66a6b', '[\"*\"]', NULL, NULL, '2025-01-10 01:47:30', '2025-01-10 01:47:30'),
(33, 'App\\Models\\User', 2, 'API Token', '55003b5e5ecd3c54ea1d25006e5733140eedd17955697353bab2e4426198837b', '[\"*\"]', NULL, NULL, '2025-01-10 01:47:55', '2025-01-10 01:47:55'),
(34, 'App\\Models\\User', 1, 'API Token', '294232913e47a3115bc21504f7aefb4ad61d13ab18b45e21eba885cc532fe8e1', '[\"*\"]', NULL, NULL, '2025-01-10 01:48:38', '2025-01-10 01:48:38'),
(35, 'App\\Models\\User', 1, 'API Token', '766a05434ec5afd076667c97d28e9e45f32527568fb80db8f35dbe28b307d284', '[\"*\"]', NULL, NULL, '2025-01-10 02:17:36', '2025-01-10 02:17:36'),
(36, 'App\\Models\\User', 1, 'API Token', '2ccdd8073ae74dfd1c364fae95f6e804e7428ee6cc05c286643ed05af346740f', '[\"*\"]', NULL, NULL, '2025-01-10 02:28:43', '2025-01-10 02:28:43'),
(37, 'App\\Models\\User', 1, 'API Token', '9d84a49baf38398b66171f5654954cc303f025756125965084a743a8f8301890', '[\"*\"]', NULL, NULL, '2025-01-10 03:01:13', '2025-01-10 03:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Full access to system', '2025-01-09 16:46:47', '2025-01-09 16:46:47'),
(8, 'Moderator', 'Limited Access', '2025-01-10 03:02:13', '2025-01-10 03:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@example.com', '$2y$10$xZATl3R8UFz7gy2XExt6eeLRl4v.LGS5RqC1rypLfwgG7wrqXB2XS', 'Admin', '2025-01-09 16:19:39', '2025-01-09 16:19:39');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
