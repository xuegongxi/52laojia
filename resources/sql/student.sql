/*
Navicat MySQL Data Transfer

Source Server         : xbrl
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : laojia

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-08-17 18:04:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psw` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'wewe', 'wew');
INSERT INTO `student` VALUES ('2', 'wewe', 'wew');
INSERT INTO `student` VALUES ('3', 'wewe', 'wewe');
