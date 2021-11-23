/*
 Navicat Premium Data Transfer

 Source Server         : MySQL@localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ssmbuild

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 23/11/2021 15:34:42
*/

CREATE DATABASE `ssmbuild`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_count` int NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (2, 'Python 3.5 从零开始学', 518, 'Python提供了高效的高级数据结构，还能简单有效地面向对象编程');
INSERT INTO `books` VALUES (3, 'Android 项目驱动式开发教程', 657, 'Android是一种基于Linux内核的自由及开放源代码的操作系统');
INSERT INTO `books` VALUES (5, 'Java Web 动态网站开发', 461, 'Java Server Pages（Java服务器页面）');
INSERT INTO `books` VALUES (7, '网络综合布线实用技术', 378, '针对建筑物中所有的通信网络基础设施进行建设施工的一项技术');
INSERT INTO `books` VALUES (8, '网络安全攻防实战', 269, 'INSPC网络安全认证培训教程，适合高等院校计算机相关专业学生学习。');
INSERT INTO `books` VALUES (9, '大数据数学基础', 10, 'python语言描述');
INSERT INTO `books` VALUES (10, '形势与政策（2021秋季版）', 9999, '《形势与政策》内容包括了与国内外形势与政策紧密联系的8个专题，对帮助青年大学生深刻理解和领会党的最新理论成果、认识当前国内国际政治经济形势具有较强的指导作用。');
INSERT INTO `books` VALUES (11, 'Photoshop网站UI设计全程解密', 2438, '本书以目前最受欢迎的图像处理与合成软件——Photoshop为设计工具，对主流网页设计流程和制作技巧进行了全面、细致的剖析。');
INSERT INTO `books` VALUES (12, '书法艺术', 7419, '汉字书法为中国文化的独特表现艺术，被誉为：无言的诗，无形的舞；无图的画，无声的乐。');
INSERT INTO `books` VALUES (13, '实用应用文写作', 5134, '本教材包括绪论、公务文书、事务文书、学业文书、经济文书、诉讼文书、社交礼仪文书、求职文书等内容。教材阐述了各种应用文书的写作知识和写作方法，每个文种都选录了例文并编写了评析。');
INSERT INTO `books` VALUES (14, '心理素质教育与训练', 8422, '本书不追求理论上的周全与系统，而是以训练为主，围绕他们的心理特点、生活环境、常见的生活事件以及心理障碍，提供科学、有效、实用的心理学技术与方法，在心理训练中加深对自身心理行为的理解，从而促进大学生及青年朋友自我潜能的开发，增强社会适应能力，提高心理健康水平。');
INSERT INTO `books` VALUES (15, '大学军事理论与技能训练', 11285, '全书分为上下两篇，上篇为军事理论篇，主要包括中国国防、国际战略环境、军事思想、信息化战争、军事高技术；下篇为军事技能篇，主要包括中国人民解放军条令教育与训练、军事地形学与基本战术、综合训练。');
INSERT INTO `books` VALUES (16, '体育与健康', 12453, '本书面向广大学生和体育爱好者，通俗易懂，并附有详细、准确的动作图解，适合高校师生的教与学，也对乐于强身健体的公众具有较强的指导意义。');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int NOT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rdescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rprems` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '管理员', 'admin:insert,admin:delete,admin:update,admin:select');
INSERT INTO `role` VALUES (4, 'instr', '老师', 'instr:insert,instr:delete,instr:update,instr:select');
INSERT INTO `role` VALUES (5, 'stu', '学生', 'stu:insert,stu:delete,stu:update,stu:select');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0,
  `createdtime` datetime NULL DEFAULT NULL,
  `rid` int NULL DEFAULT 5,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 18, '男', '2001-10-27', 0, '2021-07-08 15:16:35', 1);
INSERT INTO `user` VALUES (3, 'root', 'root', 'root', 10, NULL, NULL, 0, NULL, 1);
INSERT INTO `user` VALUES (4, 'user', 'user', 'user', NULL, NULL, NULL, 0, NULL, 5);
INSERT INTO `user` VALUES (5, 'guest', 'guest', 'guest', NULL, NULL, NULL, 0, NULL, 5);
INSERT INTO `user` VALUES (6, 'test', 'test', '测试', 16, '男', NULL, 0, NULL, 5);
INSERT INTO `user` VALUES (7, 'san', 'sansan', '阿三', 20, '男', '2000-10-03', 0, '2021-10-14 14:43:32', 4);
INSERT INTO `user` VALUES (8, 'becky', 'becky123', 'Becky', 19, '女', '2001-05-22', 0, '2021-10-14 14:53:37', 1);

SET FOREIGN_KEY_CHECKS = 1;
