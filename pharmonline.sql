/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 100419
Source Host           : localhost:3306
Source Database       : pharmonline

Target Server Type    : MYSQL
Target Server Version : 100419
File Encoding         : 65001

Date: 2022-01-03 21:56:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_ID` varchar(10) NOT NULL,
  `category_Name` varchar(255) DEFAULT NULL,
  `category_Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderID` varchar(255) NOT NULL,
  `orderDateTime` datetime DEFAULT NULL,
  `collectDateTime` datetime DEFAULT NULL,
  `totalprice` double(65,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `customerID` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('O1', '2021-12-24 21:31:28', '2022-01-07 11:00:00', '920.00', 'Pending', 'C1');
INSERT INTO `order` VALUES ('O2', '2021-12-27 12:08:44', '2021-12-31 12:15:00', '130.00', 'Accepted', 'C2');
INSERT INTO `order` VALUES ('O3', '2021-12-25 18:20:59', '2022-01-04 19:00:00', '700.00', 'Prepared', 'C1');
INSERT INTO `order` VALUES ('O4', '2022-01-02 17:56:57', '2022-01-11 17:00:00', '70.00', 'Rejected', 'C4');
INSERT INTO `order` VALUES ('O5', '2022-01-02 18:04:03', '2022-01-25 18:00:00', '120.00', 'Completed', 'C3');

-- ----------------------------
-- Table structure for orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `orderID` varchar(255) NOT NULL,
  `productID` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`orderID`,`productID`),
  KEY `productID` (`productID`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('O1', 'P01', '17');
INSERT INTO `orderproduct` VALUES ('O1', 'P02', '6');
INSERT INTO `orderproduct` VALUES ('O1', 'P03', '20');
INSERT INTO `orderproduct` VALUES ('O2', 'P01', '5');
INSERT INTO `orderproduct` VALUES ('O2', 'P02', '1');
INSERT INTO `orderproduct` VALUES ('O3', 'P01', '3');
INSERT INTO `orderproduct` VALUES ('O3', 'P02', '18');
INSERT INTO `orderproduct` VALUES ('O3', 'P03', '5');
INSERT INTO `orderproduct` VALUES ('O4', 'P01', '1');
INSERT INTO `orderproduct` VALUES ('O4', 'P02', '1');
INSERT INTO `orderproduct` VALUES ('O4', 'P03', '1');
INSERT INTO `orderproduct` VALUES ('O5', 'P01', '1');
INSERT INTO `orderproduct` VALUES ('O5', 'P02', '2');
INSERT INTO `orderproduct` VALUES ('O5', 'P03', '2');

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
  `product_Quantity` int(255) DEFAULT NULL,
  `product_Picture` blob DEFAULT NULL,
  PRIMARY KEY (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('P01', 'Panadol Actifast', 'Pain Killer', '20.00', null, '30', null);
INSERT INTO `product` VALUES ('P02', 'Panadol Soluble', 'Fever', '30.00', null, '25', null);
INSERT INTO `product` VALUES ('P03', 'Panadol Biasa', 'Fever', '20.00', null, '25', null);

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
INSERT INTO `stock` VALUES ('ST3', 'Add Stock', 'S2', 'P01', '50', '10', 'R0032021', '2021-12-24', '2022-03-01');
INSERT INTO `stock` VALUES ('ST4', 'Add Stock', 'S2', 'P01', '69.69', '16', 'R0032022', '2021-12-24', '2022-03-12');
INSERT INTO `stock` VALUES ('ST5', 'Add Stock', 'S2', 'P02', '29.29', '10', 'R0032022', '2021-12-27', '2022-03-09');

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
INSERT INTO `supplier` VALUES ('OneTime', 'S2', '012345678', 'Jln BCD', 'sadasad', '2021-12-31');
INSERT INTO `supplier` VALUES ('KPJ', 'S7', '0123455', '+10146816649', 'sadasd', '2021-12-29');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `phoneNum` varchar(20) CHARACTER SET utf8mb4 DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `userType` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `userID` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  PRIMARY KEY (`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('cust1', 'customer1', '012-3456789', 'cust1@gmail.com', 'Customer', 'C1', '123');
INSERT INTO `user` VALUES ('clcheong', 'Chien Li', '012-5139022', 'clcheong00@gmail.com', 'Customer', 'C2', '123');
INSERT INTO `user` VALUES ('test', 'testing', '123456', 'test@gmail.com', 'Customer', 'C3', '123');
INSERT INTO `user` VALUES ('johndoe', 'John Doe', '0123456799', 'johndoe@gmail.com', 'Customer', 'C4', '123');
INSERT INTO `user` VALUES ('admin123', 'admin', '01234567890', 'admin@gmail.com', 'Pharmacist', 'P1', '123');
