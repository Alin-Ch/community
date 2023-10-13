/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2023-06-05 20:45:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `notice` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '2023-06-02 14:30:00', '这是一条公告');

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `sex` varchar(20) NOT NULL,
  `health` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of people
-- ----------------------------
INSERT INTO `people` VALUES ('1', '张丽娟', '70', '女', '健康');
INSERT INTO `people` VALUES ('2', '王娟儿', '65', '女', '健康');
INSERT INTO `people` VALUES ('3', '李梅儿', '60', '女', '健康');
INSERT INTO `people` VALUES ('4', '李老汉', '73', '男', '健康');
INSERT INTO `people` VALUES ('5', '铁拐李', '76', '男', '残疾');
INSERT INTO `people` VALUES ('6', '王狗蛋', '65', '男', '健康');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '123456');
INSERT INTO `users` VALUES ('2', '胡歌', '123456');
INSERT INTO `users` VALUES ('3', '赵丽颖', '123456');
INSERT INTO `users` VALUES ('4', '刘亦菲', '123456');
