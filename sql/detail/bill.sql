/*
Navicat MySQL Data Transfer

Source Server         : Docker-local-VMware
Source Server Version : 50726
Source Host           : 10.66.66.66:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-03-10 09:30:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '账单项目编号',
  `product_id` varchar(64) DEFAULT NULL COMMENT '商品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类编号',
  `category_name` varchar(255) DEFAULT NULL COMMENT '所属分类',
  `purchase_price` decimal(10,2) DEFAULT NULL COMMENT '进货价',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `profits` decimal(10,2) DEFAULT NULL COMMENT '净利润',
  `number` bigint(20) DEFAULT NULL COMMENT '购买数量',
  `create_time` datetime COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售账单表';
