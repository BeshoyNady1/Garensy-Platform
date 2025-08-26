-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 26, 2025 at 01:55 PM
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
-- Database: `garensy`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` float(9,2) NOT NULL DEFAULT 0.00,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name_ar`, `name_en`, `created_at`, `updated_at`) VALUES
(1, 'مصر', 'Egypt', '2025-08-20 23:24:28', NULL),
(2, 'المملكة العربية السعودية', 'Kingdom of Saudi Arabia', '2025-08-20 23:24:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `service_id`, `package_id`, `created_at`, `updated_at`) VALUES
(1, 2, 207, NULL, '2025-08-24 05:23:08', '2025-08-24 08:23:08'),
(2, 2, 208, NULL, '2025-08-24 05:23:35', '2025-08-24 08:23:35'),
(3, 2, 206, NULL, '2025-08-24 05:24:23', '2025-08-24 08:24:23'),
(4, 2, NULL, 3, '2025-08-26 02:28:45', '2025-08-26 05:28:45'),
(5, 2, NULL, 2, '2025-08-26 02:28:50', '2025-08-26 05:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_ar` text NOT NULL,
  `message_en` text DEFAULT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','confirmed','canceled','finished') DEFAULT 'pending',
  `payment_status` enum('unpaid','paid') DEFAULT 'unpaid',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(4, 2, 1200.00, 'pending', 'unpaid', '2025-08-25 22:39:25', '2025-08-25 22:39:25'),
(5, 2, 1700.00, 'pending', 'unpaid', '2025-08-25 22:46:49', '2025-08-25 22:46:49'),
(6, 2, 700.00, 'pending', 'unpaid', '2025-08-25 22:52:14', '2025-08-25 22:52:14'),
(12, 2, 1050.00, 'pending', 'unpaid', '2025-08-26 09:35:50', '2025-08-26 09:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `service_id`, `package_id`, `qty`, `price`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(4, 4, 198, NULL, 1, 400.00, '2025-08-25 12:00:00', '2025-08-25 14:00:00', '2025-08-25 22:39:25', '2025-08-25 22:39:25'),
(5, 4, 198, NULL, 1, 400.00, '2025-08-25 12:00:00', '2025-08-25 14:00:00', '2025-08-25 22:39:25', '2025-08-25 22:39:25'),
(6, 4, 198, NULL, 1, 400.00, '2025-08-25 12:00:00', '2025-08-25 14:00:00', '2025-08-25 22:39:25', '2025-08-25 22:39:25'),
(7, 5, 208, NULL, 1, 500.00, '2025-08-26 12:00:00', '2025-08-26 15:00:00', '2025-08-25 22:46:49', '2025-08-25 22:46:49'),
(8, 5, 208, NULL, 1, 500.00, '2025-08-26 12:00:00', '2025-08-26 15:00:00', '2025-08-25 22:46:49', '2025-08-25 22:46:49'),
(9, 5, 193, NULL, 1, 350.00, '2025-08-27 12:00:00', '2025-08-27 14:00:00', '2025-08-25 22:46:49', '2025-08-25 22:46:49'),
(10, 5, 193, NULL, 1, 350.00, '2025-08-27 12:00:00', '2025-08-27 14:00:00', '2025-08-25 22:46:49', '2025-08-25 22:46:49'),
(11, 6, 193, NULL, 1, 350.00, '2025-08-27 12:00:00', '2025-08-27 14:00:00', '2025-08-25 22:52:14', '2025-08-25 22:52:14'),
(12, 6, 193, NULL, 1, 350.00, '2025-08-27 12:00:00', '2025-08-27 14:00:00', '2025-08-25 22:52:14', '2025-08-25 22:52:14'),
(15, 12, 238, NULL, 1, 800.00, '2025-08-26 12:00:00', '2025-08-26 14:00:00', '2025-08-26 09:35:50', '2025-08-26 09:35:50'),
(16, 12, NULL, 3, 1, 250.00, '2025-08-26 12:00:00', '2025-08-26 15:00:00', '2025-08-26 09:35:50', '2025-08-26 09:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description_ar` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `provider_id`, `name_ar`, `name_en`, `description_ar`, `description_en`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'باقة أساسية - فئة 1', 'Basic Package - Category 1', 'باقة اقتصادية مصممة لتقديم خدمات فئة 1 بجودة عالية وتكلفة مناسبة.', 'An economical package designed to deliver Category 1 services with high quality and affordable cost.', 150.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(2, 1, 'باقة مميزة - فئة 1', 'Premium Package - Category 1', 'باقة متكاملة لفئة 1 توفر دعمًا إضافيًا وتجربة مخصصة.', 'A comprehensive package for Category 1 with additional support and a customized experience.', 200.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(3, 1, 'باقة متقدمة - فئة 1', 'Advanced Package - Category 1', 'باقة متقدمة لفئة 1 مع ميزات إضافية لتحقيق أهدافك.', 'An advanced package for Category 1 with extra features to achieve your goals.', 250.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(4, 1, 'باقة احترافية - فئة 1', 'Professional Package - Category 1', 'باقة احترافية لفئة 1 توفر أعلى مستويات الجودة.', 'A professional package for Category 1 offering the highest quality standards.', 300.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(5, 1, 'باقة فاخرة - فئة 1', 'Luxury Package - Category 1', 'باقة فاخرة لفئة 1 مع دعم مخصص ونتائج استثنائية.', 'A luxury package for Category 1 with dedicated support and exceptional results.', 350.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(6, 1, 'باقة أساسية - فئة 2', 'Basic Package - Category 2', 'باقة اقتصادية مصممة لتقديم خدمات فئة 2 بجودة عالية وتكلفة مناسبة.', 'An economical package designed to deliver Category 2 services with high quality and affordable cost.', 250.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(7, 1, 'باقة مميزة - فئة 2', 'Premium Package - Category 2', 'باقة متكاملة لفئة 2 توفر دعمًا إضافيًا وتجربة مخصصة.', 'A comprehensive package for Category 2 with additional support and a customized experience.', 300.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(8, 1, 'باقة متقدمة - فئة 2', 'Advanced Package - Category 2', 'باقة متقدمة لفئة 2 مع ميزات إضافية لتحقيق أهدافك.', 'An advanced package for Category 2 with extra features to achieve your goals.', 350.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(9, 1, 'باقة احترافية - فئة 2', 'Professional Package - Category 2', 'باقة احترافية لفئة 2 توفر أعلى مستويات الجودة.', 'A professional package for Category 2 offering the highest quality standards.', 400.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(10, 1, 'باقة فاخرة - فئة 2', 'Luxury Package - Category 2', 'باقة فاخرة لفئة 2 مع دعم مخصص ونتائج استثنائية.', 'A luxury package for Category 2 with dedicated support and exceptional results.', 450.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(11, 1, 'باقة أساسية - فئة 3', 'Basic Package - Category 3', 'باقة اقتصادية مصممة لتقديم خدمات فئة 3 بجودة عالية وتكلفة مناسبة.', 'An economical package designed to deliver Category 3 services with high quality and affordable cost.', 350.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(12, 1, 'باقة مميزة - فئة 3', 'Premium Package - Category 3', 'باقة متكاملة لفئة 3 توفر دعمًا إضافيًا وتجربة مخصصة.', 'A comprehensive package for Category 3 with additional support and a customized experience.', 400.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(13, 1, 'باقة متقدمة - فئة 3', 'Advanced Package - Category 3', 'باقة متقدمة لفئة 3 مع ميزات إضافية لتحقيق أهدافك.', 'An advanced package for Category 3 with extra features to achieve your goals.', 450.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(14, 1, 'باقة احترافية - فئة 3', 'Professional Package - Category 3', 'باقة احترافية لفئة 3 توفر أعلى مستويات الجودة.', 'A professional package for Category 3 offering the highest quality standards.', 500.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20'),
(15, 1, 'باقة فاخرة - فئة 3', 'Luxury Package - Category 3', 'باقة فاخرة لفئة 3 مع دعم مخصص ونتائج استثنائية.', 'A luxury package for Category 3 with dedicated support and exceptional results.', 550.00, 'active', '2025-08-26 06:45:20', '2025-08-26 06:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `package_cities`
--

CREATE TABLE `package_cities` (
  `package_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_cities`
--

INSERT INTO `package_cities` (`package_id`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-08-26 09:26:30', NULL),
(1, 2, '2025-08-26 09:26:30', NULL),
(2, 1, '2025-08-26 09:26:30', NULL),
(2, 2, '2025-08-26 09:26:30', NULL),
(3, 1, '2025-08-26 09:26:30', NULL),
(3, 2, '2025-08-26 09:26:30', NULL),
(4, 1, '2025-08-26 09:26:30', NULL),
(4, 2, '2025-08-26 09:26:30', NULL),
(5, 1, '2025-08-26 09:26:30', NULL),
(5, 2, '2025-08-26 09:26:30', NULL),
(6, 1, '2025-08-26 09:26:30', NULL),
(6, 2, '2025-08-26 09:26:30', NULL),
(7, 1, '2025-08-26 09:26:30', NULL),
(7, 2, '2025-08-26 09:26:30', NULL),
(8, 1, '2025-08-26 09:26:30', NULL),
(8, 2, '2025-08-26 09:26:30', NULL),
(9, 1, '2025-08-26 09:26:30', NULL),
(9, 2, '2025-08-26 09:26:30', NULL),
(10, 1, '2025-08-26 09:26:30', NULL),
(10, 2, '2025-08-26 09:26:30', NULL),
(11, 1, '2025-08-26 09:26:30', NULL),
(11, 2, '2025-08-26 09:26:30', NULL),
(12, 1, '2025-08-26 09:26:30', NULL),
(12, 2, '2025-08-26 09:26:30', NULL),
(13, 1, '2025-08-26 09:26:30', NULL),
(13, 2, '2025-08-26 09:26:30', NULL),
(14, 1, '2025-08-26 09:26:30', NULL),
(14, 2, '2025-08-26 09:26:30', NULL),
(15, 1, '2025-08-26 09:26:30', NULL),
(15, 2, '2025-08-26 09:26:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_features`
--

CREATE TABLE `package_features` (
  `id` bigint(20) NOT NULL,
  `package_id` int(11) NOT NULL,
  `description_ar` varchar(255) DEFAULT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_features`
--

INSERT INTO `package_features` (`id`, `package_id`, `description_ar`, `description_en`, `created_at`, `updated_at`) VALUES
(1, 1, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(2, 1, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(3, 1, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(4, 1, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(5, 1, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(6, 2, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(7, 2, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(8, 2, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(9, 2, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(10, 2, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(11, 3, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(12, 3, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(13, 3, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(14, 3, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(15, 3, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(16, 4, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(17, 4, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(18, 4, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(19, 4, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(20, 4, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(21, 5, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(22, 5, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(23, 5, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(24, 5, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(25, 5, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(26, 6, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(27, 6, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(28, 6, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(29, 6, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(30, 6, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(31, 7, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(32, 7, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(33, 7, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(34, 7, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(35, 7, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(36, 8, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(37, 8, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(38, 8, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(39, 8, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(40, 8, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:50', '2025-08-26 06:46:50'),
(41, 9, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(42, 9, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(43, 9, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(44, 9, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(45, 9, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(46, 10, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(47, 10, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(48, 10, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(49, 10, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(50, 10, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(51, 11, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(52, 11, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(53, 11, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(54, 11, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(55, 11, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(56, 12, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(57, 12, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(58, 12, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(59, 12, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(60, 12, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(61, 13, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(62, 13, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(63, 13, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(64, 13, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(65, 13, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(66, 14, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(67, 14, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(68, 14, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(69, 14, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(70, 14, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(71, 15, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(72, 15, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(73, 15, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(74, 15, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 06:46:51', '2025-08-26 06:46:51'),
(75, 15, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 06:46:51', '2025-08-26 06:46:51');

-- --------------------------------------------------------

--
-- Table structure for table `package_images`
--

CREATE TABLE `package_images` (
  `id` bigint(20) NOT NULL,
  `package_id` int(11) NOT NULL,
  `src` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_images`
--

INSERT INTO `package_images` (`id`, `package_id`, `src`, `created_at`, `updated_at`) VALUES
(1, 1, 'assets/img/packages/package1.jpeg', '2025-08-26 07:20:27', NULL),
(2, 2, 'assets/img/packages/package1.jpeg', '2025-08-26 07:20:27', NULL),
(3, 3, 'assets/img/packages/package1.jpeg', '2025-08-26 07:20:27', NULL),
(4, 4, 'assets/img/packages/package2.jpeg', '2025-08-26 07:20:27', NULL),
(5, 5, 'assets/img/packages/package2.jpeg', '2025-08-26 07:20:27', NULL),
(6, 6, 'assets/img/packages/package2.jpeg', '2025-08-26 07:20:27', NULL),
(7, 7, 'assets/img/packages/package3.jpeg', '2025-08-26 07:20:27', NULL),
(8, 8, 'assets/img/packages/package3.jpeg', '2025-08-26 07:20:27', NULL),
(9, 9, 'assets/img/packages/package3.jpeg', '2025-08-26 07:20:27', NULL),
(10, 10, 'assets/img/packages/package4.jpeg', '2025-08-26 07:20:27', NULL),
(11, 11, 'assets/img/packages/package4.jpeg', '2025-08-26 07:20:27', NULL),
(12, 12, 'assets/img/packages/package4.jpeg', '2025-08-26 07:20:27', NULL),
(13, 13, 'assets/img/packages/package5.jpeg', '2025-08-26 07:20:27', NULL),
(14, 14, 'assets/img/packages/package5.jpeg', '2025-08-26 07:20:27', NULL),
(15, 15, 'assets/img/packages/package5.jpeg', '2025-08-26 07:20:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `method` enum('credit_card','stc_pay','paypal','stripe','paymob') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `transaction_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `commercial_register` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `user_id`, `business_name`, `description`, `city`, `national_id`, `commercial_register`, `created_at`, `updated_at`) VALUES
(1, 1, 'provider1', 'provider1', 'EGYPT', '1212121212121', '1212121212121', '2025-08-20 01:48:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description_ar` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `provider_id`, `name_ar`, `name_en`, `description_ar`, `description_en`, `price`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(191, 1, 'خدمة 1 - فئة 1', 'Service 1 - Category 1', 'وصف خدمة 1 في فئة 1', 'Description of Service 1 in Category 1', 150.00, 1, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(192, 1, 'خدمة 2 - فئة 1', 'Service 2 - Category 1', 'وصف خدمة 2 في فئة 1', 'Description of Service 2 in Category 1', 250.00, 1, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(193, 1, 'خدمة 3 - فئة 1', 'Service 3 - Category 1', 'وصف خدمة 3 في فئة 1', 'Description of Service 3 in Category 1', 350.00, 1, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(194, 1, 'خدمة 4 - فئة 1', 'Service 4 - Category 1', 'وصف خدمة 4 في فئة 1', 'Description of Service 4 in Category 1', 450.00, 1, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(195, 1, 'خدمة 5 - فئة 1', 'Service 5 - Category 1', 'وصف خدمة 5 في فئة 1', 'Description of Service 5 in Category 1', 550.00, 1, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(196, 1, 'خدمة 1 - فئة 2', 'Service 1 - Category 2', 'وصف خدمة 1 في فئة 2', 'Description of Service 1 in Category 2', 200.00, 2, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(197, 1, 'خدمة 2 - فئة 2', 'Service 2 - Category 2', 'وصف خدمة 2 في فئة 2', 'Description of Service 2 in Category 2', 300.00, 2, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(198, 1, 'خدمة 3 - فئة 2', 'Service 3 - Category 2', 'وصف خدمة 3 في فئة 2', 'Description of Service 3 in Category 2', 400.00, 2, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(199, 1, 'خدمة 4 - فئة 2', 'Service 4 - Category 2', 'وصف خدمة 4 في فئة 2', 'Description of Service 4 in Category 2', 500.00, 2, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(200, 1, 'خدمة 5 - فئة 2', 'Service 5 - Category 2', 'وصف خدمة 5 في فئة 2', 'Description of Service 5 in Category 2', 600.00, 2, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(201, 1, 'خدمة 1 - فئة 3', 'Service 1 - Category 3', 'وصف خدمة 1 في فئة 3', 'Description of Service 1 in Category 3', 250.00, 3, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(202, 1, 'خدمة 2 - فئة 3', 'Service 2 - Category 3', 'وصف خدمة 2 في فئة 3', 'Description of Service 2 in Category 3', 350.00, 3, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(203, 1, 'خدمة 3 - فئة 3', 'Service 3 - Category 3', 'وصف خدمة 3 في فئة 3', 'Description of Service 3 in Category 3', 450.00, 3, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(204, 1, 'خدمة 4 - فئة 3', 'Service 4 - Category 3', 'وصف خدمة 4 في فئة 3', 'Description of Service 4 in Category 3', 550.00, 3, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(205, 1, 'خدمة 5 - فئة 3', 'Service 5 - Category 3', 'وصف خدمة 5 في فئة 3', 'Description of Service 5 in Category 3', 650.00, 3, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(206, 1, 'خدمة 1 - فئة 4', 'Service 1 - Category 4', 'وصف خدمة 1 في فئة 4', 'Description of Service 1 in Category 4', 300.00, 4, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(207, 1, 'خدمة 2 - فئة 4', 'Service 2 - Category 4', 'وصف خدمة 2 في فئة 4', 'Description of Service 2 in Category 4', 400.00, 4, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(208, 1, 'خدمة 3 - فئة 4', 'Service 3 - Category 4', 'وصف خدمة 3 في فئة 4', 'Description of Service 3 in Category 4', 500.00, 4, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(209, 1, 'خدمة 4 - فئة 4', 'Service 4 - Category 4', 'وصف خدمة 4 في فئة 4', 'Description of Service 4 in Category 4', 600.00, 4, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(210, 1, 'خدمة 5 - فئة 4', 'Service 5 - Category 4', 'وصف خدمة 5 في فئة 4', 'Description of Service 5 in Category 4', 700.00, 4, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(211, 1, 'خدمة 1 - فئة 5', 'Service 1 - Category 5', 'وصف خدمة 1 في فئة 5', 'Description of Service 1 in Category 5', 350.00, 5, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(212, 1, 'خدمة 2 - فئة 5', 'Service 2 - Category 5', 'وصف خدمة 2 في فئة 5', 'Description of Service 2 in Category 5', 450.00, 5, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(213, 1, 'خدمة 3 - فئة 5', 'Service 3 - Category 5', 'وصف خدمة 3 في فئة 5', 'Description of Service 3 in Category 5', 550.00, 5, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(214, 1, 'خدمة 4 - فئة 5', 'Service 4 - Category 5', 'وصف خدمة 4 في فئة 5', 'Description of Service 4 in Category 5', 650.00, 5, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(215, 1, 'خدمة 5 - فئة 5', 'Service 5 - Category 5', 'وصف خدمة 5 في فئة 5', 'Description of Service 5 in Category 5', 750.00, 5, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(216, 1, 'خدمة 1 - فئة 6', 'Service 1 - Category 6', 'وصف خدمة 1 في فئة 6', 'Description of Service 1 in Category 6', 400.00, 6, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(217, 1, 'خدمة 2 - فئة 6', 'Service 2 - Category 6', 'وصف خدمة 2 في فئة 6', 'Description of Service 2 in Category 6', 500.00, 6, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(218, 1, 'خدمة 3 - فئة 6', 'Service 3 - Category 6', 'وصف خدمة 3 في فئة 6', 'Description of Service 3 in Category 6', 600.00, 6, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(219, 1, 'خدمة 4 - فئة 6', 'Service 4 - Category 6', 'وصف خدمة 4 في فئة 6', 'Description of Service 4 in Category 6', 700.00, 6, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(220, 1, 'خدمة 5 - فئة 6', 'Service 5 - Category 6', 'وصف خدمة 5 في فئة 6', 'Description of Service 5 in Category 6', 800.00, 6, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(221, 1, 'خدمة 1 - فئة 7', 'Service 1 - Category 7', 'وصف خدمة 1 في فئة 7', 'Description of Service 1 in Category 7', 450.00, 7, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(222, 1, 'خدمة 2 - فئة 7', 'Service 2 - Category 7', 'وصف خدمة 2 في فئة 7', 'Description of Service 2 in Category 7', 550.00, 7, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(223, 1, 'خدمة 3 - فئة 7', 'Service 3 - Category 7', 'وصف خدمة 3 في فئة 7', 'Description of Service 3 in Category 7', 650.00, 7, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(224, 1, 'خدمة 4 - فئة 7', 'Service 4 - Category 7', 'وصف خدمة 4 في فئة 7', 'Description of Service 4 in Category 7', 750.00, 7, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(225, 1, 'خدمة 5 - فئة 7', 'Service 5 - Category 7', 'وصف خدمة 5 في فئة 7', 'Description of Service 5 in Category 7', 850.00, 7, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(226, 1, 'خدمة 1 - فئة 8', 'Service 1 - Category 8', 'وصف خدمة 1 في فئة 8', 'Description of Service 1 in Category 8', 500.00, 8, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(227, 1, 'خدمة 2 - فئة 8', 'Service 2 - Category 8', 'وصف خدمة 2 في فئة 8', 'Description of Service 2 in Category 8', 600.00, 8, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(228, 1, 'خدمة 3 - فئة 8', 'Service 3 - Category 8', 'وصف خدمة 3 في فئة 8', 'Description of Service 3 in Category 8', 700.00, 8, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(229, 1, 'خدمة 4 - فئة 8', 'Service 4 - Category 8', 'وصف خدمة 4 في فئة 8', 'Description of Service 4 in Category 8', 800.00, 8, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(230, 1, 'خدمة 5 - فئة 8', 'Service 5 - Category 8', 'وصف خدمة 5 في فئة 8', 'Description of Service 5 in Category 8', 900.00, 8, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(231, 1, 'خدمة 1 - فئة 9', 'Service 1 - Category 9', 'وصف خدمة 1 في فئة 9', 'Description of Service 1 in Category 9', 550.00, 9, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(232, 1, 'خدمة 2 - فئة 9', 'Service 2 - Category 9', 'وصف خدمة 2 في فئة 9', 'Description of Service 2 in Category 9', 650.00, 9, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(233, 1, 'خدمة 3 - فئة 9', 'Service 3 - Category 9', 'وصف خدمة 3 في فئة 9', 'Description of Service 3 in Category 9', 750.00, 9, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(234, 1, 'خدمة 4 - فئة 9', 'Service 4 - Category 9', 'وصف خدمة 4 في فئة 9', 'Description of Service 4 in Category 9', 850.00, 9, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(235, 1, 'خدمة 5 - فئة 9', 'Service 5 - Category 9', 'وصف خدمة 5 في فئة 9', 'Description of Service 5 in Category 9', 950.00, 9, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(236, 1, 'خدمة 1 - فئة 10', 'Service 1 - Category 10', 'وصف خدمة 1 في فئة 10', 'Description of Service 1 in Category 10', 600.00, 10, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(237, 1, 'خدمة 2 - فئة 10', 'Service 2 - Category 10', 'وصف خدمة 2 في فئة 10', 'Description of Service 2 in Category 10', 700.00, 10, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(238, 1, 'خدمة 3 - فئة 10', 'Service 3 - Category 10', 'وصف خدمة 3 في فئة 10', 'Description of Service 3 in Category 10', 800.00, 10, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(239, 1, 'خدمة 4 - فئة 10', 'Service 4 - Category 10', 'وصف خدمة 4 في فئة 10', 'Description of Service 4 in Category 10', 900.00, 10, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(240, 1, 'خدمة 5 - فئة 10', 'Service 5 - Category 10', 'وصف خدمة 5 في فئة 10', 'Description of Service 5 in Category 10', 1000.00, 10, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(241, 1, 'خدمة 1 - فئة 11', 'Service 1 - Category 11', 'وصف خدمة 1 في فئة 11', 'Description of Service 1 in Category 11', 650.00, 11, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(242, 1, 'خدمة 2 - فئة 11', 'Service 2 - Category 11', 'وصف خدمة 2 في فئة 11', 'Description of Service 2 in Category 11', 750.00, 11, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(243, 1, 'خدمة 3 - فئة 11', 'Service 3 - Category 11', 'وصف خدمة 3 في فئة 11', 'Description of Service 3 in Category 11', 850.00, 11, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(244, 1, 'خدمة 4 - فئة 11', 'Service 4 - Category 11', 'وصف خدمة 4 في فئة 11', 'Description of Service 4 in Category 11', 950.00, 11, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(245, 1, 'خدمة 5 - فئة 11', 'Service 5 - Category 11', 'وصف خدمة 5 في فئة 11', 'Description of Service 5 in Category 11', 1050.00, 11, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(246, 1, 'خدمة 1 - فئة 12', 'Service 1 - Category 12', 'وصف خدمة 1 في فئة 12', 'Description of Service 1 in Category 12', 700.00, 12, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(247, 1, 'خدمة 2 - فئة 12', 'Service 2 - Category 12', 'وصف خدمة 2 في فئة 12', 'Description of Service 2 in Category 12', 800.00, 12, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(248, 1, 'خدمة 3 - فئة 12', 'Service 3 - Category 12', 'وصف خدمة 3 في فئة 12', 'Description of Service 3 in Category 12', 900.00, 12, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(249, 1, 'خدمة 4 - فئة 12', 'Service 4 - Category 12', 'وصف خدمة 4 في فئة 12', 'Description of Service 4 in Category 12', 1000.00, 12, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(250, 1, 'خدمة 5 - فئة 12', 'Service 5 - Category 12', 'وصف خدمة 5 في فئة 12', 'Description of Service 5 in Category 12', 1100.00, 12, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(251, 1, 'خدمة 1 - فئة 13', 'Service 1 - Category 13', 'وصف خدمة 1 في فئة 13', 'Description of Service 1 in Category 13', 750.00, 13, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(252, 1, 'خدمة 2 - فئة 13', 'Service 2 - Category 13', 'وصف خدمة 2 في فئة 13', 'Description of Service 2 in Category 13', 850.00, 13, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(253, 1, 'خدمة 3 - فئة 13', 'Service 3 - Category 13', 'وصف خدمة 3 في فئة 13', 'Description of Service 3 in Category 13', 950.00, 13, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(254, 1, 'خدمة 4 - فئة 13', 'Service 4 - Category 13', 'وصف خدمة 4 في فئة 13', 'Description of Service 4 in Category 13', 1050.00, 13, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(255, 1, 'خدمة 5 - فئة 13', 'Service 5 - Category 13', 'وصف خدمة 5 في فئة 13', 'Description of Service 5 in Category 13', 1150.00, 13, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(256, 1, 'خدمة 1 - فئة 14', 'Service 1 - Category 14', 'وصف خدمة 1 في فئة 14', 'Description of Service 1 in Category 14', 800.00, 14, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(257, 1, 'خدمة 2 - فئة 14', 'Service 2 - Category 14', 'وصف خدمة 2 في فئة 14', 'Description of Service 2 in Category 14', 900.00, 14, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(258, 1, 'خدمة 3 - فئة 14', 'Service 3 - Category 14', 'وصف خدمة 3 في فئة 14', 'Description of Service 3 in Category 14', 1000.00, 14, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(259, 1, 'خدمة 4 - فئة 14', 'Service 4 - Category 14', 'وصف خدمة 4 في فئة 14', 'Description of Service 4 in Category 14', 1100.00, 14, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(260, 1, 'خدمة 5 - فئة 14', 'Service 5 - Category 14', 'وصف خدمة 5 في فئة 14', 'Description of Service 5 in Category 14', 1200.00, 14, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(261, 1, 'خدمة 1 - فئة 15', 'Service 1 - Category 15', 'وصف خدمة 1 في فئة 15', 'Description of Service 1 in Category 15', 850.00, 15, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(262, 1, 'خدمة 2 - فئة 15', 'Service 2 - Category 15', 'وصف خدمة 2 في فئة 15', 'Description of Service 2 in Category 15', 950.00, 15, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(263, 1, 'خدمة 3 - فئة 15', 'Service 3 - Category 15', 'وصف خدمة 3 في فئة 15', 'Description of Service 3 in Category 15', 1050.00, 15, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(264, 1, 'خدمة 4 - فئة 15', 'Service 4 - Category 15', 'وصف خدمة 4 في فئة 15', 'Description of Service 4 in Category 15', 1150.00, 15, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(265, 1, 'خدمة 5 - فئة 15', 'Service 5 - Category 15', 'وصف خدمة 5 في فئة 15', 'Description of Service 5 in Category 15', 1250.00, 15, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(266, 1, 'خدمة 1 - فئة 16', 'Service 1 - Category 16', 'وصف خدمة 1 في فئة 16', 'Description of Service 1 in Category 16', 900.00, 16, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(267, 1, 'خدمة 2 - فئة 16', 'Service 2 - Category 16', 'وصف خدمة 2 في فئة 16', 'Description of Service 2 in Category 16', 1000.00, 16, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(268, 1, 'خدمة 3 - فئة 16', 'Service 3 - Category 16', 'وصف خدمة 3 في فئة 16', 'Description of Service 3 in Category 16', 1100.00, 16, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(269, 1, 'خدمة 4 - فئة 16', 'Service 4 - Category 16', 'وصف خدمة 4 في فئة 16', 'Description of Service 4 in Category 16', 1200.00, 16, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(270, 1, 'خدمة 5 - فئة 16', 'Service 5 - Category 16', 'وصف خدمة 5 في فئة 16', 'Description of Service 5 in Category 16', 1300.00, 16, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(271, 1, 'خدمة 1 - فئة 17', 'Service 1 - Category 17', 'وصف خدمة 1 في فئة 17', 'Description of Service 1 in Category 17', 950.00, 17, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(272, 1, 'خدمة 2 - فئة 17', 'Service 2 - Category 17', 'وصف خدمة 2 في فئة 17', 'Description of Service 2 in Category 17', 1050.00, 17, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(273, 1, 'خدمة 3 - فئة 17', 'Service 3 - Category 17', 'وصف خدمة 3 في فئة 17', 'Description of Service 3 in Category 17', 1150.00, 17, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(274, 1, 'خدمة 4 - فئة 17', 'Service 4 - Category 17', 'وصف خدمة 4 في فئة 17', 'Description of Service 4 in Category 17', 1250.00, 17, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(275, 1, 'خدمة 5 - فئة 17', 'Service 5 - Category 17', 'وصف خدمة 5 في فئة 17', 'Description of Service 5 in Category 17', 1350.00, 17, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(276, 1, 'خدمة 1 - فئة 18', 'Service 1 - Category 18', 'وصف خدمة 1 في فئة 18', 'Description of Service 1 in Category 18', 1000.00, 18, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(277, 1, 'خدمة 2 - فئة 18', 'Service 2 - Category 18', 'وصف خدمة 2 في فئة 18', 'Description of Service 2 in Category 18', 1100.00, 18, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(278, 1, 'خدمة 3 - فئة 18', 'Service 3 - Category 18', 'وصف خدمة 3 في فئة 18', 'Description of Service 3 in Category 18', 1200.00, 18, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(279, 1, 'خدمة 4 - فئة 18', 'Service 4 - Category 18', 'وصف خدمة 4 في فئة 18', 'Description of Service 4 in Category 18', 1300.00, 18, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(280, 1, 'خدمة 5 - فئة 18', 'Service 5 - Category 18', 'وصف خدمة 5 في فئة 18', 'Description of Service 5 in Category 18', 1400.00, 18, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(281, 1, 'خدمة 1 - فئة 19', 'Service 1 - Category 19', 'وصف خدمة 1 في فئة 19', 'Description of Service 1 in Category 19', 1050.00, 19, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(282, 1, 'خدمة 2 - فئة 19', 'Service 2 - Category 19', 'وصف خدمة 2 في فئة 19', 'Description of Service 2 in Category 19', 1150.00, 19, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(283, 1, 'خدمة 3 - فئة 19', 'Service 3 - Category 19', 'وصف خدمة 3 في فئة 19', 'Description of Service 3 in Category 19', 1250.00, 19, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(284, 1, 'خدمة 4 - فئة 19', 'Service 4 - Category 19', 'وصف خدمة 4 في فئة 19', 'Description of Service 4 in Category 19', 1350.00, 19, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(285, 1, 'خدمة 5 - فئة 19', 'Service 5 - Category 19', 'وصف خدمة 5 في فئة 19', 'Description of Service 5 in Category 19', 1450.00, 19, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(286, 1, 'خدمة 1 - فئة 20', 'Service 1 - Category 20', 'وصف خدمة 1 في فئة 20', 'Description of Service 1 in Category 20', 1100.00, 20, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(287, 1, 'خدمة 2 - فئة 20', 'Service 2 - Category 20', 'وصف خدمة 2 في فئة 20', 'Description of Service 2 in Category 20', 1200.00, 20, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(288, 1, 'خدمة 3 - فئة 20', 'Service 3 - Category 20', 'وصف خدمة 3 في فئة 20', 'Description of Service 3 in Category 20', 1300.00, 20, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(289, 1, 'خدمة 4 - فئة 20', 'Service 4 - Category 20', 'وصف خدمة 4 في فئة 20', 'Description of Service 4 in Category 20', 1400.00, 20, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(290, 1, 'خدمة 5 - فئة 20', 'Service 5 - Category 20', 'وصف خدمة 5 في فئة 20', 'Description of Service 5 in Category 20', 1500.00, 20, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(291, 1, 'خدمة 1 - فئة 21', 'Service 1 - Category 21', 'وصف خدمة 1 في فئة 21', 'Description of Service 1 in Category 21', 1150.00, 21, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(292, 1, 'خدمة 2 - فئة 21', 'Service 2 - Category 21', 'وصف خدمة 2 في فئة 21', 'Description of Service 2 in Category 21', 1250.00, 21, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(293, 1, 'خدمة 3 - فئة 21', 'Service 3 - Category 21', 'وصف خدمة 3 في فئة 21', 'Description of Service 3 in Category 21', 1350.00, 21, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(294, 1, 'خدمة 4 - فئة 21', 'Service 4 - Category 21', 'وصف خدمة 4 في فئة 21', 'Description of Service 4 in Category 21', 1450.00, 21, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(295, 1, 'خدمة 5 - فئة 21', 'Service 5 - Category 21', 'وصف خدمة 5 في فئة 21', 'Description of Service 5 in Category 21', 1550.00, 21, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(296, 1, 'خدمة 1 - فئة 22', 'Service 1 - Category 22', 'وصف خدمة 1 في فئة 22', 'Description of Service 1 in Category 22', 1200.00, 22, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(297, 1, 'خدمة 2 - فئة 22', 'Service 2 - Category 22', 'وصف خدمة 2 في فئة 22', 'Description of Service 2 in Category 22', 1300.00, 22, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(298, 1, 'خدمة 3 - فئة 22', 'Service 3 - Category 22', 'وصف خدمة 3 في فئة 22', 'Description of Service 3 in Category 22', 1400.00, 22, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(299, 1, 'خدمة 4 - فئة 22', 'Service 4 - Category 22', 'وصف خدمة 4 في فئة 22', 'Description of Service 4 in Category 22', 1500.00, 22, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(300, 1, 'خدمة 5 - فئة 22', 'Service 5 - Category 22', 'وصف خدمة 5 في فئة 22', 'Description of Service 5 in Category 22', 1600.00, 22, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(301, 1, 'خدمة 1 - فئة 23', 'Service 1 - Category 23', 'وصف خدمة 1 في فئة 23', 'Description of Service 1 in Category 23', 1250.00, 23, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(302, 1, 'خدمة 2 - فئة 23', 'Service 2 - Category 23', 'وصف خدمة 2 في فئة 23', 'Description of Service 2 in Category 23', 1350.00, 23, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(303, 1, 'خدمة 3 - فئة 23', 'Service 3 - Category 23', 'وصف خدمة 3 في فئة 23', 'Description of Service 3 in Category 23', 1450.00, 23, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(304, 1, 'خدمة 4 - فئة 23', 'Service 4 - Category 23', 'وصف خدمة 4 في فئة 23', 'Description of Service 4 in Category 23', 1550.00, 23, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(305, 1, 'خدمة 5 - فئة 23', 'Service 5 - Category 23', 'وصف خدمة 5 في فئة 23', 'Description of Service 5 in Category 23', 1650.00, 23, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(306, 1, 'خدمة 1 - فئة 24', 'Service 1 - Category 24', 'وصف خدمة 1 في فئة 24', 'Description of Service 1 in Category 24', 1300.00, 24, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(307, 1, 'خدمة 2 - فئة 24', 'Service 2 - Category 24', 'وصف خدمة 2 في فئة 24', 'Description of Service 2 in Category 24', 1400.00, 24, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(308, 1, 'خدمة 3 - فئة 24', 'Service 3 - Category 24', 'وصف خدمة 3 في فئة 24', 'Description of Service 3 in Category 24', 1500.00, 24, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(309, 1, 'خدمة 4 - فئة 24', 'Service 4 - Category 24', 'وصف خدمة 4 في فئة 24', 'Description of Service 4 in Category 24', 1600.00, 24, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(310, 1, 'خدمة 5 - فئة 24', 'Service 5 - Category 24', 'وصف خدمة 5 في فئة 24', 'Description of Service 5 in Category 24', 1700.00, 24, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(311, 1, 'خدمة 1 - فئة 25', 'Service 1 - Category 25', 'وصف خدمة 1 في فئة 25', 'Description of Service 1 in Category 25', 1350.00, 25, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(312, 1, 'خدمة 2 - فئة 25', 'Service 2 - Category 25', 'وصف خدمة 2 في فئة 25', 'Description of Service 2 in Category 25', 1450.00, 25, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(313, 1, 'خدمة 3 - فئة 25', 'Service 3 - Category 25', 'وصف خدمة 3 في فئة 25', 'Description of Service 3 in Category 25', 1550.00, 25, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(314, 1, 'خدمة 4 - فئة 25', 'Service 4 - Category 25', 'وصف خدمة 4 في فئة 25', 'Description of Service 4 in Category 25', 1650.00, 25, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(315, 1, 'خدمة 5 - فئة 25', 'Service 5 - Category 25', 'وصف خدمة 5 في فئة 25', 'Description of Service 5 in Category 25', 1750.00, 25, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(316, 1, 'خدمة 1 - فئة 26', 'Service 1 - Category 26', 'وصف خدمة 1 في فئة 26', 'Description of Service 1 in Category 26', 1400.00, 26, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(317, 1, 'خدمة 2 - فئة 26', 'Service 2 - Category 26', 'وصف خدمة 2 في فئة 26', 'Description of Service 2 in Category 26', 1500.00, 26, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(318, 1, 'خدمة 3 - فئة 26', 'Service 3 - Category 26', 'وصف خدمة 3 في فئة 26', 'Description of Service 3 in Category 26', 1600.00, 26, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(319, 1, 'خدمة 4 - فئة 26', 'Service 4 - Category 26', 'وصف خدمة 4 في فئة 26', 'Description of Service 4 in Category 26', 1700.00, 26, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(320, 1, 'خدمة 5 - فئة 26', 'Service 5 - Category 26', 'وصف خدمة 5 في فئة 26', 'Description of Service 5 in Category 26', 1800.00, 26, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(321, 1, 'خدمة 1 - فئة 27', 'Service 1 - Category 27', 'وصف خدمة 1 في فئة 27', 'Description of Service 1 in Category 27', 1450.00, 27, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(322, 1, 'خدمة 2 - فئة 27', 'Service 2 - Category 27', 'وصف خدمة 2 في فئة 27', 'Description of Service 2 in Category 27', 1550.00, 27, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(323, 1, 'خدمة 3 - فئة 27', 'Service 3 - Category 27', 'وصف خدمة 3 في فئة 27', 'Description of Service 3 in Category 27', 1650.00, 27, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(324, 1, 'خدمة 4 - فئة 27', 'Service 4 - Category 27', 'وصف خدمة 4 في فئة 27', 'Description of Service 4 in Category 27', 1750.00, 27, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(325, 1, 'خدمة 5 - فئة 27', 'Service 5 - Category 27', 'وصف خدمة 5 في فئة 27', 'Description of Service 5 in Category 27', 1850.00, 27, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(326, 1, 'خدمة 1 - فئة 28', 'Service 1 - Category 28', 'وصف خدمة 1 في فئة 28', 'Description of Service 1 in Category 28', 1500.00, 28, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(327, 1, 'خدمة 2 - فئة 28', 'Service 2 - Category 28', 'وصف خدمة 2 في فئة 28', 'Description of Service 2 in Category 28', 1600.00, 28, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(328, 1, 'خدمة 3 - فئة 28', 'Service 3 - Category 28', 'وصف خدمة 3 في فئة 28', 'Description of Service 3 in Category 28', 1700.00, 28, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(329, 1, 'خدمة 4 - فئة 28', 'Service 4 - Category 28', 'وصف خدمة 4 في فئة 28', 'Description of Service 4 in Category 28', 1800.00, 28, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(330, 1, 'خدمة 5 - فئة 28', 'Service 5 - Category 28', 'وصف خدمة 5 في فئة 28', 'Description of Service 5 in Category 28', 1900.00, 28, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(331, 1, 'خدمة 1 - فئة 29', 'Service 1 - Category 29', 'وصف خدمة 1 في فئة 29', 'Description of Service 1 in Category 29', 1550.00, 29, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(332, 1, 'خدمة 2 - فئة 29', 'Service 2 - Category 29', 'وصف خدمة 2 في فئة 29', 'Description of Service 2 in Category 29', 1650.00, 29, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(333, 1, 'خدمة 3 - فئة 29', 'Service 3 - Category 29', 'وصف خدمة 3 في فئة 29', 'Description of Service 3 in Category 29', 1750.00, 29, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(334, 1, 'خدمة 4 - فئة 29', 'Service 4 - Category 29', 'وصف خدمة 4 في فئة 29', 'Description of Service 4 in Category 29', 1850.00, 29, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(335, 1, 'خدمة 5 - فئة 29', 'Service 5 - Category 29', 'وصف خدمة 5 في فئة 29', 'Description of Service 5 in Category 29', 1950.00, 29, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(336, 1, 'خدمة 1 - فئة 30', 'Service 1 - Category 30', 'وصف خدمة 1 في فئة 30', 'Description of Service 1 in Category 30', 1600.00, 30, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(337, 1, 'خدمة 2 - فئة 30', 'Service 2 - Category 30', 'وصف خدمة 2 في فئة 30', 'Description of Service 2 in Category 30', 1700.00, 30, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(338, 1, 'خدمة 3 - فئة 30', 'Service 3 - Category 30', 'وصف خدمة 3 في فئة 30', 'Description of Service 3 in Category 30', 1800.00, 30, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(339, 1, 'خدمة 4 - فئة 30', 'Service 4 - Category 30', 'وصف خدمة 4 في فئة 30', 'Description of Service 4 in Category 30', 1900.00, 30, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(340, 1, 'خدمة 5 - فئة 30', 'Service 5 - Category 30', 'وصف خدمة 5 في فئة 30', 'Description of Service 5 in Category 30', 2000.00, 30, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(341, 1, 'خدمة 1 - فئة 31', 'Service 1 - Category 31', 'وصف خدمة 1 في فئة 31', 'Description of Service 1 in Category 31', 1650.00, 31, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(342, 1, 'خدمة 2 - فئة 31', 'Service 2 - Category 31', 'وصف خدمة 2 في فئة 31', 'Description of Service 2 in Category 31', 1750.00, 31, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(343, 1, 'خدمة 3 - فئة 31', 'Service 3 - Category 31', 'وصف خدمة 3 في فئة 31', 'Description of Service 3 in Category 31', 1850.00, 31, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(344, 1, 'خدمة 4 - فئة 31', 'Service 4 - Category 31', 'وصف خدمة 4 في فئة 31', 'Description of Service 4 in Category 31', 1950.00, 31, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(345, 1, 'خدمة 5 - فئة 31', 'Service 5 - Category 31', 'وصف خدمة 5 في فئة 31', 'Description of Service 5 in Category 31', 2050.00, 31, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(346, 1, 'خدمة 1 - فئة 32', 'Service 1 - Category 32', 'وصف خدمة 1 في فئة 32', 'Description of Service 1 in Category 32', 1700.00, 32, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(347, 1, 'خدمة 2 - فئة 32', 'Service 2 - Category 32', 'وصف خدمة 2 في فئة 32', 'Description of Service 2 in Category 32', 1800.00, 32, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(348, 1, 'خدمة 3 - فئة 32', 'Service 3 - Category 32', 'وصف خدمة 3 في فئة 32', 'Description of Service 3 in Category 32', 1900.00, 32, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(349, 1, 'خدمة 4 - فئة 32', 'Service 4 - Category 32', 'وصف خدمة 4 في فئة 32', 'Description of Service 4 in Category 32', 2000.00, 32, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(350, 1, 'خدمة 5 - فئة 32', 'Service 5 - Category 32', 'وصف خدمة 5 في فئة 32', 'Description of Service 5 in Category 32', 2100.00, 32, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(351, 1, 'خدمة 1 - فئة 33', 'Service 1 - Category 33', 'وصف خدمة 1 في فئة 33', 'Description of Service 1 in Category 33', 1750.00, 33, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(352, 1, 'خدمة 2 - فئة 33', 'Service 2 - Category 33', 'وصف خدمة 2 في فئة 33', 'Description of Service 2 in Category 33', 1850.00, 33, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(353, 1, 'خدمة 3 - فئة 33', 'Service 3 - Category 33', 'وصف خدمة 3 في فئة 33', 'Description of Service 3 in Category 33', 1950.00, 33, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(354, 1, 'خدمة 4 - فئة 33', 'Service 4 - Category 33', 'وصف خدمة 4 في فئة 33', 'Description of Service 4 in Category 33', 2050.00, 33, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(355, 1, 'خدمة 5 - فئة 33', 'Service 5 - Category 33', 'وصف خدمة 5 في فئة 33', 'Description of Service 5 in Category 33', 2150.00, 33, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(356, 1, 'خدمة 1 - فئة 34', 'Service 1 - Category 34', 'وصف خدمة 1 في فئة 34', 'Description of Service 1 in Category 34', 1800.00, 34, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(357, 1, 'خدمة 2 - فئة 34', 'Service 2 - Category 34', 'وصف خدمة 2 في فئة 34', 'Description of Service 2 in Category 34', 1900.00, 34, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(358, 1, 'خدمة 3 - فئة 34', 'Service 3 - Category 34', 'وصف خدمة 3 في فئة 34', 'Description of Service 3 in Category 34', 2000.00, 34, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(359, 1, 'خدمة 4 - فئة 34', 'Service 4 - Category 34', 'وصف خدمة 4 في فئة 34', 'Description of Service 4 in Category 34', 2100.00, 34, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(360, 1, 'خدمة 5 - فئة 34', 'Service 5 - Category 34', 'وصف خدمة 5 في فئة 34', 'Description of Service 5 in Category 34', 2200.00, 34, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(361, 1, 'خدمة 1 - فئة 35', 'Service 1 - Category 35', 'وصف خدمة 1 في فئة 35', 'Description of Service 1 in Category 35', 1850.00, 35, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(362, 1, 'خدمة 2 - فئة 35', 'Service 2 - Category 35', 'وصف خدمة 2 في فئة 35', 'Description of Service 2 in Category 35', 1950.00, 35, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(363, 1, 'خدمة 3 - فئة 35', 'Service 3 - Category 35', 'وصف خدمة 3 في فئة 35', 'Description of Service 3 in Category 35', 2050.00, 35, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(364, 1, 'خدمة 4 - فئة 35', 'Service 4 - Category 35', 'وصف خدمة 4 في فئة 35', 'Description of Service 4 in Category 35', 2150.00, 35, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(365, 1, 'خدمة 5 - فئة 35', 'Service 5 - Category 35', 'وصف خدمة 5 في فئة 35', 'Description of Service 5 in Category 35', 2250.00, 35, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(366, 1, 'خدمة 1 - فئة 36', 'Service 1 - Category 36', 'وصف خدمة 1 في فئة 36', 'Description of Service 1 in Category 36', 1900.00, 36, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(367, 1, 'خدمة 2 - فئة 36', 'Service 2 - Category 36', 'وصف خدمة 2 في فئة 36', 'Description of Service 2 in Category 36', 2000.00, 36, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(368, 1, 'خدمة 3 - فئة 36', 'Service 3 - Category 36', 'وصف خدمة 3 في فئة 36', 'Description of Service 3 in Category 36', 2100.00, 36, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(369, 1, 'خدمة 4 - فئة 36', 'Service 4 - Category 36', 'وصف خدمة 4 في فئة 36', 'Description of Service 4 in Category 36', 2200.00, 36, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(370, 1, 'خدمة 5 - فئة 36', 'Service 5 - Category 36', 'وصف خدمة 5 في فئة 36', 'Description of Service 5 in Category 36', 2300.00, 36, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(371, 1, 'خدمة 1 - فئة 37', 'Service 1 - Category 37', 'وصف خدمة 1 في فئة 37', 'Description of Service 1 in Category 37', 1950.00, 37, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(372, 1, 'خدمة 2 - فئة 37', 'Service 2 - Category 37', 'وصف خدمة 2 في فئة 37', 'Description of Service 2 in Category 37', 2050.00, 37, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(373, 1, 'خدمة 3 - فئة 37', 'Service 3 - Category 37', 'وصف خدمة 3 في فئة 37', 'Description of Service 3 in Category 37', 2150.00, 37, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(374, 1, 'خدمة 4 - فئة 37', 'Service 4 - Category 37', 'وصف خدمة 4 في فئة 37', 'Description of Service 4 in Category 37', 2250.00, 37, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15'),
(375, 1, 'خدمة 5 - فئة 37', 'Service 5 - Category 37', 'وصف خدمة 5 في فئة 37', 'Description of Service 5 in Category 37', 2350.00, 37, 'active', '2025-08-20 01:53:15', '2025-08-20 01:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name_ar`, `name_en`, `image`, `created_at`, `updated_at`) VALUES
(1, 'القاعات الفندقية VIP', 'VIP Hotel Halls', 'assets/img/categories/hall.webp', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(2, 'الغرف الفندقية VIP', 'VIP Hotel Rooms', 'assets/img/categories/6755f74075e351.20426279.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(3, 'قاعة', 'Hall', 'assets/img/categories/675211f167f6e7.57296036.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(4, 'استراحة', 'Rest Area', 'assets/img/categories/6755f72b2d4a62.41485752.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(5, 'مصور', 'Photographer (Male)', 'assets/img/categories/6755978cbc3156.14053519.jpeg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(6, 'مصورة', 'Photographer (Female)', 'assets/img/categories/6755db633f2a42.52102286.jpeg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(7, 'كوشة', 'Wedding Stage (Kosha)', 'assets/img/categories/6755dbb03d5a64.05038847.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(8, 'استقبال', 'Reception', 'assets/img/categories/6755dbf334c590.43078327.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(9, 'مضيفات', 'Hostesses', 'assets/img/categories/67575ec99913d7.04105646.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(10, 'بوفيه مفتوح', 'Open Buffet', 'assets/img/categories/6752116e399b13.31136928.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(11, 'ضيافة', 'Hospitality', 'assets/img/categories/6758792b852730.00942490.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(12, 'فنانه', 'Female Artist', 'assets/img/categories/675597c143c792.12721835.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(13, 'فرش, انارة وكراسي', 'Furniture, Lighting & Chairs', 'assets/img/categories/67588650663bc5.46841188.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(14, 'مطاعم تجهيز العشاء', 'Dinner Catering Restaurants', 'assets/img/categories/67589ccd704e79.40743595.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(15, 'كيكة', 'Cake', 'assets/img/categories/6755f7a4d44929.33857836.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(16, 'مسكات عرائس', 'Bridal Bouquets', 'assets/img/categories/67575e8798ce00.61468668.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(17, 'تجهيز غرفه الفندق', 'Hotel Room Preparation', 'assets/img/categories/6755f76e7fb463.39767350.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(18, 'هير ستايل', 'Hairstyle', 'assets/img/categories/675596ed4f8193.10611981.jpeg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(19, 'تزيين السياره', 'Car Decoration', 'assets/img/categories/67588d1c4379a5.35269618.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(20, 'ذبائح', 'Slaughtered Meat (Dhabihah)', 'assets/img/categories/67588eb274cbd7.06466331.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(21, 'زفات', 'Wedding Entrances (Zaffat)', 'assets/img/categories/67589d3c5446c4.02013081.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(22, 'توزيعات و هدايا', 'Giveaways & Gifts', 'assets/img/categories/67588da02ad734.99424837.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(23, 'وصيفة', 'Bridesmaid', 'assets/img/categories/675884ff6a11a0.01752848.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(24, 'مشغل نسائي', 'Women’s Salon', 'assets/img/categories/675211440e6fd8.63826003.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(25, 'خدمات العناية', 'Beauty Care Services', 'assets/img/categories/6759cfcce765e8.69787514.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(26, 'ميكب ارتست', 'Makeup Artist', 'assets/img/categories/67559a49de41d1.43002873.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(27, 'فنان', 'Artist (Male)', 'assets/img/categories/67559a03e77491.03597813.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(28, 'تنسيق ورد', 'Flower Arrangement', 'assets/img/categories/67587a5bd49bd9.63063487.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(29, 'نقاشة حنا', 'Henna Artist', 'assets/img/categories/67587a8b868850.90345853.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(30, 'عضاية فل', 'Flower Garland', 'assets/img/categories/67588530ee8ae5.84486224.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(31, 'تصميم دعوات', 'Invitation Design', 'assets/img/categories/6758684126ca08.77739086.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(32, 'دي جي', 'DJ', 'assets/img/categories/67589dd7e58683.27793088.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(33, 'رسامة', 'Painter (Female)', 'assets/img/categories/6755fb51366d04.85021553.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(34, 'دواليب ملكة', 'Bride’s Wardrobe', 'assets/img/categories/675868820a2b83.29242737.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(35, 'كماليات', 'Accessories', 'assets/img/categories/6759d0004cd543.10746782.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(36, 'الفن الشعبي', 'Folk Art', 'assets/img/categories/67588d3d7e8185.81413159.jpg', '2025-08-20 00:31:57', '2025-08-20 00:31:57'),
(37, 'مقدم قهوة', 'Coffee Server', 'assets/img/categories/675879954cc2c9.40806568.png', '2025-08-20 00:31:57', '2025-08-20 00:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `service_cities`
--

CREATE TABLE `service_cities` (
  `service_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_cities`
--

INSERT INTO `service_cities` (`service_id`, `city_id`, `created_at`, `updated_at`) VALUES
(191, 2, '2025-08-20 23:38:29', NULL),
(192, 2, '2025-08-20 23:38:29', NULL),
(193, 2, '2025-08-20 23:38:29', NULL),
(194, 2, '2025-08-20 23:38:29', NULL),
(195, 2, '2025-08-20 23:38:29', NULL),
(196, 2, '2025-08-20 23:38:29', NULL),
(197, 2, '2025-08-20 23:38:29', NULL),
(198, 2, '2025-08-20 23:38:29', NULL),
(199, 2, '2025-08-20 23:38:29', NULL),
(200, 2, '2025-08-20 23:38:29', NULL),
(201, 2, '2025-08-20 23:38:29', NULL),
(202, 2, '2025-08-20 23:38:29', NULL),
(203, 2, '2025-08-20 23:38:29', NULL),
(204, 2, '2025-08-20 23:38:29', NULL),
(205, 2, '2025-08-20 23:38:29', NULL),
(206, 2, '2025-08-20 23:38:29', NULL),
(207, 2, '2025-08-20 23:38:29', NULL),
(208, 2, '2025-08-20 23:38:29', NULL),
(209, 2, '2025-08-20 23:38:29', NULL),
(210, 2, '2025-08-20 23:38:29', NULL),
(211, 2, '2025-08-20 23:38:29', NULL),
(212, 2, '2025-08-20 23:38:29', NULL),
(213, 2, '2025-08-20 23:38:29', NULL),
(214, 2, '2025-08-20 23:38:29', NULL),
(215, 2, '2025-08-20 23:38:29', NULL),
(216, 2, '2025-08-20 23:38:29', NULL),
(217, 2, '2025-08-20 23:38:29', NULL),
(218, 2, '2025-08-20 23:38:29', NULL),
(219, 2, '2025-08-20 23:38:29', NULL),
(220, 2, '2025-08-20 23:38:29', NULL),
(221, 2, '2025-08-20 23:38:29', NULL),
(222, 2, '2025-08-20 23:38:29', NULL),
(223, 2, '2025-08-20 23:38:29', NULL),
(224, 2, '2025-08-20 23:38:29', NULL),
(225, 2, '2025-08-20 23:38:29', NULL),
(226, 2, '2025-08-20 23:38:29', NULL),
(227, 2, '2025-08-20 23:38:29', NULL),
(228, 2, '2025-08-20 23:38:29', NULL),
(229, 2, '2025-08-20 23:38:29', NULL),
(230, 2, '2025-08-20 23:38:29', NULL),
(231, 2, '2025-08-20 23:38:29', NULL),
(232, 2, '2025-08-20 23:38:29', NULL),
(233, 2, '2025-08-20 23:38:29', NULL),
(234, 2, '2025-08-20 23:38:29', NULL),
(235, 2, '2025-08-20 23:38:29', NULL),
(236, 2, '2025-08-20 23:38:29', NULL),
(237, 2, '2025-08-20 23:38:29', NULL),
(238, 2, '2025-08-20 23:38:29', NULL),
(239, 2, '2025-08-20 23:38:29', NULL),
(240, 2, '2025-08-20 23:38:29', NULL),
(241, 2, '2025-08-20 23:38:29', NULL),
(242, 2, '2025-08-20 23:38:29', NULL),
(243, 2, '2025-08-20 23:38:29', NULL),
(244, 2, '2025-08-20 23:38:29', NULL),
(245, 2, '2025-08-20 23:38:29', NULL),
(246, 2, '2025-08-20 23:38:29', NULL),
(247, 2, '2025-08-20 23:38:29', NULL),
(248, 2, '2025-08-20 23:38:29', NULL),
(249, 2, '2025-08-20 23:38:29', NULL),
(250, 2, '2025-08-20 23:38:29', NULL),
(251, 2, '2025-08-20 23:38:29', NULL),
(252, 2, '2025-08-20 23:38:29', NULL),
(253, 2, '2025-08-20 23:38:29', NULL),
(254, 2, '2025-08-20 23:38:29', NULL),
(255, 2, '2025-08-20 23:38:29', NULL),
(256, 2, '2025-08-20 23:38:29', NULL),
(257, 2, '2025-08-20 23:38:29', NULL),
(258, 2, '2025-08-20 23:38:29', NULL),
(259, 2, '2025-08-20 23:38:29', NULL),
(260, 2, '2025-08-20 23:38:29', NULL),
(261, 2, '2025-08-20 23:38:29', NULL),
(262, 2, '2025-08-20 23:38:29', NULL),
(263, 2, '2025-08-20 23:38:29', NULL),
(264, 2, '2025-08-20 23:38:29', NULL),
(265, 2, '2025-08-20 23:38:29', NULL),
(266, 2, '2025-08-20 23:38:29', NULL),
(267, 2, '2025-08-20 23:38:29', NULL),
(268, 2, '2025-08-20 23:38:29', NULL),
(269, 2, '2025-08-20 23:38:29', NULL),
(270, 2, '2025-08-20 23:38:29', NULL),
(271, 2, '2025-08-20 23:38:29', NULL),
(272, 2, '2025-08-20 23:38:29', NULL),
(273, 2, '2025-08-20 23:38:29', NULL),
(274, 2, '2025-08-20 23:38:29', NULL),
(275, 2, '2025-08-20 23:38:29', NULL),
(276, 2, '2025-08-20 23:38:29', NULL),
(277, 2, '2025-08-20 23:38:29', NULL),
(278, 2, '2025-08-20 23:38:29', NULL),
(279, 2, '2025-08-20 23:38:29', NULL),
(280, 2, '2025-08-20 23:38:29', NULL),
(281, 2, '2025-08-20 23:38:29', NULL),
(282, 2, '2025-08-20 23:38:29', NULL),
(283, 2, '2025-08-20 23:38:29', NULL),
(284, 2, '2025-08-20 23:38:29', NULL),
(285, 2, '2025-08-20 23:38:29', NULL),
(286, 2, '2025-08-20 23:38:29', NULL),
(287, 2, '2025-08-20 23:38:29', NULL),
(288, 2, '2025-08-20 23:38:29', NULL),
(289, 2, '2025-08-20 23:38:29', NULL),
(290, 2, '2025-08-20 23:38:29', NULL),
(291, 2, '2025-08-20 23:38:29', NULL),
(292, 2, '2025-08-20 23:38:29', NULL),
(293, 2, '2025-08-20 23:38:29', NULL),
(294, 2, '2025-08-20 23:38:29', NULL),
(295, 2, '2025-08-20 23:38:29', NULL),
(296, 2, '2025-08-20 23:38:29', NULL),
(297, 2, '2025-08-20 23:38:29', NULL),
(298, 2, '2025-08-20 23:38:29', NULL),
(299, 2, '2025-08-20 23:38:29', NULL),
(300, 2, '2025-08-20 23:38:29', NULL),
(301, 2, '2025-08-20 23:38:29', NULL),
(302, 2, '2025-08-20 23:38:29', NULL),
(303, 2, '2025-08-20 23:38:29', NULL),
(304, 2, '2025-08-20 23:38:29', NULL),
(305, 2, '2025-08-20 23:38:29', NULL),
(306, 2, '2025-08-20 23:38:29', NULL),
(307, 2, '2025-08-20 23:38:29', NULL),
(308, 2, '2025-08-20 23:38:29', NULL),
(309, 2, '2025-08-20 23:38:29', NULL),
(310, 2, '2025-08-20 23:38:29', NULL),
(311, 2, '2025-08-20 23:38:29', NULL),
(312, 2, '2025-08-20 23:38:29', NULL),
(313, 2, '2025-08-20 23:38:29', NULL),
(314, 2, '2025-08-20 23:38:29', NULL),
(315, 2, '2025-08-20 23:38:29', NULL),
(316, 2, '2025-08-20 23:38:29', NULL),
(317, 2, '2025-08-20 23:38:29', NULL),
(318, 2, '2025-08-20 23:38:29', NULL),
(319, 2, '2025-08-20 23:38:29', NULL),
(320, 2, '2025-08-20 23:38:29', NULL),
(321, 2, '2025-08-20 23:38:29', NULL),
(322, 2, '2025-08-20 23:38:29', NULL),
(323, 2, '2025-08-20 23:38:29', NULL),
(324, 2, '2025-08-20 23:38:29', NULL),
(325, 2, '2025-08-20 23:38:29', NULL),
(326, 2, '2025-08-20 23:38:29', NULL),
(327, 2, '2025-08-20 23:38:29', NULL),
(328, 2, '2025-08-20 23:38:29', NULL),
(329, 2, '2025-08-20 23:38:29', NULL),
(330, 2, '2025-08-20 23:38:29', NULL),
(331, 2, '2025-08-20 23:38:29', NULL),
(332, 2, '2025-08-20 23:38:29', NULL),
(333, 2, '2025-08-20 23:38:29', NULL),
(334, 2, '2025-08-20 23:38:29', NULL),
(335, 2, '2025-08-20 23:38:29', NULL),
(336, 2, '2025-08-20 23:38:29', NULL),
(337, 2, '2025-08-20 23:38:29', NULL),
(338, 2, '2025-08-20 23:38:29', NULL),
(339, 2, '2025-08-20 23:38:29', NULL),
(340, 2, '2025-08-20 23:38:29', NULL),
(341, 2, '2025-08-20 23:38:29', NULL),
(342, 2, '2025-08-20 23:38:29', NULL),
(343, 2, '2025-08-20 23:38:29', NULL),
(344, 2, '2025-08-20 23:38:29', NULL),
(345, 2, '2025-08-20 23:38:29', NULL),
(346, 2, '2025-08-20 23:38:29', NULL),
(347, 2, '2025-08-20 23:38:29', NULL),
(348, 2, '2025-08-20 23:38:29', NULL),
(349, 2, '2025-08-20 23:38:29', NULL),
(350, 2, '2025-08-20 23:38:29', NULL),
(351, 2, '2025-08-20 23:38:29', NULL),
(352, 2, '2025-08-20 23:38:29', NULL),
(353, 2, '2025-08-20 23:38:29', NULL),
(354, 2, '2025-08-20 23:38:29', NULL),
(355, 2, '2025-08-20 23:38:29', NULL),
(356, 2, '2025-08-20 23:38:29', NULL),
(357, 2, '2025-08-20 23:38:29', NULL),
(358, 2, '2025-08-20 23:38:29', NULL),
(359, 2, '2025-08-20 23:38:29', NULL),
(360, 2, '2025-08-20 23:38:29', NULL),
(361, 2, '2025-08-20 23:38:29', NULL),
(362, 2, '2025-08-20 23:38:29', NULL),
(363, 2, '2025-08-20 23:38:29', NULL),
(364, 2, '2025-08-20 23:38:29', NULL),
(365, 2, '2025-08-20 23:38:29', NULL),
(366, 2, '2025-08-20 23:38:29', NULL),
(367, 2, '2025-08-20 23:38:29', NULL),
(368, 2, '2025-08-20 23:38:29', NULL),
(369, 2, '2025-08-20 23:38:29', NULL),
(370, 2, '2025-08-20 23:38:29', NULL),
(371, 2, '2025-08-20 23:38:29', NULL),
(372, 2, '2025-08-20 23:38:29', NULL),
(373, 2, '2025-08-20 23:38:29', NULL),
(374, 2, '2025-08-20 23:38:29', NULL),
(375, 2, '2025-08-20 23:38:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_features`
--

CREATE TABLE `service_features` (
  `id` bigint(20) NOT NULL,
  `service_id` int(11) NOT NULL,
  `description_ar` varchar(255) DEFAULT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_features`
--

INSERT INTO `service_features` (`id`, `service_id`, `description_ar`, `description_en`, `created_at`, `updated_at`) VALUES
(26, 191, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(27, 191, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(28, 191, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(29, 191, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(30, 191, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(31, 192, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(32, 192, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(33, 192, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(34, 192, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(35, 192, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(36, 193, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(37, 193, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(38, 193, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(39, 193, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(40, 193, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(41, 194, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(42, 194, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(43, 194, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(44, 194, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(45, 194, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(46, 195, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(47, 195, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(48, 195, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(49, 195, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(50, 195, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(51, 196, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(52, 196, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(53, 196, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(54, 196, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(55, 196, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(56, 197, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(57, 197, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(58, 197, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(59, 197, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(60, 197, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(61, 198, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(62, 198, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(63, 198, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(64, 198, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(65, 198, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(66, 199, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(67, 199, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(68, 199, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(69, 199, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(70, 199, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(71, 200, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(72, 200, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(73, 200, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(74, 200, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(75, 200, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(76, 201, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(77, 201, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(78, 201, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(79, 201, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(80, 201, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(81, 202, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(82, 202, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(83, 202, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(84, 202, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(85, 202, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(86, 203, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(87, 203, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(88, 203, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(89, 203, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(90, 203, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(91, 204, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(92, 204, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(93, 204, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(94, 204, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(95, 204, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(96, 205, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(97, 205, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(98, 205, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(99, 205, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(100, 205, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(101, 206, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(102, 206, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(103, 206, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(104, 206, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(105, 206, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(106, 207, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(107, 207, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(108, 207, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(109, 207, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(110, 207, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(111, 208, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(112, 208, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(113, 208, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(114, 208, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(115, 208, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(116, 209, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(117, 209, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(118, 209, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(119, 209, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(120, 209, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(121, 210, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(122, 210, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(123, 210, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(124, 210, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(125, 210, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(126, 211, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(127, 211, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(128, 211, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(129, 211, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(130, 211, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(131, 212, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(132, 212, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(133, 212, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(134, 212, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(135, 212, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(136, 213, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(137, 213, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(138, 213, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(139, 213, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(140, 213, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(141, 214, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(142, 214, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(143, 214, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(144, 214, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(145, 214, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(146, 215, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(147, 215, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(148, 215, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(149, 215, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(150, 215, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(151, 216, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(152, 216, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(153, 216, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(154, 216, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(155, 216, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(156, 217, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(157, 217, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(158, 217, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(159, 217, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(160, 217, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(161, 218, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(162, 218, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(163, 218, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(164, 218, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(165, 218, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(166, 219, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(167, 219, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(168, 219, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(169, 219, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(170, 219, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(171, 220, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(172, 220, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(173, 220, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(174, 220, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(175, 220, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(176, 221, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(177, 221, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(178, 221, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(179, 221, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(180, 221, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(181, 222, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(182, 222, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(183, 222, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(184, 222, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(185, 222, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(186, 223, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(187, 223, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(188, 223, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(189, 223, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(190, 223, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(191, 224, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(192, 224, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(193, 224, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(194, 224, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(195, 224, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(196, 225, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(197, 225, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(198, 225, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(199, 225, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(200, 225, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(201, 226, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(202, 226, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(203, 226, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(204, 226, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(205, 226, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(206, 227, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(207, 227, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(208, 227, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(209, 227, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(210, 227, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(211, 228, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL);
INSERT INTO `service_features` (`id`, `service_id`, `description_ar`, `description_en`, `created_at`, `updated_at`) VALUES
(212, 228, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(213, 228, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(214, 228, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(215, 228, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(216, 229, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(217, 229, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(218, 229, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(219, 229, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(220, 229, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(221, 230, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(222, 230, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(223, 230, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(224, 230, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(225, 230, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(226, 231, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(227, 231, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(228, 231, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(229, 231, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(230, 231, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(231, 232, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(232, 232, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(233, 232, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(234, 232, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(235, 232, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(236, 233, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(237, 233, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(238, 233, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(239, 233, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(240, 233, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(241, 234, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(242, 234, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(243, 234, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(244, 234, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(245, 234, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(246, 235, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(247, 235, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(248, 235, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(249, 235, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(250, 235, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(251, 236, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(252, 236, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(253, 236, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(254, 236, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(255, 236, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(256, 237, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(257, 237, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(258, 237, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(259, 237, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(260, 237, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(261, 238, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(262, 238, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(263, 238, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(264, 238, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(265, 238, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(266, 239, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(267, 239, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(268, 239, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(269, 239, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(270, 239, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(271, 240, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(272, 240, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(273, 240, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(274, 240, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(275, 240, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(276, 241, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(277, 241, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(278, 241, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(279, 241, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(280, 241, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(281, 242, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(282, 242, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(283, 242, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(284, 242, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(285, 242, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(286, 243, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(287, 243, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(288, 243, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(289, 243, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(290, 243, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(291, 244, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(292, 244, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(293, 244, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(294, 244, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(295, 244, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(296, 245, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(297, 245, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(298, 245, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(299, 245, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(300, 245, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(301, 246, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(302, 246, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(303, 246, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(304, 246, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(305, 246, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(306, 247, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(307, 247, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(308, 247, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(309, 247, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(310, 247, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(311, 248, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(312, 248, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(313, 248, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(314, 248, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(315, 248, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(316, 249, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(317, 249, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(318, 249, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(319, 249, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(320, 249, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(321, 250, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(322, 250, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(323, 250, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(324, 250, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(325, 250, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(326, 251, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(327, 251, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(328, 251, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(329, 251, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(330, 251, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(331, 252, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(332, 252, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(333, 252, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(334, 252, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(335, 252, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(336, 253, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(337, 253, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(338, 253, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(339, 253, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(340, 253, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(341, 254, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(342, 254, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(343, 254, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(344, 254, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(345, 254, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(346, 255, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(347, 255, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(348, 255, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(349, 255, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(350, 255, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(351, 256, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(352, 256, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(353, 256, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(354, 256, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(355, 256, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(356, 257, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(357, 257, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(358, 257, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(359, 257, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(360, 257, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(361, 258, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(362, 258, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(363, 258, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(364, 258, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(365, 258, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(366, 259, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(367, 259, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(368, 259, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(369, 259, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(370, 259, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(371, 260, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(372, 260, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(373, 260, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(374, 260, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(375, 260, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(376, 261, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(377, 261, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(378, 261, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(379, 261, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(380, 261, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(381, 262, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(382, 262, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(383, 262, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(384, 262, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(385, 262, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(386, 263, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(387, 263, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(388, 263, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(389, 263, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(390, 263, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(391, 264, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(392, 264, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(393, 264, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(394, 264, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(395, 264, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(396, 265, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(397, 265, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL);
INSERT INTO `service_features` (`id`, `service_id`, `description_ar`, `description_en`, `created_at`, `updated_at`) VALUES
(398, 265, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(399, 265, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(400, 265, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(401, 266, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(402, 266, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(403, 266, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(404, 266, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(405, 266, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(406, 267, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(407, 267, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(408, 267, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(409, 267, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(410, 267, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(411, 268, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(412, 268, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(413, 268, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(414, 268, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(415, 268, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(416, 269, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(417, 269, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(418, 269, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(419, 269, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(420, 269, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(421, 270, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(422, 270, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(423, 270, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(424, 270, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(425, 270, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(426, 271, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(427, 271, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(428, 271, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(429, 271, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(430, 271, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(431, 272, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(432, 272, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(433, 272, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(434, 272, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(435, 272, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(436, 273, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(437, 273, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(438, 273, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(439, 273, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(440, 273, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(441, 274, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(442, 274, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(443, 274, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(444, 274, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(445, 274, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(446, 275, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(447, 275, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(448, 275, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(449, 275, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(450, 275, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(451, 276, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(452, 276, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(453, 276, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(454, 276, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(455, 276, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(456, 277, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(457, 277, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(458, 277, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(459, 277, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(460, 277, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(461, 278, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(462, 278, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(463, 278, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(464, 278, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(465, 278, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(466, 279, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(467, 279, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(468, 279, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(469, 279, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(470, 279, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(471, 280, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(472, 280, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(473, 280, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(474, 280, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(475, 280, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(476, 281, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(477, 281, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(478, 281, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(479, 281, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(480, 281, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(481, 282, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(482, 282, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(483, 282, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(484, 282, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(485, 282, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(486, 283, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(487, 283, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(488, 283, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(489, 283, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(490, 283, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(491, 284, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(492, 284, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(493, 284, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(494, 284, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(495, 284, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(496, 285, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(497, 285, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(498, 285, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(499, 285, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(500, 285, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(501, 286, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(502, 286, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(503, 286, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(504, 286, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(505, 286, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(506, 287, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(507, 287, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(508, 287, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(509, 287, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(510, 287, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(511, 288, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(512, 288, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(513, 288, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(514, 288, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(515, 288, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(516, 289, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(517, 289, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(518, 289, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(519, 289, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(520, 289, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(521, 290, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(522, 290, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(523, 290, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(524, 290, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(525, 290, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(526, 291, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(527, 291, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(528, 291, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(529, 291, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(530, 291, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(531, 292, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(532, 292, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(533, 292, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(534, 292, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(535, 292, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(536, 293, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(537, 293, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(538, 293, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(539, 293, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(540, 293, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(541, 294, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(542, 294, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(543, 294, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(544, 294, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(545, 294, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(546, 295, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(547, 295, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(548, 295, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(549, 295, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(550, 295, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(551, 296, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(552, 296, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(553, 296, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(554, 296, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(555, 296, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(556, 297, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(557, 297, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(558, 297, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(559, 297, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(560, 297, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(561, 298, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(562, 298, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(563, 298, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(564, 298, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(565, 298, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(566, 299, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(567, 299, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(568, 299, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(569, 299, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(570, 299, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(571, 300, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(572, 300, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(573, 300, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(574, 300, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(575, 300, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(576, 301, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(577, 301, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(578, 301, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(579, 301, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(580, 301, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(581, 302, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(582, 302, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(583, 302, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL);
INSERT INTO `service_features` (`id`, `service_id`, `description_ar`, `description_en`, `created_at`, `updated_at`) VALUES
(584, 302, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(585, 302, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(586, 303, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(587, 303, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(588, 303, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(589, 303, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(590, 303, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(591, 304, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(592, 304, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(593, 304, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(594, 304, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(595, 304, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(596, 305, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(597, 305, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(598, 305, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(599, 305, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(600, 305, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(601, 306, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(602, 306, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(603, 306, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(604, 306, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(605, 306, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(606, 307, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(607, 307, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(608, 307, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(609, 307, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(610, 307, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(611, 308, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(612, 308, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(613, 308, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(614, 308, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(615, 308, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(616, 309, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(617, 309, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(618, 309, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(619, 309, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(620, 309, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(621, 310, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(622, 310, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(623, 310, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(624, 310, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(625, 310, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(626, 311, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(627, 311, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(628, 311, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(629, 311, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(630, 311, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(631, 312, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(632, 312, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(633, 312, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(634, 312, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(635, 312, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(636, 313, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(637, 313, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(638, 313, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(639, 313, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(640, 313, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(641, 314, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(642, 314, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(643, 314, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(644, 314, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(645, 314, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(646, 315, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(647, 315, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(648, 315, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(649, 315, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(650, 315, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(651, 316, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(652, 316, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(653, 316, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(654, 316, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(655, 316, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(656, 317, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(657, 317, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(658, 317, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(659, 317, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(660, 317, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(661, 318, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(662, 318, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(663, 318, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(664, 318, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(665, 318, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(666, 319, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(667, 319, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(668, 319, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(669, 319, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(670, 319, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(671, 320, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(672, 320, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(673, 320, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(674, 320, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(675, 320, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(676, 321, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(677, 321, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(678, 321, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(679, 321, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(680, 321, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(681, 322, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(682, 322, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(683, 322, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(684, 322, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(685, 322, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(686, 323, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(687, 323, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(688, 323, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(689, 323, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(690, 323, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(691, 324, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(692, 324, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(693, 324, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(694, 324, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(695, 324, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(696, 325, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(697, 325, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(698, 325, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(699, 325, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(700, 325, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(701, 326, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(702, 326, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(703, 326, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(704, 326, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(705, 326, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(706, 327, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(707, 327, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(708, 327, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(709, 327, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(710, 327, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(711, 328, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(712, 328, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(713, 328, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(714, 328, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(715, 328, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(716, 329, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(717, 329, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(718, 329, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(719, 329, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(720, 329, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(721, 330, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(722, 330, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(723, 330, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(724, 330, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(725, 330, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(726, 331, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(727, 331, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(728, 331, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(729, 331, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(730, 331, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(731, 332, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(732, 332, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(733, 332, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(734, 332, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(735, 332, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(736, 333, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(737, 333, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(738, 333, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(739, 333, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(740, 333, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(741, 334, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(742, 334, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(743, 334, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(744, 334, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(745, 334, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(746, 335, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(747, 335, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(748, 335, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(749, 335, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(750, 335, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(751, 336, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(752, 336, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(753, 336, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(754, 336, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(755, 336, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(756, 337, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(757, 337, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(758, 337, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(759, 337, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(760, 337, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(761, 338, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(762, 338, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(763, 338, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(764, 338, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(765, 338, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(766, 339, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(767, 339, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(768, 339, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(769, 339, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL);
INSERT INTO `service_features` (`id`, `service_id`, `description_ar`, `description_en`, `created_at`, `updated_at`) VALUES
(770, 339, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(771, 340, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(772, 340, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(773, 340, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(774, 340, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(775, 340, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(776, 341, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(777, 341, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(778, 341, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(779, 341, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(780, 341, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(781, 342, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(782, 342, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(783, 342, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(784, 342, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(785, 342, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(786, 343, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(787, 343, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(788, 343, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(789, 343, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(790, 343, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(791, 344, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(792, 344, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(793, 344, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(794, 344, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(795, 344, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(796, 345, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(797, 345, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(798, 345, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(799, 345, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(800, 345, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(801, 346, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(802, 346, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(803, 346, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(804, 346, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(805, 346, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(806, 347, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(807, 347, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(808, 347, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(809, 347, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(810, 347, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(811, 348, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(812, 348, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(813, 348, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(814, 348, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(815, 348, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(816, 349, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(817, 349, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(818, 349, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(819, 349, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(820, 349, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(821, 350, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(822, 350, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(823, 350, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(824, 350, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(825, 350, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(826, 351, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(827, 351, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(828, 351, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(829, 351, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(830, 351, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(831, 352, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(832, 352, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(833, 352, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(834, 352, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(835, 352, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(836, 353, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(837, 353, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(838, 353, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(839, 353, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(840, 353, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(841, 354, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(842, 354, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(843, 354, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(844, 354, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(845, 354, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(846, 355, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(847, 355, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(848, 355, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(849, 355, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(850, 355, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(851, 356, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(852, 356, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(853, 356, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(854, 356, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(855, 356, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(856, 357, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(857, 357, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(858, 357, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(859, 357, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(860, 357, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(861, 358, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(862, 358, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(863, 358, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(864, 358, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(865, 358, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(866, 359, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(867, 359, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(868, 359, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(869, 359, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(870, 359, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(871, 360, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(872, 360, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(873, 360, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(874, 360, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(875, 360, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(876, 361, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(877, 361, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(878, 361, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(879, 361, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(880, 361, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(881, 362, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(882, 362, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(883, 362, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(884, 362, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(885, 362, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(886, 363, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(887, 363, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(888, 363, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(889, 363, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(890, 363, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(891, 364, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(892, 364, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(893, 364, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(894, 364, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(895, 364, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(896, 365, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(897, 365, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(898, 365, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(899, 365, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(900, 365, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(901, 366, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(902, 366, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(903, 366, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(904, 366, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(905, 366, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(906, 367, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(907, 367, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(908, 367, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(909, 367, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(910, 367, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(911, 368, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(912, 368, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(913, 368, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(914, 368, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(915, 368, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(916, 369, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(917, 369, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(918, 369, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(919, 369, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(920, 369, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(921, 370, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(922, 370, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(923, 370, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(924, 370, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(925, 370, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(926, 371, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(927, 371, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(928, 371, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(929, 371, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(930, 371, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(931, 372, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(932, 372, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(933, 372, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(934, 372, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(935, 372, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(936, 373, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(937, 373, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(938, 373, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(939, 373, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(940, 373, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(941, 374, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(942, 374, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(943, 374, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(944, 374, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(945, 374, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL),
(946, 375, 'نقدم خدمات بأعلى معايير الجودة، مع ضمان تقديم نتائج احترافية تلبي توقعات العملاء وتساهم في تحقيق أهدافهم.', 'We provide services with the highest quality standards, ensuring professional results that meet customer expectations and contribute to achieving their goals.', '2025-08-26 07:38:58', NULL),
(947, 375, 'كل خدمة يتم تصميمها بعناية لتتناسب مع احتياجات العميل الخاصة، مما يضمن تجربة فريدة ونتائج مخصصة.', 'Each service is carefully tailored to meet the specific needs of the client, ensuring a unique experience and customized results.', '2025-08-26 07:38:58', NULL),
(948, 375, 'فريق دعم عملاء متاح على مدار الساعة للإجابة على استفساراتك وضمان تجربة سلسة من البداية إلى النهاية.', 'A dedicated customer support team is available 24/7 to answer your inquiries and ensure a seamless experience from start to finish.', '2025-08-26 07:38:58', NULL),
(949, 375, 'نقدم أسعارًا واضحة وعادلة بدون رسوم خفية، مع تفاصيل كاملة عن تكلفة الخدمة مقدمًا.', 'We offer transparent and fair pricing with no hidden fees, providing full details of service costs upfront.', '2025-08-26 07:38:58', NULL),
(950, 375, 'نلتزم بالجداول الزمنية المتفق عليها، مما يضمن تسليم الخدمات في المواعيد المحددة بكفاءة ودقة.', 'We adhere to agreed-upon timelines, ensuring services are delivered on time with efficiency and precision.', '2025-08-26 07:38:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_images`
--

CREATE TABLE `service_images` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `src` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_images`
--

INSERT INTO `service_images` (`id`, `service_id`, `src`, `created_at`, `updated_at`) VALUES
(1, 191, 'assets/img/categories/hall.webp', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(2, 192, 'assets/img/categories/hall.webp', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(3, 193, 'assets/img/categories/hall.webp', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(4, 194, 'assets/img/categories/hall.webp', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(5, 195, 'assets/img/categories/hall.webp', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(6, 196, 'assets/img/categories/6755f74075e351.20426279.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(7, 197, 'assets/img/categories/6755f74075e351.20426279.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(8, 198, 'assets/img/categories/6755f74075e351.20426279.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(9, 199, 'assets/img/categories/6755f74075e351.20426279.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(10, 200, 'assets/img/categories/6755f74075e351.20426279.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(11, 201, 'assets/img/categories/675211f167f6e7.57296036.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(12, 202, 'assets/img/categories/675211f167f6e7.57296036.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(13, 203, 'assets/img/categories/675211f167f6e7.57296036.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(14, 204, 'assets/img/categories/675211f167f6e7.57296036.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(15, 205, 'assets/img/categories/675211f167f6e7.57296036.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(16, 206, 'assets/img/categories/6755f72b2d4a62.41485752.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(17, 207, 'assets/img/categories/6755f72b2d4a62.41485752.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(18, 208, 'assets/img/categories/6755f72b2d4a62.41485752.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(19, 209, 'assets/img/categories/6755f72b2d4a62.41485752.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(20, 210, 'assets/img/categories/6755f72b2d4a62.41485752.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(21, 211, 'assets/img/categories/6755978cbc3156.14053519.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(22, 212, 'assets/img/categories/6755978cbc3156.14053519.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(23, 213, 'assets/img/categories/6755978cbc3156.14053519.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(24, 214, 'assets/img/categories/6755978cbc3156.14053519.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(25, 215, 'assets/img/categories/6755978cbc3156.14053519.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(26, 216, 'assets/img/categories/6755db633f2a42.52102286.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(27, 217, 'assets/img/categories/6755db633f2a42.52102286.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(28, 218, 'assets/img/categories/6755db633f2a42.52102286.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(29, 219, 'assets/img/categories/6755db633f2a42.52102286.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(30, 220, 'assets/img/categories/6755db633f2a42.52102286.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(31, 221, 'assets/img/categories/6755dbb03d5a64.05038847.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(32, 222, 'assets/img/categories/6755dbb03d5a64.05038847.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(33, 223, 'assets/img/categories/6755dbb03d5a64.05038847.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(34, 224, 'assets/img/categories/6755dbb03d5a64.05038847.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(35, 225, 'assets/img/categories/6755dbb03d5a64.05038847.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(36, 226, 'assets/img/categories/6755dbf334c590.43078327.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(37, 227, 'assets/img/categories/6755dbf334c590.43078327.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(38, 228, 'assets/img/categories/6755dbf334c590.43078327.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(39, 229, 'assets/img/categories/6755dbf334c590.43078327.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(40, 230, 'assets/img/categories/6755dbf334c590.43078327.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(41, 231, 'assets/img/categories/67575ec99913d7.04105646.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(42, 232, 'assets/img/categories/67575ec99913d7.04105646.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(43, 233, 'assets/img/categories/67575ec99913d7.04105646.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(44, 234, 'assets/img/categories/67575ec99913d7.04105646.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(45, 235, 'assets/img/categories/67575ec99913d7.04105646.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(46, 236, 'assets/img/categories/6752116e399b13.31136928.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(47, 237, 'assets/img/categories/6752116e399b13.31136928.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(48, 238, 'assets/img/categories/6752116e399b13.31136928.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(49, 239, 'assets/img/categories/6752116e399b13.31136928.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(50, 240, 'assets/img/categories/6752116e399b13.31136928.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(51, 241, 'assets/img/categories/6758792b852730.00942490.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(52, 242, 'assets/img/categories/6758792b852730.00942490.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(53, 243, 'assets/img/categories/6758792b852730.00942490.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(54, 244, 'assets/img/categories/6758792b852730.00942490.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(55, 245, 'assets/img/categories/6758792b852730.00942490.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(56, 246, 'assets/img/categories/675597c143c792.12721835.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(57, 247, 'assets/img/categories/675597c143c792.12721835.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(58, 248, 'assets/img/categories/675597c143c792.12721835.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(59, 249, 'assets/img/categories/675597c143c792.12721835.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(60, 250, 'assets/img/categories/675597c143c792.12721835.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(61, 251, 'assets/img/categories/67588650663bc5.46841188.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(62, 252, 'assets/img/categories/67588650663bc5.46841188.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(63, 253, 'assets/img/categories/67588650663bc5.46841188.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(64, 254, 'assets/img/categories/67588650663bc5.46841188.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(65, 255, 'assets/img/categories/67588650663bc5.46841188.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(66, 256, 'assets/img/categories/67589ccd704e79.40743595.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(67, 257, 'assets/img/categories/67589ccd704e79.40743595.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(68, 258, 'assets/img/categories/67589ccd704e79.40743595.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(69, 259, 'assets/img/categories/67589ccd704e79.40743595.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(70, 260, 'assets/img/categories/67589ccd704e79.40743595.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(71, 261, 'assets/img/categories/6755f7a4d44929.33857836.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(72, 262, 'assets/img/categories/6755f7a4d44929.33857836.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(73, 263, 'assets/img/categories/6755f7a4d44929.33857836.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(74, 264, 'assets/img/categories/6755f7a4d44929.33857836.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(75, 265, 'assets/img/categories/6755f7a4d44929.33857836.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(76, 266, 'assets/img/categories/67575e8798ce00.61468668.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(77, 267, 'assets/img/categories/67575e8798ce00.61468668.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(78, 268, 'assets/img/categories/67575e8798ce00.61468668.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(79, 269, 'assets/img/categories/67575e8798ce00.61468668.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(80, 270, 'assets/img/categories/67575e8798ce00.61468668.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(81, 271, 'assets/img/categories/6755f76e7fb463.39767350.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(82, 272, 'assets/img/categories/6755f76e7fb463.39767350.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(83, 273, 'assets/img/categories/6755f76e7fb463.39767350.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(84, 274, 'assets/img/categories/6755f76e7fb463.39767350.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(85, 275, 'assets/img/categories/6755f76e7fb463.39767350.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(86, 276, 'assets/img/categories/675596ed4f8193.10611981.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(87, 277, 'assets/img/categories/675596ed4f8193.10611981.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(88, 278, 'assets/img/categories/675596ed4f8193.10611981.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(89, 279, 'assets/img/categories/675596ed4f8193.10611981.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(90, 280, 'assets/img/categories/675596ed4f8193.10611981.jpeg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(91, 281, 'assets/img/categories/67588d1c4379a5.35269618.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(92, 282, 'assets/img/categories/67588d1c4379a5.35269618.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(93, 283, 'assets/img/categories/67588d1c4379a5.35269618.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(94, 284, 'assets/img/categories/67588d1c4379a5.35269618.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(95, 285, 'assets/img/categories/67588d1c4379a5.35269618.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(96, 286, 'assets/img/categories/67588eb274cbd7.06466331.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(97, 287, 'assets/img/categories/67588eb274cbd7.06466331.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(98, 288, 'assets/img/categories/67588eb274cbd7.06466331.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(99, 289, 'assets/img/categories/67588eb274cbd7.06466331.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(100, 290, 'assets/img/categories/67588eb274cbd7.06466331.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(101, 291, 'assets/img/categories/67589d3c5446c4.02013081.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(102, 292, 'assets/img/categories/67589d3c5446c4.02013081.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(103, 293, 'assets/img/categories/67589d3c5446c4.02013081.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(104, 294, 'assets/img/categories/67589d3c5446c4.02013081.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(105, 295, 'assets/img/categories/67589d3c5446c4.02013081.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(106, 296, 'assets/img/categories/67588da02ad734.99424837.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(107, 297, 'assets/img/categories/67588da02ad734.99424837.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(108, 298, 'assets/img/categories/67588da02ad734.99424837.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(109, 299, 'assets/img/categories/67588da02ad734.99424837.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(110, 300, 'assets/img/categories/67588da02ad734.99424837.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(111, 301, 'assets/img/categories/675884ff6a11a0.01752848.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(112, 302, 'assets/img/categories/675884ff6a11a0.01752848.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(113, 303, 'assets/img/categories/675884ff6a11a0.01752848.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(114, 304, 'assets/img/categories/675884ff6a11a0.01752848.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(115, 305, 'assets/img/categories/675884ff6a11a0.01752848.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(116, 306, 'assets/img/categories/675211440e6fd8.63826003.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(117, 307, 'assets/img/categories/675211440e6fd8.63826003.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(118, 308, 'assets/img/categories/675211440e6fd8.63826003.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(119, 309, 'assets/img/categories/675211440e6fd8.63826003.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(120, 310, 'assets/img/categories/675211440e6fd8.63826003.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(121, 311, 'assets/img/categories/6759cfcce765e8.69787514.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(122, 312, 'assets/img/categories/6759cfcce765e8.69787514.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(123, 313, 'assets/img/categories/6759cfcce765e8.69787514.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(124, 314, 'assets/img/categories/6759cfcce765e8.69787514.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(125, 315, 'assets/img/categories/6759cfcce765e8.69787514.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(126, 316, 'assets/img/categories/67559a49de41d1.43002873.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(127, 317, 'assets/img/categories/67559a49de41d1.43002873.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(128, 318, 'assets/img/categories/67559a49de41d1.43002873.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(129, 319, 'assets/img/categories/67559a49de41d1.43002873.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(130, 320, 'assets/img/categories/67559a49de41d1.43002873.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(131, 321, 'assets/img/categories/67559a03e77491.03597813.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(132, 322, 'assets/img/categories/67559a03e77491.03597813.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(133, 323, 'assets/img/categories/67559a03e77491.03597813.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(134, 324, 'assets/img/categories/67559a03e77491.03597813.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(135, 325, 'assets/img/categories/67559a03e77491.03597813.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(136, 326, 'assets/img/categories/67587a5bd49bd9.63063487.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(137, 327, 'assets/img/categories/67587a5bd49bd9.63063487.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(138, 328, 'assets/img/categories/67587a5bd49bd9.63063487.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(139, 329, 'assets/img/categories/67587a5bd49bd9.63063487.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(140, 330, 'assets/img/categories/67587a5bd49bd9.63063487.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(141, 331, 'assets/img/categories/67587a8b868850.90345853.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(142, 332, 'assets/img/categories/67587a8b868850.90345853.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(143, 333, 'assets/img/categories/67587a8b868850.90345853.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(144, 334, 'assets/img/categories/67587a8b868850.90345853.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(145, 335, 'assets/img/categories/67587a8b868850.90345853.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(146, 336, 'assets/img/categories/67588530ee8ae5.84486224.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(147, 337, 'assets/img/categories/67588530ee8ae5.84486224.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(148, 338, 'assets/img/categories/67588530ee8ae5.84486224.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(149, 339, 'assets/img/categories/67588530ee8ae5.84486224.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(150, 340, 'assets/img/categories/67588530ee8ae5.84486224.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(151, 341, 'assets/img/categories/6758684126ca08.77739086.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(152, 342, 'assets/img/categories/6758684126ca08.77739086.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(153, 343, 'assets/img/categories/6758684126ca08.77739086.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(154, 344, 'assets/img/categories/6758684126ca08.77739086.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(155, 345, 'assets/img/categories/6758684126ca08.77739086.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(156, 346, 'assets/img/categories/67589dd7e58683.27793088.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(157, 347, 'assets/img/categories/67589dd7e58683.27793088.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(158, 348, 'assets/img/categories/67589dd7e58683.27793088.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(159, 349, 'assets/img/categories/67589dd7e58683.27793088.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(160, 350, 'assets/img/categories/67589dd7e58683.27793088.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(161, 351, 'assets/img/categories/6755fb51366d04.85021553.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(162, 352, 'assets/img/categories/6755fb51366d04.85021553.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(163, 353, 'assets/img/categories/6755fb51366d04.85021553.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(164, 354, 'assets/img/categories/6755fb51366d04.85021553.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(165, 355, 'assets/img/categories/6755fb51366d04.85021553.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(166, 356, 'assets/img/categories/675868820a2b83.29242737.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(167, 357, 'assets/img/categories/675868820a2b83.29242737.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(168, 358, 'assets/img/categories/675868820a2b83.29242737.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(169, 359, 'assets/img/categories/675868820a2b83.29242737.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(170, 360, 'assets/img/categories/675868820a2b83.29242737.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(171, 361, 'assets/img/categories/6759d0004cd543.10746782.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(172, 362, 'assets/img/categories/6759d0004cd543.10746782.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(173, 363, 'assets/img/categories/6759d0004cd543.10746782.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(174, 364, 'assets/img/categories/6759d0004cd543.10746782.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(175, 365, 'assets/img/categories/6759d0004cd543.10746782.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(176, 366, 'assets/img/categories/67588d3d7e8185.81413159.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(177, 367, 'assets/img/categories/67588d3d7e8185.81413159.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(178, 368, 'assets/img/categories/67588d3d7e8185.81413159.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(179, 369, 'assets/img/categories/67588d3d7e8185.81413159.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(180, 370, 'assets/img/categories/67588d3d7e8185.81413159.jpg', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(181, 371, 'assets/img/categories/675879954cc2c9.40806568.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(182, 372, 'assets/img/categories/675879954cc2c9.40806568.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(183, 373, 'assets/img/categories/675879954cc2c9.40806568.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(184, 374, 'assets/img/categories/675879954cc2c9.40806568.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00'),
(185, 375, 'assets/img/categories/675879954cc2c9.40806568.png', '2025-08-20 02:29:00', '2025-08-20 02:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT 'assets/img/avatar.webp',
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `verification_code_expires_at` datetime DEFAULT NULL,
  `role` enum('customer','provider','admin') DEFAULT 'customer',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `email`, `phone`, `password`, `verification_code`, `verification_code_expires_at`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'assets/img/avatar.webp', 'admin@admin.com', '01000000000', '$2y$12$qZQoLMy4l7M3SaRQdssvRe1RWwbC7yA3AmWqjflPrNyh3fiolE.9S', NULL, NULL, 'customer', 'active', '2025-08-19 22:47:15', '2025-08-22 23:38:40'),
(2, 'beshoy nady', 'assets/img/avatar.webp', 'bishoy.nady123@gmail.com', '(015) 233-61', '$2y$10$J0Eb6Uy5JzW7vbRH0UzFjOOGFRs.GufbkjCjRaC1hBxXNKtNuysei', NULL, NULL, 'customer', 'active', '2025-08-22 20:38:10', '2025-08-24 02:56:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `package_features`
--
ALTER TABLE `package_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_images`
--
ALTER TABLE `package_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_features`
--
ALTER TABLE `service_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_images`
--
ALTER TABLE `service_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `package_features`
--
ALTER TABLE `package_features`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `package_images`
--
ALTER TABLE `package_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `service_features`
--
ALTER TABLE `service_features`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1049;

--
-- AUTO_INCREMENT for table `service_images`
--
ALTER TABLE `service_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `favorites_ibfk_3` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
