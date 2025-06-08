/*
Navicat MySQL Data Transfer

Source Server         : Docker-local-VMware
Source Server Version : 50726
Source Host           : 10.66.66.66:3306
Source Database       : supermarket_demo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-03-10 21:28:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号',
  `name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2012 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('2001', '食品');
INSERT INTO `product_category` VALUES ('2002', '饮料');
INSERT INTO `product_category` VALUES ('2003', '日用品');
INSERT INTO `product_category` VALUES ('2004', '数码产品');
INSERT INTO `product_category` VALUES ('2005', '图书');
INSERT INTO `product_category` VALUES ('2006', '玩具');
INSERT INTO `product_category` VALUES ('2007', '电子产品');
INSERT INTO `product_category` VALUES ('2008', '日常穿搭');
INSERT INTO `product_category` VALUES ('2009', '卫生健康');
INSERT INTO `product_category` VALUES ('2010', '汽车内饰');
INSERT INTO `product_category` VALUES ('2011', '时尚穿搭');
