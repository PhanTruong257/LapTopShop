-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 02:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptopshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'Lenovo'),
(3, 'Dell'),
(4, 'Apple'),
(5, 'Asus'),
(6, 'LG'),
(7, 'toshiba');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `quantity` int(11) DEFAULT NULL COMMENT '购买商品数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `payment`, `pay_time`) VALUES
(10021, 2, 25796.00, '2019-06-08 21:31:08'),
(10022, 2, 23997.00, '2019-06-09 00:00:14'),
(10023, 2, 3999.00, '2019-06-09 00:09:07'),
(10024, 2, 4099.00, '2019-06-09 00:09:13'),
(10025, 2, 5299.00, '2019-06-09 00:09:17'),
(10026, 2, 5299.00, '2019-06-09 00:09:20'),
(10027, 2, 8098.00, '2019-06-09 00:10:11'),
(10028, 2, 11298.00, '2019-06-09 00:10:17'),
(10029, 2, 5999.00, '2019-06-09 00:10:21'),
(10030, 2, 5299.00, '2019-06-09 00:10:24'),
(10031, 2, 5299.00, '2019-06-09 00:10:28'),
(10032, 2, 17297.00, '2019-06-09 09:32:47'),
(10033, 2, 41691.00, '2019-06-09 10:21:33'),
(10034, 2, 13097.00, '2019-06-09 14:18:25'),
(10035, 2, 6188.00, '2019-06-09 22:21:42'),
(10036, 3, 7998.00, '2019-06-09 22:24:22'),
(10037, 3, 20095.00, '2019-06-09 22:26:14'),
(10038, 2, 1999800.00, '2019-06-09 22:29:43'),
(10039, 3, 239940.00, '2019-06-09 23:18:14'),
(10040, 2, 38094.00, '2019-06-10 08:28:19'),
(10041, 2, 45292.00, '2019-06-10 08:29:31'),
(10042, 2, 8098.00, '2019-06-10 08:30:43'),
(10043, 2, 17997.00, '2019-06-10 09:18:54'),
(10044, 2, 372114.00, '2019-06-11 14:51:13'),
(10045, 2, 40990.00, '2019-06-11 15:00:56'),
(10046, 2, 623048.00, '2019-06-11 15:02:34'),
(10047, 2, 4099.00, '2019-06-11 15:10:31'),
(10048, 2, 36891.00, '2019-06-11 15:12:55'),
(10049, 4, 11998.00, '2019-06-11 15:18:29'),
(10050, 5, 9999.00, '2019-06-11 15:56:42'),
(10051, 5, 11998.00, '2019-06-11 15:58:06'),
(10052, 5, 783804.00, '2019-06-11 15:58:51'),
(10053, 2, 5999.00, '2019-06-13 13:07:45'),
(10054, 2, 29997.00, '2019-06-14 07:53:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_price` decimal(50,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(50,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `user_id`, `order_id`, `product_name`, `product_image`, `product_price`, `quantity`, `total_price`) VALUES
(6, 2, 10021, '联想 拯救者Y7000', 'lenovo-拯救者-Y7000.jpg', 6299.00, 2, 12598.00),
(7, 2, 10021, 'Apple MacBook Air', 'Apple-MacBook-Air.jpg', 8299.00, 1, 8299.00),
(8, 2, 10021, '联想 小新潮7000', 'lenovo-小新-潮7000.jpg', 4899.00, 1, 4899.00),
(9, 2, 10022, '华为 MateBook X Pro', 'huawei-matebook-x-pro.jpg', 9999.00, 2, 19998.00),
(10, 2, 10022, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 1, 3999.00),
(11, 2, 10023, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 1, 3999.00),
(12, 2, 10024, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(13, 2, 10025, '联想 小新Air', 'lenovo-小新-air.jpg', 5299.00, 1, 5299.00),
(14, 2, 10026, '联想 小新Air', 'lenovo-小新-air.jpg', 5299.00, 1, 5299.00),
(15, 2, 10027, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 1, 3999.00),
(16, 2, 10027, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(17, 2, 10028, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 1, 5999.00),
(18, 2, 10028, '联想 小新Air', 'lenovo-小新-air.jpg', 5299.00, 1, 5299.00),
(19, 2, 10029, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 1, 5999.00),
(20, 2, 10030, '联想 小新Air', 'lenovo-小新-air.jpg', 5299.00, 1, 5299.00),
(21, 2, 10031, '联想 小新Air', 'lenovo-小新-air.jpg', 5299.00, 1, 5299.00),
(22, 2, 10032, 'Apple MacBook Air', 'Apple-MacBook-Air.jpg', 8299.00, 1, 8299.00),
(23, 2, 10032, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(24, 2, 10032, '联想 小新潮7000', 'lenovo-小新-潮7000.jpg', 4899.00, 1, 4899.00),
(25, 2, 10033, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 5, 20495.00),
(26, 2, 10033, '联想 小新Air', 'lenovo-小新-air.jpg', 5299.00, 4, 21196.00),
(27, 2, 10034, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 2, 8198.00),
(28, 2, 10034, '联想 小新潮7000', 'lenovo-小新-潮7000.jpg', 4899.00, 1, 4899.00),
(29, 2, 10035, '华硕 灵耀S 2代', '3ec5b854-09e9-4a93-a089-0cb3ff31d015.jpg', 6188.00, 1, 6188.00),
(30, 3, 10036, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 2, 7998.00),
(31, 3, 10037, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 4, 15996.00),
(32, 3, 10037, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(33, 2, 10038, '华为 MateBook X Pro', 'huawei-matebook-x-pro.jpg', 9999.00, 200, 1999800.00),
(34, 3, 10039, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 60, 239940.00),
(35, 2, 10040, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 1, 5999.00),
(36, 2, 10040, '华为 MateBook X Pro', 'huawei-matebook-x-pro.jpg', 9999.00, 2, 19998.00),
(37, 2, 10040, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 2, 7998.00),
(38, 2, 10040, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(39, 2, 10041, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 1, 3999.00),
(40, 2, 10041, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 4, 16396.00),
(41, 2, 10041, 'Apple MacBook Air', 'Apple-MacBook-Air.jpg', 8299.00, 3, 24897.00),
(42, 2, 10042, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 1, 3999.00),
(43, 2, 10042, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(44, 2, 10043, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 3, 17997.00),
(45, 2, 10044, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 1, 5999.00),
(46, 2, 10044, '华为 MateBook X Pro', 'huawei-matebook-x-pro.jpg', 9999.00, 3, 29997.00),
(47, 2, 10044, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 82, 336118.00),
(48, 2, 10045, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 10, 40990.00),
(49, 2, 10046, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 152, 623048.00),
(50, 2, 10047, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 1, 4099.00),
(51, 2, 10048, '荣耀 MagicBook 2019', 'honor-magicbook-2019.jpg', 4099.00, 9, 36891.00),
(52, 4, 10049, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 2, 11998.00),
(53, 5, 10050, '华为 MateBook X Pro', 'huawei-matebook-x-pro.jpg', 9999.00, 1, 9999.00),
(54, 5, 10051, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 2, 11998.00),
(55, 5, 10052, '华为 MateBook E', 'huawei-matebook-e.jpg', 3999.00, 196, 783804.00),
(56, 2, 10053, '华为 MateBook 14', 'huawei-matebook14.jpg', 5999.00, 1, 5999.00),
(57, 2, 10054, '华为 MateBook X Pro', 'huawei-matebook-x-pro.jpg', 9999.00, 3, 29997.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` decimal(50,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `brand_id`, `name`, `image`, `detail`, `stock`, `price`) VALUES
(10012, 1, 'Macbook AIR', 'b25c9c36-09dc-4347-833f-debc783ec814.jpg', 'siêu ngon, mua về là dùng code như rồng', 12, 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` int(4) DEFAULT NULL COMMENT '\r\n',
  `real_name` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login_name`, `password`, `role`, `real_name`, `phone`, `address`) VALUES
(1, 'admin', 'admin', 1, 'PT', '888888', 'hehe'),
(3, '11', '11', 0, NULL, NULL, NULL),
(4, 'user2', '1234', 0, NULL, NULL, NULL),
(5, '222', '222', 0, NULL, NULL, NULL),
(6, 'user3', '1234', 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10055;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10013;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
