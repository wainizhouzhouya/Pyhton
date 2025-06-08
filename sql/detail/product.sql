/*
Navicat MySQL Data Transfer

Source Server         : Docker-local-VMware
Source Server Version : 50726
Source Host           : 10.66.66.66:3306
Source Database       : supermarket_demo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-03-10 21:28:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(64) NOT NULL COMMENT '条形码',
  `category_id` bigint(20) DEFAULT NULL COMMENT '商品分类编号',
  `provider_id` bigint(20) DEFAULT NULL COMMENT '供应商编号',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `factory_address` varchar(255) DEFAULT NULL COMMENT '生产地址',
  `purchase_price` decimal(10,2) DEFAULT NULL COMMENT '进货价',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('10', '2001', '20190013', '奥利奥Update0428', '奥利奥饼干工厂', '3.30', '6.50', '987');
INSERT INTO `product` VALUES ('11', '2003', '20190013', '黑人牙膏(薄荷味)', '上海宝洁日用品公司', '3.20', '9.50', '960');
INSERT INTO `product` VALUES ('12', '2001', '20190014', '火腿肠', '北京王中王', '2.20', '3.00', '140');
INSERT INTO `product` VALUES ('13', '2002', '20190012', '可口可乐(500ML)', '合肥太古可乐', '2.10', '3.00', '288');
INSERT INTO `product` VALUES ('15', '2003', '20190014', '金口健牙膏', '云南白药牙膏有限公司', '6.00', '12.00', '180');
INSERT INTO `product` VALUES ('16', '2007', '20190014', '神舟K670E-G6D1笔记本电脑', '深圳市神舟创新科技公司', '4199.00', '5799.00', '200');
INSERT INTO `product` VALUES ('17', '2002', '20190013', '康师傅绿茶', '上海康师傅有限公司', '1.20', '3.00', '200');
INSERT INTO `product` VALUES ('18', '2001', '20190012', '康师傅红烧拌面', '上海康师傅有限公司', '3.20', '5.00', '100');
INSERT INTO `product` VALUES ('19', '2002', '20190014', '蒙牛纯牛奶250ML', '蒙牛乳业', '1.20', '3.50', '500');
INSERT INTO `product` VALUES ('20', '2003', '20190014', '黑人牙膏（草莓味）', '上海宝洁有限公司', '5.20', '12.00', '2000');
INSERT INTO `product` VALUES ('21', '2002', '20190014', '蒙牛纯牛奶 1.5L', '蒙牛乳业', '6.00', '12.00', '300');
INSERT INTO `product` VALUES ('22', '2007', '20190014', 'ROMOSS/罗马仕 sense8P', '深圳罗马仕科技有限公司', '60.00', '119.00', '487');
INSERT INTO `product` VALUES ('23', '2002', '20190014', '蒙牛圣牧有机牛奶品醇200ml*12', '蒙牛乳业', '30.00', '79.00', '100');
INSERT INTO `product` VALUES ('24', '2004', '20190014', 'BOW航世笔记本外接键盘', 'B.O.W', '12.00', '39.00', '3000');
INSERT INTO `product` VALUES ('25', '2003', '20190013', '米家电水壶1A', 'MIJIA/米家', '50.00', '79.00', '276');
INSERT INTO `product` VALUES ('26', '2009', '20190014', '决明子枸杞菊花茶', '泉州市百年修本茶业有限公司', '6.00', '59.00', '100');
INSERT INTO `product` VALUES ('27', '2007', '20190014', 'sense 4 mini', '深圳罗马仕科技有限公司', '12.00', '39.00', '280');
INSERT INTO `product` VALUES ('28', '2008', '20190014', '李宁跑步鞋透气新款男鞋', 'Lining/李宁', '120.00', '319.00', '300');
INSERT INTO `product` VALUES ('29', '2009', '20190014', '蓝禾医疗一次性使用医用口罩', '浙江蓝禾医疗用品有限公司', '5.20', '19.00', '100');
INSERT INTO `product` VALUES ('30', '2010', '20190014', '临时停车牌号码汽车用品', '以斯帖车品专营店', '3.20', '12.00', '300');
INSERT INTO `product` VALUES ('31', '2002', '20190014', '蒙牛真果粒礼盒装250g*24盒', '蒙牛乳业', '26.00', '52.00', '100');
INSERT INTO `product` VALUES ('32', '2002', '20190014', '【超定制】豆本豆豆奶250ml*24盒', '豆本豆', '12.00', '39.00', '300');
INSERT INTO `product` VALUES ('33', '2008', '20190013', '鸿星尔克开衫卫衣男', '鸿星尔克', '120.00', '339.00', '300');
INSERT INTO `product` VALUES ('34', '2007', '20190012', '华为荣耀9x手机壳', '深圳罗马仕科技有限公司', '5.20', '39.00', '300');
INSERT INTO `product` VALUES ('35', '2007', '20190013', '绿联usb扩展器转换接头', 'B.O.W', '6.00', '39.00', '300');
INSERT INTO `product` VALUES ('36', '2001', '20190012', '威其诺自热小火锅速食', '蒙牛乳业', '6.00', '39.00', '100');
INSERT INTO `product` VALUES ('37', '2008', '20190014', '红米k30手机壳液态硅胶', '蒙牛乳业', '3.20', '12.00', '88');
INSERT INTO `product` VALUES ('38', '2008', '20190014', '取暖器小型家用小太阳', '上海康师傅有限公司', '5.20', '39.00', '300');
INSERT INTO `product` VALUES ('39', '2003', '20190012', '电脑椅家用靠背办公椅', '上海康师傅有限公司', '120.00', '119.00', '300');
INSERT INTO `product` VALUES ('40', '2003', '20190014', '联想小新air14键盘膜', '深圳罗马仕科技有限公司', '120.00', '5.00', '288');
INSERT INTO `product` VALUES ('41', '2003', '20190014', '黑人薄荷（牙膏味）', '上海宝洁有限公司', '6.00', '12.00', '200');
INSERT INTO `product` VALUES ('44', '2003', '20190017', '米家保温杯（500ML）黑色', '南京米家日用品有限公司', '36.00', '99.00', '188');
INSERT INTO `product` VALUES ('45', '2007', '20190017', '测试商品0509', '深圳罗马电子科技技术公司', '68.00', '168.00', '200');
INSERT INTO `product` VALUES ('46', '2004', '20190014', '华为Mate 40 Pro 6+128', '华为终端', '6299.00', '7999.00', '1000');
INSERT INTO `product` VALUES ('47', '2006', '20190017', '四驱车', '奥飞娱乐', '34.00', '60.00', '990');
INSERT INTO `product` VALUES ('48', '2002', '20190012', '可口可乐330ML*6', '合肥太古娱乐', '7.90', '12.90', '1000');
INSERT INTO `product` VALUES ('49', '2001', '20190012', '泰国香蕉', '淮南天猫超市大润发', '7.90', '15.00', '990');
INSERT INTO `product` VALUES ('50', '2001', '20190012', '桃李花式面包', '江苏省镇江市', '1.30', '2.50', '600');
INSERT INTO `product` VALUES ('51', '2009', '20190013', '甘草', '安徽省合肥市高新区', '3.60', '12.00', '600');
INSERT INTO `product` VALUES ('52', '2005', '20190019', '大话数据结构', '上海大雅图书', '37.00', '89.00', '588');
INSERT INTO `product` VALUES ('53', '2005', '20190019', '计算机网络（第七版）', '上海大雅图书', '34.00', '78.00', '580');
INSERT INTO `product` VALUES ('54', '2006', '20190019', '飞机航模', '武汉玩具厂', '37.00', '400.00', '600');
INSERT INTO `product` VALUES ('55', '2011', '20190017', '鸿星尔克卫衣', '福建衣服厂', '39.00', '128.00', '100');
INSERT INTO `product` VALUES ('56', '2009', '20190014', '蓝月亮洗衣液', '江苏省镇江市', '37.00', '128.00', '599');
