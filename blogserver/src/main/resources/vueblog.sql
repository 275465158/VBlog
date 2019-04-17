/*
 Navicat Premium Data Transfer

 Source Server         : blog
 Source Server Type    : MySQL
 Source Server Version : 50027
 Source Host           : localhost:3306
 Source Schema         : vueblog2

 Target Server Type    : MySQL
 Target Server Version : 50027
 File Encoding         : 65001

 Date: 17/04/2019 15:39:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mdContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'md文件源码',
  `htmlContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'html源码',
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `publishDate` datetime NULL DEFAULT NULL,
  `editTime` datetime NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL COMMENT '0表示草稿箱，1表示已发表，2表示已删除',
  `pageView` int(11) NULL DEFAULT 0,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `cid` USING BTREE(`cid`),
  INDEX `uid` USING BTREE(`uid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`cid`) REFER `vueblog2/category`(`id`); (`uid`) REFER `v' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'vue真坑啊', 'vue真坑啊', '<p>vue真坑啊</p>\n', 'vue真坑啊\n', 56, 7, '2019-04-17 11:51:01', '2019-04-17 11:51:01', 1, 0);
INSERT INTO `article` VALUES (2, '真坑', '前后端分离真坑', '<p>前后端分离真坑</p>\n', '前后端分离真坑\n', 56, 7, '2019-04-17 11:52:10', '2019-04-17 11:52:10', 1, 0);
INSERT INTO `article` VALUES (3, '搭建springboot记录', '一、搭建基本框架\n1.先搭建基本的框架  demo\n2.创建bean类，创建表\n3.整合mybatis\n{\n- 配置数据源信息（就是填写数据库的配置				信息  springboot）\n- 使用注解版mybatis\n    1.使用@ScanMapper\n    2.创建Mapper   Mapper需要加入@Mapper的注解\n}', '<p>一、搭建基本框架<br />\n1.先搭建基本的框架  demo<br />\n2.创建bean类，创建表<br />\n3.整合mybatis<br />\n{</p>\n<ul>\n<li>配置数据源信息（就是填写数据库的配置				信息  springboot）</li>\n<li>使用注解版mybatis<br />\n1.使用@ScanMapper<br />\n2.创建Mapper   Mapper需要加入@Mapper的注解<br />\n}</li>\n</ul>\n', '一、搭建基本框架\n1.先搭建基本的框架  demo\n2.创建bean类，创建表\n3.整合mybati', 66, 22, '2019-04-17 15:14:12', '2019-04-17 15:14:12', 1, 1);
INSERT INTO `article` VALUES (4, '前端vue搭建记录', '1. 新建一个基本的Vuedemo\n2. 整合axios，解决跨域问题。\n3. 编写登录模块，解决不同用户状态下的访问权限问题\n4. 填充各种细节内容', '<ol>\n<li>新建一个基本的Vuedemo</li>\n<li>整合axios，解决跨域问题。</li>\n<li>编写登录模块，解决不同用户状态下的访问权限问题</li>\n<li>填充各种细节内容</li>\n</ol>\n', '\n新建一个基本的Vuedemo\n整合axios，解决跨域问题。\n编写登录模块，解决不同用户状态下的访', 66, 22, '2019-04-17 15:13:56', '2019-04-17 15:13:56', 1, 1);

-- ----------------------------
-- Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NULL DEFAULT NULL,
  `tid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `tid` USING BTREE(`tid`),
  INDEX `article_tags_ibfk_1` USING BTREE(`aid`),
  CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`aid`) REFER `vueblog2/article`(`id`) ON DELETE CASCADE;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_tags
-- ----------------------------
INSERT INTO `article_tags` VALUES (1, 4, 67);
INSERT INTO `article_tags` VALUES (2, 3, 68);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (56, 'Vue22', '2017-12-21');
INSERT INTO `category` VALUES (58, '人生感悟', '2017-12-21');
INSERT INTO `category` VALUES (60, 'JavaEE', '2017-12-21');
INSERT INTO `category` VALUES (61, 'Git', '2017-12-21');
INSERT INTO `category` VALUES (62, 'Linux', '2017-12-21');
INSERT INTO `category` VALUES (66, '小帅专栏', '2019-04-17');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `publishDate` datetime NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL COMMENT '-1表示正常回复，其他值表示是评论的回复',
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `aid` USING BTREE(`aid`),
  INDEX `uid` USING BTREE(`uid`),
  INDEX `parentId` USING BTREE(`parentId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`aid`) REFER `vueblog2/article`(`id`); (`uid`) REFER `vu' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pv
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countDate` date NULL DEFAULT NULL,
  `pv` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `pv_ibfk_1` USING BTREE(`uid`),
  CONSTRAINT `pv_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`uid`) REFER `vueblog2/user`(`id`) ON DELETE CASCADE' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pv
-- ----------------------------
INSERT INTO `pv` VALUES (1, '2019-04-10', 20, 6);
INSERT INTO `pv` VALUES (2, '2019-04-10', 14, 7);
INSERT INTO `pv` VALUES (4, '2019-04-10', 40, 6);
INSERT INTO `pv` VALUES (5, '2019-04-10', 23, 7);
INSERT INTO `pv` VALUES (6, '2019-04-10', 11, 6);
INSERT INTO `pv` VALUES (7, '2019-04-10', 32, 7);
INSERT INTO `pv` VALUES (26, '2019-04-10', 2, 6);
INSERT INTO `pv` VALUES (27, '2019-04-10', 77, 7);
INSERT INTO `pv` VALUES (28, '2019-04-10', 1055, 6);
INSERT INTO `pv` VALUES (29, '2019-04-10', -86, 7);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员');
INSERT INTO `roles` VALUES (2, '普通用户');
INSERT INTO `roles` VALUES (3, '测试角色1');
INSERT INTO `roles` VALUES (4, '测试角色2');
INSERT INTO `roles` VALUES (5, '测试角色3');

-- ----------------------------
-- Table structure for roles_user
-- ----------------------------
DROP TABLE IF EXISTS `roles_user`;
CREATE TABLE `roles_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NULL DEFAULT 2,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `rid` USING BTREE(`rid`),
  INDEX `roles_user_ibfk_2` USING BTREE(`uid`),
  CONSTRAINT `roles_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roles_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`rid`) REFER `vueblog2/roles`(`id`); (`uid`) REFER `vueb' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles_user
-- ----------------------------
INSERT INTO `roles_user` VALUES (8, 2, 7);
INSERT INTO `roles_user` VALUES (9, 1, 7);
INSERT INTO `roles_user` VALUES (17, 5, 7);
INSERT INTO `roles_user` VALUES (121, 2, 6);
INSERT INTO `roles_user` VALUES (130, 1, 6);
INSERT INTO `roles_user` VALUES (132, 2, 23);
INSERT INTO `roles_user` VALUES (133, 2, 24);
INSERT INTO `roles_user` VALUES (134, 2, 22);
INSERT INTO `roles_user` VALUES (135, 1, 22);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `tagName` USING BTREE(`tagName`)
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (66, '666');
INSERT INTO `tags` VALUES (35, 'Ajax');
INSERT INTO `tags` VALUES (36, 'Dubbo');
INSERT INTO `tags` VALUES (40, 'git');
INSERT INTO `tags` VALUES (33, 'Linux');
INSERT INTO `tags` VALUES (45, 'mongodb');
INSERT INTO `tags` VALUES (42, 'spring');
INSERT INTO `tags` VALUES (44, 'SpringSecurity');
INSERT INTO `tags` VALUES (37, 'websocket');
INSERT INTO `tags` VALUES (34, 'Zookeeper');
INSERT INTO `tags` VALUES (67, '前端');
INSERT INTO `tags` VALUES (68, '后台内容');
INSERT INTO `tags` VALUES (50, '图片上传');
INSERT INTO `tags` VALUES (51, '图片预览');
INSERT INTO `tags` VALUES (41, '学习资料');
INSERT INTO `tags` VALUES (65, '杂谈');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (6, 'linghu', '令狐葱', '202cb962ac59075b964b07152d234b70', 1, 'linghu@qq.com', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920326&di=44a6fa6b597d86f475c2b15fa93008dd&imgtype=0&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2015-01-12%2F023019564.jpg', '2017-12-08 09:30:22');
INSERT INTO `user` VALUES (7, 'sang', '江南一点雨', '202cb962ac59075b964b07152d234b70', 1, 'sang123@qq.com', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', '2017-12-21 13:30:29');
INSERT INTO `user` VALUES (22, 'iauhsoaix', '酒醉太平', '202cb962ac59075b964b07152d234b70', 1, '853574130@qq.com', 'http://photocdn.sohu.com/20120314/Img337695482.jpg', '2019-03-10 16:45:01');
INSERT INTO `user` VALUES (23, 'xiaoshuai', '小帅', '202cb962ac59075b964b07152d234b70', 1, NULL, 'http://img3.bitautoimg.com/autoalbum/files/20170706/118/16291411834240_5538270_16.jpg', NULL);
INSERT INTO `user` VALUES (24, 'test', NULL, '202cb962ac59075b964b07152d234b70', 1, NULL, NULL, NULL);

-- ----------------------------
-- View structure for pvview
-- ----------------------------
DROP VIEW IF EXISTS `pvview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `pvview` AS select sum(pv) as pv,uid from pv group by uid ;

-- ----------------------------
-- View structure for totalpvview
-- ----------------------------
DROP VIEW IF EXISTS `totalpvview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `totalpvview` AS select sum(pageView) as totalPv,uid from article a group by uid ;

SET FOREIGN_KEY_CHECKS = 1;
