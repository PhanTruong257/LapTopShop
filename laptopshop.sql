-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:47 AM
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
(7, 'toshiba'),
(16, 'Hp'),
(17, 'Acer');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
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
(10055, 3, 20000.00, '2024-12-18 15:21:22'),
(10056, 3, 30480.00, '2024-12-18 15:21:34');

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
(58, 3, 10055, 'Macbook AIR', 'Apple-MacBook-Air.jpg', 20000.00, 1, 20000.00),
(59, 3, 10056, 'Acer Aspire 7', '45b822b6-26fb-41f6-a786-77c829141993.jpg', 13990.00, 1, 13990.00),
(60, 3, 10056, 'Acer Swift Go 14', 'ea357541-7cac-40af-a644-4635f3892c36.jpg', 16490.00, 1, 16490.00);

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
(10012, 1, 'Macbook AIR', 'Apple-MacBook-Air.jpg', 'siêu ngon, mua về là dùng code như rồng', 10, 20000.00),
(10013, 16, 'HP Pavilion X360 14', '8cb6fbec-c05a-4dfc-9329-a8d201ae67cc.jpg', 'Laptop HP Pavilion X360 14 ek2024TU Core 5 120U/16GB/512GB/Touch/Pen/Win11 (9Z2V6PA)', 10, 19000.00),
(10015, 17, 'Acer Aspire 7', '45b822b6-26fb-41f6-a786-77c829141993.jpg', 'Laptop Acer Aspire 7 A715 76 53PJ i5 12450H/16GB/512GB/Win11 (NH.QGESV.007)', 9, 13990.00),
(10016, 17, 'Acer Aspire 5', '72c8589d-26b6-49c6-80d4-5b4d7ff55018.jpg', 'Laptop Acer Aspire 5 A514 54 5127 i5 1135G7/8GB/512GB/Win11 (NX.A28SV.007)', 10, 18990.00),
(10017, 17, 'Acer Aspire 3', 'ed94ee94-9833-4b65-895f-12542d5b7aa1.jpg', 'Laptop Acer Aspire 3 A315 58 529V i5 1135G7/8GB/256GB/Win11 (NX.ADDSV.00N)', 10, 8990.00),
(10018, 17, 'Acer Aspire Lite', '2d50cc7a-3067-49a9-b1df-e8d723f881c9.jpg', 'Laptop Acer Aspire Lite AL16 51P 596H i5 1235U/8GB/512GB/Win11 (NX.KWZSV.002)', 10, 12690.00),
(10019, 17, 'Acer Aspire Lite 15', 'cc392d13-b303-4d28-ba83-021443ad2e66.jpg', 'Laptop Acer Aspire Lite 15 51M 55NB i5 1155G7/8GB/512GB/Win11 (NX.KRSSV.001)', 10, 11190.00),
(10020, 17, 'Acer Aspire Lite 14', '5144a6c4-ec66-45bf-9e0f-eb59776c6057.jpg', 'Laptop Acer Aspire Lite 14 51M 59BN i5 1235U/16GB/512GB/Win11 (NX.KTXSV.001)', 10, 13490.00),
(10021, 17, 'Acer Swift Go 14', 'ea357541-7cac-40af-a644-4635f3892c36.jpg', 'Laptop Acer Swift Go 14 41 R251 R5 7430U/16GB/1TB/Win11 (NX.KG3SV.005)', 9, 16490.00);

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
(3, '11', '11', 0, 'hehe', '0123456789', 'hehe'),
(4, 'user2', '1234', 0, 'hehe2', '0123456788', 'hehe2'),
(5, '222', '222', 0, 'hehe3', '0123456787', 'hehe3'),
(6, 'user3', '1234', 0, 'hehe4', '0123456786', 'hehe4');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10057;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10022;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;