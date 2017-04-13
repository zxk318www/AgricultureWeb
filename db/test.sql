/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-02-22 09:43:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `id` varchar(255) NOT NULL COMMENT '管理员id',
  `Uid` varchar(255) NOT NULL COMMENT '用户编号id',
  `name` varchar(255) NOT NULL COMMENT '管理员姓名',
  `phone` varchar(255) NOT NULL COMMENT '管理员联系电话',
  `address` varchar(255) NOT NULL COMMENT '管理员地址',
  `state` int(5) NOT NULL COMMENT '管理员状态 0--在线，1--下线',
  `LLoginDate` datetime NOT NULL COMMENT '最近在线时间',
  PRIMARY KEY (`id`),
  KEY `Uid` (`Uid`),
  CONSTRAINT `admininfo_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` varchar(255) NOT NULL COMMENT '商品id',
  `UInfoid` varchar(255) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` double(10,2) NOT NULL COMMENT '商品单价',
  `address` varchar(255) NOT NULL COMMENT '商品的产地',
  `state` int(5) NOT NULL COMMENT '商品状态 0--上架，1--下架，2--已出售',
  `describe` varchar(255) NOT NULL COMMENT '商品描述',
  `num` int(10) NOT NULL COMMENT '商品的浏览数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` varchar(255) NOT NULL COMMENT '帖子id',
  `Uid` varchar(255) NOT NULL COMMENT '关联User的id',
  `title` varchar(125) NOT NULL COMMENT '帖子的标题',
  `content` varchar(255) NOT NULL COMMENT '帖子的正文',
  `state` int(5) NOT NULL DEFAULT '0' COMMENT '帖子状态 0--展示，1--删除，2--强制下线',
  `PostDate` datetime NOT NULL COMMENT '发帖时间',
  `AdminInfoid` varchar(255) NOT NULL COMMENT '关联AdminInfo的id',
  `num` int(10) NOT NULL COMMENT '帖子的浏览数',
  PRIMARY KEY (`id`),
  KEY `Uid` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` varchar(255) NOT NULL COMMENT '购物车id',
  `UInfoid` varchar(255) NOT NULL COMMENT '关联UserInfo的id',
  `state` int(5) NOT NULL COMMENT '购物车状态 0--收藏,1--结算',
  `AddCarDate` datetime NOT NULL COMMENT '加入购物车时间',
  `num` int(5) NOT NULL COMMENT '加入购物车数量',
  `Goodsid` varchar(255) NOT NULL COMMENT '关联商品Goods的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `id` varchar(255) NOT NULL COMMENT '交易id',
  `FromUInfoid` varchar(255) NOT NULL COMMENT '交易关联UserInfo的id',
  `ToUInfoid` varchar(255) NOT NULL COMMENT '交易关联的UserInfo的id',
  `TradeDate` datetime NOT NULL COMMENT '交易时间',
  `state` int(5) NOT NULL COMMENT '交易状态 0--关闭，1--成功，2--待定',
  `Goodsid` varchar(510) NOT NULL COMMENT '交易商品的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL COMMENT '账户id',
  `uname` varchar(255) NOT NULL COMMENT '账户登录名',
  `pwd` varchar(255) NOT NULL COMMENT '账户密码',
  `state` int(5) NOT NULL DEFAULT '0' COMMENT '账户类型  0--普通用户 1--高级用户 2--管理员',
  `del_flag` int(5) NOT NULL DEFAULT '0' COMMENT '删除标记  0--未删除，1--删除',
  `UpdateDate` datetime NOT NULL COMMENT '创建时间',
  `DeleteDate` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `userinfo` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20130501114', 'zxk', '123654', '0', '0', '2017-02-16 15:39:14', null);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` varchar(255) NOT NULL COMMENT '用户id',
  `Uid` varchar(255) NOT NULL COMMENT '账户id',
  `name` varchar(255) NOT NULL COMMENT '用户姓名',
  `age` varchar(5) DEFAULT NULL COMMENT '用户年龄',
  `IDCard` varchar(255) NOT NULL COMMENT '用户证件号码',
  `phone` varchar(255) NOT NULL COMMENT '用户电话',
  `sex` varchar(5) NOT NULL COMMENT '用户性别',
  `address` varchar(255) NOT NULL COMMENT '用户居住地址',
  `Level` int(5) NOT NULL DEFAULT '1' COMMENT '用户等级  1-5级，5级最高',
  `balance` double NOT NULL DEFAULT '0' COMMENT '用户余额',
  `state` int(5) NOT NULL DEFAULT '0' COMMENT '用户状态 0--在线 ，1--下线',
  `LLoginDate` datetime NOT NULL COMMENT '最近在线时间',
  `del_flag` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Uid` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('001', '20130501114', 'Zhangsnke', '23', '111111111111111', '136852085220', '男', '浙江绍兴', '1', '0', '0', '2017-02-16 15:36:08', '0');
