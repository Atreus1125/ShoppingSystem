-- 删除数据库
DROP DATABASE IF EXISTS shoppingsystem;

-- 创建数据库
CREATE DATABASE shoppingsystem CHARACTER SET utf8;

-- 使用数据库
USE shoppingsystem;

-- 删除数据表
/*先删从表再删除主表*/
DROP TABLE IF EXISTS `order_detail`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `people`;
DROP TABLE IF EXISTS `goods`;

-- 创建数据表
# 1.创建商品信息表
CREATE TABLE `goods`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `explain` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nowprice` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

# 2.创建用户信息表
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

# 3.创建订单索引表
CREATE TABLE `order`  (
  `person_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sumprice` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`person_id`) USING BTREE,
  INDEX `person_name`(`person_name`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`person_name`) REFERENCES `people` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

# 4.创建订单详情表
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `person_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `order` (`person_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1127 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- 编写测试数据
# 1.增加商品信息
INSERT INTO `goods` VALUES ('1', 'image/phone1.png', 'HUAWEI P40 Pro 5G', '享三期免息', '5988');
INSERT INTO `goods` VALUES ('2', 'image/phone2.png', 'HUAWEI P40 Pro+ 5G', '享六期免息', '7988');
INSERT INTO `goods` VALUES ('3', 'image/phone3.png', '荣耀30', '50倍超稳远摄', '3298');
INSERT INTO `goods` VALUES ('4', 'image/phone4.png', 'HUAWEI Mate 30E Pro 5G', '享六期免息', '5299');
INSERT INTO `goods` VALUES ('5', 'image/phone5.png', 'HUAWEI Mate 40 Pro+ 5G', '享多重权益', '8999');
INSERT INTO `goods` VALUES ('6', 'image/phone6.png', '荣耀Play4', '6400万锐利四摄', '1999');
INSERT INTO `goods` VALUES ('7', 'image/phone7.png', '华为畅想20 Plus', '购机赠耳机', '2299');
INSERT INTO `goods` VALUES ('8', 'image/phone8.png', '荣耀X10 Max', '护眼阳光屏', '2099');

# 2.增加用户信息：
INSERT INTO `people` VALUES ('20180101', '123456', '阿卡丽', '534953576@qq.com', '均衡教派');
INSERT INTO `people` VALUES ('20180102', '123456', '琪亚娜', '534953576@qq.com', '以绪塔尔');
INSERT INTO `people` VALUES ('20180103', '123456', '艾瑞利娅', '534953576@qq.com', '艾欧尼亚');
INSERT INTO `people` VALUES ('20180104', '123456', '卡莎', '534953576@qq.com', '虚空之地');
INSERT INTO `people` VALUES ('20180105', '123456', '霞', '534953576@qq.com', '瓦斯塔亚');
INSERT INTO `people` VALUES ('20180106', '123456', '洛', '534953576@qq.com', '瓦斯塔亚');

-- 提交事务
COMMIT;
