-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2020 at 10:57 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virtual_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Balte', 'bxrute', 'bxrute@gmail.com', '$2y$10$W0S.DfzhLNMfaGn7v9eC8u.ZB0hitLegOKeHgxq1.xwEjnLYgpS7O', NULL, '2020-07-28 00:31:58', '2020-07-28 00:31:58'),
(2, 'admin01', 'admin01', 'admin01@gmail.com', '$2y$10$7P/Epkk4Wg6twG9rjRNR/e2zczjVZBqHMdEMJlD.jKdIheUgDEOIu', NULL, '2020-07-28 00:32:30', '2020-07-28 00:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoices_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_status` tinyint(1) NOT NULL DEFAULT '0',
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoices_id`, `user_phone`, `item_id`, `invoice_status`, `item_name`, `quantity`, `option`, `message`, `price`, `created_at`, `updated_at`) VALUES
(1, 'AAA085710552349', '085710552349', 'LPOM01', 1, 'Lamb Chops with Pomegranate Sauce', 4, 'With Mashed Potato', '-', 210000, '2020-08-06 08:23:10', '2020-08-06 08:59:30'),
(2, 'AAA085710552349', '085710552349', 'SPBO01', 1, 'Spaghetti Bolognese', 1, '-', 'give me extra sauce', 25000, '2020-08-06 08:24:59', '2020-08-06 08:59:30'),
(3, 'AAA085710552349', '085710552349', 'SPBO02', 1, 'Spaghetti Bolognese', 2, '-', '-', 50000, '2020-08-06 08:26:23', '2020-08-06 08:59:30'),
(4, 'AAA088225961003', '088225961003', 'LPOM01', 1, 'Lamb Chops with Pomegranate Sauce', 3, 'With Mashed Potato', '-', 157500, '2020-08-06 08:28:36', '2020-08-06 08:43:37'),
(6, 'AAB088225961003', '088225961003', 'MPEK01', 0, 'Pempek', 2, 'Kapal Selam', '-', 30000, '2020-08-06 08:50:25', '2020-08-06 08:50:25'),
(8, 'AAB088225961003', '088225961003', 'TENS01', 0, 'Tenderloin Steak', 1, 'Medium Rare', 'Mushroom sauce', 85000, '2020-08-06 08:51:05', '2020-08-06 08:51:05'),
(11, 'AAA085591452814', '085591452814', 'MBGR01', 0, 'Monster Burger', 2, 'With Ground Beef', '-', 100000, '2020-08-06 09:02:26', '2020-08-06 09:02:26'),
(12, 'AAA081225128703', '081225128703', 'LASA01', 1, 'Lasagna', 1, '-', '-', 37500, '2020-08-06 09:05:45', '2020-08-06 09:06:04'),
(13, 'AAB081225128703', '081225128703', 'LPOM01', 1, 'Lamb Chops with Pomegranate Sauce', 2, 'With Mashed Potato', '-', 105000, '2020-08-06 09:06:27', '2020-08-06 09:06:40'),
(15, 'AAC081225128703', '081225128703', 'SPBO01', 1, 'Spaghetti Bolognese', 2, '-', '-', 50000, '2020-08-06 09:07:36', '2020-08-06 09:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `menu_id` char(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `options` varchar(1000) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `description` varchar(2000) NOT NULL,
  `poster` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_id`, `name`, `category`, `price`, `options`, `rating`, `description`, `poster`) VALUES
(1, 'CTIM', 'Chicken Tikka Masala', 'western', 25000, NULL, 0, 'Bored with roasted or grilled chicken? Then, you should try our creamy yet juicy, boneless chicken cooked with our freshly harvested vegetables and long-shaped japanese rice. Full of incredible flavors!', 'chicken-tikka-masala-1.jpg'),
(2, 'LPOM', 'Lamb Chops with Pomegranate Sauce', 'western', 52500, 'with mashed potato,with baked potato', 0, 'Experience the tenderness of the finest lamb rib in town covered by red wine and pomegranate sauce. It\'s elegant, flavorful, and addicting.', 'lamb-chops-with-pomegranate-sauce.jpg'),
(3, 'LASA', 'Lasagna', 'western', 37500, NULL, 0, 'Nowadays, you don\'t have to travel to Emilia-Romagna to taste the best lasagna. Instead, try our italian-standard lasagna with meaty bolognese sauce and creamy bechamel mingling between chewy pasta layers. Also, it\'s big. So, make sure to bring your friends or family when you eat this!', 'lasagna.jpg'),
(4, 'SPBO', 'Spaghetti Bolognese', 'western', 25000, NULL, 0, 'It may look like a regular spaghetti. But, what makes our spaghetti special is, we don\'t use packed or canned bolognese sauce. Instead, we make our ground beef and sauce. More beefy and tasty!', 'spaghetti-bolognese.jpg'),
(5, 'MBGR', 'Monster Burger', 'western', 50000, 'with ground beef,with chicken fillet,with fish fillet', 0, 'As the name says, it\'s huge! Thick meat pressed between fresh vegetables and buns accompanied by crispy french fries. See if you can b-eat the monster!', 'monster-burger.jpg'),
(6, 'TENS', 'Tenderloin Steak', 'western', 85000, 'rare,medium rare,medium,well done', 0, 'Feel the elegance while trying our 200gr tenderloin steak that will satisfy your desire. Made with super tender yet juicy meat covered in thick, strong sauce and fresh vegetables. Available with Blackpepper sauce, BBQ sauce and Mushroom sauce.', 'tenderloin-steak.jpg'),
(7, 'GADO', 'Gado Gado', 'indonesian', 12000, NULL, 0, 'Gado gado is an Indonesian salad contains vegetables such as carrots, cabbage, tomato, long bean mixed with eggs, tofu, and potato covered in peanut sauce. What a feast for a salad!', 'gado-gado.jpg'),
(8, 'PDNG', 'Nasi Padang', 'indonesian', 22000, 'rendang,grilled chicken', 0, 'If any foreigner being asked about what Indonesian food they know, then this is what they will mostly answer. Try the famous, UNESCO-approved rendang (palm-sized beef with special seasoning) and you\'ll addicted to it.', 'nasi-padang.jpg'),
(9, 'MPEK', 'Pempek', 'indonesian', 15000, 'kapal selam,lenjer', 0, 'Pempek is an Indonesian fishcake, made of fish (mostly mackerel) and tapioca, soaked in rich sweet and sour sauce called cuko. I\'m going to be honest, the cuko is crazily good.', 'pempek.jpg'),
(10, 'KONR', 'Sup Konro', 'indonesian', 49900, 'with rice,with ketupat', 0, 'One of Indonesia\'s best soup is here just for you. Konro is a rib soup mixed with herbs and spices. Usually eaten with rice or ketupat (cube-shaped rice). Taste the savoury of Indonesian soup!', 'sup-konro-1.jpg'),
(11, 'SEBL', 'Seblak', 'indonesian', 15000, 'spicy level 1,spicy level 2,spicy level 3,spicy level 4,spicy level 5', 0, 'If you like spicy food, then put seblak in your list. Seblak is made of wet kerupuk (starch cracker), scrambled egg, meatballs or sausages, noodles, vegetables, and extremely hot chili sauce. You can choose the spiciness level from level 1 (not spicy at all) to level 5 (the hottest). It takes some courage to eat it. And yes, it\'s edible.', 'seblak-2.jpg'),
(12, 'GAYO', 'Aceh Gayo Coffee', 'beverages', 10000, 'espresso,coffe latte,sugar only', 0, '[Arabica | Single origin | Specialty grade] Try the famous Aceh Gayo coffee originated from Aceh, Indonesia. It has bold body, medium acidity, intense sweetness, and chocolate aftertaste.', 'aceh-gayo-coffee.jpg'),
(13, 'FRUT', 'Fresh Juice', 'beverages', 9000, 'orange,strawberry,avocado,banana,mango,soursop,apple,pear,guava,melon,kiwi,tomato,carrot', 0, 'Fresh juice from freshly harvested fruit. We subtituted sugar with honey, so don\'t worry.', 'fruit-juice.jpg'),
(14, 'SOFT', 'Soft Drink', 'beverages', 7000, 'pepsi,coca-cola,fanta,sprite', 0, 'Complete your feast with our soft drinks.', 'soft-drink.jpg'),
(15, 'GTEA', 'Green Tea', 'beverages', 5000, 'hot + with sugar,iced + with sugar,hot + without sugar,iced + without sugar', 0, 'Taste our green tea harvested from local farm.', 'green-tea-2.jpg'),
(17, 'BSPL', 'Banana Split', 'dessert', 15000, NULL, 0, 'Banana with three-flavors ice cream poured by dark chocolate.', 'banana-split.jpg'),
(18, 'PARF', 'Yogurt Parfait with Triple Berries', 'dessert', 20000, NULL, 0, 'Complete your feast by ordering our special parfait consists of non-flavored yogurt, vanilla ice cream, and triple berries (strawberry, blueberry, and raspberry).', 'parfait.jpg'),
(19, 'AQUA', 'Mineral Water', 'beverages', 3000, 'iced,without ice', 0, 'Be healthy by drinking mineral water regularly.', 'water.jpg'),
(20, 'CINC', 'Iced Cincau', 'beverages', 5000, NULL, 0, 'Plain milk? Choco milk? Boring. Instead, try one of the most delicious drink in Indonesia. It\'s a glass of milk combined with cincau (grass jelly) and brown sugar. Sweet and chewy.', 'cincau-2.jpg');

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
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2020_06_27_193607_create_invoices_table', 1),
(17, '2020_07_28_043643_create_admins_table', 2),
(18, '2020_07_28_044544_create_admins_table', 3),
(19, '2020_07_28_045118_update_users_table', 4),
(20, '2020_08_06_145520_update_users_add_phone_column', 5),
(21, '2020_08_06_145936_update_invoices_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marco Reus', 'reus', 'reus@gmail.com', '088225961003', '$2y$10$kRIxtX5PObU2Jz1ljR4MSOY2KdTIUaVA61OG.DfF/kS.YOMKUqAvu', NULL, '2020-08-06 08:12:57', '2020-08-06 08:12:57'),
(4, 'Mario Balotelli', 'mb459', 'mb459@gmail.com', '081225128703', '$2y$10$i4utDPFlVMqTd4/.SQrsTO1stZBcROopihLfZxeM2byvnuXkuIB1G', NULL, '2020-08-06 08:15:39', '2020-08-06 08:15:39'),
(5, 'Zinedine Zidane', 'zidanezz', 'z.zidane@realmadrid.es', '5551945203', '$2y$10$yl/e2MlrgYcyvCdeMJ2h0.7K72uGN5WhRYTQPpcs8KF6xSFOIsaBS', NULL, '2020-08-09 13:39:18', '2020-08-09 13:39:18'),
(6, 'Theo Hernandez', 'theo', 'theo.hernandez@acmilan.it', '555123915', '$2y$10$Xb0fpwnP7dDz82.VVdyOw.KZANLBlUUiM8fmETrwUDxgxUILDKUT2', NULL, '2020-08-09 13:57:37', '2020-08-09 13:57:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
