/*
Navicat MySQL Data Transfer

Source Server         : Docker-local-VMware
Source Server Version : 50726
Source Host           : 10.66.66.66:3306
Source Database       : supermarket_demo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-03-10 21:28:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product_provider
-- ----------------------------
DROP TABLE IF EXISTS `product_provider`;
CREATE TABLE `product_provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
  `name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系人电话',
  `address` varchar(511) DEFAULT NULL COMMENT '供应商地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20190020 DEFAULT CHARSET=utf8mb4 COMMENT='供应商表';

-- ----------------------------
-- Records of product_provider
-- ----------------------------
INSERT INTO `product_provider` VALUES ('20190012', '安徽合家欢超市供货端', '李南京', '18129373827', '安徽省合肥市蜀山区幸福路112号');
INSERT INTO `product_provider` VALUES ('20190013', '百货超市供货端', '高子腾', '16736352263', '江苏省无锡市');
INSERT INTO `product_provider` VALUES ('20190014', '天猫超市电商线下特供', '李天猫', '19384748392', '浙江省余杭区太子路12号');
INSERT INTO `product_provider` VALUES ('20190016', '安徽淮南超市', '李飞', '18130112698', '安徽省淮南市田家庵区');
INSERT INTO `product_provider` VALUES ('20190017', '南京百大超市', '花木兰', '18130112665', '南京雨花台区66号');
INSERT INTO `product_provider` VALUES ('20190018', '上海桃李面包厂', '李亮', '17364320225', '上海徐家汇');
INSERT INTO `product_provider` VALUES ('20190019', '京东', '刘强', '8274617', '江苏省宿迁市京东电商特供');
