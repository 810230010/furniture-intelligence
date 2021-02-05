/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : furniture_intelligence

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 03/02/2021 17:24:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for furniture_customer
-- ----------------------------
DROP TABLE IF EXISTS `furniture_customer`;
CREATE TABLE `furniture_customer` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(18) NOT NULL DEFAULT '' COMMENT '昵称',
  `phone` varchar(18) NOT NULL COMMENT '手机号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效：0=无效，1=有效',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='买家';

-- ----------------------------
-- Table structure for furniture_customer_receiver_address
-- ----------------------------
DROP TABLE IF EXISTS `furniture_customer_receiver_address`;
CREATE TABLE `furniture_customer_receiver_address` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(21) NOT NULL DEFAULT '0' COMMENT '买家ID',
  `name` varchar(100) DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) DEFAULT NULL COMMENT '手机号',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认,0=否，1=是',
  `post_code` varchar(100) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `province` varchar(100) NOT NULL DEFAULT '' COMMENT '省份/直辖市',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '城市',
  `region` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址(街道)',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效: 0=无效，1=有效',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='买家收货地址表';

-- ----------------------------
-- Table structure for furniture_factory
-- ----------------------------
DROP TABLE IF EXISTS `furniture_factory`;
CREATE TABLE `furniture_factory` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `username` varchar(18) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(18) NOT NULL COMMENT '密码',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效：0=无效，1=有效',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='工厂';

-- ----------------------------
-- Table structure for furniture_factory_info
-- ----------------------------
DROP TABLE IF EXISTS `furniture_factory_info`;
CREATE TABLE `furniture_factory_info` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `factory_id` bigint(21) NOT NULL COMMENT '工厂ID',
  `factory_name` varchar(18) NOT NULL DEFAULT '' COMMENT '工厂名称',
  `logo` varchar(256) NOT NULL DEFAULT '' COMMENT '工厂logo',
  `introduction` varchar(2048) NOT NULL DEFAULT '' COMMENT '工厂介绍',
  `tags` varchar(32) NOT NULL COMMENT '擅长领域',
  `pictures` varchar(1024) NOT NULL COMMENT '公司图片',
  `address` varchar(128) NOT NULL COMMENT '地址，eg: 国家,省,市,详细地址',
  `output_value` varchar(64) NOT NULL COMMENT '产值',
  `factory_character` varchar(12) NOT NULL COMMENT '企业性质：JOIN=合资',
  `has_factory_house` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有厂房',
  `register_year` varchar(4) NOT NULL COMMENT '成立年份',
  `factory_area` varchar(16) NOT NULL COMMENT '工厂面积',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效：0=无效，1=有效',
  `employee_count` varchar(16) NOT NULL COMMENT '员工数量',
  `software_status` varchar(16) NOT NULL COMMENT '软件情况，逗号分割',
  `contact_name` varchar(16) NOT NULL COMMENT '联系人',
  `position` varchar(16) NOT NULL COMMENT '职位',
  `contact_tel` varchar(16) NOT NULL COMMENT '手机号',
  `factory_homepage` varchar(128) NOT NULL COMMENT '公司首页',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='工厂详细信息';

-- ----------------------------
-- Table structure for furniture_factory_product
-- ----------------------------
DROP TABLE IF EXISTS `furniture_factory_product`;
CREATE TABLE `furniture_factory_product` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `factory_id` bigint(21) NOT NULL COMMENT '工厂ID',
  `product_name` varchar(64) NOT NULL COMMENT '产品名称',
  `abbr_pic` varchar(64) NOT NULL DEFAULT '1' COMMENT '缩略图',
  `album_pics` varchar(256) NOT NULL COMMENT '产品组图',
  `keyword` varchar(16) NOT NULL COMMENT '关键字',
  `technology` varchar(8) NOT NULL COMMENT '工艺',
  `material` varchar(16) NOT NULL COMMENT '材料',
  `price` decimal(18,2) NOT NULL COMMENT '最低报价',
  `min_purchase_num` int(11) NOT NULL COMMENT '最低采购数量',
  `stock` int(11) NOT NULL COMMENT '库存量',
  `first_pay_percent` int(11) NOT NULL COMMENT '首付比例',
  `last_pay_percent` int(11) NOT NULL COMMENT '尾付比例',
  `is_valid` tinyint(1) NOT NULL COMMENT '是否有效',
  `publish_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品';

-- ----------------------------
-- Table structure for furniture_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `furniture_order_return_apply`;
CREATE TABLE `furniture_order_return_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增长',
  `order_id` int(11) NOT NULL COMMENT '订单编号',
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `refund_amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `reason` int(11) NOT NULL COMMENT '退货原因',
  `descrription` varchar(255) NOT NULL DEFAULT '2' COMMENT '换货原因 (其他的时候)',
  `approval_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '同意时间',
  `refuse_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '拒绝时间',
  `refund_type` int(2) NOT NULL COMMENT ' 1、退货 2、退款',
  `status` tinyint(2) NOT NULL COMMENT '状态: 0=申请换货,1=申请成功,2=申请失败,3=退货中,4=退货成功',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款/退货';

-- ----------------------------
-- Table structure for furniture_product_order
-- ----------------------------
DROP TABLE IF EXISTS `furniture_product_order`;
CREATE TABLE `furniture_product_order` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) NOT NULL COMMENT '订单编号',
  `query_id` bigint(21) NOT NULL DEFAULT '0' COMMENT '竞标ID',
  `bid_id` bigint(21) NOT NULL DEFAULT '0' COMMENT '材料',
  `product_id` varchar(128) NOT NULL COMMENT '图纸',
  `factory_id` bigint(21) NOT NULL COMMENT '厂家ID',
  `customer_id` bigint(21) NOT NULL COMMENT '买家ID',
  `total_amount` decimal(18,2) NOT NULL COMMENT '总金额',
  `pay_amount` decimal(18,2) NOT NULL COMMENT '实付金额',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式：0=未支付，1=支付宝，2=微信',
  `order_type` tinyint(1) NOT NULL COMMENT '订单生成类型：0=询价产生，1=购买产品生成',
  `source_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单来源：0=pc，1=app',
  `receiver_name` varchar(16) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(16) NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(16) NOT NULL COMMENT '邮编',
  `receiver_province` varchar(8) NOT NULL COMMENT '省',
  `receiver_city` varchar(8) NOT NULL COMMENT '市',
  `receiver_region` varchar(8) NOT NULL COMMENT '区',
  `receiver_detail_address` varchar(64) NOT NULL COMMENT '详细地址',
  `remark` varchar(128) NOT NULL COMMENT '订单备注',
  `order_status` tinyint(2) NOT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '支付时间',
  `delivery_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `receive_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货时间',
  `is_valid` tinyint(1) NOT NULL COMMENT '是否有效',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单';

-- ----------------------------
-- Table structure for furniture_product_query
-- ----------------------------
DROP TABLE IF EXISTS `furniture_product_query`;
CREATE TABLE `furniture_product_query` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '标题',
  `remark` varchar(1024) NOT NULL COMMENT '需求说明',
  `material` varchar(64) NOT NULL COMMENT '材料',
  `design_pic` varchar(128) NOT NULL COMMENT '图纸',
  `attachment` varchar(128) NOT NULL COMMENT '附件',
  `required_technology` varchar(256) NOT NULL COMMENT '工艺条件',
  `product_submit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交货日期',
  `expired_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截止日期',
  `is_valid` tinyint(1) NOT NULL COMMENT '是否有效',
  `customer_id` bigint(21) NOT NULL COMMENT '创建人ID',
  `status` tinyint(1) NOT NULL COMMENT '询标状态：0=结束，1=询标成功，2=询标中',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='询价';

-- ----------------------------
-- Table structure for furniture_product_query_bid
-- ----------------------------
DROP TABLE IF EXISTS `furniture_product_query_bid`;
CREATE TABLE `furniture_product_query_bid` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '标题',
  `remark` varchar(1024) NOT NULL COMMENT '需求说明',
  `material` varchar(64) NOT NULL COMMENT '材料',
  `design_pic` varchar(128) NOT NULL COMMENT '图纸',
  `attachment` varchar(128) NOT NULL COMMENT '附件',
  `required_technology` varchar(256) NOT NULL COMMENT '工艺条件',
  `expired_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '截止日期',
  `is_valid` tinyint(1) NOT NULL COMMENT '是否有效',
  `customer_id` bigint(21) NOT NULL COMMENT '创建人ID',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='竞价';

SET FOREIGN_KEY_CHECKS = 1;
