/*
Navicat MySQL Data Transfer

Source Server         : xbrl
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : laojia

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-08-17 18:03:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `news_title` varchar(200) DEFAULT NULL COMMENT '新闻标题',
  `news_person` varchar(20) DEFAULT NULL COMMENT '新闻发布人',
  `news_from` varchar(100) DEFAULT NULL COMMENT '新闻来源',
  `news_content` blob COMMENT '新闻内容',
  `news_type` varchar(20) DEFAULT NULL COMMENT '新闻类型',
  `news_address` varchar(100) DEFAULT NULL COMMENT '新闻发生地',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('4', '程序员编程网盗老板600万元 一年作案达1800余次', null, '京华时报', 0x3C703E0D0A09093C2F703E3C68313EB3CCD0F2D4B1B1E0B3CCCDF8B5C1C0CFB0E5363030CDF2D4AA20D2BBC4EAD7F7B0B8B4EF31383030D3E0B4CE3C2F68313E3C703E0D0A09093C2F703E3C703E32303136C4EA3038D4C23137C8D52030383A303720BEA9BBAACAB1B1A83C2F703E3C703E0D0A093C2F703E3C703E0D0A09093C696D67207372633D22687474703A2F2F636D732D6275636B65742E6E6F73646E2E3132372E6E65742F63617463687069632F612F61372F61373563313030623639343939356530643030346365343332343366373961342E6A70673F696D61676556696577267468756D626E61696C3D3535307830222F3ED5ECB2E9D4B1D4DAC2DEC4B3B5C4B3B5C4DACBD1B3F6B6E0D5C5C9E6B0B8D2F8D0D0BFA8A1A33C696D67207372633D22687474703A2F2F636D732D6275636B65742E6E6F73646E2E3132372E6E65742F63617463687069632F652F65652F65653866646330376565366139633130343765656334653961356436663338372E6A70673F696D61676556696577267468756D626E61696C3D3535307830222F3ED5ECB2E9D4B1D4DAB2FDC6BDB1B1C6DFBCD2D5F2C4B3D0A1C7F8BDABC2DEC4B3B7F2B8BED7A5BBF1A3ACB2A2CFD6B3A1BFAAD5B9CDBBBBF7C9F3D1B6A1A33C696D67207372633D22687474703A2F2F636D732D6275636B65742E6E6F73646E2E3132372E6E65742F63617463687069632F622F62362F62366362363333616431646665313261343935616435383931313633386164362E6A70673F696D61676556696577267468756D626E61696C3D3535307830222F3ED7A5B2B6CFD6B3A1A3ACD5ECB2E9D4B1B1C8B6D4D7AFC4B3C8A1C7AECAB1B5C4BCE0BFD8BDD8CDBCA3ACCBD1B2E9C6E4B5B1CAB1B5C4D7C5D7B0A1A33C696D67207372633D22687474703A2F2F636D732D6275636B65742E6E6F73646E2E3132372E6E65742F63617463687069632F352F35322F35323065616432653036336563613463613065663230623262393738376532392E6A70673F696D61676556696577267468756D626E61696C3D3535307830222F3EB8F9BEDDC2DEC4B3B7F2B8BEB5C4B9A9CAF6A3ACD5ECB2E9D4B1C7B0CDF9B2FDC6BDCCECCDA8D4B7A3ACBDABC1EDD2BBC3FBCFD3D2C9C8CBC0EEC4B3D7A5BBF1A1A33C2F703E3C703EB7A2CFD6D4F8C8CED6B0B5C4C4B3D7E2B3B5B9ABCBBEB5C4B7FECEF1C6F7B4E6D4DAC2A9B6B4A3ACB3CCD0F2D4B1C2DEC4B3B1E0D0B4B3CCD0F2A3ACB9B4BDE1B4F3D1A7CDACD1A7A3ACCDA8B9FDCDF8C9CFD7AAD5CBB5C1C8A1B8C3B9ABCBBED4BC363030CDF2D7CABDF0A1A3BDFCC8D5A3ACB1B1BEA9CAD0B9ABB0B2BED6CDF8B0B2D7DCB6D3BBE1CDACBAA3B5EDB9ABB0B2B7D6BED6D0CCD5ECD6A7B6D3BDABCFD3D2C9C8CBC2DEC4B3A1A2C0EEC4B3BCB0C2DEC4B3C6DED7D3D7AFC4B3D7A5BBF1A1A33C2F703E3C703EA1F5B0B8B7A23C2F703E3C703ED7E2B3B5B9ABCBBED5CBBBA7363030CDF2B1BBB5C13C2F703E3C703EBDF1C4EA37D4C23133C8D5A3ACB1B1BEA9CAD0B9ABB0B2BED6CDF8B0B2D7DCB6D3BDD3B1B1BEA9CAD0C4B3CDF8C2E7D7E2B3B5B9ABCBBEB1A8BEAFB3C6A3ACB8C3B9ABCBBED4DAC5CCB5E3D5CBC4BFCAB1B7A2CFD6A3ACB8C3B9ABCBBED5CBBBA7C4DAB5C4D4BC363030CDF2D4AAB2BBD2EDB6F8B7C9A1A33C2F703E3C703EBEAD0D0AB9FDB9ABCBBEC4DAB2BFD7D4B2E9B7A2CFD6A3ACD3D0C8CBCAB9D3C3B8C3B9ABCBBEC3DCD4BFBDF8C8EBB7FECEF1C6F7CFF2D2F8D0D0B6E0B4CEB7A2CBCDC1CBD0E9BCD9B5C4B8B6BFEEB1A8CEC4A3ACC8C3D2F8D0D0BDABB8C3B9ABCBBED5CBBBA7C4DAD7CABDF0B6E0B4CECFF2B8C3C8CBB5C4B6E0D5C5D2F8D0D0BFA8B8B6BFEEA1A3B8C3B9ABCBBED4B1B9A4BBB90D0AB3C6A3ACCFD3D2C9C8CBC3BFB4CED7AAD7DFB2BBCDACBDF0B6EEB5C4D7CABDF0BAF3A3ACBBB9B1E0D0B4B3CCD0F2BDABD2F8D0D0B7A2BBD8B8C3B9ABCBBEB7FECEF1C6F7B5C4B6D4D5CBB5A5BDF8D0D0D0DEB8C4A3ACC4A8B5F4C1CBB8F8CFD3D2C9C8CBB5C4B4F2BFEEBCC7C2BCA3ACD6C2CAB9B9ABCBBEB2BBC4DCBCB0CAB1B7A2CFD6C6E4D0D0CEAAA1A33C2F703E3C703EA1F5D5ECB2E93C2F703E3C703ECFD3B7B8D2BBC4EAD7F7B0B831383030D3E0B4CE3C2F703E3C703ECAD00D0AB9ABB0B2BED6CDF8B0B2D7DCB6D3BBE1CDACBAA3B5EDB9ABB0B2B7D6BED6D0CCD5ECD6A7B6D3B3C9C1A2D7A8B0B8D7E9A3ACBEADB9FDD7D0CFB8CAE1C0EDB8C3B9ABCBBECEBBD3DABABCD6DDB5C4B7FECEF1C6F7CAFDBEDDBCB0C9CFBAA3D2F8C1AAB5C4BBE3BFEEC1F7CFF2B7A2CFD6A3ACB4D3C8A5C4EA35D4C2B5BDBDF1C4EA37D4C2A3ACCFD3D2C9C8CBC0FB0D0AD3C3B8C3B9ABCBBEB5C4C3DCD4BFCFC8BAF331383030B6E0B4CEBDABB8C3B9ABCBBED5CBBBA7D7CABDF0B8B6BFEED6C13837D5C5D2F8D0D0BFA8A3ACB8B6BFEEB5C4BDF0B6EEC9D9D4F2BCB8B0D9D4AAA3ACB6E0D4F2CAFDCDF2D4AAA1A3C9E6B0B8B5C43837D5C5D2F8D0D0BFA8B9E9CAF4B5D8C9E6BCB0CED2B9FA3134B8F6CAA1CAD0A3AC0D0AB0ECBFA8C8CBB5C4C9EDB7DDD0C5CFA2D2B2B8F7B2BBCFE0CDACA3ACBBB3D2C9CFB5CFD3D2C9C8CBB7C7B7A8B9BAB5C3A1A33C2F703E3C703E3C62722F3E3C2F703E, '0', '110101001001', '2016-08-17 10:45:55');
INSERT INTO `news` VALUES ('5', '住建部等七部门出台新规 加强房地产中介管理', null, '京华时报', 0x3C703E0D0A09093C2F703E3C68313ED7A1BDA8B2BFB5C8C6DFB2BFC3C5B3F6CCA8D0C2B9E620BCD3C7BFB7BFB5D8B2FAD6D0BDE9B9DCC0ED3C2F68313E3C703E0D0A09093C2F703E3C703E32303136C4EA3038D4C23136C8D52031363A313920D1EBCAD33C2F703E3C703E0D0A093C2F703E3C703E0D0A09093C2F703E3C7020636C6173733D22665F63656E746572223E3C696D67207372633D222F75656469746F72315F345F336A73702F75706C6F61642F696D6167652F32303136303831372F313437313430353838303238353038353430312E6A7067222F3E3C2F703E3C703EBDFCC8D5A3ACD7A1BDA8B2BFB5C8C6DFB2BFC3C5C1AABACFD3A1B7A2CFE0B9D8B9DCC0EDD2E2BCFBA3BA3C2F703E3C703ED2AAC7F3B8F7B5D8BACBD1E9B7BFD4B4D0C5CFA2A3ACD2D1B3F6CADBBBF2B3F6D7E2B5C4B7BFCEDDA3ACD2AAD4DABACFCDACC7A9B6A9D6AEC8D5C6F032B8F6B9A4D7F7C8D5C4DABDABB7BFD4B4D0C5CFA2B3B7B3FDA3BB3C2F703E3C703ED6D0BDE9BBFAB9B9B2BBB5C3CEAAB2BBB7FBBACFBDBBD2D7CCF5BCFEB5C4B1A3D5CFD0D4D7A1B7BFB5C8B7BFCEDDCCE1B9A9D6D0BDE9B7FECEF1A3BB3C2F703E3C703EB2BBB5C3BDABBDF0C8DAB7FECEF1D3EBC6E4CBFBB7FECEF1C0A6B0F3B5C8A1A33C2F703E3C703E3C62722F3E3C2F703E, '0', '110101001001', null);

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
