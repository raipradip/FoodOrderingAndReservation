-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 19, 2021 at 01:13 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `email` varchar(2556) NOT NULL,
  `pname` varchar(2556) NOT NULL,
  `rname` varchar(2556) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `pid`, `email`, `pname`, `rname`, `qty`, `price`, `total`) VALUES
(30, 15, 'jayana@gamil.com', 'Samosa', 'Bhojan Griha', 1, 15, 15),
(31, 16, 'jayana@gamil.com', 'Thakali Set', 'Bhojan Griha', 1, 300, 300);

-- --------------------------------------------------------

--
-- Table structure for table `chair_detail`
--

CREATE TABLE `chair_detail` (
  `id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `booked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chair_detail`
--

INSERT INTO `chair_detail` (`id`, `table_id`, `booked`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 2, 0),
(6, 2, 0),
(7, 2, 0),
(8, 3, 0),
(9, 4, 1),
(10, 7, 0),
(11, 8, 0),
(12, 8, 0),
(13, 8, 0),
(14, 8, 0),
(21, 7, 0),
(22, 7, 0),
(23, 4, 1),
(24, 4, 1),
(25, 4, 0),
(26, 5, 0),
(27, 5, 0),
(28, 9, 0),
(29, 9, 0),
(30, 9, 0),
(31, 9, 0),
(32, 3, 0),
(33, 3, 0),
(34, 3, 0),
(35, 6, 0),
(36, 6, 0),
(37, 6, 0),
(38, 6, 0),
(39, 6, 0),
(40, 6, 0),
(41, 10, 0),
(42, 10, 0),
(43, 10, 0),
(44, 11, 0),
(45, 11, 0),
(46, 11, 0),
(47, 11, 0),
(48, 12, 0),
(49, 12, 0),
(50, 12, 0),
(51, 12, 0),
(52, 13, 0),
(53, 13, 0),
(54, 13, 0),
(55, 14, 0),
(56, 14, 0),
(57, 14, 0),
(58, 14, 0),
(59, 14, 0),
(60, 14, 0),
(61, 15, 0),
(62, 15, 0),
(63, 15, 0),
(64, 15, 0),
(65, 16, 0),
(66, 16, 0),
(67, 16, 0),
(68, 17, 0),
(69, 17, 0),
(70, 17, 0),
(71, 17, 0),
(72, 17, 0),
(73, 17, 0),
(74, 18, 0),
(75, 18, 0),
(76, 18, 0),
(77, 19, 0),
(78, 19, 0),
(79, 19, 0),
(80, 19, 0),
(81, 20, 0),
(82, 20, 0),
(83, 20, 0),
(84, 21, 0),
(85, 21, 0),
(86, 21, 0),
(87, 22, 0),
(88, 22, 0),
(89, 22, 0),
(90, 22, 0),
(91, 22, 0),
(92, 22, 0),
(93, 23, 0),
(94, 23, 0),
(95, 23, 0),
(96, 23, 0),
(97, 24, 0),
(98, 24, 0),
(99, 24, 0),
(100, 24, 0),
(101, 24, 0),
(102, 24, 0),
(103, 25, 0),
(104, 25, 0),
(105, 25, 0),
(106, 25, 0),
(107, 26, 0),
(108, 26, 0),
(109, 26, 0),
(110, 27, 0),
(111, 27, 0),
(112, 27, 0),
(113, 28, 0),
(114, 28, 0),
(115, 28, 0),
(116, 28, 0),
(117, 28, 0),
(118, 29, 0),
(119, 29, 0),
(120, 29, 0),
(121, 29, 0),
(122, 29, 0),
(123, 29, 0),
(124, 30, 0),
(125, 30, 0),
(126, 30, 0),
(127, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chair_reserved`
--

CREATE TABLE `chair_reserved` (
  `id` int(255) NOT NULL,
  `c_id` int(255) NOT NULL,
  `chair_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test@gmail.com'),
(2, 'Amit Thakur', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'amit@gmail.com'),
(3, 'Pradip', '7b4e02e3af3016406c03d2f37036392b1346f66f', '2learn2fun@gmail.com'),
(4, 'suyal', '8b38153f0dd8d9253f15826002da17831b9dd83f', 'jayana@gamil.com'),
(5, 'user', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'user@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `pid` int(100) NOT NULL,
  `rid` int(100) NOT NULL,
  `name` varchar(2556) NOT NULL,
  `image` varchar(2556) NOT NULL,
  `price` int(200) NOT NULL,
  `rname` varchar(2556) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`pid`, `rid`, `name`, `image`, `price`, `rname`) VALUES
(1, 1, 'Buff Chowmin', 'images/items/chowmin.jpg', 200, 'Baneshwor Restaurant'),
(2, 1, 'Veg Chowmin', 'images/items/chowmin2.jpg', 120, 'Baneshwor Restaurant'),
(3, 1, 'Buff MoMo', 'images/items/momo.jpeg', 200, 'Baneshwor Restaurant'),
(5, 2, 'Buff MoMo', 'images/items/momo.jpeg', 150, 'Eddies'),
(6, 2, 'Veg MoMo', 'images/items/momo1.png', 100, 'Eddies'),
(7, 2, 'Buff Chowmin', 'images/items/chowmin2.jpg', 150, 'Eddies'),
(8, 3, 'Buff MoMo', 'images/items/momo.jpeg', 150, 'Atithi Satkar'),
(9, 3, 'Veg MoMo', 'images/items/momo1.png', 120, 'Atithi Satkar'),
(10, 3, 'Buff Chowmin', 'images/items/chowmin3.jpg', 100, 'Atithi Satkar'),
(11, 3, 'Veg Chowmin', 'images/items/chowmin2.jpg', 70, 'Atithi Satkar'),
(12, 2, 'Veg Chowmin', 'images/items/chowmin.jpg', 70, 'Eddies'),
(13, 1, 'Pizza', 'images/items/pizza.jpeg', 500, 'Baneshwor Restaurant'),
(14, 4, 'Fried Rice', 'images/items/friedrice2.jpg', 100, 'Bhojan Griha'),
(15, 4, 'Samosa', 'images/items/samosa.jpg', 15, 'Bhojan Griha'),
(16, 4, 'Thakali Set', 'images/items/thakaliset.jpeg', 300, 'Bhojan Griha'),
(17, 5, 'Thongba', 'images/items/tongba.jpg', 350, 'Le Sherpa'),
(18, 5, 'Thukpa', 'images/items/thukpa.jpg', 200, 'Le Sherpa'),
(19, 5, 'Thenduk', 'images/items/thenduk.jpg', 300, 'Le Sherpa'),
(20, 6, 'Full Khana Set', 'images/items/khanaset.webp', 200, 'Bhojdeals'),
(21, 6, 'Chicken Chilly', 'images/items/chickentandoori.jpg', 250, 'Bhojdeals'),
(22, 6, 'Fish Chilly', 'images/items/fishchilli.jpg', 450, 'Bhojdeals'),
(23, 6, 'Pork Belly', 'images/items/porkbelly.jpg', 450, 'Bhojdeals'),
(27, 7, 'Buff MoMo', 'images/items/momo.jpeg', 200, 'The Bakery and Cafe'),
(31, 7, 'Pizza', 'images/items/pizza1.jpeg', 250, 'The Bakery and Cafe'),
(32, 8, 'Burger', 'images/items/7.jpg', 200, 'Dragon Cafe');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `email` varchar(2556) NOT NULL,
  `pname` varchar(2556) NOT NULL,
  `rname` varchar(2556) NOT NULL,
  `qty` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseid` int(100) NOT NULL,
  `email` varchar(2556) NOT NULL,
  `pname` varchar(2565) NOT NULL,
  `rname` varchar(2556) NOT NULL,
  `qty` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `total` int(250) NOT NULL,
  `lat` double NOT NULL,
  `longt` double NOT NULL,
  `date_purchase` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseid`, `email`, `pname`, `rname`, `qty`, `price`, `total`, `lat`, `longt`, `date_purchase`) VALUES
(1, 'test@gmail.com', 'Buff Chowmin', 'Baneshwor Restaurant', 1, 200, 200, 0, 0, '2020-01-12 23:22:38'),
(2, 'test@gmail.com', 'Veg Chowmin', 'Baneshwor Restaurant', 1, 120, 120, 0, 0, '2020-01-12 23:22:38'),
(3, 'test@gmail.com', 'Buff MoMo', 'Eddies', 1, 150, 150, 0, 0, '2020-01-13 10:09:02'),
(4, 'test@gmail.com', 'Veg MoMo', 'Eddies', 1, 100, 100, 0, 0, '2020-01-13 10:09:02'),
(8, 'test@gmail.com', 'Pizza', 'Baneshwor Restaurant', 1, 500, 500, 0, 0, '2020-01-13 10:13:06'),
(9, 'test@gmail.com', 'Buff Chowmin', 'Baneshwor Restaurant', 1, 200, 200, 0, 0, '2020-01-13 10:16:47'),
(10, 'test@gmail.com', 'Veg Chowmin', 'Baneshwor Restaurant', 1, 120, 120, 0, 0, '2020-01-13 10:16:47'),
(12, 'test@gmail.com', 'Thongba', 'Le Sherpa', 1, 350, 350, 0, 0, '2020-01-13 10:24:14'),
(13, 'test@gmail.com', 'Thukpa', 'Le Sherpa', 1, 200, 200, 0, 0, '2020-01-13 10:24:14'),
(14, 'test@gmail.com', 'Thentuk', 'Le Sherpa', 1, 300, 300, 0, 0, '2020-01-13 10:27:05'),
(19, 'test@gmail.com', 'Thentuk', 'Le Sherpa', 1, 300, 300, 27.671110199999998, 85.344622, '2020-01-13 11:32:59'),
(20, '2learn2fun@gmail.com', 'Buff MoMo', 'Eddies', 1, 150, 150, 27.6714657, 85.3389657, '2020-01-16 09:39:22'),
(21, 'test@gmail.com', 'Fried Rice', 'Bhojan Griha', 1, 100, 100, 27.7399393, 85.303271, '2021-07-23 19:11:51'),
(22, 'test@gmail.com', 'Samosa', 'Bhojan Griha', 1, 15, 15, 27.7399393, 85.303271, '2021-07-23 19:11:51'),
(23, 'test@gmail.com', 'Buff MoMo', 'Baneshwor Restaurant', 1, 200, 200, 27.7399393, 85.303271, '2021-07-23 19:11:51'),
(24, 'test@gmail.com', 'Veg MoMo', 'Eddies', 1, 100, 100, 27.7399393, 85.303271, '2021-07-23 19:11:51'),
(25, 'test@gmail.com', 'Full Khana Set', 'Bhojdeals', 1, 200, 200, 27.7356183, 85.3548338, '2021-07-24 01:11:19'),
(26, 'test@gmail.com', 'Chicken Chilly', 'Bhojdeals', 1, 250, 250, 27.7356183, 85.3548338, '2021-07-24 01:11:19'),
(27, 'test@gmail.com', 'Fish Chilly', 'Bhojdeals', 1, 450, 450, 27.7356183, 85.3548338, '2021-07-24 01:11:19'),
(28, 'test@gmail.com', 'Thenduk', 'Le Sherpa', 1, 300, 300, 27.7356183, 85.3548338, '2021-07-24 01:11:19'),
(29, 'test@gmail.com', 'Thukpa', 'Le Sherpa', 1, 200, 200, 27.7356183, 85.3548338, '2021-07-24 01:11:19'),
(30, 'test@gmail.com', 'Fish Chilly', 'Bhojdeals', 1, 450, 450, 27.7356183, 85.3548338, '2021-07-24 01:15:30'),
(31, 'test@gmail.com', 'Chicken Chilly', 'Bhojdeals', 1, 250, 250, 27.7356183, 85.3548338, '2021-07-24 01:15:30'),
(32, 'amit@gmail.com', 'Buff MoMo', 'Eddies', 1, 150, 150, 27.7357084, 85.3547935, '2021-07-24 13:40:28'),
(33, 'amit@gmail.com', 'Veg MoMo', 'Eddies', 2, 100, 200, 27.7357084, 85.3547935, '2021-07-24 13:40:28'),
(34, 'amit@gmail.com', 'Buff Chowmin', 'Baneshwor Restaurant', 1, 200, 200, 27.7357084, 85.3547935, '2021-07-24 13:40:28'),
(35, 'amit@gmail.com', 'Veg Chowmin', 'Baneshwor Restaurant', 4, 120, 480, 27.7357084, 85.3547935, '2021-07-24 13:40:29'),
(36, 'amit@gmail.com', 'Buff MoMo', 'Baneshwor Restaurant', 5, 200, 1000, 27.7357084, 85.3547935, '2021-07-24 13:40:29'),
(37, 'amit@gmail.com', 'Veg MoMo', 'Eddies', 1, 100, 100, 27.7357084, 85.3547935, '2021-07-24 13:41:39'),
(38, 'amit@gmail.com', 'Buff Chowmin', 'Eddies', 1, 150, 150, 27.7357084, 85.3547935, '2021-07-24 13:41:39'),
(39, 'amit@gmail.com', 'Veg Chowmin', 'Eddies', 1, 70, 70, 27.7357084, 85.3547935, '2021-07-24 13:41:39'),
(40, 'amit@gmail.com', 'Veg Chowmin', 'Baneshwor Restaurant', 1, 120, 120, 27.7357084, 85.3547935, '2021-07-24 13:42:39'),
(41, 'amit@gmail.com', 'Buff Chowmin', 'Baneshwor Restaurant', 1, 200, 200, 27.7357084, 85.3547935, '2021-07-24 13:42:39'),
(42, 'amit@gmail.com', 'Pizza', 'Baneshwor Restaurant', 1, 500, 500, 27.7357084, 85.3547935, '2021-07-24 13:42:39'),
(43, 'amit@gmail.com', 'Buff MoMo', 'The Bakery and Cafe', 2, 200, 400, 27.7357084, 85.3547935, '2021-07-24 14:22:27'),
(44, 'amit@gmail.com', 'Pizza', 'The Bakery and Cafe', 3, 250, 750, 27.7357084, 85.3547935, '2021-07-24 14:22:27'),
(45, 'test@gmail.com', 'Buff MoMo', 'Eddies', 1, 150, 150, 27.7357084, 85.3547935, '2021-07-24 14:58:45'),
(46, 'test@gmail.com', 'Veg MoMo', 'Eddies', 1, 100, 100, 27.7357084, 85.3547935, '2021-07-24 14:58:45'),
(47, 'user@gmail.com', 'Veg MoMo', 'Atithi Satkar', 1, 120, 120, 27.719313699999997, 85.38957189999999, '2021-07-25 10:57:24'),
(48, 'user@gmail.com', 'Buff MoMo', 'Atithi Satkar', 1, 150, 150, 27.719313699999997, 85.38957189999999, '2021-07-25 10:57:24'),
(49, 'user@gmail.com', 'Veg Chowmin', 'Atithi Satkar', 1, 70, 70, 27.719313699999997, 85.38957189999999, '2021-07-25 10:57:24'),
(50, 'test@gmail.com', 'Buff Chowmin', 'Baneshwor Restaurant', 4, 200, 800, 27.719313699999997, 85.38957189999999, '2021-07-25 14:04:33'),
(51, 'test@gmail.com', 'Veg Chowmin', 'Baneshwor Restaurant', 1, 120, 120, 27.719313699999997, 85.38957189999999, '2021-07-25 14:04:33'),
(52, 'test@gmail.com', 'Buff MoMo', 'Baneshwor Restaurant', 1, 200, 200, 27.719313699999997, 85.38957189999999, '2021-07-25 14:04:33'),
(53, 'test@gmail.com', 'Buff Chowmin', 'Baneshwor Restaurant', 4, 200, 800, 27.6624958, 85.4375574, '2021-07-25 14:09:05'),
(54, 'test@gmail.com', 'Veg Chowmin', 'Baneshwor Restaurant', 1, 120, 120, 27.6624958, 85.4375574, '2021-07-25 14:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(50) NOT NULL,
  `rname` varchar(2556) NOT NULL,
  `address` varchar(2556) NOT NULL,
  `image` varchar(2556) NOT NULL,
  `pan_image` varchar(2556) NOT NULL,
  `email` varchar(2556) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `rname`, `address`, `image`, `pan_image`, `email`, `password`) VALUES
(6, 'demorestaurant', 'peepalbot', 'uploads/Beautiful-sunset.jpg', 'uploads/pan-card.jpg', 'demo@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_detail`
--

CREATE TABLE `reservation_detail` (
  `id` int(255) NOT NULL,
  `reservation_date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `cust_mail` varchar(2556) NOT NULL,
  `phone` varchar(2556) NOT NULL,
  `res_id` int(255) NOT NULL,
  `table_id` int(255) NOT NULL,
  `chair_id` varchar(2556) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation_detail`
--

INSERT INTO `reservation_detail` (`id`, `reservation_date`, `time`, `cust_mail`, `phone`, `res_id`, `table_id`, `chair_id`, `status`) VALUES
(7, '2021-07-25', '8:00pm', 'test@gmail.com', '9843438743', 3, 3, '8,32,33,', 0),
(8, '2021-07-26', '3:15pm', 'test@gmail.com', '982232123', 1, 4, '9,23,24,', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(50) NOT NULL,
  `rname` varchar(2556) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `image` varchar(3556) NOT NULL,
  `email` varchar(2556) NOT NULL,
  `password` varchar(2556) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `rname`, `address`, `image`, `email`, `password`) VALUES
(1, 'Baneshwor Restaurant', 'Baneshwor', 'uploads/1.jpg', 'chowmin@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(2, 'Eddies', 'Balkumari', 'uploads/2.jpg', 'eddies@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(3, 'Atithi Satkar', 'Amrit Marg', 'uploads/3.jpg', 'atithi@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(4, 'Bhojan Griha', 'Dillibazar', 'uploads/4.jpg', 'bhojan@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(5, 'Le Sherpa', 'Maharajgunj', 'uploads/5.jpg', 'sherpa@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(6, 'Bhojdeals', 'kathmandu', 'uploads/6.jpg', 'bhojdeals@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(7, 'The Bakery and Cafe', 'Teendhara Marg', 'uploads/8.jpg', 'bakery@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(8, 'Dragon Cafe', 'Thasikhel', 'uploads/1.jpg', 'dragon@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(11, 'foodie', 'thali', 'uploads/patrick-tomasso-GXXYkSwndP4-unsplash.jpg', 'food@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(50) NOT NULL,
  `email` varchar(3556) NOT NULL,
  `rid` int(50) NOT NULL,
  `msg` varchar(3556) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `email`, `rid`, `msg`) VALUES
(1, 'test@gmail.com', 11, 'nice restaurant'),
(2, 'test@gmail.com', 11, 'tasty'),
(3, 'test@gmail.com', 11, 'very good\r\n'),
(4, 'test@gmail.com', 11, 'cool items'),
(5, 'test@gmail.com', 12, 'fried rice is very tasty here!!!!'),
(6, '2learn2fun@gmail.com', 2, 'nice restaurant'),
(7, 'test@gmail.com', 12, 'nice ');

-- --------------------------------------------------------

--
-- Table structure for table `table_detail`
--

CREATE TABLE `table_detail` (
  `id` int(11) NOT NULL,
  `res_id` int(255) NOT NULL,
  `booked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table_detail`
--

INSERT INTO `table_detail` (`id`, `res_id`, `booked`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 1, 0),
(5, 2, 0),
(6, 3, 0),
(7, 1, 0),
(8, 1, 0),
(9, 2, 0),
(10, 3, 0),
(11, 3, 0),
(12, 4, 0),
(13, 4, 0),
(14, 4, 0),
(15, 5, 0),
(16, 5, 0),
(17, 5, 0),
(18, 5, 0),
(19, 6, 0),
(20, 6, 0),
(21, 6, 0),
(22, 6, 0),
(23, 7, 0),
(24, 7, 0),
(25, 7, 0),
(26, 7, 0),
(27, 8, 0),
(28, 8, 0),
(29, 8, 0),
(30, 8, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chair_detail`
--
ALTER TABLE `chair_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chair_reserved`
--
ALTER TABLE `chair_reserved`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseid`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation_detail`
--
ALTER TABLE `reservation_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_detail`
--
ALTER TABLE `table_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `chair_detail`
--
ALTER TABLE `chair_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `chair_reserved`
--
ALTER TABLE `chair_reserved`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `pid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservation_detail`
--
ALTER TABLE `reservation_detail`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `table_detail`
--
ALTER TABLE `table_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
