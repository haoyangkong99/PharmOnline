/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : pharmonline

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2021-12-23 21:28:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_ID` varchar(10) NOT NULL,
  `product_Name` varchar(255) DEFAULT NULL,
  `product_Description` varchar(255) DEFAULT NULL,
  `product_Selling_Price` decimal(7,2) DEFAULT NULL,
  `product_Category` varchar(255) DEFAULT NULL,
  `product_Picture` blob DEFAULT NULL,
  PRIMARY KEY (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('P01', 'Panadol Actifast', 'Pain Killer', '20.00', null, null);
INSERT INTO `product` VALUES ('P02', 'Panadol Soluble', 'Fever', '30.00', null, null);
INSERT INTO `product` VALUES ('P03', 'Panadol Biasa', 'Fever', '20.00', null, null);

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `stockTransactionID` varchar(255) NOT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `supplierID` varchar(255) DEFAULT NULL,
  `productID` varchar(255) DEFAULT '',
  `cost` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `referenceNo` varchar(255) DEFAULT NULL,
  `arrivalDate` date DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  PRIMARY KEY (`stockTransactionID`),
  KEY `SupID` (`supplierID`),
  KEY `ProductID` (`productID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`productID`) REFERENCES `product` (`product_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SupID` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`supplierID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('ST1', 'Add Stock', 'S5', 'P02', '21', '47', 'R002021', '2022-01-20', '2022-02-17');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierName` varchar(255) DEFAULT NULL,
  `supplierID` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('KPJx', 'S1', 'asdas', '+10146816649', 'dasdasdas', '2022-01-13');
INSERT INTO `supplier` VALUES ('Onemedicare', 'S5', '0146816649', '+10126816649', 'sadasd', '2022-01-06');
INSERT INTO `supplier` VALUES ('KPJ', 'S7', '0123455', '+10146816649', 'sadasd', '2021-12-29');
