/*
Navicat MySQL Data Transfer

Source Server         : xbrl
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : laojia

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-08-17 18:04:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `password2` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `errors` varchar(255) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20', 'admin', null, '1', '1', 'sss@12', '123445', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('21', 'admin3', null, '2', '3', '1212@11', '1212', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('22', 'admin2', null, '2', '2', '12121@232', '12121212', null, '110', '110100000000', '110101000000', '110101001000', '110101001001');
INSERT INTO `user` VALUES ('23', 'xuegongxi', '美好的一天', '1234', '1234', 'xuegongxi@sina.com', '15810524388', null, '370', '371100000000', '371122000000', '371122104000', '371122104206');
INSERT INTO `user` VALUES ('24', null, null, null, null, null, null, null, null, null, null, null, null);
