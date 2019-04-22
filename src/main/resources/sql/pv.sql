/*
Navicat MySQL Data Transfer

Source Server         : 192.168.5.121
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : pv

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-01 17:36:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `description`
-- ----------------------------
DROP TABLE IF EXISTS `description`;
CREATE TABLE `description` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version_id` (`version_id`),
  CONSTRAINT `version_id` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of description
-- ----------------------------
INSERT INTO `description` VALUES ('1', '修复', '修复xxx', '2');
INSERT INTO `description` VALUES ('2', '优化', '优化xxx', '2');
INSERT INTO `description` VALUES ('3', '新增', '新增xxx', '2');
INSERT INTO `description` VALUES ('4', '优化', '十大啊啊啊啊啊啊阿萨德客服代表身份报考的法师那块地方你撒的看能否地方那师傅', '6');
INSERT INTO `description` VALUES ('5', '优化', '新增贷款和撒加大剂量的萨拉就到了', '14');
INSERT INTO `description` VALUES ('6', '新增', '的理解爱的路上的密码了对吗大师顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '6');
INSERT INTO `description` VALUES ('7', '优化', '老大是你的烂电视的女生的女生就爱看你的你说你打，你，到达，是你的那是，电脑上', '6');
INSERT INTO `description` VALUES ('8', '优化', '11111111', '9');
INSERT INTO `description` VALUES ('9', '新增', '99999999', '5');
INSERT INTO `description` VALUES ('13', '优化', '顶替', '12');
INSERT INTO `description` VALUES ('16', '优化', 'author', '7');
INSERT INTO `description` VALUES ('17', '修复', '发过分的高分的', '6');
INSERT INTO `description` VALUES ('18', '新增', '你的看上你放开你的伤口', '6');
INSERT INTO `description` VALUES ('22', '优化', '123', '6');
INSERT INTO `description` VALUES ('23', '修改', '变成修改', '2');

-- ----------------------------
-- Table structure for `label`
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('1', '测试版');
INSERT INTO `label` VALUES ('2', '正式版');
INSERT INTO `label` VALUES ('3', '特定版');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `paltform` varchar(20) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'DBAPP', 'andriod', '0');
INSERT INTO `product` VALUES ('2', 'Author', 'PC', '0');
INSERT INTO `product` VALUES ('3', 'sdk', 'andriod', '0');
INSERT INTO `product` VALUES ('4', 'sdk', 'ios', '0');
INSERT INTO `product` VALUES ('5', 'core', 'andriod', '0');
INSERT INTO `product` VALUES ('6', 'core', 'ios', '0');
INSERT INTO `product` VALUES ('7', '教育版', 'PC', '0');
INSERT INTO `product` VALUES ('8', '专业版', 'PC', '0');
INSERT INTO `product` VALUES ('9', '睿泰产品一', 'PC', '0');
INSERT INTO `product` VALUES ('10', '111', 'ios', '1');
INSERT INTO `product` VALUES ('11', '1', 'PC', '1');
INSERT INTO `product` VALUES ('12', '3131', 'PC', '1');
INSERT INTO `product` VALUES ('13', '3', 'ios', '1');
INSERT INTO `product` VALUES ('14', '11', 'andriod', '1');
INSERT INTO `product` VALUES ('15', 'DBAPP', 'andriod', '0');
INSERT INTO `product` VALUES ('16', '产品1', 'PC', '1');
INSERT INTO `product` VALUES ('17', '教育版A', 'PC', '0');
INSERT INTO `product` VALUES ('18', '教育版B', 'andriod', '0');
INSERT INTO `product` VALUES ('19', '专业版ABC', 'PC', '0');
INSERT INTO `product` VALUES ('20', '专业版BCD', 'PC', '0');
INSERT INTO `product` VALUES ('21', '专业版Q', 'ios', '0');
INSERT INTO `product` VALUES ('22', '专业版W', 'andriod', '0');
INSERT INTO `product` VALUES ('23', '产品v', 'ios', '0');
INSERT INTO `product` VALUES ('24', '产品b', 'PC', '0');
INSERT INTO `product` VALUES ('25', '章洋', 'PC', '0');
INSERT INTO `product` VALUES ('26', 'aaa', 'PC', '0');
INSERT INTO `product` VALUES ('27', '神奇', 'PC', '1');
INSERT INTO `product` VALUES ('28', '修改了', 'PC', '1');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '优化');
INSERT INTO `type` VALUES ('2', '新增');
INSERT INTO `type` VALUES ('3', '修复');

-- ----------------------------
-- Table structure for `version`
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(20) NOT NULL,
  `version_code` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(100) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_check` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('1', 'RC', '1.0', '2019-01-10 15:26:54', '在D盘', '123', '1', null, '0', '1');
INSERT INTO `version` VALUES ('2', 'GA', '1.0.1', '2019-01-10 15:34:42', '在C盘', '456', '1', '1', '0', '1');
INSERT INTO `version` VALUES ('3', 'GA', '2.0', '2019-01-10 15:37:27', '不知道\'', '不晓得', '1', null, '0', '1');
INSERT INTO `version` VALUES ('4', 'Alpha', '1.0', '2019-01-10 15:28:56', null, null, '2', null, '0', '1');
INSERT INTO `version` VALUES ('5', 'Beta', '1.0', '2019-01-10 15:30:34', null, null, '3', null, '0', '1');
INSERT INTO `version` VALUES ('6', 'RC', '1.0.2', '2019-01-10 17:13:29', '123', '456', '1', '1', '0', '1');
INSERT INTO `version` VALUES ('7', 'Alpha', '1.0.1', '2019-01-10 17:16:19', null, null, '2', '4', '0', '1');
INSERT INTO `version` VALUES ('8', 'GA', '1.0', '2019-01-18 14:34:46', null, null, '4', null, '0', '1');
INSERT INTO `version` VALUES ('9', 'Beta', '1.0', '2019-01-18 14:35:07', null, null, '5', null, '0', '1');
INSERT INTO `version` VALUES ('10', 'GA', '2.0.1', '2019-01-18 16:02:05', '', '', '1', '3', '1', '1');
INSERT INTO `version` VALUES ('11', 'GA', '1.0', '2019-01-18 17:04:13', null, null, '6', null, '0', '1');
INSERT INTO `version` VALUES ('12', 'RC', '1.0', '2019-01-18 17:06:56', null, null, '7', null, '0', '1');
INSERT INTO `version` VALUES ('13', 'GA', '1.0', '2019-01-22 08:57:28', null, null, '8', null, '0', '1');
INSERT INTO `version` VALUES ('14', 'GA', '1.0.1', '2019-01-22 08:58:41', '在C盘', '你猜', '8', '13', '0', '1');
INSERT INTO `version` VALUES ('15', '初出茅庐', '1.0', '2019-01-31 15:27:04', null, null, '9', null, '1', '1');
INSERT INTO `version` VALUES ('16', '22', '333', '2019-01-31 15:35:03', null, null, '10', null, '0', '1');
INSERT INTO `version` VALUES ('17', '1', '1', '2019-01-31 15:40:49', null, null, '11', null, '0', '1');
INSERT INTO `version` VALUES ('18', '11', '111', '2019-01-31 15:42:48', null, null, '12', null, '1', '1');
INSERT INTO `version` VALUES ('19', '3', '3', '2019-01-31 15:43:00', null, null, '13', null, '0', '1');
INSERT INTO `version` VALUES ('20', '22', '222', '2019-01-31 15:45:06', null, null, '14', null, '0', '1');
INSERT INTO `version` VALUES ('21', '1', '2.0.1', '2019-01-31 15:45:26', '2', '2&', '1', '3', '0', '1');
INSERT INTO `version` VALUES ('22', 'Beta', '1.0.1', '2019-02-01 08:38:04', '111', '111', '3', '5', '0', '1');
INSERT INTO `version` VALUES ('23', 'Beta', '2.0', '2019-02-01 08:40:57', '222', '222', '3', null, '0', '1');
INSERT INTO `version` VALUES ('24', 'Beta', '2.0.1', '2019-02-01 08:41:26', '333', '333', '3', '23', '0', '1');
INSERT INTO `version` VALUES ('25', 'GA', '1.0', '2019-02-01 08:45:52', null, null, '15', null, '0', '1');
INSERT INTO `version` VALUES ('26', 'RC', '1.0.1', '2019-02-01 08:46:56', 'XXX', 'XXX', '15', '25', '0', '1');
INSERT INTO `version` VALUES ('27', 'GA', '2.0', '2019-02-01 08:47:55', '', '', '5', null, '0', '1');
INSERT INTO `version` VALUES ('28', '测试版', '1.0', '2019-02-01 09:45:19', null, null, '16', null, '0', '1');
INSERT INTO `version` VALUES ('29', '测试版', '1.0.1', '2019-02-01 09:46:32', '111', '222', '16', '28', '0', '1');
INSERT INTO `version` VALUES ('30', '测试版', '2.0', '2019-02-01 09:47:04', '', '', '16', null, '0', '1');
INSERT INTO `version` VALUES ('31', '测试版', '2.0.1', '2019-02-01 09:47:17', '', '', '16', '30', '0', '1');
INSERT INTO `version` VALUES ('32', 'ABC', '1.0', '2019-02-14 11:52:28', null, null, '17', null, '0', '1');
INSERT INTO `version` VALUES ('33', 'Beta', '2.0', '2019-02-14 11:57:44', null, null, '18', null, '0', '1');
INSERT INTO `version` VALUES ('34', 'GA', '2.0', '2019-02-14 12:00:22', null, null, '19', null, '0', '1');
INSERT INTO `version` VALUES ('35', 'ABCD', '3.0', '2019-02-14 12:02:54', null, null, '20', null, '0', '1');
INSERT INTO `version` VALUES ('36', 'Q', '3.0', '2019-02-14 12:04:39', null, null, '21', null, '0', '1');
INSERT INTO `version` VALUES ('37', 'W', '5.0', '2019-02-14 12:07:34', null, null, '22', null, '0', '1');
INSERT INTO `version` VALUES ('38', 'v', '4.0', '2019-02-14 13:12:06', null, null, '23', null, '0', '1');
INSERT INTO `version` VALUES ('39', 'B', '2.0', '2019-02-25 13:17:26', null, null, '24', null, '0', '1');
INSERT INTO `version` VALUES ('40', 'GA', '2.0.2', '2019-02-14 17:19:42', '', '', '1', '3', '0', '1');
INSERT INTO `version` VALUES ('41', '11', '11', '2019-02-27 17:14:23', null, null, '25', null, '0', '1');
INSERT INTO `version` VALUES ('42', '123', '123', '2019-02-27 17:16:03', null, null, '26', null, '0', '1');
INSERT INTO `version` VALUES ('43', 'GA', '11111', '2019-03-04 15:13:08', null, null, '1', '1', '0', '1');
INSERT INTO `version` VALUES ('44', 'ABCD', 'ABCD', '2019-03-04 15:58:08', null, null, '1', '1', '0', '1');
INSERT INTO `version` VALUES ('45', 'QWE', 'QWE', '2019-03-04 16:29:45', null, null, '1', '3', '0', '1');
INSERT INTO `version` VALUES ('46', 'ASCA', 'XAS', '2019-03-04 16:39:41', null, null, '1', '3', '0', '1');
INSERT INTO `version` VALUES ('47', 'SASD', 'DVCD', '2019-03-04 16:43:33', null, null, '1', '3', '0', '1');
INSERT INTO `version` VALUES ('48', 'FFSA', 'FSSF', '2019-03-04 16:47:13', null, null, '1', '3', '0', '1');
INSERT INTO `version` VALUES ('49', 'SSS', 'SSS', '2019-03-04 16:56:09', null, null, '1', '1', '0', '1');
INSERT INTO `version` VALUES ('50', 'ttt', 'ttt', '2019-03-04 16:57:36', null, null, '1', '1', '0', '1');
INSERT INTO `version` VALUES ('51', 'Q', '1.0.2', '2019-03-05 15:21:46', 'http://localhost:8083/知识不进脑.jpg', '知识不进脑.jpg', '2', '4', '0', '1');
INSERT INTO `version` VALUES ('52', 'RC', '1.1.1', '2019-03-05 15:28:15', 'http://localhost:8083/你在代码里下毒.png', '你在代码里下毒.png', '2', '4', '0', '1');
INSERT INTO `version` VALUES ('53', 'Q', '2.0.7', '2019-03-05 15:33:10', 'http://localhost:8083/花钱一时爽.jpg', '花钱一时爽.jpg', '3', '23', '0', '1');
INSERT INTO `version` VALUES ('54', 'W', '1.0.1', '2019-03-06 11:19:17', 'http://localhost:8083/uploadFile/20190306\\add7925f8da042519c8804751c95efc9.jpg', '20190306\\add7925f8da042519c8804751c95efc9.jpg', '3', '5', '1', '1');
INSERT INTO `version` VALUES ('55', 'GA', '1.0.1', '2019-03-06 11:22:55', 'http://localhost:8083/uploadFile/20190306/66464db6015542fa90321676654ff859.png', '66464db6015542fa90321676654ff859.png', '5', '9', '0', '1');
INSERT INTO `version` VALUES ('56', '修改版本', '8.8.8', '2019-03-28 16:10:45', 'http://localhost:8088/files/20190329101734_学习网址.txt', '20190329101734_学习网址.txt', '5', '9', '0', '1');
INSERT INTO `version` VALUES ('57', '你猜', '1.0', '2019-03-29 09:11:46', null, null, '27', null, '1', '1');
INSERT INTO `version` VALUES ('58', '新增版本', '6.6.6', '2019-03-29 09:38:49', 'http://localhost:8088/files/20190329102748_mvc.png', '20190329102748_mvc.png', '27', '57', '0', '1');
INSERT INTO `version` VALUES ('59', '新增版本', '1.0', '2019-04-01 09:24:12', null, null, '28', null, '1', '1');

-- ----------------------------
-- Table structure for `version_label`
-- ----------------------------
DROP TABLE IF EXISTS `version_label`;
CREATE TABLE `version_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version_label
-- ----------------------------
INSERT INTO `version_label` VALUES ('1', '测试版', '2');
INSERT INTO `version_label` VALUES ('2', '正式版', '3');
INSERT INTO `version_label` VALUES ('3', '特定版', '4');
INSERT INTO `version_label` VALUES ('4', '正式版', '44');
INSERT INTO `version_label` VALUES ('5', '特定版', '45');
INSERT INTO `version_label` VALUES ('6', '测试版', '46');
INSERT INTO `version_label` VALUES ('7', '测试版', '47');
INSERT INTO `version_label` VALUES ('8', '测试版', '48');
INSERT INTO `version_label` VALUES ('9', '测试版', '49');
INSERT INTO `version_label` VALUES ('10', '特定版', '50');
INSERT INTO `version_label` VALUES ('11', '特定版', '51');
INSERT INTO `version_label` VALUES ('12', '测试版', '52');
INSERT INTO `version_label` VALUES ('13', '特定版', '53');
INSERT INTO `version_label` VALUES ('14', '特定版', '54');
INSERT INTO `version_label` VALUES ('15', '测试版', '55');
INSERT INTO `version_label` VALUES ('16', '测试版', '56');
INSERT INTO `version_label` VALUES ('17', '测试版', '58');

-- ----------------------------
-- Table structure for `version_related`
-- ----------------------------
DROP TABLE IF EXISTS `version_related`;
CREATE TABLE `version_related` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verison_id` (`version_id`),
  KEY `related_id` (`parent_id`),
  CONSTRAINT `related_id` FOREIGN KEY (`parent_id`) REFERENCES `version` (`id`),
  CONSTRAINT `verison_id` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version_related
-- ----------------------------
INSERT INTO `version_related` VALUES ('14', '7', '6');
INSERT INTO `version_related` VALUES ('15', '9', '7');
INSERT INTO `version_related` VALUES ('16', '5', '6');
INSERT INTO `version_related` VALUES ('17', '9', '5');
INSERT INTO `version_related` VALUES ('20', '12', '15');
INSERT INTO `version_related` VALUES ('21', '24', '26');
INSERT INTO `version_related` VALUES ('22', '27', '24');
INSERT INTO `version_related` VALUES ('23', '22', '29');
INSERT INTO `version_related` VALUES ('24', '27', '22');
INSERT INTO `version_related` VALUES ('25', '36', '21');
INSERT INTO `version_related` VALUES ('26', '36', '40');
