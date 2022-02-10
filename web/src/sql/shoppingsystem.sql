-- 删除数据库
DROP DATABASE IF EXISTS shoppingsystem;

-- 创建数据库
CREATE DATABASE shoppingsystem CHARACTER SET utf8;

-- 使用数据库
USE shoppingsystem;

-- 删除数据表
DROP TABLE IF EXISTS `order_detail`;
DROP TABLE IF EXISTS `order_index`;
DROP TABLE IF EXISTS `people`;
DROP TABLE IF EXISTS `goods`;

-- 创建数据表
# 1.创建用户信息表
CREATE TABLE `people` (
    `id`              INT NOT NULL,/*用户编号*/
    `password`        VARCHAR(50),/*用户密码*/
    `name`            VARCHAR(50),/*用户姓名*/
    `email`           VARCHAR(50),/*用户邮箱*/
    `address`         VARCHAR(100),/*用户地址*/
    `status`          INT,/*用户状态*/
    CONSTRAINT `people_pk_id` PRIMARY KEY (`id`)/* 用户编号作为主键 */
) ENGINE = InnoDB;

# 2.创建商品信息表
CREATE TABLE `goods` (
    `id`              INT NOT NULL,/*商品编号*/
    `name`            VARCHAR(50),/*商品名称*/
    `image`           VARCHAR(50),/*商品图片*/
    `old_price`       INT,/*商品原价*/
    `new_price`       INT,/*商品现价*/
    `info_brief`      VARCHAR(100),/*商品简要信息*/
    `info_detailed`   VARCHAR(100),/*商品详细信息*/
    `info_additional` VARCHAR(100),/*商品附加信息*/
    `status`          INT,/*商品状态*/
    CONSTRAINT `goods_pk_id` PRIMARY KEY (`id`)/*商品编号作为主键*/
) ENGINE = InnoDB;

# 3.创建订单索引表/*存储一个用户的订单索引信息*/
CREATE TABLE `order_index` (
    `id`              INT NOT NULL AUTO_INCREMENT,/*订单编号*/
    `person_id`       INT NOT NULL,/*订单的属主的编号*/
    `price`           INT,/*订单总价*/
    `address`         VARCHAR(100),/*收货地址*/
    `time`            DATETIME,/*创建日期*/
    `status`          INT,/*订单状态*/
    CONSTRAINT `order_index_pk_id` PRIMARY KEY (`id`),/*订单编号作为主键*/
    CONSTRAINT `order_index_ibfk_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE/*用户表用户编号作为外键*/
) ENGINE = InnoDB AUTO_INCREMENT = 100;/*支持外键以及事务处理，主键从100开始自增*/

# 4.创建订单详情表/*存储所有用户的所有订单的详细信息*/
CREATE TABLE `order_detail` (
    `order_index_id`  INT NOT NULL,/*所属订单的编号*/
    `goods_id`        INT NOT NULL,/*所含商品的编号*/
    `goods_name`      VARCHAR(50),/*所含商品的名称*/
    `number`          INT,/*每种商品的数量*/
    `price`           INT,/*每种商品的总价*/
    CONSTRAINT `order_detail_pk_order_index_id_goods_id` PRIMARY KEY (`order_index_id`, `goods_id`),/*商品编号与所属订单编号作为联合主键 */
    CONSTRAINT `order_detail_ibfk_order_index_id` FOREIGN KEY (`order_index_id`) REFERENCES `order_index` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,/*订单索引表订单编号作为外键*/
    CONSTRAINT `order_detail_ibfk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE/*商品表商品编号作为外键*/
) ENGINE = InnoDB;/*支持外键以及事务处理*/

-- 编写测试数据
# 1.增加用户信息
INSERT INTO `people` VALUES (2022101, '123456', '阿卡丽', '534953576@qq.com', '均衡教派', 0);
INSERT INTO `people` VALUES (2022102, '123456', '琪亚娜', '534953576@qq.com', '以绪塔尔', 0);
INSERT INTO `people` VALUES (2022103, '123456', '艾瑞利娅', '534953576@qq.com', '艾欧尼亚', 0);
INSERT INTO `people` VALUES (2022104, '123456', '卡莎', '534953576@qq.com', '虚空之地', 0);
INSERT INTO `people` VALUES (2022105, '123456', '霞', '534953576@qq.com', '瓦斯塔亚', 0);
INSERT INTO `people` VALUES (2022106, '123456', '洛', '534953576@qq.com', '瓦斯塔亚', 0);

# 2.增加商品数据
INSERT INTO `goods` VALUES (101, 'HUAWEI P40 Pro 5G', './png/phone1.png', 6300, 5988, '享三期免息', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (102, 'HUAWEI P40 Pro+ 5G', './png/phone2.png', 8000, 7988, '享六期免息', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (103, '荣耀30', './png/phone3.png', 3500, 3298, '50倍超稳远摄', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (104, 'HUAWEI Mate 30E Pro 5G', './png/phone4.png', 5300, 5299, '享六期免息', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (105, 'HUAWEI Mate 40 Pro+ 5G','./png/phone5.png', 9000, 8999, '享多重权益', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (106, '荣耀Play4', './png/phone6.png', 2000, 1999, '6400万锐利四摄', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (107, '华为畅想20 Plus', './png/phone7.png', 2500, 2299 ,'购机赠耳机', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);
INSERT INTO `goods` VALUES (108, '荣耀X10 Max', './png/phone8.png', 2100, 2099, '护眼阳光屏', '麒麟99 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', '支付后赠花加330元鲜花满减券/银联、花呗、掌上生活、工行分期/支付可享免息购买即赠商城积分, 积分可抵现', 0);

# 3.增加订单索引数据
# INSERT INTO `order_index` VALUES (0, 2022101, 13976, '均衡教派', now(), 0);
# INSERT INTO `order_index` VALUES (0, 2022101, 5988, '均衡教派', now(), 0);
# INSERT INTO `order_index` VALUES (0, 2022101, 7988, '均衡教派', now(), 0);

# 4.增加订单详情数据
# INSERT INTO `order_detail` VALUES (100, 101, 'HUAWEI P40 Pro 5G', 1, 5988);
# INSERT INTO `order_detail` VALUES (100, 102, 'HUAWEI P40 Pro+ 5G', 1, 7988);

-- 提交事务
COMMIT;