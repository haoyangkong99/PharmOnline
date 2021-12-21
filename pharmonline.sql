/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : pharmonline

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2021-12-21 10:33:09
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `supplier` VALUES ('Onemedicare sdn.bhd', 'S00001', '011-12345678', '011-12345678', 'Antibiotic distributor', '2021-12-14');
