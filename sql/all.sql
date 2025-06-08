/*
Navicat MySQL Data Transfer

Source Server         : Docker-local-VMware
Source Server Version : 50726
Source Host           : 10.66.66.66:3306
Source Database       : supermarket_demo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-03-11 21:53:31
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
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='销售账单表';

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('3', '13', '可口可乐(500ML)', '2002', '饮料', '2.10', '3.00', '4.50', '5', '2022-03-11 20:12:27');
INSERT INTO `bill` VALUES ('4', '15', '金口健牙膏', '2003', '日用品', '6.00', '12.00', '12.00', '2', '2022-03-11 20:12:27');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('9', 'bill', '销售账单表', null, null, 'Bill', 'crud', 'com.ruoyi.project.system', 'system', 'bill', '销售账单', 'ruoyi', '0', '/', null, 'admin', '2022-02-03 23:01:21', '', null, null);
INSERT INTO `gen_table` VALUES ('10', 'product', '商品表', '', null, 'Product', 'crud', 'com.ruoyi.project.system', 'system', 'product', '商品', 'ruoyi', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2022-02-03 23:01:21', '', '2022-02-04 06:10:22', '');
INSERT INTO `gen_table` VALUES ('11', 'product_category', '商品分类表', null, null, 'ProductCategory', 'crud', 'com.ruoyi.project.system', 'system', 'category', '商品分类', 'ruoyi', '0', '/', null, 'admin', '2022-02-03 23:01:21', '', null, null);
INSERT INTO `gen_table` VALUES ('12', 'product_provider', '供应商表', null, null, 'ProductProvider', 'crud', 'com.ruoyi.project.system', 'system', 'provider', '供应商', 'ruoyi', '0', '/', null, 'admin', '2022-02-03 23:01:21', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('49', '9', 'id', '账单项目编号', 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', null, '1', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('50', '9', 'product_id', '商品编号', 'varchar(64)', 'String', 'productId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('51', '9', 'product_name', '商品名称', 'varchar(255)', 'String', 'productName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('52', '9', 'category_id', '分类编号', 'bigint(20)', 'Long', 'categoryId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('53', '9', 'category_name', '所属分类', 'varchar(255)', 'String', 'categoryName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('54', '9', 'purchase_price', '进货价', 'decimal(10,2)', 'BigDecimal', 'purchasePrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('55', '9', 'sale_price', '销售价', 'decimal(10,2)', 'BigDecimal', 'salePrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('56', '9', 'profits', '净利润', 'decimal(10,2)', 'BigDecimal', 'profits', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('57', '9', 'create_time', '创建日期', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', null, '10', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:28:40');
INSERT INTO `gen_table_column` VALUES ('58', '10', 'id', '条形码', 'varchar(64)', 'String', 'id', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('59', '10', 'category_id', '商品分类编号', 'bigint(20)', 'Long', 'categoryId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '2', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('60', '10', 'provider_id', '供应商编号', 'bigint(20)', 'Long', 'providerId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '3', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('61', '10', 'name', '商品名称', 'varchar(255)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('62', '10', 'factory_address', '生产地址', 'varchar(255)', 'String', 'factoryAddress', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('63', '10', 'purchase_price', '进货价', 'decimal(10,2)', 'BigDecimal', 'purchasePrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('64', '10', 'sale_price', '销售价', 'decimal(10,2)', 'BigDecimal', 'salePrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('65', '10', 'stock', '库存', 'int(11)', 'Long', 'stock', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-03 23:01:21', null, '2022-02-04 06:10:22');
INSERT INTO `gen_table_column` VALUES ('66', '11', 'id', '商品分类编号', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('67', '11', 'name', '商品分类名称', 'varchar(255)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('68', '12', 'id', '供应商编号', 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('69', '12', 'name', '供应商名称', 'varchar(255)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('70', '12', 'contact_name', '联系人姓名', 'varchar(255)', 'String', 'contactName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('71', '12', 'contact_phone', '联系人电话', 'varchar(255)', 'String', 'contactPhone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('72', '12', 'address', '供应商地址', 'varchar(511)', 'String', 'address', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '5', 'admin', '2022-02-03 23:01:21', '', null);
INSERT INTO `gen_table_column` VALUES ('73', '9', 'number', '购买数量', 'bigint(20)', 'Long', 'number', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', '', '2022-02-04 06:28:40', '', null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号',
  `id` varchar(64) NOT NULL UNIQUE COMMENT '条形码',
  `category_id` bigint(20) DEFAULT NULL COMMENT '商品分类编号',
  `provider_id` bigint(20) DEFAULT NULL COMMENT '供应商编号',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `factory_address` varchar(255) DEFAULT NULL COMMENT '生产地址',
  `purchase_price` decimal(10,2) DEFAULT NULL COMMENT '进货价',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('10', '2001', '20190013', '奥利奥Update0428', '奥利奥饼干工厂', '3.30', '6.50', '980');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('11', '2003', '20190013', '黑人牙膏(薄荷味)', '上海宝洁日用品公司', '3.20', '9.50', '960');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('12', '2001', '20190014', '火腿肠', '北京王中王', '2.20', '3.00', '140');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('13', '2002', '20190012', '可口可乐(500ML)', '合肥太古可乐', '2.10', '3.00', '281');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('15', '2003', '20190014', '金口健牙膏', '云南白药牙膏有限公司', '6.00', '12.00', '178');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('16', '2007', '20190014', '神舟K670E-G6D1笔记本电脑', '深圳市神舟创新科技公司', '4199.00', '5799.00', '200');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('17', '2002', '20190013', '康师傅绿茶', '上海康师傅有限公司', '1.20', '3.00', '200');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('18', '2001', '20190012', '康师傅红烧拌面', '上海康师傅有限公司', '3.20', '5.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('19', '2002', '20190014', '蒙牛纯牛奶250ML', '蒙牛乳业', '1.20', '3.50', '500');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('20', '2003', '20190014', '黑人牙膏（草莓味）', '上海宝洁有限公司', '5.20', '12.00', '2000');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('21', '2002', '20190014', '蒙牛纯牛奶 1.5L', '蒙牛乳业', '6.00', '12.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('22', '2007', '20190014', 'ROMOSS/罗马仕 sense8P', '深圳罗马仕科技有限公司', '60.00', '119.00', '487');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('22233658', '2007', '20190017', '测温计', '京东大药房', '10.00', '60.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('23', '2002', '20190014', '蒙牛圣牧有机牛奶品醇200ml*12', '蒙牛乳业', '30.00', '79.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('24', '2004', '20190014', 'BOW航世笔记本外接键盘', 'B.O.W', '12.00', '39.00', '3000');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('25', '2003', '20190013', '米家电水壶1A', 'MIJIA/米家', '50.00', '79.00', '276');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('26', '2009', '20190014', '决明子枸杞菊花茶', '泉州市百年修本茶业有限公司', '6.00', '59.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('27', '2007', '20190014', 'sense 4 mini', '深圳罗马仕科技有限公司', '12.00', '39.00', '280');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('28', '2008', '20190014', '李宁跑步鞋透气新款男鞋', 'Lining/李宁', '120.00', '319.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('29', '2009', '20190014', '蓝禾医疗一次性使用医用口罩', '浙江蓝禾医疗用品有限公司', '5.20', '19.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('30', '2010', '20190014', '临时停车牌号码汽车用品', '以斯帖车品专营店', '3.20', '12.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('31', '2002', '20190014', '蒙牛真果粒礼盒装250g*24盒', '蒙牛乳业', '26.00', '52.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('32', '2002', '20190014', '【超定制】豆本豆豆奶250ml*24盒', '豆本豆', '12.00', '39.00', '299');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('33', '2008', '20190013', '鸿星尔克开衫卫衣男', '鸿星尔克', '120.00', '339.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('34', '2007', '20190012', '华为荣耀9x手机壳', '深圳罗马仕科技有限公司', '5.20', '39.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('35', '2007', '20190013', '绿联usb扩展器转换接头', 'B.O.W', '6.00', '39.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('36', '2001', '20190012', '威其诺自热小火锅速食', '蒙牛乳业', '6.00', '39.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('37', '2008', '20190014', '红米k30手机壳液态硅胶', '蒙牛乳业', '3.20', '12.00', '88');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('38', '2008', '20190014', '取暖器小型家用小太阳', '上海康师傅有限公司', '5.20', '39.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('39', '2003', '20190012', '电脑椅家用靠背办公椅', '上海康师傅有限公司', '120.00', '119.00', '300');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('40', '2003', '20190014', '联想小新air14键盘膜', '深圳罗马仕科技有限公司', '120.00', '5.00', '288');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('41', '2003', '20190014', '黑人薄荷（牙膏味）', '上海宝洁有限公司', '6.00', '12.00', '200');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('44', '2003', '20190017', '米家保温杯（500ML）黑色', '南京米家日用品有限公司', '36.00', '99.00', '188');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('45', '2007', '20190017', '测试商品0509', '深圳罗马电子科技技术公司', '68.00', '168.00', '200');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('46', '2004', '20190014', '华为Mate 40 Pro 6+128', '华为终端', '6299.00', '7999.00', '1000');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('47', '2006', '20190017', '四驱车', '奥飞娱乐', '34.00', '60.00', '990');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('48', '2002', '20190012', '可口可乐330ML*6', '合肥太古娱乐', '7.90', '12.90', '1000');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('49', '2001', '20190012', '泰国香蕉', '淮南天猫超市大润发', '7.90', '15.00', '990');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('50', '2001', '20190012', '桃李花式面包', '江苏省镇江市', '1.30', '2.50', '600');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('51', '2009', '20190013', '甘草', '安徽省合肥市高新区', '3.60', '12.00', '600');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('52', '2005', '20190019', '大话数据结构', '上海大雅图书', '37.00', '89.00', '588');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('53', '2005', '20190019', '计算机网络（第七版）', '上海大雅图书', '34.00', '78.00', '580');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('54', '2006', '20190019', '飞机航模', '武汉玩具厂', '37.00', '400.00', '600');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('55', '2011', '20190017', '鸿星尔克卫衣', '福建衣服厂', '39.00', '128.00', '100');
INSERT INTO `product` (`id`, `category_id`, `provider_id`, `name`, `factory_address`, `purchase_price`, `sale_price`, `stock`) VALUES ('56', '2009', '20190014', '蓝月亮洗衣液', '江苏省镇江市', '37.00', '128.00', '599');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号',
  `name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

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
INSERT INTO `product_category` VALUES ('2012', '护肤品');

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

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日历信息表';

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调度器状态表';

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES ('10', '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-02-03 22:26:18', '', null, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-03 22:26:15', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-02-03 22:26:18', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-02-03 22:26:18', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-02-03 22:26:18', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-02-03 22:26:18', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-02-03 22:26:18', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-02-03 22:26:18', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-02-03 22:26:18', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-02-03 22:26:18', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-02-03 22:26:18', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-02-03 22:26:18', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-02-03 22:26:18', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-02-03 22:26:18', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-02-03 22:26:18', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-02-03 22:26:18', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-02-03 22:26:18', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 22:33:14');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 22:34:23');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 22:46:28');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 22:52:36');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 23:00:57');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 23:03:14');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 23:08:28');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 23:10:05');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 23:24:53');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-03 23:56:27');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 00:02:28');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 00:04:54');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:17:04');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:22:03');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:23:39');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:28:26');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:32:22');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:35:27');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:38:21');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:42:45');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:47:19');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:47:57');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:48:53');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:54:16');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 01:54:55');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 02:00:10');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 02:05:00');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 02:06:16');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 02:07:20');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 02:09:43');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 02:15:04');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 04:32:36');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 04:35:20');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 04:48:44');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:15:51');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:17:52');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:22:26');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:22:57');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:25:33');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:36:15');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:37:06');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:41:29');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:42:20');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:54:54');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 05:57:07');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:03:29');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:28:31');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:30:58');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:36:12');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:49:15');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:51:38');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 06:59:12');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:00:22');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:08:04');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:10:27');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:11:16');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:12:50');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:14:31');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:24:21');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:29:11');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:30:14');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:31:15');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:32:29');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:34:41');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:43:10');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:45:14');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 07:48:21');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 08:08:47');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 08:11:42');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 08:15:47');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 08:18:23');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 08:27:11');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 08:33:34');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 11:00:30');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 11:46:29');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 11:52:09');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 11:53:49');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 11:59:34');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:06:35');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:08:27');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:21:24');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:23:10');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:25:25');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:28:33');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:30:33');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:32:42');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:35:45');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:45:41');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:49:01');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:50:14');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 12:53:12');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:02:30');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:03:52');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:05:39');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:07:00');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:11:09');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:18:57');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2022-02-04 13:22:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2027 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-02-03 22:26:15', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-02-03 22:26:15', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-02-03 22:26:15', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2022-02-03 22:26:15', '', null, '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-02-03 22:26:15', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-02-03 22:26:15', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-02-03 22:26:15', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-02-03 22:26:15', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-02-03 22:26:15', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-02-03 22:26:15', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-02-03 22:26:16', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-02-03 22:26:16', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-02-03 22:26:16', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-02-03 22:26:16', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-02-03 22:26:16', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-02-03 22:26:16', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-02-03 22:26:16', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-02-03 22:26:16', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-02-03 22:26:16', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-02-03 22:26:16', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-02-03 22:26:16', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-02-03 22:26:16', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-02-03 22:26:16', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '115', '1', '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '115', '2', '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '115', '3', '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '115', '4', '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '115', '5', '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-02-03 22:26:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '超市管理', '0', '0', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-balance-scale', 'admin', '2022-02-03 22:33:52', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '销售账单', '2000', '1', '/system/bill', 'menuItem', 'C', '0', '1', 'system:bill:view', 'fa fa-building-o', 'admin', '2022-02-03 22:51:05', 'admin', '2022-02-04 08:19:00', '销售账单菜单');
INSERT INTO `sys_menu` VALUES ('2002', '销售账单查询', '2001', '1', '#', '', 'F', '0', '1', 'system:bill:list', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '销售账单新增', '2001', '2', '#', '', 'F', '0', '1', 'system:bill:add', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '销售账单修改', '2001', '3', '#', '', 'F', '0', '1', 'system:bill:edit', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '销售账单删除', '2001', '4', '#', '', 'F', '0', '1', 'system:bill:remove', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '销售账单导出', '2001', '5', '#', '', 'F', '0', '1', 'system:bill:export', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '商品分类', '2000', '4', '/system/category', 'menuItem', 'C', '0', '1', 'system:category:view', 'fa fa-folder-o', 'admin', '2022-02-03 22:51:05', 'admin', '2022-02-04 13:11:34', '商品分类菜单');
INSERT INTO `sys_menu` VALUES ('2008', '商品分类查询', '2007', '1', '#', '', 'F', '0', '1', 'system:category:list', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '商品分类新增', '2007', '2', '#', '', 'F', '0', '1', 'system:category:add', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '商品分类修改', '2007', '3', '#', '', 'F', '0', '1', 'system:category:edit', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '商品分类删除', '2007', '4', '#', '', 'F', '0', '1', 'system:category:remove', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '商品分类导出', '2007', '5', '#', '', 'F', '0', '1', 'system:category:export', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '库存管理', '2000', '2', '/system/product', 'menuItem', 'C', '0', '1', 'system:product:view', 'fa fa-cubes', 'admin', '2022-02-03 22:51:05', 'admin', '2022-02-04 13:11:46', '商品菜单');
INSERT INTO `sys_menu` VALUES ('2014', '商品查询', '2013', '1', '#', '', 'F', '0', '1', 'system:product:list', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '商品新增', '2013', '2', '#', '', 'F', '0', '1', 'system:product:add', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '商品修改', '2013', '3', '#', '', 'F', '0', '1', 'system:product:edit', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '商品删除', '2013', '4', '#', '', 'F', '0', '1', 'system:product:remove', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '商品导出', '2013', '5', '#', '', 'F', '0', '1', 'system:product:export', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '供应商', '2000', '5', '/system/provider', 'menuItem', 'C', '0', '1', 'system:provider:view', 'fa fa-handshake-o', 'admin', '2022-02-03 22:51:05', 'admin', '2022-02-04 13:12:01', '供应商菜单');
INSERT INTO `sys_menu` VALUES ('2020', '供应商查询', '2019', '1', '#', '', 'F', '0', '1', 'system:provider:list', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '供应商新增', '2019', '2', '#', '', 'F', '0', '1', 'system:provider:add', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '供应商修改', '2019', '3', '#', '', 'F', '0', '1', 'system:provider:edit', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '供应商删除', '2019', '4', '#', '', 'F', '0', '1', 'system:provider:remove', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '供应商导出', '2019', '5', '#', '', 'F', '0', '1', 'system:provider:export', '#', 'admin', '2022-02-03 22:51:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '收银台', '2000', '0', '/system/checkout', 'menuItem', 'C', '0', '1', null, 'fa fa-shopping-cart', 'admin', '2022-02-03 23:07:51', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-02-03 22:26:18', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-02-03 22:26:18', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"超市管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-balance-scale\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:33:52');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"product,bill,product_provider,product_category\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:35:02');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"bill,product,product_category,product_provider\"]}', null, '0', null, '2022-02-03 22:35:15');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:46:40');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:46:42');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:46:44');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:46:47');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"product_provider,product_category,product,bill\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 22:46:53');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"product,product_category,product_provider,bill\"]}', null, '0', null, '2022-02-03 22:47:57');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:01:08');
INSERT INTO `sys_oper_log` VALUES ('110', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:01:10');
INSERT INTO `sys_oper_log` VALUES ('111', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:01:11');
INSERT INTO `sys_oper_log` VALUES ('112', '代码生成', '3', 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', '1', 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:01:13');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"product,bill,product_provider,product_category\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:01:21');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"bill,product,product_category,product_provider\"]}', null, '0', null, '2022-02-03 23:01:27');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"收银台\"],\"url\":[\"/system/checkout\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-shopping-cart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:06:49');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', '1', 'admin', '研发部门', '/system/menu/remove/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:07:12');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"收银台\"],\"url\":[\"/system/checkout\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-shopping-cart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-03 23:07:51');
INSERT INTO `sys_oper_log` VALUES ('118', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"10\"],\"tableName\":[\"product\"],\"tableComment\":[\"商品表\"],\"className\":[\"Product\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"58\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"条形码\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"59\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商品分类编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"categoryId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"60\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"供应商编号\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"providerId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"61\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"商品名称\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"62\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"生产地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"factoryAddress\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"63\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"进货价\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"purchasePrice\"],\"columns[5]', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 06:09:05');
INSERT INTO `sys_oper_log` VALUES ('119', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"10\"],\"tableName\":[\"product\"],\"tableComment\":[\"商品表\"],\"className\":[\"Product\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"58\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"条形码\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"59\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商品分类编号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"categoryId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"60\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"供应商编号\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"providerId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"61\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"商品名称\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"62\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"生产地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"factoryAddress\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"63\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"进货价\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"purchasePrice\"],\"columns[5]', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 06:10:22');
INSERT INTO `sys_oper_log` VALUES ('120', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/product', '127.0.0.1', '内网IP', '\"product\"', null, '0', null, '2022-02-04 06:10:28');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', '1', 'admin', '研发部门', '/tool/gen/synchDb/bill', '127.0.0.1', '内网IP', '\"bill\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 06:28:40');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', '研发部门', '/tool/gen/download/bill', '127.0.0.1', '内网IP', '\"bill\"', null, '0', null, '2022-02-04 06:28:57');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"销售账单\"],\"url\":[\"/system/bill\"],\"target\":[\"menuItem\"],\"perms\":[\"system:bill:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-building-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 08:19:00');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"商品分类\"],\"url\":[\"/system/category\"],\"target\":[\"menuItem\"],\"perms\":[\"system:category:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-folder-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 08:19:28');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"库存管理\"],\"url\":[\"/system/product\"],\"target\":[\"menuItem\"],\"perms\":[\"system:product:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-cubes\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 08:20:09');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"供应商\"],\"url\":[\"/system/provider\"],\"target\":[\"menuItem\"],\"perms\":[\"system:provider:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-handshake-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 08:20:24');
INSERT INTO `sys_oper_log` VALUES ('127', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', 'POST', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"超级管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"gly@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 08:23:53');
INSERT INTO `sys_oper_log` VALUES ('128', '销售账单', '3', 'com.ruoyi.project.system.bill.controller.BillController.remove()', 'POST', '1', 'admin', '研发部门', '/system/bill/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 11:54:42');
INSERT INTO `sys_oper_log` VALUES ('129', '销售账单', '3', 'com.ruoyi.project.system.bill.controller.BillController.remove()', 'POST', '1', 'admin', '研发部门', '/system/bill/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 11:54:44');
INSERT INTO `sys_oper_log` VALUES ('130', '商品分类', '1', 'com.ruoyi.project.system.category.controller.ProductCategoryController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/category/add', '127.0.0.1', '内网IP', '{\"name\":[\"护肤品\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 12:51:32');
INSERT INTO `sys_oper_log` VALUES ('131', '商品', '1', 'com.ruoyi.project.system.product.controller.ProductController.addSave()', 'POST', '1', 'admin', '研发部门', '/system/product/add', '127.0.0.1', '内网IP', '{\"id\":[\"22233658\"],\"categoryId\":[\"2007\"],\"providerId\":[\"20190017\"],\"name\":[\"测温计\"],\"factoryAddress\":[\"京东大药房\"],\"purchasePrice\":[\"10\"],\"salePrice\":[\"60\"],\"stock\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 12:54:56');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"商品分类\"],\"url\":[\"/system/category\"],\"target\":[\"menuItem\"],\"perms\":[\"system:category:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-folder-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 13:11:34');
INSERT INTO `sys_oper_log` VALUES ('133', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"库存管理\"],\"url\":[\"/system/product\"],\"target\":[\"menuItem\"],\"perms\":[\"system:product:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-cubes\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 13:11:47');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"供应商\"],\"url\":[\"/system/provider\"],\"target\":[\"menuItem\"],\"perms\":[\"system:provider:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-handshake-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-02-04 13:12:01');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-02-03 22:26:15', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-02-03 22:26:15', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-02-03 22:26:15', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-02-03 22:26:15', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '0', '0', 'admin', '2022-02-03 22:26:15', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2022-02-03 22:26:15', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '超级管理员', '00', 'gly@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-03-11 21:39:21', '2022-02-03 22:26:15', 'admin', '2022-02-03 22:26:15', '', '2022-02-04 13:22:04', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-02-03 22:26:15', '2022-02-03 22:26:15', 'admin', '2022-02-03 22:26:15', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('76002e87-52f2-48ce-a612-daaaa0d8b99e', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', 'on_line', '2022-03-11 21:39:18', '2022-03-11 21:39:21', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
