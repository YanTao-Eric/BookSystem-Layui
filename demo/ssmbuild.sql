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

 Date: 12/09/2021 23:45:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  `click_count` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` int NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `comment_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'Java基本数据类型', '1591081911906.html', 2, 17, '<p>123<br/></p>', 1, '2020-03-16 14:39:00', 11);
INSERT INTO `article` VALUES (2, 'Mysql关联查询', '1591081914533.html', 3, 9, '<p>33</p>', 1, '2020-03-16 14:41:36', 9);
INSERT INTO `article` VALUES (3, 'Servlet与JSP', '1591081917363.html', 1, 7, '<p><br/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"/ueditor/jsp/upload/image/20200421/1587434476034062541.png\" title=\"1587434476034062541.png\" alt=\"1.png\"/></p>', 0, '2020-04-21 10:01:39', 0);
INSERT INTO `article` VALUES (4, 'Json与XML', '1591081921925.html', 1, 1, '333', 1, '2020-05-13 14:59:59', 0);
INSERT INTO `article` VALUES (5, 'String与StringBuilder区别', '1591081924236.html', 1, 1, '111', 1, '2020-05-31 16:38:41', 0);
INSERT INTO `article` VALUES (6, '==与equals的区别', '1591081927934.html', 1, 0, '111', 1, '2020-05-31 16:39:21', 0);
INSERT INTO `article` VALUES (7, 'ssm集成', '1591081930081.html', 3, 0, '25', 1, '2018-10-03 15:00:03', 0);
INSERT INTO `article` VALUES (8, '设计模式之单例模式', '1591081547868.html', 1, 0, '11', 1, '2020-05-31 16:39:55', 0);
INSERT INTO `article` VALUES (9, 'xml解析', '1591081933174.html', 1, 0, '23232', 1, '2020-05-31 16:50:53', 0);
INSERT INTO `article` VALUES (10, '数据库连接池', '1591081935288.html', 1, 0, '6363', 1, '2020-05-31 16:51:29', 0);
INSERT INTO `article` VALUES (11, 'SpringMvc的故事', '1591081939844.html', 2, 0, '1212', 0, '2020-05-30 23:18:58', 0);
INSERT INTO `article` VALUES (12, 'Spring来到的时刻', '1591081943154.html', 1, 0, '333', 1, '2020-05-30 23:21:10', 0);
INSERT INTO `article` VALUES (16, 'Mybatis用起来', '1591081945378.html', 2, 0, '5555', 1, '2020-05-31 10:59:37', 0);
INSERT INTO `article` VALUES (20, 'UUID的使用', '1591081957819.html', 1, 3, '不是八个核桃吗？', 1, '2020-05-31 19:25:51', 0);
INSERT INTO `article` VALUES (24, '过滤器的使用', '1591081955507.html', 2, 1, '888', 1, '2020-06-02 14:19:32', 0);
INSERT INTO `article` VALUES (44, 'AAA', NULL, NULL, 0, '<p>abd<br/></p>', 1, '2021-06-21 15:15:38', 0);
INSERT INTO `article` VALUES (45, 'ABC', NULL, NULL, 0, '<p>asmckejancfi<br/></p>', 1, '2021-06-21 15:17:46', 0);
INSERT INTO `article` VALUES (46, 'Abb', NULL, NULL, 0, '<p>accnkjac<br/></p>', 1, '2021-06-22 13:24:35', 0);
INSERT INTO `article` VALUES (47, 'buvgx', NULL, NULL, 1, '<p>bxhzj<br/></p>', 1, '2021-06-22 13:44:47', 0);

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `id` int NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES (1, '技术文章', 'technology');
INSERT INTO `article_type` VALUES (2, '行业新闻', 'industry');
INSERT INTO `article_type` VALUES (3, '学科咨询', 'subject');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_count` int NULL DEFAULT NULL,
  `detail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'Java 程序设计项目教程', 263, 'Java是一门面向对象编程语言。');
INSERT INTO `books` VALUES (2, 'Python 3.5 从零开始学', 518, 'Python提供了高效的高级数据结构，还能简单有效地面向对象编程');
INSERT INTO `books` VALUES (3, 'Android 项目驱动式开发教程', 657, 'Android是一种基于Linux内核的自由及开放源代码的操作系统');
INSERT INTO `books` VALUES (5, 'Java Web 动态网站开发', 461, 'Java Server Pages（Java服务器页面）');
INSERT INTO `books` VALUES (6, '网络组建于互联', 532, '本书主要是为了培养学生网络规划、组建、调试和改进能力');
INSERT INTO `books` VALUES (7, '网络综合布线实用技术', 378, '针对建筑物中所有的通信网络基础设施进行建设施工的一项技术');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int NOT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rprems` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 'admin:insert,admin:delete,admin:update,admin:select');
INSERT INTO `role` VALUES (2, '学生干部', 'cadre:insert,cadre:delete,cadre:update,cadre:select');
INSERT INTO `role` VALUES (3, '学生干事', 'officer:insert,officer:delete,officer:update,officer:select');
INSERT INTO `role` VALUES (4, '辅导员', 'instr:insert,instr:delete,instr:update,instr:select');
INSERT INTO `role` VALUES (5, '学生', 'stu:insert,stu:delete,stu:update,stu:select');

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
  `status` int NULL DEFAULT NULL,
  `createdtime` datetime NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 18, '男', '2001-10-27', 0, '2021-07-08 15:16:35', 1);
INSERT INTO `user` VALUES (2, 'cadre', 'cadre', 'zhansgan', 19, '女', '2002-05-20', 0, '2021-08-12 20:47:16', 2);
INSERT INTO `user` VALUES (3, 'root', 'root', 'root', 10, NULL, NULL, NULL, NULL, 3);
INSERT INTO `user` VALUES (4, 'user', 'user', 'user', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `user` VALUES (5, 'guest', 'guest', 'guest', NULL, NULL, NULL, NULL, NULL, 5);

SET FOREIGN_KEY_CHECKS = 1;
