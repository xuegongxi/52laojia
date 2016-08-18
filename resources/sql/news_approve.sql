/*
Navicat MySQL Data Transfer

Source Server         : xbrl
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : laojia

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-08-17 18:04:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `news_approve`
-- ----------------------------
DROP TABLE IF EXISTS `news_approve`;
CREATE TABLE `news_approve` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `news_id` int(20) DEFAULT NULL COMMENT '新闻主键',
  `news_create_userid` int(20) DEFAULT NULL COMMENT '新闻创建人',
  `news_approve_userid` int(20) DEFAULT NULL COMMENT '新闻审核人',
  `approve_state` int(20) DEFAULT NULL COMMENT '审批状态',
  `approve_opinion` varchar(100) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_approve
-- ----------------------------
