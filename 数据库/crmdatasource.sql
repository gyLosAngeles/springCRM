/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : crmdatasource

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 15/05/2019 16:28:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for askers
-- ----------------------------
DROP TABLE IF EXISTS `askers`;
CREATE TABLE `askers`  (
  `askerId` int(11) NOT NULL AUTO_INCREMENT,
  `askerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CheckState` int(11) NULL DEFAULT NULL,
  `CheckInTime` datetime(0) NULL DEFAULT NULL,
  `ChangeState` int(11) NULL DEFAULT NULL,
  `Weight` double NULL DEFAULT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BakContent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`askerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of askers
-- ----------------------------
INSERT INTO `askers` VALUES (1, '1', 1, '2019-05-08 22:05:12', 1, 1, '1', '1');
INSERT INTO `askers` VALUES (2, '1', 1, '2019-05-08 10:36:11', 1, 1, '1', '1');

-- ----------------------------
-- Table structure for moduletab
-- ----------------------------
DROP TABLE IF EXISTS `moduletab`;
CREATE TABLE `moduletab`  (
  `moduleId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NULL DEFAULT NULL,
  `moduleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moduleWeight` double NULL DEFAULT NULL,
  `moduleUrl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moduleCreateTime` datetime(0) NULL DEFAULT NULL,
  `roleModuleLastUpdateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`moduleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moduletab
-- ----------------------------
INSERT INTO `moduletab` VALUES (1, 0, '系统管理', 100, '', '2019-05-10 11:48:55', '2019-05-11 11:48:58');
INSERT INTO `moduletab` VALUES (2, 1, '用户管理', 99, 'conservator/user', '2019-05-10 11:49:36', '2019-05-10 11:49:39');
INSERT INTO `moduletab` VALUES (3, 1, '角色管理', 98, 'conservator/role', '2019-05-10 11:50:30', '2019-05-10 11:50:33');
INSERT INTO `moduletab` VALUES (4, 1, '模块管理', 97, 'conservator/module', '2019-05-10 11:52:05', '2019-05-10 11:52:08');
INSERT INTO `moduletab` VALUES (5, 0, '学生管理', 100, '', '2019-05-10 11:53:15', '2019-05-10 11:53:17');
INSERT INTO `moduletab` VALUES (6, 5, '网络跟踪', 95, 'conservator/sd', '2019-05-10 11:54:10', '2019-05-10 11:54:13');
INSERT INTO `moduletab` VALUES (7, 5, '我的学生', 94, 'CustomerStudents', '2019-05-10 11:54:48', '2019-05-10 11:54:50');
INSERT INTO `moduletab` VALUES (8, 9, '分量设置', 70, 'conservator/fsg', '2019-05-10 12:27:21', '2019-05-10 12:27:24');
INSERT INTO `moduletab` VALUES (9, 0, '员工管理', 100, ' ', '2019-05-14 12:22:33', '2019-05-14 12:22:36');
INSERT INTO `moduletab` VALUES (10, 9, '员工签到', 70, 'director/employee', '2019-05-14 12:23:34', '2019-05-14 12:23:37');
INSERT INTO `moduletab` VALUES (11, 5, '网络学生', 50, 'wl/wlStudentswangluo', NULL, NULL);

-- ----------------------------
-- Table structure for netfollows
-- ----------------------------
DROP TABLE IF EXISTS `netfollows`;
CREATE TABLE `netfollows`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` int(11) NULL DEFAULT NULL,
  `StudentName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FollowTime` datetime(0) NULL DEFAULT NULL,
  `NextFollowTime` datetime(0) NULL DEFAULT NULL,
  `Content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserId` int(11) NULL DEFAULT NULL,
  `FollowType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateTime` datetime(0) NULL DEFAULT NULL,
  `FollowState` int(11) NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of netfollows
-- ----------------------------
INSERT INTO `netfollows` VALUES (1, 1, '1', '2019-05-14 10:27:11', '2019-05-14 10:27:11', '1', 1, '1', '2019-05-14 10:27:11', 1, '');
INSERT INTO `netfollows` VALUES (2, 1, '1', '2019-05-14 10:27:55', '2019-05-14 10:27:55', '1', 1, '1', '2019-05-14 10:27:55', 1, '');
INSERT INTO `netfollows` VALUES (7, 1, '1', '2019-05-08 00:00:00', '2019-05-29 00:00:00', '成功', 1, '微信', '2019-05-15 00:00:00', 1, '成功');
INSERT INTO `netfollows` VALUES (8, 1, '2', '2019-05-09 00:00:00', '2019-05-23 00:00:00', '狗儿子', 1, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (9, 1, '2', '2019-05-08 00:00:00', '2019-05-23 00:00:00', '1', 1, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (10, 1, '2', '2019-05-07 00:00:00', '2019-05-16 00:00:00', '1', 1, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (11, 2, '2', '2019-05-15 00:00:00', '2019-05-02 00:00:00', '1', 2, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (12, 2, '2', '2019-03-07 00:00:00', '2019-05-09 00:00:00', '1', 2, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (13, 2, '2', '2019-03-07 00:00:00', '2019-05-09 00:00:00', '1', 2, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (14, 2, '2', '2019-05-08 00:00:00', '2019-05-16 00:00:00', '1', 2, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (15, 2, '2', '2019-05-15 00:00:00', '2019-05-09 00:00:00', '1', 2, '1', '2019-05-15 00:00:00', 1, '1');
INSERT INTO `netfollows` VALUES (16, 2, '2', '2011-03-08 00:00:00', '2019-05-17 00:00:00', '1', 2, '1', '2019-05-15 00:00:00', 1, '1');

-- ----------------------------
-- Table structure for permissiontab
-- ----------------------------
DROP TABLE IF EXISTS `permissiontab`;
CREATE TABLE `permissiontab`  (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permissionModule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permissionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permissionLastUpdateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`permissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rolemoduletab
-- ----------------------------
DROP TABLE IF EXISTS `rolemoduletab`;
CREATE TABLE `rolemoduletab`  (
  `roleModuleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NULL DEFAULT NULL,
  `moduleId` int(11) NULL DEFAULT NULL,
  `roleModuleLastUpdateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`roleModuleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemoduletab
-- ----------------------------
INSERT INTO `rolemoduletab` VALUES (1, 1, 1, '2019-05-10 12:32:44');
INSERT INTO `rolemoduletab` VALUES (2, 1, 2, '2019-05-10 12:33:05');
INSERT INTO `rolemoduletab` VALUES (3, 1, 3, '2019-05-10 12:33:17');
INSERT INTO `rolemoduletab` VALUES (4, 1, 4, '2019-05-10 12:34:18');
INSERT INTO `rolemoduletab` VALUES (5, 1, 5, '2019-05-10 15:09:05');
INSERT INTO `rolemoduletab` VALUES (6, 1, 6, '2019-05-10 15:09:08');
INSERT INTO `rolemoduletab` VALUES (7, 1, 7, '2019-05-10 15:09:12');
INSERT INTO `rolemoduletab` VALUES (8, 1, 8, '2019-05-10 15:09:16');
INSERT INTO `rolemoduletab` VALUES (9, 5, 5, NULL);
INSERT INTO `rolemoduletab` VALUES (11, 5, 6, NULL);
INSERT INTO `rolemoduletab` VALUES (13, 2, 5, NULL);
INSERT INTO `rolemoduletab` VALUES (14, 2, 6, NULL);
INSERT INTO `rolemoduletab` VALUES (17, 2, 9, NULL);
INSERT INTO `rolemoduletab` VALUES (18, 2, 10, NULL);
INSERT INTO `rolemoduletab` VALUES (19, 3, 5, NULL);
INSERT INTO `rolemoduletab` VALUES (20, 3, 7, NULL);
INSERT INTO `rolemoduletab` VALUES (21, 4, 5, NULL);
INSERT INTO `rolemoduletab` VALUES (22, 4, 7, NULL);
INSERT INTO `rolemoduletab` VALUES (23, 5, 7, NULL);
INSERT INTO `rolemoduletab` VALUES (24, 3, 9, NULL);
INSERT INTO `rolemoduletab` VALUES (25, 3, 8, NULL);
INSERT INTO `rolemoduletab` VALUES (26, 1, 9, NULL);
INSERT INTO `rolemoduletab` VALUES (27, 1, 10, NULL);
INSERT INTO `rolemoduletab` VALUES (28, 1, 11, NULL);

-- ----------------------------
-- Table structure for rolepermissiontab
-- ----------------------------
DROP TABLE IF EXISTS `rolepermissiontab`;
CREATE TABLE `rolepermissiontab`  (
  `rolePermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NULL DEFAULT NULL,
  `permissionId` int(11) NULL DEFAULT NULL,
  `rolePermissionLastUpdateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`rolePermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roletab
-- ----------------------------
DROP TABLE IF EXISTS `roletab`;
CREATE TABLE `roletab`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleExplain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleCreateTime` datetime(0) NULL DEFAULT NULL,
  `roleLastUpdateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roletab
-- ----------------------------
INSERT INTO `roletab` VALUES (1, '管理员', '管理所有的模块', '2019-05-10 11:38:21', '2019-05-10 11:38:24');
INSERT INTO `roletab` VALUES (2, '咨询经理', '管理网络咨询师和咨询师经理', '2019-05-10 11:42:33', '2019-05-10 11:42:35');
INSERT INTO `roletab` VALUES (3, '网络咨询师', '招生', '2019-05-10 11:42:57', '2019-05-10 11:43:00');
INSERT INTO `roletab` VALUES (4, '咨询师', '跟踪', '2019-05-10 11:43:21', '2019-05-10 11:43:23');
INSERT INTO `roletab` VALUES (5, 'aa', NULL, '2019-05-12 00:08:38', NULL);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Age` int(11) NULL DEFAULT NULL,
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StuStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PerState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MsgSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SourceUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SourceKeyWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NetPusherId` int(11) NULL DEFAULT NULL,
  `AskerId` int(11) NULL DEFAULT NULL,
  `QQ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WeiXin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateTime` datetime(0) NULL DEFAULT NULL,
  `LearnForward` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsValid` int(11) NULL DEFAULT NULL,
  `Record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsReturnVist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FirstVisitTime` datetime(0) NULL DEFAULT NULL,
  `IsHome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HomeTime` datetime(0) NULL DEFAULT NULL,
  `LostValid` int(11) NULL DEFAULT NULL,
  `IsPay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayTime` datetime(0) NULL DEFAULT NULL,
  `Money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsReturnMoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsInClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `InClassTime` datetime(0) NULL DEFAULT NULL,
  `InClassContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AskerContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsDel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FromPart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StuConcern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsBaoBei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ZiXunName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReturnMoneyReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PreMoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PreMoneyTime` datetime(0) NULL DEFAULT NULL,
  `Scoring` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打分',
  `Education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `Location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在区域',
  `Onlineremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在线备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 'zhang', 20, '男', '13103807321', '在线', '关注', '学校', 'www.baidu.com', '上网', '河南省', 1, 1, '1725059364', '13103807320', '哈哈哈', '2019-05-01 15:22:49', '计算机', 1, '有', '是', '2019-05-01 00:00:00', '是', '2019-05-03 00:00:00', 1, '是', '2019-05-01 00:00:00', '300', '否', '是', '2019-09-03 00:00:00', '张三', '001', '否', '是', '是', '是', '三三', '01', '不上了', '500', '2019-05-03 00:00:00', '52', '大学', '河南', '三');
INSERT INTO `students` VALUES (2, '李四', 20, '男', '13569892234', '在线', '关注', '学校', 'www.baidu.com', '上网', '山西省', 1, 0, '17458950043', '13569892234', '呵呵呵', '2019-05-16 15:25:24', '网络开发', 1, '有', '是', '2019-05-23 15:25:52', '是', '2019-05-24 15:26:01', 1, '是', '2019-05-25 15:26:14', '300', '否', '是', '2019-05-27 15:26:31', '李四', '002', '否', '是', '是', '是', '四四', '02', '生病', '500', '2019-05-28 15:27:15', '25', '高中', '上海', '四');
INSERT INTO `students` VALUES (3, '张雅', 21, '女', '13003040252', '在线', '关注', '学校', 'www.baidu.com', '上网', '河南省', 1, 0, '17258099390', '16222578943', '嘿嘿嘿', '2019-05-13 15:29:19', '物联网', 1, '有', '否', '2019-05-14 15:29:46', '否', '2019-05-15 15:29:55', 1, '否', '2019-05-16 15:30:06', '300', '否', '否', '2019-05-17 15:30:26', '张雅', '003', '是', '否', '否', '否', '五五', '03', '毕业', '500', '2019-05-17 15:31:03', '58', '专科', '北京', '五');
INSERT INTO `students` VALUES (4, '1', 1, '1', '154585284', '1', NULL, NULL, '1', '254', NULL, NULL, NULL, '215', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1');

-- ----------------------------
-- Table structure for userchecks
-- ----------------------------
DROP TABLE IF EXISTS `userchecks`;
CREATE TABLE `userchecks`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NULL DEFAULT NULL,
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CheckInTime` datetime(0) NULL DEFAULT NULL,
  `CheckState` int(11) NULL DEFAULT NULL,
  `IsCancel` int(11) NULL DEFAULT NULL,
  `CheckOutTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userchecks
-- ----------------------------
INSERT INTO `userchecks` VALUES (1, 1, 'zhangsan', NULL, 2, 2, NULL);
INSERT INTO `userchecks` VALUES (2, 2, 'lisi', NULL, 2, 2, NULL);
INSERT INTO `userchecks` VALUES (3, 3, 'aa', NULL, 2, 2, '2019-05-14 15:53:42');

-- ----------------------------
-- Table structure for userroletab
-- ----------------------------
DROP TABLE IF EXISTS `userroletab`;
CREATE TABLE `userroletab`  (
  `userRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  `userRoleLastUpdateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`userRoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userroletab
-- ----------------------------
INSERT INTO `userroletab` VALUES (1, 1, 1, '2019-05-10 11:44:01');
INSERT INTO `userroletab` VALUES (2, 2, 2, '2019-05-10 11:44:30');
INSERT INTO `userroletab` VALUES (3, 2, 3, '2019-05-11 08:27:28');
INSERT INTO `userroletab` VALUES (5, 3, 5, NULL);

-- ----------------------------
-- Table structure for usertab
-- ----------------------------
DROP TABLE IF EXISTS `usertab`;
CREATE TABLE `usertab`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPassWord` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userIsLockout` int(10) NULL DEFAULT NULL,
  `userUpdateTime` datetime(0) NULL DEFAULT NULL,
  `userCreateTime` datetime(0) NULL DEFAULT NULL,
  `userLastLoginTime` datetime(0) NULL DEFAULT NULL,
  `userLastLoginIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPassWrongCout` int(255) NULL DEFAULT NULL,
  `userLockoutTime` datetime(0) NULL DEFAULT NULL,
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userTelephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usertab
-- ----------------------------
INSERT INTO `usertab` VALUES (1, 'zhangsan', 'ysd123', 2, '2019-05-13 11:50:18', '2019-05-10 11:31:54', '2019-05-10 11:32:00', NULL, 1, '2019-05-10 11:32:34', '12345678@qq.com', '13526444798');
INSERT INTO `usertab` VALUES (2, 'lisi', 'ysd123', 2, '2019-05-13 11:53:48', '2019-05-10 11:36:53', '2019-05-10 11:36:56', NULL, 2, '2019-05-10 11:37:04', '12345678@qq.com', '13512223256');
INSERT INTO `usertab` VALUES (3, 'aa', 'ysd123', 2, '2019-05-11 15:29:48', '2019-05-11 14:25:05', NULL, NULL, NULL, NULL, '13156', '235165');

SET FOREIGN_KEY_CHECKS = 1;
