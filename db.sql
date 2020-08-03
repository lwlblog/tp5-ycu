/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 03/08/2020 20:34:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_groups
-- ----------------------------
DROP TABLE IF EXISTS `admin_groups`;
CREATE TABLE `admin_groups`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `rights` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限，json',
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_groups
-- ----------------------------
INSERT INTO `admin_groups` VALUES (1, '系统管理员', '[1,4,5,6,2,8,9,10,11,12,3,13,14,27,28,36,37,38,29,33,30,31,32,41,42,43,44,39,40]');
INSERT INTO `admin_groups` VALUES (2, '教师', '[3,13,14,27,28,36,37,38,29,33,30,31,32,41,42,43,44,39,40]');
INSERT INTO `admin_groups` VALUES (5, '测试角色', '[1,4,5,6]');

-- ----------------------------
-- Table structure for admin_menus
-- ----------------------------
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus`  (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级菜单',
  `ord` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `controller` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名称',
  `method` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `ishidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏：0正常显示，1隐藏',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menus
-- ----------------------------
INSERT INTO `admin_menus` VALUES (1, 0, 0, '管理员管理', '', '', 'xe726', 0, 0);
INSERT INTO `admin_menus` VALUES (2, 0, 1, '权限管理', '', '', 'xe71c', 0, 0);
INSERT INTO `admin_menus` VALUES (3, 0, 2, '系统设置', '', '', 'xe6ae', 0, 0);
INSERT INTO `admin_menus` VALUES (4, 1, 0, '管理员列表', 'Admin', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (5, 1, 0, '管理员添加', 'Admin', 'add', '', 1, 0);
INSERT INTO `admin_menus` VALUES (6, 1, 0, '管理员保存', 'Admin', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (8, 2, 0, '菜单管理', 'Menu', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (9, 2, 0, '菜单添加', 'Menu', 'add', '', 1, 0);
INSERT INTO `admin_menus` VALUES (10, 2, 0, '菜单保存', 'Menu', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (11, 2, 0, '角色管理', 'Roles', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (12, 2, 0, '角色保存', 'Roles', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (13, 3, 0, '网站设置', 'Site', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (14, 3, 0, '保存设置', 'Site', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (27, 0, 3, '分类管理', '', '', 'xe6b4', 0, 0);
INSERT INTO `admin_menus` VALUES (36, 0, 5, '幻灯片管理', '', '', 'xe6a8', 0, 0);
INSERT INTO `admin_menus` VALUES (28, 27, 0, '分类管理', 'Category', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (33, 29, 3, '图片上传', 'Content', 'upload_img', '', 1, 0);
INSERT INTO `admin_menus` VALUES (29, 0, 4, '内容管理', '', '', 'xe6a2', 0, 0);
INSERT INTO `admin_menus` VALUES (30, 29, 0, '内容列表', 'Content', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (31, 29, 1, '内容添加', 'Content', 'add', '', 1, 0);
INSERT INTO `admin_menus` VALUES (32, 29, 2, '内容保存', 'Content', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (37, 36, 0, '首页首屏', 'Slide', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (38, 36, 1, '幻灯片保存', 'Slide', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (39, 0, 6, '其他页面', '', '', 'xe696', 0, 0);
INSERT INTO `admin_menus` VALUES (40, 39, 0, '图标', 'Other', 'icon', '', 0, 0);
INSERT INTO `admin_menus` VALUES (41, 29, 4, '课程简介', 'Desc', 'index', '', 0, 0);
INSERT INTO `admin_menus` VALUES (42, 29, 5, '简介添加', 'Desc', 'add', '', 1, 0);
INSERT INTO `admin_menus` VALUES (43, 29, 6, '简介保存', 'Desc', 'save', '', 1, 0);
INSERT INTO `admin_menus` VALUES (44, 29, 7, '文件列表', 'File', 'index', '', 0, 0);

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `truename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `gid` int(10) NOT NULL COMMENT '角色id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0正常，1禁用',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', '李文龙', 1, 0, 1515650649);
INSERT INTO `admins` VALUES (2, 'test', '47ec2dd791e31e2ef2076caf64ed9b3d', 'tests', 2, 0, 1515650649);
INSERT INTO `admins` VALUES (4, 'liwenlong', 'c1f189555f653bac78e12484681114b9', '李文龙', 2, 1, 1587357635);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '课程id',
  `ord` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `is_index` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页展示：0不展示，1展示',
  `is_nav` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否作为导航：0不作导航，1作为导航',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 0, 0, '软件工程', 0, 0, 0);
INSERT INTO `category` VALUES (2, 0, 1, '植物生物学', 0, 0, 0);
INSERT INTO `category` VALUES (3, 1, 0, '课程简介', 0, 1, 0);
INSERT INTO `category` VALUES (4, 1, 0, '教学文件', 0, 1, 0);
INSERT INTO `category` VALUES (5, 1, 0, '教学课件', 1, 1, 0);
INSERT INTO `category` VALUES (6, 1, 0, '课程团队', 0, 1, 0);
INSERT INTO `category` VALUES (7, 1, 0, '课程拓展', 0, 1, 0);
INSERT INTO `category` VALUES (8, 1, 0, '实践教学', 0, 1, 0);
INSERT INTO `category` VALUES (11, 1, 0, '章节练习', 1, 1, 0);
INSERT INTO `category` VALUES (13, 2, 0, '课程简介', 0, 1, 0);
INSERT INTO `category` VALUES (14, 4, 0, '教学进度', 0, 0, 0);
INSERT INTO `category` VALUES (17, 1, 0, '自测训练', 0, 1, 0);
INSERT INTO `category` VALUES (18, 1, 0, '重难点视频', 0, 0, 0);
INSERT INTO `category` VALUES (19, 4, 0, '教学大纲', 0, 0, 0);
INSERT INTO `category` VALUES (20, 4, 0, '考核方案', 0, 0, 0);
INSERT INTO `category` VALUES (23, 8, 0, '实验参考案例', 0, 0, 0);
INSERT INTO `category` VALUES (24, 8, 0, '实验内容', 0, 0, 0);
INSERT INTO `category` VALUES (25, 2, 0, '教学团队', 0, 1, 0);
INSERT INTO `category` VALUES (26, 2, 0, '教学资源', 0, 1, 0);
INSERT INTO `category` VALUES (27, 2, 0, '实践教学', 0, 1, 0);
INSERT INTO `category` VALUES (28, 1, 0, '教学大纲', 0, 0, 0);
INSERT INTO `category` VALUES (29, 2, 0, '植物地图', 0, 1, 0);
INSERT INTO `category` VALUES (30, 2, 0, '拓展资源', 0, 1, 0);
INSERT INTO `category` VALUES (31, 2, 0, '教研与教改', 0, 1, 0);
INSERT INTO `category` VALUES (32, 2, 0, '互动与交流', 0, 0, 0);
INSERT INTO `category` VALUES (33, 2, 0, '多媒体课件', 1, 1, 0);
INSERT INTO `category` VALUES (34, 2, 0, '野外实习指导', 1, 0, 0);
INSERT INTO `category` VALUES (35, 26, 0, '教学大纲', 0, 0, 0);
INSERT INTO `category` VALUES (36, 26, 0, '教学日历', 0, 0, 0);
INSERT INTO `category` VALUES (37, 26, 0, '课程教案', 0, 0, 0);
INSERT INTO `category` VALUES (38, 26, 0, '多媒体课件', 0, 0, 0);
INSERT INTO `category` VALUES (39, 27, 0, '野外实习指导', 0, 0, 0);
INSERT INTO `category` VALUES (40, 27, 0, '实习基地', 0, 0, 0);
INSERT INTO `category` VALUES (41, 30, 0, '专题讲座库', 0, 0, 0);
INSERT INTO `category` VALUES (42, 30, 0, '素材资源库', 0, 0, 0);
INSERT INTO `category` VALUES (43, 30, 0, '知识检索库', 0, 0, 0);
INSERT INTO `category` VALUES (45, 0, 2, '测试', 0, 0, 0);

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course_id` int(10) NOT NULL DEFAULT 0 COMMENT '课程id',
  `cat_id` int(10) NOT NULL DEFAULT 0 COMMENT '分类id',
  `sub_id` int(10) NOT NULL DEFAULT 0 COMMENT '细分id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情标题',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述，简介',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情url',
  `pv` int(10) NOT NULL DEFAULT 0 COMMENT '点击量',
  `status` tinyint(1) NOT NULL COMMENT '状态：0下线，1正常',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (10, 1, 4, 14, '管理信息系统.实验进度表', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002104513301.swf', 8, 1, 1585723603);
INSERT INTO `content` VALUES (11, 1, 4, 14, '管理信息系统.教学进度表', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002104623864.swf', 4, 1, 1585723678);
INSERT INTO `content` VALUES (72, 1, 4, 14, '1111', '', '', '', 'http://ycu.com', 0, 1, 1591860803);
INSERT INTO `content` VALUES (12, 1, 4, 19, '管理信息系统教学大纲', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002104741536.swf', 10, 1, 1585723727);
INSERT INTO `content` VALUES (13, 1, 4, 19, '管理信息系统实验大纲', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002104824442.swf', 32, 1, 1585723764);
INSERT INTO `content` VALUES (14, 1, 4, 20, '管理信息系统实验--考核方案', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002105004192.swf', 45, 1, 1585723832);
INSERT INTO `content` VALUES (15, 1, 4, 20, '管理信息系统--考核方案', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002104919692.swf', 5, 1, 1585723864);
INSERT INTO `content` VALUES (16, 1, 5, 0, '管理信息系统-第九章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002111117598.swf', 14, 1, 1585723954);
INSERT INTO `content` VALUES (17, 1, 5, 0, '管理信息系统-第一章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002110318989.swf', 22, 1, 1585723987);
INSERT INTO `content` VALUES (18, 1, 5, 0, '管理信息系统-第七章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002110959411.swf', 71, 1, 1585724016);
INSERT INTO `content` VALUES (19, 1, 5, 0, '管理信息系统-第六章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2018100211083636.swf', 13, 1, 1585724053);
INSERT INTO `content` VALUES (20, 1, 5, 0, '管理信息系统-第五章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002110648567.swf', 34, 1, 1585724090);
INSERT INTO `content` VALUES (21, 1, 5, 0, '管理信息系统-第三章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002110553129.swf', 1, 1, 1585724115);
INSERT INTO `content` VALUES (22, 1, 5, 0, '管理信息系统-第二章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002110442692.swf', 56, 1, 1585724143);
INSERT INTO `content` VALUES (23, 1, 5, 0, '管理信息系统-第八章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181002110136692.swf', 0, 1, 1585724166);
INSERT INTO `content` VALUES (24, 1, 3, 0, '课程简介', '', '', '', '/uploads/20200402/b72e6c3229822a4c4e16854934a067f2.html', 0, 1, 1585823602);
INSERT INTO `content` VALUES (25, 1, 11, 0, '第1章 信息系统和管理练习题', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027103752769.swf', 0, 1, 1585829079);
INSERT INTO `content` VALUES (26, 1, 11, 0, '第2章 管理信息系统概论', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027103831379.swf', 0, 1, 1585829123);
INSERT INTO `content` VALUES (27, 1, 11, 0, '第3章 管理信息系统的技术基础', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027103901676.swf', 1, 1, 1585829151);
INSERT INTO `content` VALUES (28, 1, 11, 0, '第5章 管理信息系统的战略规划和开发方法', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027104022863.swf', 1, 1, 1585829176);
INSERT INTO `content` VALUES (29, 1, 11, 0, '第6章 管理信息系统的系统分析练习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027104055394.swf', 0, 1, 1585829208);
INSERT INTO `content` VALUES (30, 1, 11, 0, '第7章 管理信息系统的系统设计练习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027104131754.swf', 0, 1, 1585829233);
INSERT INTO `content` VALUES (31, 1, 11, 0, '第8章 管理信息系统的系统实施练习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027104203879.swf', 0, 1, 1585829267);
INSERT INTO `content` VALUES (32, 1, 11, 0, '第9章 面向对象的系统开发方法练习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171027104253410.swf', 0, 1, 1585829336);
INSERT INTO `content` VALUES (33, 1, 8, 24, '实验四', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171028034722815.swf', 0, 1, 1585877005);
INSERT INTO `content` VALUES (34, 1, 8, 24, '实验三', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171028034659310.swf', 0, 1, 1585877053);
INSERT INTO `content` VALUES (35, 1, 8, 24, '实验二', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171028034629674.swf', 0, 1, 1585877079);
INSERT INTO `content` VALUES (36, 1, 8, 24, '实验一', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171028034555659.swf', 0, 1, 1585877109);
INSERT INTO `content` VALUES (37, 1, 8, 23, 'xxxx公司人事管理信息系统分析说明书分析', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2017102704085098.swf', 38, 1, 1585877228);
INSERT INTO `content` VALUES (38, 1, 8, 23, '教学管理系统分析说明书', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171026030534176.swf', 0, 1, 1585877259);
INSERT INTO `content` VALUES (39, 1, 8, 23, '小型超市管理系统分析', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20171026030443832.swf', 0, 1, 1585877284);
INSERT INTO `content` VALUES (43, 1, 6, 0, '卢照', '', '卢照', '', '/uploads/20200403/32e39fe72d9972cfc5d78c111adeb556.html', 8, 1, 1585902029);
INSERT INTO `content` VALUES (42, 1, 6, 0, '李奋华', '', '李奋华', '', '/uploads/20200406/d45d43aae82055b38698b55536daf319.html', 16, 1, 1585901999);
INSERT INTO `content` VALUES (44, 2, 26, 35, '理论教学大纲', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181012062324937.swf', 1, 1, 1586090719);
INSERT INTO `content` VALUES (45, 2, 26, 35, '实验教学大纲', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181012063221765.swf', 0, 1, 1586090749);
INSERT INTO `content` VALUES (46, 2, 26, 35, '实习教学大纲', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141125031447913.swf', 0, 1, 1586090774);
INSERT INTO `content` VALUES (47, 2, 26, 36, '实验课进度表', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20181012065107203.swf', 0, 1, 1586090815);
INSERT INTO `content` VALUES (48, 2, 26, 36, '理论课教学进度表', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2018101206531231.swf', 1, 1, 1586090854);
INSERT INTO `content` VALUES (49, 2, 26, 37, '第十章 裸子植物', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141125033931225.swf', 0, 1, 1586090902);
INSERT INTO `content` VALUES (50, 2, 26, 37, '第十三章 粘菌真菌和地衣', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141125033733585.swf', 2, 1, 1586090931);
INSERT INTO `content` VALUES (51, 2, 26, 37, '第十二章 植物的进化与系统演化', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141125033645991.swf', 0, 1, 1586090954);
INSERT INTO `content` VALUES (52, 2, 26, 38, '第二章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141204015702458.swf', 0, 1, 1586090986);
INSERT INTO `content` VALUES (53, 2, 26, 38, '第一章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2014112507323485.swf', 0, 1, 1586091043);
INSERT INTO `content` VALUES (54, 2, 33, 0, '第二章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141204015702458.swf', 2, 1, 1586091172);
INSERT INTO `content` VALUES (55, 2, 33, 0, '第一章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2014112507323485.swf', 1, 1, 1586091200);
INSERT INTO `content` VALUES (56, 2, 33, 0, '绪论', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141204015303740.swf', 0, 1, 1586091244);
INSERT INTO `content` VALUES (57, 2, 33, 0, '第四章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126082332647.swf', 1, 1, 1586091286);
INSERT INTO `content` VALUES (58, 2, 33, 0, '第五章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126082418772.swf', 1, 1, 1586091312);
INSERT INTO `content` VALUES (59, 2, 33, 0, '第六章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2014112608251469.swf', 0, 1, 1586091337);
INSERT INTO `content` VALUES (60, 2, 33, 0, '第七章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126082601210.swf', 0, 1, 1586091367);
INSERT INTO `content` VALUES (61, 2, 34, 0, '前言', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141204094849833.swf', 0, 1, 1586091495);
INSERT INTO `content` VALUES (62, 2, 34, 0, '第六部分 中条山维管植物名录', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126092405178.swf', 2, 1, 1586091520);
INSERT INTO `content` VALUES (63, 2, 34, 0, '第五部分 青岛海滨常见海藻名录', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2014120409565405.swf', 10, 1, 1586091568);
INSERT INTO `content` VALUES (64, 2, 34, 0, '第四部分 植物生态学实习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126092140975.swf', 3, 1, 1586091623);
INSERT INTO `content` VALUES (65, 2, 34, 0, '第三部分 种子植物实习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/2014112609200169.swf', 7, 1, 1586091664);
INSERT INTO `content` VALUES (66, 2, 34, 0, '第二部分 孢子植物实习', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126091859913.swf', 0, 1, 1586091692);
INSERT INTO `content` VALUES (67, 2, 34, 0, '第一部分 实习地区的基本概况', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141204095155724.swf', 0, 1, 1586091736);
INSERT INTO `content` VALUES (68, 2, 34, 0, '目 录', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141204095042115.swf', 0, 1, 1586091765);
INSERT INTO `content` VALUES (69, 2, 33, 0, '第十一章', '', '未知', '', 'http://jpkc.ycu.edu.cn/upload/20141126090109585.swf', 1, 1, 1586091864);

-- ----------------------------
-- Table structure for desc
-- ----------------------------
DROP TABLE IF EXISTS `desc`;
CREATE TABLE `desc`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `c_id` int(10) NOT NULL DEFAULT 1 COMMENT '课程id',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程简介',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转链接',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of desc
-- ----------------------------
INSERT INTO `desc` VALUES (1, 1, '《软件工程》是信息管理与信息系统专业本科生的一门重要专业必修课程，它以计算机为主要支撑技术，以管理信息及业务的科学化、系统化、现代化为目标，集管理科学、信息科学、计算机科学、行为科学、系统工程学等多学科为一体的新型边缘学科体系。主要内容包括管理信息系统的概念、结构和建立管理信息系统的基础，管理信息系统开发方法学、管理信息系统开发过程各阶段的任务与技术、管理信息系统的开发环境与工具等。通过本课程的学习，旨在指导学生运用管理、信息、系统、计算机等学科的理论和概念，掌握信息系统分析与设计的方法及计算机信息处理技术，对企事业等社会组织中的业务管理和决策信息进行收集、存储、组织、检索、分析、设计、处理和应用，培养学生应用信息技术进行管理信息处理和管理信息系统开发及组织实施的能力，侧重对信息系统开发方法和技术的学习，是一门实用性、技术性较强的课。', 'http://jpkc.ycu.edu.cn/glxxxt/style/book.jpg', '/index/index/detail?gid=3', 1585723603);
INSERT INTO `desc` VALUES (12, 2, '《植物生物学》的前身是《植物学》。《植物学》是在1984年伴随着运城学院的前身运城师专创建和生化系的建立而开设立的生物科学专业的课程之一，是生化教育和化生教育专业的基础课程。自2000年运城学院成立后，植物学则是生命科学系生物教育本科专业的主要专业基础课程。 从1984年原运城师专建系以来，在老一辈教学名师滕崇德教授带领的植物学课程组全体教师的辛勤耕耘下，先后建立了植物学实验室、标本室，编著了多部实验、实习讲义，制作教学模型，绘制教学挂图，为本课程的建设奠定了基础。1987年滕崇德教授带领青年教师参加了《山西树木志》的编写工作，1988年参加了山西省植被研究的课题。1990年滕崇德教授主编全国高等师范专科学校《植物学》教材，培养了植物学方面的优秀教师。', 'http://jpkc.ycu.edu.cn/zwswx/style/kctp.jpg', '/', 1585894302);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, 'html', '/uploads/20200403/eabddbaf60fcb9b21cdfe8b350e7e1c3.html', 1585901999);
INSERT INTO `file` VALUES (2, 'html', '/uploads/20200403/32e39fe72d9972cfc5d78c111adeb556.html', 1585902029);
INSERT INTO `file` VALUES (3, 'html', '/uploads/20200402/b72e6c3229822a4c4e16854934a067f2.html', 1585823602);
INSERT INTO `file` VALUES (6, 'html', '/uploads/20200406/d45d43aae82055b38698b55536daf319.html', 1586154517);
INSERT INTO `file` VALUES (7, 'png', '/uploads/20200420/427b298457ce51594d78acd78cf6e1ed.png', 1587370584);

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites`  (
  `names` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `values` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES ('site', '\"ycu\\u8bfe\\u7a0b\"');

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `c_id` int(10) NOT NULL COMMENT '课程id',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '类型：0首页首屏',
  `ord` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES (14, 1, 0, 0, 'banner1', 'http://jpkc.ycu.edu.cn', 'http://jpkc.ycu.edu.cn/glxxxt/style/banner_1.jpg');
INSERT INTO `slide` VALUES (15, 1, 0, 0, 'banner2', 'http://jpkc.ycu.edu.cn', 'http://jpkc.ycu.edu.cn/glxxxt/style/banner_1.jpg');
INSERT INTO `slide` VALUES (16, 1, 1, 0, '教学大纲', '/index/index/detail?c_id=1&gid=28', 'http://jpkc.ycu.edu.cn/glxxxt/style/jxMore.jpg');
INSERT INTO `slide` VALUES (17, 1, 1, 0, '重难点视频', '/index/index/detail?c_id=1&gid=18', 'http://jpkc.ycu.edu.cn/glxxxt/style/spMore.jpg');
INSERT INTO `slide` VALUES (18, 1, 1, 0, '课程拓展', '/index/index/detail?c_id=1&gid=7', 'http://jpkc.ycu.edu.cn/glxxxt/style/kcMore.jpg');
INSERT INTO `slide` VALUES (19, 1, 1, 0, '实践教学', '/index/index/detail?c_id=1&gid=8', 'http://jpkc.ycu.edu.cn/glxxxt/style/sjMore.jpg');
INSERT INTO `slide` VALUES (20, 1, 2, 0, 'banner3', '/', 'http://jpkc.ycu.edu.cn/glxxxt/style/main.jpg');
INSERT INTO `slide` VALUES (21, 1, 3, 0, '李奋华', '/index/index/detail?c_id=1&gid=6&n=42', 'http://jpkc.ycu.edu.cn/upload/20181004125407952.jpg');
INSERT INTO `slide` VALUES (22, 1, 3, 0, '卢照', '/index/index/detail?c_id=1&gid=6&n=43', 'http://jpkc.ycu.edu.cn/upload/20181003102958498.jpg');
INSERT INTO `slide` VALUES (23, 1, 3, 0, '黄潇', '/', 'http://jpkc.ycu.edu.cn/upload/20171027163301968.jpg');
INSERT INTO `slide` VALUES (24, 1, 3, 0, '贺玉珍', '/', 'http://jpkc.ycu.edu.cn/upload/20171027164148479.jpg');
INSERT INTO `slide` VALUES (25, 2, 0, 0, 'banner1', '/', 'http://jpkc.ycu.edu.cn/zwswx/style/banner1.jpg');
INSERT INTO `slide` VALUES (26, 2, 1, 0, '教学大纲', '/', 'http://jpkc.ycu.edu.cn/glxxxt/style/jxMore.jpg');
INSERT INTO `slide` VALUES (27, 2, 1, 0, '重难点视频', '/', 'http://jpkc.ycu.edu.cn/glxxxt/style/spMore.jpg');
INSERT INTO `slide` VALUES (28, 2, 1, 0, '课程拓展', '/', 'http://jpkc.ycu.edu.cn/glxxxt/style/kcMore.jpg');
INSERT INTO `slide` VALUES (29, 2, 1, 0, '实践教学', '/', 'http://jpkc.ycu.edu.cn/glxxxt/style/sjMore.jpg');
INSERT INTO `slide` VALUES (30, 2, 2, 0, '蕨的生活史', '/', 'http://jpkc.ycu.edu.cn/upload/2014112306140469.JPG');
INSERT INTO `slide` VALUES (31, 2, 2, 0, '植物化石标本', '/', 'http://jpkc.ycu.edu.cn/upload/20141123063221616.JPG');
INSERT INTO `slide` VALUES (32, 2, 3, 0, '课程负责人——滕红梅', '/', 'http://jpkc.ycu.edu.cn/upload/20141204101906271.jpg');
INSERT INTO `slide` VALUES (33, 2, 3, 0, '主讲教师-李宝平', '/', 'http://jpkc.ycu.edu.cn/upload/20141125110045335.jpg');
INSERT INTO `slide` VALUES (34, 2, 3, 0, '主讲教师-周玉亭', '/', 'http://jpkc.ycu.edu.cn/upload/20141126102536585.jpg');
INSERT INTO `slide` VALUES (35, 2, 3, 0, '主讲教师兼实践教师-崔东亚', '/', 'http://jpkc.ycu.edu.cn/upload/20181012034432140.jpg');

SET FOREIGN_KEY_CHECKS = 1;
