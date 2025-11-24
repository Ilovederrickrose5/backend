/*
 Navicat Premium Data Transfer

 Source Server         : database
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : sport_equipment

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 24/11/2025 19:00:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `is_default` bit(1) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKda8tuywtf0gb6sedwk7la1pgi`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, '2025-10-21 19:59:02', '2025-10-21 19:59:02');
INSERT INTO `cart` VALUES (4, 13, '2025-10-28 11:06:28', '2025-10-28 11:06:28');

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(38, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_id`(`cart_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
INSERT INTO `cart_item` VALUES (53, 1, 1, 1, 213.00);
INSERT INTO `cart_item` VALUES (54, 1, 67, 1, 79.00);
INSERT INTO `cart_item` VALUES (55, 1, 97, 1, 699.00);
INSERT INTO `cart_item` VALUES (56, 1, 124, 1, 1459.00);

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbg4txsew6x3gl6r9swcq190hg`(`product_id` ASC) USING BTREE,
  INDEX `FKh3f2dg11ibnht4fvnmx60jcif`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FKbg4txsew6x3gl6r9swcq190hg` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh3f2dg11ibnht4fvnmx60jcif` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for main_category
-- ----------------------------
DROP TABLE IF EXISTS `main_category`;
CREATE TABLE `main_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of main_category
-- ----------------------------
INSERT INTO `main_category` VALUES (1, '球类运动', '各类球类运动相关装备');
INSERT INTO `main_category` VALUES (2, '户外探险', '户外探险相关装备');
INSERT INTO `main_category` VALUES (3, '健身训练', '健身训练相关装备');
INSERT INTO `main_category` VALUES (4, '骑行运动', '骑行运动相关装备');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `total_amount` decimal(38, 2) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recipient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (7, 1, 213.00, 'DELIVERED', '新柳大道99号', '18178236473', '2025-10-31 06:27:55', '2025-10-31 09:51:17', 'WECHAT', '刘子豪', '');
INSERT INTO `order` VALUES (8, 13, 139.99, 'DELIVERED', '洛杉矶湖人', '18176359412', '2025-11-01 11:32:56', '2025-11-01 11:33:27', 'WECHAT', '詹姆斯', '');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(38, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (7, 7, 1, 1, 213.00);
INSERT INTO `order_item` VALUES (8, 8, 145, 1, 139.99);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `third_category_id` bigint NOT NULL,
  `price` decimal(38, 2) NOT NULL,
  `stock` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fourth_category_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `third_category_id`(`third_category_id` ASC) USING BTREE,
  INDEX `FKav48g5t32g1u8njig67edxojb`(`fourth_category_id` ASC) USING BTREE,
  CONSTRAINT `FKav48g5t32g1u8njig67edxojb` FOREIGN KEY (`fourth_category_id`) REFERENCES `fourth_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`third_category_id`) REFERENCES `third_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Spalding/斯伯丁 74-600Y', 1, 213.00, 96, '室内室外 耐打 牢固 水泥地 真皮手感PU篮球 7号', 'http://localhost:8080/upload/product/product_0c2b4f33-6a8c-498d-8b06-1f9c3be00f48.jpg', '2025-09-23 11:36:23', '2025-10-31 06:27:55', NULL);
INSERT INTO `product` VALUES (2, 'Spalding/斯伯丁 G.O.A.T.S训练系列篮球', 1, 97.00, 149, '耐磨 室内室外 静音 日常训练 手感之王 水泥地 实战比赛 橡胶篮球', 'http://localhost:8080/upload/product/product_a7207fef-7325-4368-a094-e95a232cf087.jpg', '2025-09-23 11:36:23', '2025-10-29 02:51:33', NULL);
INSERT INTO `product` VALUES (3, 'Spalding/斯伯丁 NBA队徽系列', 1, 113.00, 199, '弹力稳定 防滑耐打 手感出众 强韧 吸湿 室外耐磨 训练比赛PU篮球', 'http://localhost:8080/upload/product/product_6811a4c9-ca0b-4f5e-b7aa-13f719a8da93.jpg', '2025-09-23 11:36:23', '2025-10-31 02:29:53', NULL);
INSERT INTO `product` VALUES (4, 'Wilson/威尔逊 ETERNAL PLUS', 2, 166.00, 80, '吸湿 耐磨手感 室内外 成年人 PU篮球', 'http://localhost:8080/upload/product/product_2b7ee866-a84e-4494-b856-e401259c2ea1.jpg', '2025-09-23 11:36:23', '2025-11-23 02:28:02', NULL);
INSERT INTO `product` VALUES (5, '威尔逊篮球训练球 7号', 2, 259.00, 120, 'PU材质，适合日常训练，性价比高', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (6, '威尔逊篮球网 耐用型', 2, 59.00, 150, '高密度聚乙烯材质，抗老化，使用寿命长', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (7, '李宁CBA联名款篮球 7号', 3, 399.00, 90, 'CBA官方指定用球，防滑纹路设计，易掌控', 'http://localhost:8080/upload/product/product_7349e56a-99f3-4535-9a43-179ca6e12ccf.jpg', '2025-09-23 11:36:23', '2025-10-29 02:45:52', NULL);
INSERT INTO `product` VALUES (8, '李宁篮球训练套装', 3, 459.00, 70, '包含篮球、打气筒、网兜和护腕，一站式购买', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (9, '李宁篮球背包 大容量', 3, 239.00, 100, '可装篮球和运动装备，多口袋设计，防水面料', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (10, '乔丹篮球 室内外通用', 4, 299.00, 110, '复合皮革材质，室内外场地通用，耐磨耐打', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (11, '乔丹篮球鞋 高帮减震', 4, 599.00, 80, '高帮设计提供脚踝支撑，全掌气垫减震', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (12, '乔丹篮球训练T恤', 4, 159.00, 150, '速干面料，透气网眼，运动舒适', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (13, '摩腾篮球 7号标准球', 5, 359.00, 90, '丁基内胆，优质PU外皮，弹性稳定', 'http://localhost:8080/upload/product/product_4cdb3c67-be31-4080-9bb0-a5255e9f9f2f.jpg', '2025-09-23 11:36:23', '2025-10-29 02:46:43', NULL);
INSERT INTO `product` VALUES (14, '摩腾篮球训练手册', 5, 89.00, 200, '专业教练编写，包含基础技巧和进阶训练方法', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (15, '摩腾篮球气针套装', 5, 39.00, 300, '含气针、网袋和压力表，方便篮球充气保养', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (16, 'star足球 5号比赛用球', 6, 399.00, 70, '国际比赛认证用球，PU材质，手感柔软', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (17, 'star足球训练球 4号球', 6, 259.00, 150, '适合青少年训练使用，耐磨材质，易控制', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (18, 'star足球网 标准尺寸', 6, 299.00, 50, '标准比赛尺寸，高强度尼龙材质，耐用性强', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (19, '匹克足球 5号标准球', 7, 329.00, 80, '高弹性丁基内胆，防水PU外皮，适合各种天气', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (20, '匹克足球训练装备套装', 7, 299.00, 60, '包含足球鞋袋、护腿板和训练背心', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (21, '匹克足球袜 长筒防滑', 7, 79.00, 150, '加厚缓冲，防滑纹路，保护脚踝', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (22, '李宁足球 中超联名款', 8, 499.00, 70, '中超联赛官方指定用球，科技感设计', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (23, '李宁足球训练包', 8, 239.00, 90, '大容量设计，可装足球和训练装备', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (24, '李宁足球守门员手套', 8, 299.00, 60, '乳胶掌面，护指设计，防滑耐磨', NULL, '2025-09-23 11:36:23', '2025-09-23 11:36:23', NULL);
INSERT INTO `product` VALUES (25, '卡尔美足球训练服 套装', 9, 399.00, 120, '速干透气面料，修身设计，多色可选', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (26, '卡尔美守门员手套 专业款', 9, 299.00, 80, '乳胶掌面提供出色 grip，护指设计保护手指', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (27, '卡尔美运动袜 专业足球袜', 9, 69.00, 200, '防滑纹路，加厚缓冲，透气排汗', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (28, '匹克羽毛球拍 超轻碳纤维', 10, 399.00, 100, '全碳纤维材质，超轻设计，弹性出色', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (29, '匹克羽毛球 耐打12只装', 10, 99.00, 200, '鹅毛材质，耐打度高，飞行稳定', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (30, '匹克羽毛球包 双肩背包', 10, 199.00, 80, '大容量设计，可装2-3支球拍', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (31, '川崎羽毛球拍 专业进攻型', 11, 599.00, 90, '高弹性碳纤维，平衡点靠前，适合进攻型选手', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (32, '川崎羽毛球 耐打王', 11, 99.00, 300, '鹅毛材质，耐打度高，飞行稳定', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (33, '川崎羽毛球包 单肩背包', 11, 199.00, 70, '可装2支球拍，独立鞋仓，便携设计', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (34, '李宁羽毛球拍 风动9000', 12, 1299.00, 60, '国家队同款，风动导流科技，击球威力大', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (35, '李宁羽毛球 专业比赛级', 12, 159.00, 150, '精选鹅毛，稳定飞行，落点精准', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (36, '李宁羽毛球鞋 专业比赛款', 12, 599.00, 90, '减震防滑设计，透气网面，适合高强度比赛', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (37, '匹克网球拍 碳纤维', 13, 499.00, 80, '碳纤维复合材质，轻量化设计，控制力强', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (38, '匹克网球 训练用球', 13, 129.00, 200, '高弹性橡胶内胆，耐用性强', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (39, '匹克网球背包', 13, 259.00, 70, '大容量设计，可装2支球拍和其他装备', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (40, '川崎网球拍 专业选手款', 14, 899.00, 60, '全碳纤维材质，专业级性能，适合进阶选手', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (41, '川崎网球 比赛用球', 14, 199.00, 150, 'ITF认证比赛用球，高弹性，耐打度高', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (42, '川崎网球训练带', 14, 89.00, 120, '辅助训练用带，帮助掌握正确击球姿势', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (43, '红双喜乒乓球拍 狂飙系列', 15, 499.00, 100, '狂飙胶皮，七层纯木底板，旋转强劲', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (44, '红双喜乒乓球 三星级', 15, 129.00, 199, '国际比赛用球，40+mm，耐打度高', NULL, '2025-09-23 11:36:24', '2025-10-31 01:51:40', NULL);
INSERT INTO `product` VALUES (45, '红双喜乒乓球桌 家用折叠', 15, 2999.00, 30, '家用折叠式乒乓球桌，无需安装，方便收纳', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (46, '双鱼乒乓球拍 专业级', 16, 459.00, 79, '专业级球拍，双面反胶，控球稳定', NULL, '2025-09-23 11:36:24', '2025-10-31 01:56:54', NULL);
INSERT INTO `product` VALUES (47, '双鱼乒乓球 二星级', 16, 89.00, 250, '训练用球，耐打度高，性价比出色', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (48, '双鱼乒乓球网架 标准尺寸', 16, 129.00, 100, '标准比赛尺寸，快速安装，稳定耐用', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (49, '匹克排球 比赛专用', 18, 359.00, 70, 'PU材质，手感柔软，弹跳稳定', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (50, '匹克排球训练套装', 18, 499.00, 60, '包含排球、打气筒和训练手册', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (51, '匹克排球网 标准尺寸', 18, 299.00, 50, '高强度尼龙材质，抗老化，使用寿命长', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (52, '361°排球 5号标准球', 19, 329.00, 80, '优质PU材质，适合比赛和训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (53, '361°排球训练服', 19, 259.00, 100, '速干透气面料，运动舒适', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (54, '361°排球护膝', 19, 129.00, 150, '高弹性材质，保护膝盖，减少运动损伤', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (55, 'PGM高尔夫球杆 男士套杆', 20, 3999.00, 40, '全套13支球杆，包含木杆、铁杆和推杆', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (56, 'PGM高尔夫球 三层球', 20, 299.00, 150, '三层结构设计，飞行稳定，距离远', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (57, 'PGM高尔夫球包 标准球包', 20, 699.00, 60, '大容量设计，防水材质，耐用性强', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (58, '目击者橄榄球 标准3号球', 21, 359.00, 70, '优质PU材质，适合比赛和训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (59, '目击者橄榄球训练装备', 21, 499.00, 50, '包含头盔、护肩和护膝', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (60, '目击者橄榄球背包', 21, 299.00, 80, '大容量设计，可装橄榄球和训练装备', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (61, '威尔逊橄榄球 官方比赛用球', 22, 499.00, 60, 'NFL认证用球，优质皮革材质，手感极佳', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (62, '威尔逊橄榄球训练手册', 22, 129.00, 150, '专业教练编写，包含基础技巧和战术', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (63, '威尔逊橄榄球打气筒', 22, 89.00, 120, '高精度压力表，快速充气', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (64, '361°棒球棒 铝合金', 23, 399.00, 80, '高强度铝合金材质，轻量化设计，击球有力', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (65, '361°棒球手套 少年款', 23, 299.00, 100, '优质牛皮材质，舒适贴合，易接球', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (66, '361°棒球 训练用球', 23, 159.00, 150, '高弹性橡胶材质，安全耐用', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (67, '回力 登山靴 WXY-D637C', 24, 79.00, 70, '防水 耐磨 英伦风 厚底增高 户外登山 马丁靴 卡其色 加绒', 'http://localhost:8080/upload/product/product_70fdca8b-8218-408d-b343-cd3c282baa50.jpg', '2025-09-23 11:36:24', '2025-10-30 01:40:12', NULL);
INSERT INTO `product` VALUES (68, '自由兵 登山鞋', 24, 254.00, 100, '防滑防水 透气 徒步 户外登山 耐磨 作战 战术鞋', 'http://localhost:8080/upload/product/product_7eb00e30-aacc-4677-8600-3b750f840a7d.jpg', '2025-09-23 11:36:24', '2025-10-30 01:39:55', NULL);
INSERT INTO `product` VALUES (69, 'Jeep/吉普 马丁靴', 24, 265.00, 150, '户外靴登山鞋防滑耐磨软底时尚复古P341091106', 'http://localhost:8080/upload/product/product_004718b1-8956-4ac2-b5a6-d056386a83c2.jpg', '2025-09-23 11:36:24', '2025-10-30 02:12:05', NULL);
INSERT INTO `product` VALUES (70, '三合一冲锋衣 防风防水', 25, 1299.00, 60, '可拆卸内胆，防风防水面料，适合多种气候', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (71, '单层冲锋衣 轻薄透气', 25, 599.00, 90, '轻薄防水面料，透气排汗，适合春夏', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (72, '冲锋衣清洗液 专用清洁剂', 25, 59.00, 200, '中性配方，保护防水涂层，延长使用寿命', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (73, '碳纤维登山杖 伸缩款', 26, 399.00, 80, '碳纤维材质，轻量化设计，可调节长度', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (74, '铝合金登山杖 减震款', 26, 299.00, 100, '高强度铝合金，减震系统，舒适握把', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (75, '登山杖配件套装', 26, 89.00, 150, '包含杖尖、雪托和护腕带', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (76, '专业登山包 60L', 27, 899.00, 60, '大容量设计，背负系统舒适，多仓收纳', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (77, '户外背包 35L', 27, 599.00, 80, '轻量设计，防水面料，适合单日徒步', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (78, '登山包防雨罩', 27, 89.00, 150, '高强度尼龙材质，防水耐磨，适配多种尺寸', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (79, '三季帐篷 3-4人', 28, 1299.00, 50, '双层结构，防水PU涂层，防风抗雨', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (80, '双人帐篷 轻量化', 28, 899.00, 70, '轻量设计，快速搭建，适合徒步露营', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (81, '帐篷地垫 防潮垫', 28, 199.00, 120, 'EPE材质，防潮隔冷，舒适耐用', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (82, '羽绒睡袋 四季通用', 29, 1599.00, 40, '90%白鸭绒填充，舒适温标-10℃~5℃', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (83, '睡袋内胆 纯棉', 29, 199.00, 100, '纯棉材质，柔软舒适，保护睡袋清洁', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (84, '户外炊具套装', 29, 399.00, 80, '包含炉头、锅具和餐具，便携设计', NULL, '2025-09-23 11:36:24', '2025-09-24 02:42:20', NULL);
INSERT INTO `product` VALUES (85, 'LED营地灯 可充电', 30, 259.00, 90, '高亮度LED，多档调光，续航持久', NULL, '2025-09-23 11:36:24', '2025-09-24 02:42:20', NULL);
INSERT INTO `product` VALUES (86, '太阳能营地灯', 30, 199.00, 120, '太阳能充电，节能环保，适合户外使用', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (87, '头灯 强光防水', 30, 159.00, 150, '轻量设计，可调节亮度，续航10小时', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (88, '户外徒步鞋 防水透气', 31, 699.00, 80, 'GORE-TEX防水面料，Vibram大底，舒适耐用', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (89, '轻量徒步鞋 春夏款', 31, 499.00, 100, '网面透气，轻量设计，适合单日徒步', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (90, '徒步鞋鞋垫 减震', 31, 59.00, 200, '记忆棉材质，减震缓冲，舒适贴合', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (91, '户外速干裤 男女款', 32, 299.00, 120, '轻薄速干面料，弹性腰围，多口袋设计', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (92, '速干长裤 可拆卸', 32, 359.00, 90, '两截式设计，可转换为短裤，适合多变天气', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (93, '速干T恤 短袖', 32, 159.00, 150, '轻薄速干面料，透气网眼，运动舒适', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (94, '户外遮阳帽 防晒', 33, 129.00, 150, 'UPF50+防晒，可调节帽围，透气网眼', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (95, '渔夫帽 户外款', 33, 89.00, 200, '大檐设计，防晒防雨，轻便易收纳', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (96, '防晒头巾 多功能', 33, 59.00, 250, '多用途设计，可作头巾、围脖、帽子等', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (97, '家用哑铃', 34, 699.00, 50, '健身 家用 举重 可调节 包胶 两用 黑色 5KG一对', 'http://localhost:8080/upload/product/product_5932a428-9fd3-45c8-996f-aeb1533c6eaa.jpg', '2025-09-23 11:36:24', '2025-10-30 06:21:15', NULL);
INSERT INTO `product` VALUES (98, '哑铃套装 女士健身', 34, 359.00, 80, '彩色包胶设计，重量适中，适合女性健身', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (99, '哑铃凳 多功能健身凳', 34, 899.00, 40, '多角度调节，折叠设计，节省空间', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (100, '杠铃套装 家用健身', 35, 1299.00, 30, '包含杠铃杆和可调节重量片，适合力量训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (101, '奥杆杠铃 专业训练', 35, 899.00, 40, '高强度合金钢材质，旋转轴承，耐用性强', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (102, '杠铃片 包胶配重', 35, 599.00, 60, '环保包胶材质，无噪音，保护地板', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (103, '弹力带套装 多功能', 36, 199.00, 120, '包含5种不同阻力，适合全身训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (104, '弹力绳 拉力器', 36, 259.00, 90, '多功能设计，可进行多种力量训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (105, '阻力带 环形', 36, 89.00, 150, '高弹性乳胶材质，适合臀部和腿部训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (106, '瑜伽垫 加厚加宽', 38, 199.00, 150, 'TPE材质，6mm加厚，防滑设计', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (107, '瑜伽球 健身球', 38, 129.00, 100, '防爆材质，多种尺寸可选，适合核心训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (108, '瑜伽服套装 女', 38, 299.00, 80, '速干透气面料，弹性舒适，多色可选', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (109, '跳绳 专业竞速', 39, 159.00, 120, '钢丝绳芯，高速轴承，可调节长度', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (110, '跳绳 计数款', 39, 99.00, 150, '智能计数，卡路里计算，记忆功能', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (111, '跳绳垫 减震隔音', 39, 199.00, 80, '高密度材质，减震隔音，保护地板', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (112, '阻力带套装 健身', 40, 159.00, 100, '包含3种阻力级别，适合不同训练阶段', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (113, '弹力圈 环形阻力带', 40, 79.00, 200, '乳胶材质，高弹性，适合腿部训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (114, '阻力带训练手册', 40, 59.00, 150, '详细动作指导，适合家庭健身', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (115, '运动背心 男士速干', 42, 129.00, 150, '速干面料，透气网眼，运动舒适', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (116, '运动背心 女士健身', 42, 119.00, 120, '高弹性面料，修身设计，多色可选', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (117, '运动背心 宽松款', 42, 99.00, 100, '棉质混纺，柔软舒适，日常训练皆宜', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (118, '运动紧身裤 男士', 43, 199.00, 100, '高弹性面料，压缩设计，促进血液循环', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (119, '运动紧身裤 女士', 43, 189.00, 120, '高弹性面料，提臀设计，舒适贴合', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (120, '紧身裤 加绒款', 43, 259.00, 80, '冬季保暖，高弹性面料，适合寒冷天气训练', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (121, '运动文胸 高强度支撑', 44, 259.00, 90, '高强度支撑，减震设计，适合跑步等运动', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (122, '运动文胸 中强度', 44, 199.00, 110, '中强度支撑，舒适透气，适合瑜伽健身', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (123, '运动文胸 低强度', 44, 159.00, 130, '轻盈舒适，透气面料，适合日常活动', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (124, 'Decathlon/迪卡侬 RC100公路车', 45, 1459.00, 99, '铝合金车架 轻量化设计 适合竞速 多速 通勤 银色 标配', 'http://localhost:8080/upload/product/product_70770bf2-4161-4002-be4a-3f30178c142b.jpg', '2025-09-23 11:36:24', '2025-10-31 02:35:28', NULL);
INSERT INTO `product` VALUES (125, '公路车外胎 700C', 45, 299.00, 50, '低滚阻设计，适合公路骑行，耐磨性好', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (126, '公路车头盔 气动款', 45, 499.00, 30, '一体成型设计，通风口多，安全认证', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (127, 'Forever/永久 FS06山地车', 46, 3999.00, 20, '蓝图套件 铝合金车架 硬尾 林道 辐条轮 24速 26英寸 线碟 钢架', 'http://localhost:8080/upload/product/product_9d7ea432-4df3-4b44-975f-8ebc9ba991d3.jpg', '2025-09-23 11:36:24', '2025-10-30 06:35:43', NULL);
INSERT INTO `product` VALUES (128, '山地车避震前叉', 46, 899.00, 30, '液压避震，可调节行程，适合复杂路况', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (129, '山地车外胎 26寸', 46, 199.00, 60, '大齿纹设计，抓地力强，适合山地骑行', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (130, '折叠自行车 20寸', 47, 1999.00, 30, '铝合金车架，快速折叠，便携设计', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (131, '折叠车配件 车筐', 47, 129.00, 80, '快拆设计，大容量，适合日常通勤', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (132, '折叠车保养套装', 47, 159.00, 60, '包含链条油、工具和清洁用品', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (133, '骑行头盔 一体成型', 48, 399.00, 60, 'EPS泡沫+PC外壳，通风设计，安全认证', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (134, '骑行头盔 带灯款', 48, 459.00, 50, '前后LED灯，提高夜间骑行安全性', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (135, '头盔防虫网', 48, 29.00, 150, '防止昆虫进入头盔，保持通风', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (136, '骑行服套装 夏季短袖', 49, 499.00, 80, '速干透气面料，反光条设计，多口袋', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (137, '骑行裤 带护垫', 49, 359.00, 60, '高弹性面料，专业护垫，长时间骑行舒适', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (138, '骑行风衣 轻薄款', 49, 399.00, 50, '轻薄防水，可收纳设计，适合多变天气', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (139, '骑行锁鞋 公路款', 50, 899.00, 40, '碳纤维鞋底，轻量化设计，提升踩踏效率', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (140, '骑行锁鞋 山地款', 50, 799.00, 30, '尼龙鞋底，可兼容平底，适合混合路况', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (141, '锁踏 兼容SPD', 50, 359.00, 50, '不锈钢材质，密封轴承，耐用性强', NULL, '2025-09-23 11:36:24', '2025-09-23 11:36:24', NULL);
INSERT INTO `product` VALUES (142, '自行车水壶架 铝合金', 51, 89.00, 100, '轻量化设计，快速安装，稳固耐用', NULL, '2025-09-23 11:36:25', '2025-09-23 11:36:25', NULL);
INSERT INTO `product` VALUES (143, '自行车水壶架 碳纤维', 51, 159.00, 60, '超轻碳纤维材质，高强度，耐腐蚀', NULL, '2025-09-23 11:36:25', '2025-09-23 11:36:25', NULL);
INSERT INTO `product` VALUES (144, '自行车水壶 大容量', 51, 129.00, 80, '750ml大容量，保温设计，挤压式出水', NULL, '2025-09-23 11:36:25', '2025-09-23 11:36:25', NULL);
INSERT INTO `product` VALUES (145, '威尔逊ncaa篮球', 2, 139.99, 98, '防滑耐磨，手感好，适合室内室外', 'http://localhost:8080/upload/product/product_916db1b6-b762-42bb-af53-d14ad5284909.jpg', '2025-09-23 06:18:06', '2025-11-01 11:32:56', NULL);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `rating` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKiyof1sindb9qiqr9o8npj8klt`(`product_id` ASC) USING BTREE,
  INDEX `FKiyf57dy48lyiftdrf7y87rnxi`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `main_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKpiu24qiayeil0k09wegqshto0`(`name` ASC, `main_category_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub_categories
-- ----------------------------

-- ----------------------------
-- Table structure for sub_category
-- ----------------------------
DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `main_category_id` bigint NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sub_main`(`name` ASC, `main_category_id` ASC) USING BTREE,
  UNIQUE INDEX `UKc0ybnrc8ptbqmvn5gnmvhwwmk`(`name` ASC, `main_category_id` ASC) USING BTREE,
  INDEX `main_category_id`(`main_category_id` ASC) USING BTREE,
  CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`main_category_id`) REFERENCES `main_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sub_category
-- ----------------------------
INSERT INTO `sub_category` VALUES (1, '篮球', 1, NULL);
INSERT INTO `sub_category` VALUES (2, '足球', 1, NULL);
INSERT INTO `sub_category` VALUES (3, '羽毛球', 1, NULL);
INSERT INTO `sub_category` VALUES (4, '网球', 1, NULL);
INSERT INTO `sub_category` VALUES (5, '乒乓球', 1, NULL);
INSERT INTO `sub_category` VALUES (6, '匹克球', 1, NULL);
INSERT INTO `sub_category` VALUES (7, '排球', 1, NULL);
INSERT INTO `sub_category` VALUES (8, '高尔夫球', 1, NULL);
INSERT INTO `sub_category` VALUES (9, '橄榄球', 1, NULL);
INSERT INTO `sub_category` VALUES (10, '棒球', 1, NULL);
INSERT INTO `sub_category` VALUES (11, '登山装备', 2, NULL);
INSERT INTO `sub_category` VALUES (12, '露营装备', 2, NULL);
INSERT INTO `sub_category` VALUES (13, '徒步装备', 2, NULL);
INSERT INTO `sub_category` VALUES (14, '力量训练', 3, NULL);
INSERT INTO `sub_category` VALUES (15, '有氧训练', 3, NULL);
INSERT INTO `sub_category` VALUES (16, '健身服装', 3, NULL);
INSERT INTO `sub_category` VALUES (17, '骑行车型', 4, NULL);
INSERT INTO `sub_category` VALUES (18, '骑行装备', 4, NULL);

-- ----------------------------
-- Table structure for third_category
-- ----------------------------
DROP TABLE IF EXISTS `third_category`;
CREATE TABLE `third_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_category_id` bigint NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_third_sub`(`name` ASC, `sub_category_id` ASC) USING BTREE,
  UNIQUE INDEX `UK8qb8wbfsy3fwcuhod8amysn24`(`name` ASC, `sub_category_id` ASC) USING BTREE,
  INDEX `sub_category_id`(`sub_category_id` ASC) USING BTREE,
  CONSTRAINT `third_category_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of third_category
-- ----------------------------
INSERT INTO `third_category` VALUES (1, '斯伯丁', 1, NULL);
INSERT INTO `third_category` VALUES (2, '威尔逊', 1, NULL);
INSERT INTO `third_category` VALUES (3, '李宁', 1, NULL);
INSERT INTO `third_category` VALUES (4, '乔丹', 1, NULL);
INSERT INTO `third_category` VALUES (5, '摩腾', 1, NULL);
INSERT INTO `third_category` VALUES (6, 'star', 2, NULL);
INSERT INTO `third_category` VALUES (7, '匹克', 2, NULL);
INSERT INTO `third_category` VALUES (8, '李宁', 2, NULL);
INSERT INTO `third_category` VALUES (9, '卡尔美', 2, NULL);
INSERT INTO `third_category` VALUES (10, '匹克', 3, NULL);
INSERT INTO `third_category` VALUES (11, '川崎', 3, NULL);
INSERT INTO `third_category` VALUES (12, '李宁', 3, NULL);
INSERT INTO `third_category` VALUES (13, '匹克', 4, NULL);
INSERT INTO `third_category` VALUES (14, '川崎', 4, NULL);
INSERT INTO `third_category` VALUES (15, '红双喜', 5, NULL);
INSERT INTO `third_category` VALUES (16, '双鱼', 5, NULL);
INSERT INTO `third_category` VALUES (17, '匹克', 5, NULL);
INSERT INTO `third_category` VALUES (18, '匹克', 6, NULL);
INSERT INTO `third_category` VALUES (19, '361°', 6, NULL);
INSERT INTO `third_category` VALUES (20, 'PGM', 8, NULL);
INSERT INTO `third_category` VALUES (21, '目击者', 9, NULL);
INSERT INTO `third_category` VALUES (22, '威尔逊', 9, NULL);
INSERT INTO `third_category` VALUES (23, '361°', 10, NULL);
INSERT INTO `third_category` VALUES (24, '登山鞋', 11, NULL);
INSERT INTO `third_category` VALUES (25, '冲锋衣', 11, NULL);
INSERT INTO `third_category` VALUES (26, '登山杖', 11, NULL);
INSERT INTO `third_category` VALUES (27, '登山背包', 11, NULL);
INSERT INTO `third_category` VALUES (28, '帐篷', 12, NULL);
INSERT INTO `third_category` VALUES (29, '睡袋炊具', 12, NULL);
INSERT INTO `third_category` VALUES (30, '营地灯', 12, NULL);
INSERT INTO `third_category` VALUES (31, '徒步鞋', 13, NULL);
INSERT INTO `third_category` VALUES (32, '速干裤', 13, NULL);
INSERT INTO `third_category` VALUES (33, '遮阳帽', 13, NULL);
INSERT INTO `third_category` VALUES (34, '哑铃', 14, NULL);
INSERT INTO `third_category` VALUES (35, '杠铃', 14, NULL);
INSERT INTO `third_category` VALUES (36, '卧推凳', 14, NULL);
INSERT INTO `third_category` VALUES (37, '弹力带', 14, NULL);
INSERT INTO `third_category` VALUES (38, '瑜伽', 15, NULL);
INSERT INTO `third_category` VALUES (39, '跳绳', 15, NULL);
INSERT INTO `third_category` VALUES (40, '阻力带', 15, NULL);
INSERT INTO `third_category` VALUES (41, '健腹轮', 15, NULL);
INSERT INTO `third_category` VALUES (42, '运动背心', 16, NULL);
INSERT INTO `third_category` VALUES (43, '紧身裤', 16, NULL);
INSERT INTO `third_category` VALUES (44, '运动bra', 16, NULL);
INSERT INTO `third_category` VALUES (45, '公路车', 17, NULL);
INSERT INTO `third_category` VALUES (46, '山地车', 17, NULL);
INSERT INTO `third_category` VALUES (47, '折叠车', 17, NULL);
INSERT INTO `third_category` VALUES (48, '骑行头盔', 18, NULL);
INSERT INTO `third_category` VALUES (49, '骑行服', 18, NULL);
INSERT INTO `third_category` VALUES (50, '锁鞋', 18, NULL);
INSERT INTO `third_category` VALUES (51, '水壶架', 18, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像URL',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `UKsb8bbouer5wak8vyiiy4pf2bx`(`username` ASC) USING BTREE,
  UNIQUE INDEX `UKob8kqyqqgmefl0aco34akdtpe`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$toVy/UgAgLHSBmC4SZW7su4zPX0n8wd/E4dKWbiNsYkQJ2b22I19a', 'admin@example.com', '18178106914', '新柳大道999号', 'ADMIN', '2025-09-22 15:16:49', '2025-10-27 03:13:03', 'http://localhost:8080/upload/avatar_58ca9b3a-5559-44cb-95c3-9e3de24a1e81.webp');
INSERT INTO `user` VALUES (13, 'user1', '$2a$10$FXDNGjA479pHGc1Dj2RpUeij2BDUb.g5hv7yE8.UekTeXdBV8DQE.', 'user1@qq.com', '10086', '广西壮族自治区南宁市', 'USER', '2025-10-25 02:26:36', '2025-11-23 02:27:18', 'http://localhost:8080/upload/avatar/avatar_2c408f28-412d-4f8d-bc9e-35382692ed5e.png');
INSERT INTO `user` VALUES (14, 'user2', '$2a$10$chLy0ET4uYXXUPU6GDkuE.GQYb9YaN2I1U.GDmBSB6nTFzme6SROi', 'user2@qq.com', '', '', 'USER', '2025-11-22 12:18:07', '2025-11-22 12:18:07', NULL);

SET FOREIGN_KEY_CHECKS = 1;
