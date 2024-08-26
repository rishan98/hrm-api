-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 26, 2024 at 04:22 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrm_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_19_060258_create_roles_table', 1),
(6, '2024_08_24_230958_create_categories_table', 2),
(7, '2024_08_25_091155_create_product_has_users_table', 2),
(8, '2024_08_25_091301_create_product_has_categories_table', 2),
(9, '2024_08_25_100728_create_products_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'AdminToken', '73f904ec0a48ffde9a4bc69d15d92d8f4da12a870d3070709f4cd926d750f1b4', '[\"*\"]', NULL, NULL, '2024-08-24 17:37:31', '2024-08-24 17:37:31'),
(2, 'App\\Models\\User', 2, 'UserToken', 'af8b6551d14f5651f884414b670bb0db97e15cd916287ca659003a569aab4f20', '[\"*\"]', NULL, NULL, '2024-08-25 06:03:32', '2024-08-25 06:03:32'),
(3, 'App\\Models\\User', 2, 'UserToken', '33cfc599b02a963c72b8063a5402173301efe203dbdc0f5c43e18213e711b634', '[\"*\"]', '2024-08-25 06:13:47', NULL, '2024-08-25 06:10:55', '2024-08-25 06:13:47'),
(4, 'App\\Models\\User', 1, 'AdminToken', '46234a5bad3a3c53d90430c3b9296f37e05c5d63e20550350c9205678cf4a19a', '[\"*\"]', NULL, NULL, '2024-08-25 09:08:07', '2024-08-25 09:08:07'),
(5, 'App\\Models\\User', 1, 'AdminToken', '41d121b2ce010c3dd11d3f8c51722dfb43257c327445602b920504f2fe1fb323', '[\"*\"]', NULL, NULL, '2024-08-25 09:08:34', '2024-08-25 09:08:34'),
(6, 'App\\Models\\User', 1, 'AdminToken', 'a5819417a2560045e0c2e8887d5ad85701f1b18dc03709654caf6faa1508d7ca', '[\"*\"]', NULL, NULL, '2024-08-25 09:09:55', '2024-08-25 09:09:55'),
(7, 'App\\Models\\User', 1, 'AdminToken', '56df4e127b8f4ab5deb75055d6dbe5a98dac7113a7405e856b68b39198aeba51', '[\"*\"]', NULL, NULL, '2024-08-25 09:13:46', '2024-08-25 09:13:46'),
(8, 'App\\Models\\User', 1, 'AdminToken', '6ca9d968e509d323f2c26872c62e1bdb58b420e31e85bd6d9a3827a8f7cae4de', '[\"*\"]', NULL, NULL, '2024-08-25 09:15:12', '2024-08-25 09:15:12'),
(9, 'App\\Models\\User', 1, 'AdminToken', 'ff23b0e201db7ad96b280473680940aa67bc2acc657cc86c7e608427d1fb5b57', '[\"*\"]', NULL, NULL, '2024-08-25 09:15:27', '2024-08-25 09:15:27'),
(10, 'App\\Models\\User', 1, 'AdminToken', '1bb4020ed6fada1b888fe652985a8312f2fb981a0d7190ae4ec98e8fb1550746', '[\"*\"]', NULL, NULL, '2024-08-25 09:15:52', '2024-08-25 09:15:52'),
(11, 'App\\Models\\User', 1, 'AdminToken', 'f040df6057d371268bc2dfa9d447d0e2a39c513ddf801831a03ce2fb1951b883', '[\"*\"]', NULL, NULL, '2024-08-25 09:19:08', '2024-08-25 09:19:08'),
(12, 'App\\Models\\User', 1, 'AdminToken', '88881e8a4427fbd0446918159162a35bb51661bed8da4554c4f84cb3875f867c', '[\"*\"]', NULL, NULL, '2024-08-25 09:53:17', '2024-08-25 09:53:17'),
(13, 'App\\Models\\User', 1, 'AdminToken', 'bc02a1a69d0cdff3770852fc14ac25753d0c94d91ece519abae51bc08e7b8059', '[\"*\"]', NULL, NULL, '2024-08-25 09:53:27', '2024-08-25 09:53:27'),
(14, 'App\\Models\\User', 1, 'AdminToken', '1313c3c2c649ac92fa32a03b89521b8b31a8de95adc996a9bf4646c20a85ec2d', '[\"*\"]', NULL, NULL, '2024-08-25 09:53:28', '2024-08-25 09:53:28'),
(15, 'App\\Models\\User', 1, 'AdminToken', 'c924669d6284fdf70a458ad068089a521440245034d0d6f01de8ba675ea381c8', '[\"*\"]', NULL, NULL, '2024-08-25 09:53:29', '2024-08-25 09:53:29'),
(16, 'App\\Models\\User', 1, 'AdminToken', 'bc8829ffe826d5751f03190cb0ae20614ae7b82d88becf6feca622a9d37b877e', '[\"*\"]', NULL, NULL, '2024-08-25 09:53:29', '2024-08-25 09:53:29'),
(17, 'App\\Models\\User', 1, 'AdminToken', '105e0ee3b2958dc576b061ceb9d8d83c13b732b3891d1a16ecc2840aa4aefd60', '[\"*\"]', NULL, NULL, '2024-08-25 09:54:11', '2024-08-25 09:54:11'),
(18, 'App\\Models\\User', 1, 'AdminToken', '3d59da3c7b9346776a36fadc64179fe9ae7b617b121038f8ead15fa45232030a', '[\"*\"]', NULL, NULL, '2024-08-25 09:55:24', '2024-08-25 09:55:24'),
(19, 'App\\Models\\User', 1, 'AdminToken', 'f04470743e20b9152effdc869d554d7adb3aff3c86c4cbc536f621220f4bf03d', '[\"*\"]', NULL, NULL, '2024-08-25 09:56:14', '2024-08-25 09:56:14'),
(20, 'App\\Models\\User', 1, 'AdminToken', '45e1d7362916a28604d2aaacb9efe129750bf597aaf6be927b1f756aba529a81', '[\"*\"]', NULL, NULL, '2024-08-25 14:14:45', '2024-08-25 14:14:45'),
(21, 'App\\Models\\User', 1, 'AdminToken', '8c59975a825c45a8f57c02f6cf0cb1ba845509c59b529a3a73f6392d12247ab6', '[\"*\"]', NULL, NULL, '2024-08-25 14:14:59', '2024-08-25 14:14:59'),
(22, 'App\\Models\\User', 1, 'AdminToken', '40c07b7f5b93a540687d3154255ff2c7029e065112a96c6e1be88170b55866c6', '[\"*\"]', NULL, NULL, '2024-08-25 14:15:21', '2024-08-25 14:15:21'),
(23, 'App\\Models\\User', 1, 'AdminToken', 'cc08050af039014e3b09c58f2f09d210443dfe461b9de152882509bbc17f7a50', '[\"*\"]', NULL, NULL, '2024-08-25 14:30:24', '2024-08-25 14:30:24'),
(24, 'App\\Models\\User', 1, 'AdminToken', 'fdacccb129eb4125b3f594c7cf67e83044be267add53b44e3f6392bc8c13d502', '[\"*\"]', NULL, NULL, '2024-08-25 14:30:27', '2024-08-25 14:30:27'),
(25, 'App\\Models\\User', 1, 'AdminToken', '5048f8a078951551081e618245149cd7e42eaffd9878a2a01246077d0564c321', '[\"*\"]', NULL, NULL, '2024-08-25 14:30:28', '2024-08-25 14:30:28'),
(26, 'App\\Models\\User', 1, 'AdminToken', '609ad1a37f888c1659f58a855f2296ad4192bf3495ff03dd9f504233d29397a9', '[\"*\"]', NULL, NULL, '2024-08-25 14:31:02', '2024-08-25 14:31:02'),
(27, 'App\\Models\\User', 1, 'AdminToken', 'd6888243746346f256947c57c74460e4ded0c8be6d6b3279737577452d04b551', '[\"*\"]', NULL, NULL, '2024-08-25 14:33:33', '2024-08-25 14:33:33'),
(28, 'App\\Models\\User', 1, 'AdminToken', '2cec222a7cd784514bbb8c126a010ecf9c10a0cdb4fced8c2384912a8c269c07', '[\"*\"]', NULL, NULL, '2024-08-25 14:35:34', '2024-08-25 14:35:34'),
(29, 'App\\Models\\User', 1, 'AdminToken', 'bce79cfc4153b7bf70d503d762cf04d6d37343633c2d48119ea0ea6cf0966a65', '[\"*\"]', NULL, NULL, '2024-08-25 14:38:51', '2024-08-25 14:38:51'),
(30, 'App\\Models\\User', 1, 'AdminToken', 'ed87d8a9dc2fe4e7428ca0424a971db4fdee0baa4b21026e6d572879d7f45aeb', '[\"*\"]', NULL, NULL, '2024-08-25 14:44:47', '2024-08-25 14:44:47'),
(31, 'App\\Models\\User', 1, 'AdminToken', 'a87192aa223d39e62af9692307e392112510bd0a119197d94dd08adec6cef552', '[\"*\"]', NULL, NULL, '2024-08-25 14:45:12', '2024-08-25 14:45:12'),
(32, 'App\\Models\\User', 1, 'AdminToken', 'adcb59bed2f8a22b944b43e8081be9e2a29fe60995fc0600fe6442ab3d4b71de', '[\"*\"]', NULL, NULL, '2024-08-25 14:45:15', '2024-08-25 14:45:15'),
(33, 'App\\Models\\User', 1, 'AdminToken', '7335739f9a5a88de6de95d7d6dc742fe140d6001ce1ae658d2742a56ed85eecc', '[\"*\"]', NULL, NULL, '2024-08-25 14:45:24', '2024-08-25 14:45:24'),
(34, 'App\\Models\\User', 1, 'AdminToken', '965ef9dbb7c1686a68fc7da72eb98cda587c13372aeffb5327601a8e5d40e092', '[\"*\"]', NULL, NULL, '2024-08-25 14:46:16', '2024-08-25 14:46:16'),
(35, 'App\\Models\\User', 1, 'AdminToken', '1537530d3cd86481bfd0687b452f7a41d1f12724d6b978f5c8e3933f3f02ce14', '[\"*\"]', NULL, NULL, '2024-08-25 14:46:41', '2024-08-25 14:46:41'),
(36, 'App\\Models\\User', 1, 'AdminToken', '5a2ebfde5b7978f3d5e0bd692fbd985c65a1122b0d42e1d1980859834170eea4', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:47', '2024-08-25 14:57:47'),
(37, 'App\\Models\\User', 1, 'AdminToken', 'edf4539d0a2d439b8737fbaf1e00a7e0c25fba6e89bf909c7fb13f8231ebee8b', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:49', '2024-08-25 14:57:49'),
(38, 'App\\Models\\User', 1, 'AdminToken', '9641e13d9562de4c45ddefe93871d9d5deed671baeac8d32e50fa83278866890', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:50', '2024-08-25 14:57:50'),
(39, 'App\\Models\\User', 1, 'AdminToken', '1fadc86d8f9176b585eb060eacb9cb75cbc56c2b5c60e40cf47fd78e2ac26f85', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:51', '2024-08-25 14:57:51'),
(40, 'App\\Models\\User', 1, 'AdminToken', 'ffc7f034b431d7086c2da5ff2ee752090e7cb2fba3dbfdbbff749635722d8bb8', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:52', '2024-08-25 14:57:52'),
(41, 'App\\Models\\User', 1, 'AdminToken', 'df39b43f173ff1bd3b78ba95dbf2a38ea5e323a93483bbb43c72783217c440e2', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:52', '2024-08-25 14:57:52'),
(42, 'App\\Models\\User', 1, 'AdminToken', '6056da6fc871e10ef750d01cf93dde297ab2df16e28a27b84b794e98d8681252', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:53', '2024-08-25 14:57:53'),
(43, 'App\\Models\\User', 1, 'AdminToken', '277625fbc07b766bd2020a18fad316c65a688ba3f08c072ef13ee5e340e8cf02', '[\"*\"]', NULL, NULL, '2024-08-25 14:57:54', '2024-08-25 14:57:54'),
(44, 'App\\Models\\User', 1, 'AdminToken', '020edec4b363037e94a10d5c66c366e98a0af711d905ae89a86103a78a7f6677', '[\"*\"]', NULL, NULL, '2024-08-25 14:58:02', '2024-08-25 14:58:02'),
(45, 'App\\Models\\User', 1, 'AdminToken', '6a563e665c4666d6189f9c3dd6ccc58d56b1b743a0ee1445bbb6284200d38aee', '[\"*\"]', NULL, NULL, '2024-08-25 14:59:17', '2024-08-25 14:59:17'),
(46, 'App\\Models\\User', 1, 'AdminToken', '3b02ff9b8b285ef45008ee6642d2079e33c73d292d3b0786cb7a8744849322af', '[\"*\"]', NULL, NULL, '2024-08-25 14:59:25', '2024-08-25 14:59:25'),
(47, 'App\\Models\\User', 1, 'AdminToken', '297cdcc63072001fb59f2c6594cdbd511c63627872cdcd891843ef0d90f823ae', '[\"*\"]', NULL, NULL, '2024-08-25 14:59:27', '2024-08-25 14:59:27'),
(48, 'App\\Models\\User', 1, 'AdminToken', '550c9a8b4b6c7e6757286b03d8c8bdedab5b8a9b3b748b7c1e4bda4d4a8ddde5', '[\"*\"]', NULL, NULL, '2024-08-25 15:02:24', '2024-08-25 15:02:24'),
(49, 'App\\Models\\User', 1, 'AdminToken', '3e9d878097b1be21bc1dc1bdeb3cddb47710e3a6329e62d63af46a83d55e8af3', '[\"*\"]', NULL, NULL, '2024-08-25 15:02:26', '2024-08-25 15:02:26'),
(50, 'App\\Models\\User', 1, 'AdminToken', '2638de231da7ce0656a8b85938b9dcb82478804865e48d2fba6b5c36bbda9117', '[\"*\"]', NULL, NULL, '2024-08-25 15:02:27', '2024-08-25 15:02:27'),
(51, 'App\\Models\\User', 1, 'AdminToken', 'dbce992d3cf9117a9dc247343650e996e4185d18e66e54a6d50a34b287259a0e', '[\"*\"]', NULL, NULL, '2024-08-25 15:05:02', '2024-08-25 15:05:02'),
(52, 'App\\Models\\User', 1, 'AdminToken', '13a7e79bd9aaead13a50cd99f4cf042a438d22149e9cb7ce493f43e28119d37b', '[\"*\"]', NULL, NULL, '2024-08-25 15:05:30', '2024-08-25 15:05:30'),
(53, 'App\\Models\\User', 1, 'AdminToken', '3df5919dea2ad0b248f9c5b47bac95086e18069fc5548ae045e52d74537bc1e5', '[\"*\"]', NULL, NULL, '2024-08-25 16:28:05', '2024-08-25 16:28:05'),
(54, 'App\\Models\\User', 1, 'AdminToken', 'eb232f9aa977581b1787440686db090ce9adbcfd7ae73191fea1721cfb16cf0a', '[\"*\"]', NULL, NULL, '2024-08-25 17:26:33', '2024-08-25 17:26:33'),
(55, 'App\\Models\\User', 1, 'AdminToken', '08b400a3fa01e009814b124ae99aa9a72f6d76b055e2f978351bade5e2619b23', '[\"*\"]', NULL, NULL, '2024-08-25 17:32:04', '2024-08-25 17:32:04'),
(56, 'App\\Models\\User', 1, 'AdminToken', '62b307209eab52ec197aa78f97de85550eb17f162662fde32d45e2ec24df61cc', '[\"*\"]', NULL, NULL, '2024-08-25 17:32:39', '2024-08-25 17:32:39'),
(57, 'App\\Models\\User', 1, 'AdminToken', '69fdc47fc8d721520ca4b273aa3f30a782310672e566c4c7f06c12dfa8b01497', '[\"*\"]', NULL, NULL, '2024-08-25 17:36:19', '2024-08-25 17:36:19'),
(58, 'App\\Models\\User', 1, 'AdminToken', '4c46b5568585bda85a28df391424d6417775e61094bcff20142caa628927c661', '[\"*\"]', NULL, NULL, '2024-08-25 17:38:06', '2024-08-25 17:38:06'),
(59, 'App\\Models\\User', 1, 'AdminToken', '9411802728364b0c02a6ec07af054e19a10e32a1119f8ce475473db7640b04f2', '[\"*\"]', NULL, NULL, '2024-08-25 17:41:46', '2024-08-25 17:41:46'),
(60, 'App\\Models\\User', 1, 'AdminToken', '8fefc682c2bd1e75cd6acf78fe7e7fae5b4969d67acea53388abddb1b50792e9', '[\"*\"]', NULL, NULL, '2024-08-25 17:42:52', '2024-08-25 17:42:52'),
(61, 'App\\Models\\User', 1, 'AdminToken', 'eb4f5a5ca2a87eb346bee5dd9b4bd5039e40fdedf267b45d7078d2c317540613', '[\"*\"]', NULL, NULL, '2024-08-25 17:43:42', '2024-08-25 17:43:42'),
(62, 'App\\Models\\User', 1, 'AdminToken', 'a212410977de7e2ef4f4dc6499ce4adea7ca518eb457c4075a90d1ed086191ce', '[\"*\"]', NULL, NULL, '2024-08-25 17:45:13', '2024-08-25 17:45:13'),
(63, 'App\\Models\\User', 1, 'AdminToken', '07855396efb3dc95c5c2c3c329e4725fe3071396e9bd72c6cdba1c775a25cdbc', '[\"*\"]', NULL, NULL, '2024-08-26 03:36:06', '2024-08-26 03:36:06'),
(64, 'App\\Models\\User', 1, 'AdminToken', '33139028be8fe50c271f0275bc84c4647e5da1f2274f11daaba319d2626996d8', '[\"*\"]', NULL, NULL, '2024-08-26 03:36:39', '2024-08-26 03:36:39'),
(65, 'App\\Models\\User', 1, 'AdminToken', 'a584eed35e3c3ef0ee1a35c4272bf6178b75e449952de4df6969d1feef31c83b', '[\"*\"]', '2024-08-26 04:15:19', NULL, '2024-08-26 03:45:10', '2024-08-26 04:15:19'),
(66, 'App\\Models\\User', 1, 'AdminToken', 'e1949da4cba4b8e74566c7e47b6bc76089b9979b812c474d59caf6671ac88afe', '[\"*\"]', '2024-08-26 04:38:51', NULL, '2024-08-26 04:09:18', '2024-08-26 04:38:51'),
(67, 'App\\Models\\User', 1, 'AdminToken', 'e2ee74beac4428ff322a3aeacc567634ceada7302a345a853ebce21f5d5123c1', '[\"*\"]', '2024-08-26 05:21:34', NULL, '2024-08-26 04:55:08', '2024-08-26 05:21:34'),
(68, 'App\\Models\\User', 1, 'AdminToken', '5fa9adc1925e30d00f446645bb24b88eb5fc0da5c0ad44d2077133d416c0b581', '[\"*\"]', '2024-08-26 05:38:14', NULL, '2024-08-26 05:38:06', '2024-08-26 05:38:14'),
(69, 'App\\Models\\User', 1, 'AdminToken', 'e9b1c66f3ddc92be00dd893e54324826c9b1430ef12f38a3309f859bf4fa8641', '[\"*\"]', '2024-08-26 07:31:45', NULL, '2024-08-26 07:02:08', '2024-08-26 07:31:45'),
(70, 'App\\Models\\User', 1, 'AdminToken', '119274862fd7b708eacdb39f215f6c1c481b51b8ae0bca0deea4cef71250ed8b', '[\"*\"]', '2024-08-26 07:38:17', NULL, '2024-08-26 07:32:59', '2024-08-26 07:38:17'),
(71, 'App\\Models\\User', 1, 'AdminToken', '373d6b19295cedd8427e397f540095e12e110824dd1e7a6649ec487625f57067', '[\"*\"]', '2024-08-26 08:33:47', NULL, '2024-08-26 08:09:03', '2024-08-26 08:33:47'),
(72, 'App\\Models\\User', 1, 'AdminToken', '836304a48cbb96682f4e11638861eb886bf0bce92701ba2f2df7e5cfadabda83', '[\"*\"]', '2024-08-26 09:50:51', NULL, '2024-08-26 09:21:34', '2024-08-26 09:50:51'),
(73, 'App\\Models\\User', 1, 'AdminToken', '5b7d635e876c1c4fd2e41f6521301e530e07cca4468f9c5971653073d6ab1807', '[\"*\"]', '2024-08-26 10:23:19', NULL, '2024-08-26 09:53:55', '2024-08-26 10:23:19'),
(74, 'App\\Models\\User', 1, 'AdminToken', 'bf60bae3c7a9150aacbc7c262017c625c7fdd236834b3b781a67cb8e0061f8f7', '[\"*\"]', '2024-08-26 10:55:23', NULL, '2024-08-26 10:25:26', '2024-08-26 10:55:23'),
(75, 'App\\Models\\User', 1, 'AdminToken', '9ab3b832d0ef52eab1e6de066e31d57a1232e8739cae6f94bc874c9f87d26498', '[\"*\"]', '2024-08-26 11:26:05', NULL, '2024-08-26 10:56:10', '2024-08-26 11:26:05'),
(76, 'App\\Models\\User', 1, 'AdminToken', '267e06fc0a5b9300dd64ad773313c5f3366e44b78ba50af47748849a708b0f37', '[\"*\"]', '2024-08-26 11:42:50', NULL, '2024-08-26 11:27:25', '2024-08-26 11:42:50'),
(77, 'App\\Models\\User', 1, 'AdminToken', '73855a0064b522286b7d441e01ea314d6dad8ff8ffded0e52f33c0a6bb091ca5', '[\"*\"]', '2024-08-26 15:31:25', NULL, '2024-08-26 15:30:06', '2024-08-26 15:31:25'),
(78, 'App\\Models\\User', 3, 'AdminToken', 'afac697c6a1aad1d2a7847dea2bd6397677f9dda1bd9d887ff6bab9957c773b5', '[\"*\"]', NULL, NULL, '2024-08-26 15:50:08', '2024-08-26 15:50:08'),
(79, 'App\\Models\\User', 3, 'AdminToken', 'a4d2d64b01423a13839f40343b38386d878597c3a7c9864b992cc7f4f1d6f50a', '[\"*\"]', '2024-08-26 15:54:18', NULL, '2024-08-26 15:53:45', '2024-08-26 15:54:18'),
(80, 'App\\Models\\User', 3, 'UserToken', 'c718b17461151cd1fc64a55b3e784b025a2ab1536897fd3f9830ea25b64ebb7a', '[\"*\"]', NULL, NULL, '2024-08-26 15:56:32', '2024-08-26 15:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int NOT NULL DEFAULT '1' COMMENT '1 => Available, 0 => Upcoming',
  `status` int NOT NULL DEFAULT '0' COMMENT '1 => Active, 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `price`, `image`, `category`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Product 2', 'Product 2 Description', 2000.00, 'images/uploads/products/1724645641.png', 0, 1, '2024-08-26 04:14:01', '2024-08-26 11:08:57'),
(3, 'Product 3', 'Product 3 Description', 3000.00, 'images/uploads/products/1724645662.png', 1, 1, '2024-08-26 04:14:22', '2024-08-26 04:14:22'),
(4, 'Product 4', 'Product 4 description', 4000.00, 'images/uploads/products/1724661218.png', 0, 1, '2024-08-26 08:33:38', '2024-08-26 08:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_has_users`
--

CREATE TABLE `product_has_users` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '0 => Inactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, NULL, NULL),
(2, 'user', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '0 => Inactive, 1 => Active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `profile_image`, `email_verified_at`, `password`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, NULL, '2024-08-24 17:22:09', '$2y$12$vHQ.ND8W4I8A94G.1B8i1uNtGOcc0tLHpHbAM3BEz4vOgqLJSeEEi', 1, 1, NULL, '2024-08-24 17:22:09', '2024-08-24 17:22:09'),
(2, 'user 1', 'user1@gmail.com', '075245896', NULL, NULL, '$2y$12$XGbjfoXS25dLXP1DyO8K7ekJV/j2dNfWPl3SdDXbAkXZ3BBQGB/e6', 2, 1, NULL, '2024-08-25 06:03:32', '2024-08-25 06:03:32'),
(3, 'Rishan Umayanga', 'a@gmail.com', '0710685683', NULL, NULL, '$2y$12$aBSmKY4U8JiOYn8ehtr9q.LveYcjcFkgMNySDGLeIs7Rx2ZwiSVC.', 2, 1, NULL, '2024-08-26 15:50:08', '2024-08-26 15:50:08');

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_has_users`
--
ALTER TABLE `product_has_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_has_users`
--
ALTER TABLE `product_has_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
