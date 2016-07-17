-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.11-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.5105
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bamazon
CREATE DATABASE IF NOT EXISTS `bamazon` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bamazon`;

-- Dumping structure for table bamazon.products
CREATE TABLE IF NOT EXISTS `products` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(200) NOT NULL,
  `DeptName` varchar(200) NOT NULL,
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `StockQty` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table bamazon.products: ~10 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`ItemID`, `ProductName`, `DeptName`, `Price`, `StockQty`) VALUES
	(1, 'Bike', 'Sports', 300.00, 14),
	(2, 'Boots', 'Footwear', 125.00, 32),
	(3, 'Playstation', 'Electronics', 250.00, 12),
	(4, 'TV', 'Electronics', 699.99, 10),
	(5, 'Diamond Necklace', 'Jewelry', 3299.95, 5),
	(6, 'Fishing Pole', 'Sports', 69.99, 23),
	(7, 'Video Game', 'Electronics', 64.99, 30),
	(8, '22-Piece Cookware Set', 'HomeGoods', 129.99, 11),
	(9, 'Wall Sconce', 'HomeGoods', 19.99, 44),
	(10, 'Tennis Shoes', 'Footwear', 99.99, 11);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
