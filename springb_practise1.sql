/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : springb_practise1

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-07-04 17:13:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', '0 0 0 1 1/1 ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', null, 'com.cx.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002B636F6D2E63782E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B787074000944624261636B7570737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016AC488B6EF7874000F3020302030203120312F31203F202A7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400026462740000740015E4B880E4B8AAE69C88E689A7E8A18CE4B880E6ACA1737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-BH7UDPT1562209087982', '1562231578810', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', 'TASK_3', 'DEFAULT', null, '1564588800000', '-1', '5', 'WAITING', 'CRON', '1558075455000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002B636F6D2E63782E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B787074000944624261636B7570737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016AC488B6187874000F3020302030203120312F31203F202A7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740002646270740026E4B880E4B8AAE69C88E689A7E8A18CE4B880E6ACA128E5A487E4BBBDE695B0E68DAEE5BA9329737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('3', 'DbBackups', 'db', null, '0 0 0 1 1/1 ? *', '0', '一个月执行一次(备份数据库)', '2019-05-17 14:44:15');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'DbBackups', 'db', null, '0', null, '6', '2019-05-17 14:37:35');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'DbBackups', 'db', null, '0', null, '3', '2019-05-17 14:37:40');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'DbBackups', 'db', null, '0', null, '2', '2019-05-17 14:37:45');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'DbBackups', 'db', null, '0', null, '7', '2019-05-17 14:37:50');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'DbBackups', 'db', null, '0', null, '2', '2019-05-17 14:37:55');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('030eaab4-2862-4c3c-8b89-796ecd09177e', '3aa2n', '2019-06-20 09:20:45');
INSERT INTO `sys_captcha` VALUES ('04b0a000-25f4-4f74-8ef1-b2bdb1b128bc', 'amwdb', '2019-06-21 16:42:03');
INSERT INTO `sys_captcha` VALUES ('06021255-4044-49c9-8df4-a46890dafc69', 'cbxnw', '2019-06-20 14:11:17');
INSERT INTO `sys_captcha` VALUES ('07adf3d1-be0b-4042-80d9-53117d2d61eb', '43fcm', '2019-06-21 16:41:32');
INSERT INTO `sys_captcha` VALUES ('0862afce-b2e0-4ad9-8181-3ec5fe23fb16', '34yew', '2019-06-25 09:45:41');
INSERT INTO `sys_captcha` VALUES ('08bef0f9-65c0-4048-8466-a97e9dde54c7', 'cpfaw', '2019-06-21 09:47:08');
INSERT INTO `sys_captcha` VALUES ('094e8cc1-d19f-463b-80ad-062ef09335a3', 'yc62a', '2019-06-24 16:31:13');
INSERT INTO `sys_captcha` VALUES ('09c34930-6cf3-404f-881b-2dd9ae545193', 'ypmcm', '2019-06-25 10:01:18');
INSERT INTO `sys_captcha` VALUES ('09e98e08-9095-41e9-826e-9d3c3d640986', '68ppf', '2019-06-21 18:03:11');
INSERT INTO `sys_captcha` VALUES ('0a97f346-961a-424c-814f-f4ce039731ce', '625y7', '2019-06-24 09:31:36');
INSERT INTO `sys_captcha` VALUES ('0f0bb7c7-7de6-4383-86e8-d2e73c94d2bb', 'b5ngm', '2019-06-25 10:23:46');
INSERT INTO `sys_captcha` VALUES ('1048e6b8-c935-484b-8967-7fb42be89d27', 'd7nbn', '2019-06-25 11:28:11');
INSERT INTO `sys_captcha` VALUES ('11e6b47e-b906-4763-883d-6cfd0ef6ee1b', '8npyc', '2019-06-24 12:04:31');
INSERT INTO `sys_captcha` VALUES ('13a14d2c-62e9-42bf-8a40-073651500428', 'gabyc', '2019-06-24 09:09:31');
INSERT INTO `sys_captcha` VALUES ('13b1ddfa-a0e6-4bcd-8ad7-d29508a09da7', 'gm46n', '2019-06-25 09:45:30');
INSERT INTO `sys_captcha` VALUES ('1666a113-51b4-43b2-8b5f-5a99ac88e226', 'yn4nc', '2019-06-24 13:56:31');
INSERT INTO `sys_captcha` VALUES ('17547aeb-5094-419b-801b-5c7915676322', 'yaf6b', '2019-06-19 17:20:36');
INSERT INTO `sys_captcha` VALUES ('17a7db6f-59e0-47a1-8573-f548666caeca', 'nmfmx', '2019-06-24 15:29:56');
INSERT INTO `sys_captcha` VALUES ('18764ae9-ba1e-4ae7-8b55-93a700f711ed', 'nfex3', '2019-06-21 16:38:28');
INSERT INTO `sys_captcha` VALUES ('192b23b5-6b2c-4382-8b8c-ea3b2e8c6740', 'nnnwc', '2019-06-25 09:37:56');
INSERT INTO `sys_captcha` VALUES ('193d3d6d-4b9c-4594-8403-507b206bf218', '75bn8', '2019-06-21 16:41:45');
INSERT INTO `sys_captcha` VALUES ('1afbfdc9-f19b-4dc5-8058-003a73089ac6', 'cw64p', '2019-06-25 09:30:58');
INSERT INTO `sys_captcha` VALUES ('1b056ea9-5959-40e5-8c7b-e31f44a7ea4a', '5b66w', '2019-06-26 09:23:42');
INSERT INTO `sys_captcha` VALUES ('1b28289c-fffd-4e0b-8267-fb6187114204', 'y3ab6', '2019-06-26 09:07:22');
INSERT INTO `sys_captcha` VALUES ('1bb5f565-82a2-42ae-8f71-cd698b259836', 'pan2w', '2019-06-28 09:12:28');
INSERT INTO `sys_captcha` VALUES ('207629c7-ae22-48f3-86c3-d068de7d9ab8', 'y3am2', '2019-06-20 10:43:26');
INSERT INTO `sys_captcha` VALUES ('21a7d005-5c85-4cac-8da0-8ce97aad19de', 'pcpfw', '2019-06-21 13:56:08');
INSERT INTO `sys_captcha` VALUES ('21daae7b-2993-4af2-8c1e-0c9f4e1685b7', 'pe8n7', '2019-06-24 14:43:26');
INSERT INTO `sys_captcha` VALUES ('22bda449-7f82-491a-8078-0245746458ce', 'd72by', '2019-06-21 16:42:03');
INSERT INTO `sys_captcha` VALUES ('237d8bf8-16a5-47a5-8c09-8a0dce981920', '25ybf', '2019-06-25 10:45:06');
INSERT INTO `sys_captcha` VALUES ('24cb6135-982c-4749-8229-ad1d0db15dc3', '83ng6', '2019-06-24 11:58:17');
INSERT INTO `sys_captcha` VALUES ('2626aa9e-0361-482d-8147-42e1298441cc', 'p64m6', '2019-06-24 18:02:17');
INSERT INTO `sys_captcha` VALUES ('26b8c2a5-4b04-4bbb-8937-3dba0a3cc9d8', 'a45mm', '2019-06-24 09:45:39');
INSERT INTO `sys_captcha` VALUES ('271e7fed-4d44-4311-867b-923de1c0024b', 'bpbf5', '2019-06-20 14:18:43');
INSERT INTO `sys_captcha` VALUES ('28b18fb9-ebea-4fd0-81d1-c79a7db498c6', 'gngwe', '2019-06-25 09:45:41');
INSERT INTO `sys_captcha` VALUES ('291f16c5-9f3e-4fa2-8ce1-dc0e28623a7b', '26dgn', '2019-06-25 16:29:21');
INSERT INTO `sys_captcha` VALUES ('295df208-24e9-4d77-828c-5987a6d62f57', 'na4p3', '2019-06-24 11:45:52');
INSERT INTO `sys_captcha` VALUES ('29de0b54-e1e1-42ac-8b51-2a13f5bea10e', 'me6n3', '2019-06-25 09:37:56');
INSERT INTO `sys_captcha` VALUES ('29fbd12c-937d-4fa5-85c4-ff290a6e13de', 'fpnwc', '2019-06-21 16:41:48');
INSERT INTO `sys_captcha` VALUES ('2aa2cb1b-bd8a-46e1-8471-291c107f3b7a', '66dw7', '2019-06-24 10:38:55');
INSERT INTO `sys_captcha` VALUES ('2b14feb6-1b5f-462f-841e-9dbe0d1344e3', 'nga8g', '2019-06-21 09:10:11');
INSERT INTO `sys_captcha` VALUES ('2c3f701b-2761-4ef4-8288-bae5c88d5938', 'nmeaf', '2019-06-28 15:43:31');
INSERT INTO `sys_captcha` VALUES ('30515eab-33cc-461e-83c9-dcddcf2e2dc3', 'bfmm4', '2019-06-25 09:30:58');
INSERT INTO `sys_captcha` VALUES ('30ac521a-b269-4207-8930-c51cc307dcc6', '246mm', '2019-06-24 17:57:42');
INSERT INTO `sys_captcha` VALUES ('341398d3-6d80-4896-8299-f231adcb2c0b', 'pgnn8', '2019-07-01 10:32:25');
INSERT INTO `sys_captcha` VALUES ('34eaf53d-76ed-4ff3-8e20-c2fc03b0980d', 'c2wmx', '2019-07-04 10:53:47');
INSERT INTO `sys_captcha` VALUES ('35068474-70d2-497d-85de-ddb3301cd9fe', 'ynnbw', '2019-06-21 16:41:45');
INSERT INTO `sys_captcha` VALUES ('37ccda9f-de84-4727-8954-73ab6fa10355', 'a57e8', '2019-06-21 16:41:48');
INSERT INTO `sys_captcha` VALUES ('3d7ef1ba-ba1f-406d-8647-bf6fb6355627', 'ncyf3', '2019-06-21 11:06:33');
INSERT INTO `sys_captcha` VALUES ('3e0d0863-3306-4321-82eb-7abb44f8da7b', 'md3mp', '2019-06-24 12:04:25');
INSERT INTO `sys_captcha` VALUES ('3e99eef4-0426-406a-8a79-d26cd5902b6d', '4gn4b', '2019-06-26 15:18:24');
INSERT INTO `sys_captcha` VALUES ('4061707d-69cc-43a8-8614-821e83d05fc1', 'ypym3', '2019-06-24 12:04:25');
INSERT INTO `sys_captcha` VALUES ('41f66c1c-748b-4622-8537-91ecd838a512', 'bnb5x', '2019-06-26 09:27:16');
INSERT INTO `sys_captcha` VALUES ('42a319a7-6ea7-40ca-82aa-b6c040d42e76', '57bgn', '2019-06-20 16:45:59');
INSERT INTO `sys_captcha` VALUES ('435c4524-fda4-4f2f-807c-4c02e7be8386', 'cma2m', '2019-07-04 10:52:53');
INSERT INTO `sys_captcha` VALUES ('456780c3-b0b3-40ac-838a-ee02f418f005', '6438x', '2019-06-21 09:09:10');
INSERT INTO `sys_captcha` VALUES ('45aa8ff9-7ff0-44d7-8e86-417d4f06276b', 'ddb6b', '2019-06-21 16:48:14');
INSERT INTO `sys_captcha` VALUES ('46bc777a-2a85-44c3-83d3-932eacdd0b7d', 'eeed8', '2019-06-27 09:11:27');
INSERT INTO `sys_captcha` VALUES ('493f1290-d04e-43b7-8119-02cd0ac2c2a8', 'nec3n', '2019-06-24 14:42:54');
INSERT INTO `sys_captcha` VALUES ('4a42d761-98d5-4982-8b0e-439ad1cce4ee', 'gpaan', '2019-06-24 10:30:21');
INSERT INTO `sys_captcha` VALUES ('4cff05fb-e0f8-4a6d-852d-c6f397906cec', 'pm5p8', '2019-06-24 17:52:43');
INSERT INTO `sys_captcha` VALUES ('4e7d54cc-31b4-453b-8253-0304176f0478', 'pxxc4', '2019-06-24 14:00:03');
INSERT INTO `sys_captcha` VALUES ('4ec9def0-da2d-4c29-8181-be252bfd7d3d', '568dd', '2019-06-24 09:31:49');
INSERT INTO `sys_captcha` VALUES ('518b10a5-8b03-4bdd-8d24-efc8d5687537', '53p6n', '2019-06-21 16:48:14');
INSERT INTO `sys_captcha` VALUES ('5288cdd6-dbca-43a5-84da-5819a1492557', '88xgc', '2019-06-20 09:13:25');
INSERT INTO `sys_captcha` VALUES ('52c11b1c-4f1d-44bd-8c88-ceaae62b16f5', 'nnwew', '2019-06-24 11:49:38');
INSERT INTO `sys_captcha` VALUES ('53728f60-75fd-4395-8362-65f0d889bd18', 'aw8gp', '2019-06-24 10:30:21');
INSERT INTO `sys_captcha` VALUES ('53aa0f1c-cbf0-4291-8bcd-2b5923542c25', '83eax', '2019-07-02 11:10:23');
INSERT INTO `sys_captcha` VALUES ('55990a62-bbef-4881-8889-ed3c6c0c4956', '37c4c', '2019-06-20 14:11:17');
INSERT INTO `sys_captcha` VALUES ('5673079b-6ab1-479a-8c93-98e3270af9cb', '22y53', '2019-06-21 10:30:00');
INSERT INTO `sys_captcha` VALUES ('57c59081-c276-469c-8adb-2c3888ae74cb', '6dmmp', '2019-07-02 12:02:57');
INSERT INTO `sys_captcha` VALUES ('57cbf5d4-d684-4cdd-8220-32bd58651bd9', 'c62y4', '2019-06-25 11:43:33');
INSERT INTO `sys_captcha` VALUES ('57eaaa6b-1660-42fe-824b-09631f9036e3', 'de5y7', '2019-06-25 10:41:21');
INSERT INTO `sys_captcha` VALUES ('587585d4-fd4e-42e0-88e5-990502d9e6f9', 'ab6f8', '2019-06-24 10:39:02');
INSERT INTO `sys_captcha` VALUES ('5a0a674c-3f72-449f-82a4-b4dc8b6313bd', 'ax3fc', '2019-06-24 13:59:38');
INSERT INTO `sys_captcha` VALUES ('5ab7ec20-d04e-4209-86fa-8d27635c05f5', 'xpnya', '2019-06-25 09:37:56');
INSERT INTO `sys_captcha` VALUES ('5abc5256-9956-41b8-8a6a-b3f37016ae52', '73adw', '2019-06-25 11:27:02');
INSERT INTO `sys_captcha` VALUES ('5b682acc-53b3-40d1-883c-102208fac3a5', 'abde4', '2019-07-04 10:53:11');
INSERT INTO `sys_captcha` VALUES ('5ddf7c13-4d08-4970-87e6-ade223898d95', 'wep2n', '2019-06-24 13:59:38');
INSERT INTO `sys_captcha` VALUES ('5df5e8de-7680-443c-8504-a4e1d2b4ffc2', 'pbncw', '2019-06-24 16:31:13');
INSERT INTO `sys_captcha` VALUES ('5e93e35f-339d-4ad1-8ba2-a29a8b9f7c4b', 'm2cgd', '2019-06-26 09:22:55');
INSERT INTO `sys_captcha` VALUES ('5f948e9d-7655-4ae6-8bd1-c09fe7dc09ec', '8e6fm', '2019-06-26 09:19:30');
INSERT INTO `sys_captcha` VALUES ('60bd9ddb-c19e-4dce-86bc-5c0f408a4501', 'yw52a', '2019-06-19 17:34:08');
INSERT INTO `sys_captcha` VALUES ('63cf0571-77df-45d3-89b8-b38406d2653b', '5ym4g', '2019-06-25 10:01:14');
INSERT INTO `sys_captcha` VALUES ('644d527a-f22c-4be2-8df8-945f4a3f85fd', '7yfxy', '2019-06-26 09:21:08');
INSERT INTO `sys_captcha` VALUES ('653d6fa8-85fd-4ad8-8121-1f4bd6cf7d5b', '56gf5', '2019-07-04 10:53:19');
INSERT INTO `sys_captcha` VALUES ('6565a677-832b-405f-8b23-5468082d5e02', 'a6bn5', '2019-06-21 16:44:40');
INSERT INTO `sys_captcha` VALUES ('681a29b9-2355-41e6-8b6e-90421f903c85', '2mpge', '2019-06-24 11:49:38');
INSERT INTO `sys_captcha` VALUES ('6f060220-a2e9-4f83-8527-650431d11b4f', 'g786m', '2019-06-24 11:41:59');
INSERT INTO `sys_captcha` VALUES ('71c587b9-6bb1-494b-8e07-177a2c53c8d7', '75a4f', '2019-06-21 16:41:48');
INSERT INTO `sys_captcha` VALUES ('72bec69e-ba61-4ad2-8901-cf1177c9633f', '873n7', '2019-06-24 13:59:36');
INSERT INTO `sys_captcha` VALUES ('7431c3a8-5707-48dd-8658-351b6153a410', 'pm4gm', '2019-06-26 10:40:40');
INSERT INTO `sys_captcha` VALUES ('746d3d4f-cea4-48d0-8bb4-f04519cdc20f', 'x7ged', '2019-06-25 10:23:54');
INSERT INTO `sys_captcha` VALUES ('753d8813-2329-4b6d-8ba5-bb389a0f432b', '85xbd', '2019-06-21 13:38:20');
INSERT INTO `sys_captcha` VALUES ('773e1269-92fc-4fea-8e56-c72a2f549d52', 'anpdn', '2019-06-26 09:42:57');
INSERT INTO `sys_captcha` VALUES ('79407fa1-f454-4678-8cc5-736fa7c12658', '2n3md', '2019-06-25 10:41:25');
INSERT INTO `sys_captcha` VALUES ('7c386e15-3d52-4895-830a-9ce0226a2304', 'c2pdm', '2019-06-21 16:41:45');
INSERT INTO `sys_captcha` VALUES ('7d65a6b4-3e60-413a-8101-e00d29d1c0e7', 'a7w57', '2019-06-24 11:41:54');
INSERT INTO `sys_captcha` VALUES ('7f47d43a-072f-4049-8b4b-07a2e53379af', 'nwc8w', '2019-06-20 14:17:55');
INSERT INTO `sys_captcha` VALUES ('8069300d-df31-4cf2-8dd0-e5ece025f9ea', 'nmcd5', '2019-06-20 09:31:44');
INSERT INTO `sys_captcha` VALUES ('84b90b9e-077a-4cc2-858b-0daf3c8c8b18', '6ywnn', '2019-06-21 13:45:16');
INSERT INTO `sys_captcha` VALUES ('85c88ba9-d0c3-4a68-8945-c42422857288', '8c25b', '2019-07-02 10:58:17');
INSERT INTO `sys_captcha` VALUES ('882ad376-5bc5-404e-84bf-c8e425f71596', '2xf3w', '2019-06-21 16:48:14');
INSERT INTO `sys_captcha` VALUES ('8a1cc621-e149-44b2-8c45-619b52097389', 'dnyym', '2019-06-24 11:45:52');
INSERT INTO `sys_captcha` VALUES ('8b8bd01f-9054-46a4-872e-1857dab26d77', '77dm8', '2019-06-20 14:17:55');
INSERT INTO `sys_captcha` VALUES ('8defe326-144b-445d-8766-9dbf82e08362', 'aybn3', '2019-06-21 13:56:53');
INSERT INTO `sys_captcha` VALUES ('8e6fccb3-09a2-461a-887b-1cba43e1203d', 'ybm2e', '2019-06-24 14:43:26');
INSERT INTO `sys_captcha` VALUES ('8ffdf449-1af4-4cb5-84ab-4ae23c0a17e0', '7f5m7', '2019-06-25 10:43:48');
INSERT INTO `sys_captcha` VALUES ('906cf040-c0b9-4351-8875-1b77825621a5', '5d7b5', '2019-06-21 09:07:29');
INSERT INTO `sys_captcha` VALUES ('9307f91d-0d16-4277-8fe1-5603b1259fe5', 'pf4pb', '2019-06-25 10:40:59');
INSERT INTO `sys_captcha` VALUES ('935888d4-5942-4ed7-8305-2f9266df9f65', '2axaf', '2019-06-25 10:18:36');
INSERT INTO `sys_captcha` VALUES ('96ede69b-0dcf-4cc9-82ec-078fdb1f951c', 'ped2g', '2019-06-20 09:23:17');
INSERT INTO `sys_captcha` VALUES ('97c4a8ad-d7ed-4097-8afa-4fccbfa6109a', '82na5', '2019-06-19 17:20:35');
INSERT INTO `sys_captcha` VALUES ('98f5ca5f-c803-4ed7-857d-f7c72422a7b9', '2cbnw', '2019-06-21 11:15:24');
INSERT INTO `sys_captcha` VALUES ('9b0a3493-5204-41c6-8bf6-82cf80dd605a', 'dangx', '2019-07-03 17:07:46');
INSERT INTO `sys_captcha` VALUES ('9c009962-cefe-4a73-881f-e1068b98102e', 'fpygn', '2019-06-20 14:17:55');
INSERT INTO `sys_captcha` VALUES ('9d168548-5d4f-45d3-8743-d0b66c6cd0eb', 'wd4c2', '2019-06-25 16:29:21');
INSERT INTO `sys_captcha` VALUES ('9d799bb9-f8a1-4ebd-8f65-a8e24f17cad8', 'f2m5n', '2019-06-24 15:04:54');
INSERT INTO `sys_captcha` VALUES ('9fe8693a-ac6e-4cf8-837b-16ac137b7d73', '3nccp', '2019-06-24 11:41:56');
INSERT INTO `sys_captcha` VALUES ('9ff238b1-4132-439e-835b-7e1042d8e216', 'wbcfd', '2019-06-21 09:08:25');
INSERT INTO `sys_captcha` VALUES ('a1d83322-c4bc-48f0-8592-00147e204771', '77648', '2019-06-21 16:44:40');
INSERT INTO `sys_captcha` VALUES ('a28ee16b-f55c-45c0-8989-b47a7a1f3752', 'fegef', '2019-06-25 11:43:35');
INSERT INTO `sys_captcha` VALUES ('a586cb86-cc28-4b1a-81db-e2df04277a9a', 'pncan', '2019-06-25 09:30:58');
INSERT INTO `sys_captcha` VALUES ('a76918f1-7d04-473b-898b-599e94011e31', 'bbgde', '2019-06-19 18:05:44');
INSERT INTO `sys_captcha` VALUES ('a7720a4b-9f86-4f24-8093-dc6cd405ecaa', '253cp', '2019-06-24 09:36:12');
INSERT INTO `sys_captcha` VALUES ('aa34be54-30f8-4347-85f2-6306e7a06079', 'eg3g4', '2019-06-24 09:29:34');
INSERT INTO `sys_captcha` VALUES ('ab5f2225-2044-4515-8b74-44c158bee545', '8nb8p', '2019-06-26 09:38:11');
INSERT INTO `sys_captcha` VALUES ('ac0026fa-d773-48d4-835c-01caebed1290', 'fcnn5', '2019-06-25 11:27:02');
INSERT INTO `sys_captcha` VALUES ('ae009c2e-e8de-4e0c-8479-7a64398e5872', '6p8nx', '2019-06-21 09:10:20');
INSERT INTO `sys_captcha` VALUES ('aeb1e967-8e91-4aa1-8509-afe117744105', '842f3', '2019-06-20 09:31:30');
INSERT INTO `sys_captcha` VALUES ('b08c5379-dd0b-41f5-8a72-79e43bc1347d', '5gnc5', '2019-06-21 09:54:35');
INSERT INTO `sys_captcha` VALUES ('b2794d78-fb0a-47c9-847a-f39729516070', '3anc3', '2019-06-20 14:18:43');
INSERT INTO `sys_captcha` VALUES ('b3129f46-b169-4bb2-882f-177e5ccc4dab', '85xmc', '2019-06-21 16:41:59');
INSERT INTO `sys_captcha` VALUES ('b58ce2eb-18ed-4afc-86bd-d2f90635391a', '75p5x', '2019-06-26 12:03:49');
INSERT INTO `sys_captcha` VALUES ('b61cfe80-ba9c-4550-8ff6-8bcca238fa6b', 'fg873', '2019-06-24 09:31:49');
INSERT INTO `sys_captcha` VALUES ('b8bbd684-6706-410f-8a13-d85f8d29d85d', 'p768g', '2019-06-20 09:30:39');
INSERT INTO `sys_captcha` VALUES ('b8caae0b-86b3-475b-8180-d49466bd62cd', 'm5mp3', '2019-06-21 09:10:20');
INSERT INTO `sys_captcha` VALUES ('b90c8b0e-acea-416b-8700-70399a1c87cf', '5g7w3', '2019-06-21 18:03:11');
INSERT INTO `sys_captcha` VALUES ('bc400e18-add5-4b91-8bdb-4a310ed0305f', 'ncxaw', '2019-06-25 11:27:34');
INSERT INTO `sys_captcha` VALUES ('bc67fc4d-5f71-4ada-8883-7baf2d84e640', '3xx52', '2019-06-21 13:56:08');
INSERT INTO `sys_captcha` VALUES ('bc83f10a-96ad-43d1-8d8c-fb2f5a68fba2', 'n2we3', '2019-06-21 16:41:59');
INSERT INTO `sys_captcha` VALUES ('bd991fdb-49ad-47ad-8bab-8c22e321ad6c', 'mgwwa', '2019-06-25 10:41:27');
INSERT INTO `sys_captcha` VALUES ('becb9247-739d-43e1-8ffd-406d1f8a087a', 'b2n8n', '2019-06-20 10:40:16');
INSERT INTO `sys_captcha` VALUES ('c3969057-09cb-4faa-82b5-0f3a3c1fd443', '26448', '2019-06-26 09:42:57');
INSERT INTO `sys_captcha` VALUES ('c58bb84d-102d-49ef-8c33-5814e27532ed', '45gme', '2019-06-19 17:36:43');
INSERT INTO `sys_captcha` VALUES ('c75aa681-ad17-4ee4-8797-44de7cdb6f64', '2b62f', '2019-06-20 14:11:17');
INSERT INTO `sys_captcha` VALUES ('c7a27108-e238-4884-8b25-3f919c926ba6', '6c7wa', '2019-06-21 16:45:38');
INSERT INTO `sys_captcha` VALUES ('ca618b2f-2ba3-4132-85fa-d101310e7663', 'mwbdc', '2019-06-19 17:57:46');
INSERT INTO `sys_captcha` VALUES ('cc37535f-2007-4ddd-8882-8dd8faaf60be', 'x5844', '2019-06-20 16:07:18');
INSERT INTO `sys_captcha` VALUES ('cc8b7cc5-c38b-4565-83eb-a7008016904c', '7w2fd', '2019-06-19 17:32:15');
INSERT INTO `sys_captcha` VALUES ('cca13fe2-879d-4374-86d0-2919c29da5fc', 'am87n', '2019-06-26 15:50:28');
INSERT INTO `sys_captcha` VALUES ('ced87f0a-e67e-4d6e-8336-a67ca35cbd3c', 'gb27y', '2019-06-24 15:27:33');
INSERT INTO `sys_captcha` VALUES ('cf21fbe0-48c0-4116-8e67-06238d411ece', '4bex6', '2019-06-24 11:58:17');
INSERT INTO `sys_captcha` VALUES ('d08d67a2-de23-495e-837e-453d2c314a90', '2bfg8', '2019-06-21 09:08:25');
INSERT INTO `sys_captcha` VALUES ('d1bec5f1-e643-4468-8c16-e3b21cda0462', 'npfn5', '2019-06-25 10:40:16');
INSERT INTO `sys_captcha` VALUES ('d2b468d5-33ee-448a-8979-ce82c1e617bf', 'ncam3', '2019-06-24 10:39:02');
INSERT INTO `sys_captcha` VALUES ('d4de6115-bb0d-4991-8fd6-725cc2855007', '23y78', '2019-06-20 15:53:30');
INSERT INTO `sys_captcha` VALUES ('d63ec9eb-c8f8-4e66-89b4-0919cbfbf349', 'a7824', '2019-06-24 10:38:55');
INSERT INTO `sys_captcha` VALUES ('d7651b45-f853-4fa0-8062-e8eb32ff5730', 'ycday', '2019-06-26 09:18:44');
INSERT INTO `sys_captcha` VALUES ('d9d2aaa9-cc5e-45d8-8f2f-f82d8b82b4e0', '5c5cm', '2019-06-21 14:10:46');
INSERT INTO `sys_captcha` VALUES ('de0e0620-799a-465d-8a51-f3ffc8b3acdc', 'wgwdy', '2019-06-24 12:04:25');
INSERT INTO `sys_captcha` VALUES ('de25edb8-49a2-48b8-8649-73a95dde857b', '46xag', '2019-06-21 09:10:20');
INSERT INTO `sys_captcha` VALUES ('dea1a055-835e-4d03-8f64-79df0ec7e0f8', 'we3fg', '2019-06-21 13:56:08');
INSERT INTO `sys_captcha` VALUES ('deb82583-82a5-47db-8fc4-c8753c538af5', '262gp', '2019-06-21 16:41:59');
INSERT INTO `sys_captcha` VALUES ('e0870700-4fce-4402-8a30-68499c6520f8', 'nag3c', '2019-06-25 09:45:30');
INSERT INTO `sys_captcha` VALUES ('e123c949-b9fb-4f14-8ae9-fbda38671b62', 'f66mf', '2019-06-25 11:45:52');
INSERT INTO `sys_captcha` VALUES ('e234ad0b-8669-4fbc-89dd-eabec6831444', '25ame', '2019-06-27 09:15:14');
INSERT INTO `sys_captcha` VALUES ('e254db90-1ce8-44f6-84b0-6a8e70164992', 'p87cm', '2019-06-25 09:45:30');
INSERT INTO `sys_captcha` VALUES ('e3e711b5-6368-4e0e-833b-5619ad0fbf63', '3c4yf', '2019-06-20 10:39:51');
INSERT INTO `sys_captcha` VALUES ('e443072f-84d1-431f-811a-8e883549a48e', 'n26a6', '2019-06-25 11:27:02');
INSERT INTO `sys_captcha` VALUES ('e4ddf1d4-6263-4e15-80ac-1feb19203d6d', 'b688c', '2019-06-24 12:04:55');
INSERT INTO `sys_captcha` VALUES ('e542c1b3-0201-418d-8a24-3d1673c8fe27', 'd67gd', '2019-06-26 09:42:57');
INSERT INTO `sys_captcha` VALUES ('e5f4d59a-9dd9-4f97-8f31-411aeef85195', 'axw6c', '2019-06-20 09:12:43');
INSERT INTO `sys_captcha` VALUES ('e7882c61-e5e8-4179-8915-4d30772160bc', '5ma8f', '2019-06-25 10:08:33');
INSERT INTO `sys_captcha` VALUES ('e7e81eab-dae2-4393-87b1-b643108ae9dc', 'mg8ma', '2019-06-20 10:43:33');
INSERT INTO `sys_captcha` VALUES ('eb993972-36b4-4359-84af-e33ab6812594', 'x6726', '2019-06-20 16:07:18');
INSERT INTO `sys_captcha` VALUES ('ef2005d6-eef5-4209-8242-d875c6d03572', 'df3fc', '2019-06-21 14:10:46');
INSERT INTO `sys_captcha` VALUES ('f020e3c9-c759-49fd-86e4-f963d2c7a8eb', 'w68cb', '2019-06-20 09:13:13');
INSERT INTO `sys_captcha` VALUES ('f2d0e170-043b-478d-87ff-411be1eb02f6', '67642', '2019-07-02 11:11:45');
INSERT INTO `sys_captcha` VALUES ('f32a44e8-01bf-47e7-80ff-d71967a766d4', '3g2d3', '2019-06-24 14:43:26');
INSERT INTO `sys_captcha` VALUES ('f392e6ba-bb94-4942-81ac-2eec75455cc0', '3ae74', '2019-06-26 09:43:04');
INSERT INTO `sys_captcha` VALUES ('f4fb66d7-1b5c-42f5-8b9b-3e35fc965d86', '5yg7a', '2019-06-21 13:52:12');
INSERT INTO `sys_captcha` VALUES ('f7dd6b97-28ff-49c9-8fe0-881653d0b01e', '45g82', '2019-06-21 16:42:03');
INSERT INTO `sys_captcha` VALUES ('f8a4600d-9b50-4cc7-83c8-2db1b23d1b39', 'bp8d2', '2019-06-19 18:05:31');
INSERT INTO `sys_captcha` VALUES ('f9c19a3b-3f14-4165-85de-6fd8f53a8335', 'feep4', '2019-06-26 15:50:09');
INSERT INTO `sys_captcha` VALUES ('fbf496fa-0053-4fb1-8eb2-f75ff89f3102', 'xnemy', '2019-07-04 10:51:36');
INSERT INTO `sys_captcha` VALUES ('fd869d2c-9f3c-40b3-827f-ad7d343dd045', 'ga6b6', '2019-06-19 17:33:07');
INSERT INTO `sys_captcha` VALUES ('fd9a35db-b036-4611-8c38-b3f83dd136f4', 'g44g3', '2019-06-25 09:03:43');
INSERT INTO `sys_captcha` VALUES ('fe369c61-523c-4dac-82b3-5af6f95aa7a5', 'p73na', '2019-07-02 10:58:27');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_db_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_db_log`;
CREATE TABLE `sys_db_log` (
  `db_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据备份日志表',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件名字',
  `data` text COMMENT '运行数据',
  `type` int(10) unsigned DEFAULT NULL COMMENT '类型',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`db_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_db_log
-- ----------------------------
INSERT INTO `sys_db_log` VALUES ('13', '12862', '{\"line1\":\"mysqldump: [Warning] Using a password on the command line interface can be insecure.\"}', '1801', '2019-06-20 17:53:14', null);
INSERT INTO `sys_db_log` VALUES ('14', '12884', '{\"line1\":\"mysqldump: [Warning] Using a password on the command line interface can be insecure.\"}', '1801', '2019-06-24 15:28:44', null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('370', 'hxx123', '修改密码', 'com.cx.modules.sys.controller.SysUserController.password()', '[{\"password\":\"111111\",\"newPassword\":\"111111\"}]', '11', '192.168.1.203', '2019-06-20 09:34:14');
INSERT INTO `sys_log` VALUES ('371', 'lljadmin', '保存菜单', 'com.cx.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":37,\"name\":\"模型详情\",\"url\":\"web/model/info\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"sta\":0}]', '10', '192.168.1.201', '2019-06-20 15:45:42');
INSERT INTO `sys_log` VALUES ('372', 'admin', '修改角色', 'com.cx.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[37,38,68,67,40,41,42,43,51,54,55,57,58,59,60,62,33,47,32,35,36,44,48,49,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,50,5,6,7,8,9,10,11,12,13,14,27,30,29,-666666]}]', '132', '192.168.1.201', '2019-06-20 15:46:29');
INSERT INTO `sys_log` VALUES ('373', 'hxxadmin', '修改角色', 'com.cx.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":4,\"menuIdList\":[37,38,68,67,40,41,42,43,51,54,55,57,58,59,60,62,33,47,32,35,36,44,48,49,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,50,5,6,7,8,9,10,11,12,13,14,27,30,29,-666666]}]', '81', '192.168.1.203', '2019-06-20 16:50:09');
INSERT INTO `sys_log` VALUES ('374', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":4,\"username\":\"hxxadmin\",\"salt\":\"YeGzaH60XGWWyCbcslgG\",\"email\":\"1@qq.com\",\"mobile\":\"13246578912\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '33', '192.168.1.203', '2019-06-20 16:50:22');
INSERT INTO `sys_log` VALUES ('375', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lykadmin\",\"salt\":\"29Tll1EiLT81ckMwVUSI\",\"email\":\"123@qq.com\",\"mobile\":\"13678900987\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '13', '192.168.1.203', '2019-06-20 16:50:35');
INSERT INTO `sys_log` VALUES ('376', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"lljadmin\",\"salt\":\"xoYsi7DcAh3UynzQpK8U\",\"email\":\"1@qq.com\",\"mobile\":\"12345678911\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '11', '192.168.1.203', '2019-06-20 16:50:44');
INSERT INTO `sys_log` VALUES ('377', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '9', '192.168.1.203', '2019-06-20 16:51:00');
INSERT INTO `sys_log` VALUES ('378', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":6,\"username\":\"zadmin\",\"salt\":\"vheOAdfjrga39Df6J4Z9\",\"email\":\"1@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '11', '192.168.1.203', '2019-06-20 16:51:04');
INSERT INTO `sys_log` VALUES ('379', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lykadmin\",\"salt\":\"29Tll1EiLT81ckMwVUSI\",\"email\":\"123@qq.com\",\"mobile\":\"13678900987\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '10', '192.168.1.203', '2019-06-20 16:51:08');
INSERT INTO `sys_log` VALUES ('380', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '20', '192.168.1.203', '2019-06-20 16:51:11');
INSERT INTO `sys_log` VALUES ('381', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lykadmin\",\"salt\":\"29Tll1EiLT81ckMwVUSI\",\"email\":\"123@qq.com\",\"mobile\":\"13678900987\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '10', '192.168.1.203', '2019-06-20 16:51:15');
INSERT INTO `sys_log` VALUES ('382', 'hxxadmin', '修改用户', 'com.cx.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lykadmin\",\"salt\":\"29Tll1EiLT81ckMwVUSI\",\"email\":\"123@qq.com\",\"mobile\":\"13678900987\",\"status\":1,\"roleIdList\":[1],\"createUserId\":4}]', '14', '192.168.1.203', '2019-06-20 16:51:20');
INSERT INTO `sys_log` VALUES ('383', 'hxxadmin', '修改字典', 'com.cx.modules.door.controller.DoorDictionaryController.update()', '[{\"dictionaryId\":18,\"parentId\":0,\"code\":\"3D-CLSB\",\"name\":\"车辆装备\",\"value\":1600,\"sort\":15}]', '58', '192.168.1.203', '2019-06-24 15:28:00');
INSERT INTO `sys_log` VALUES ('384', 'lljadmin', '保存字典', 'com.cx.modules.door.controller.DoorDictionaryController.save()', '[{\"parentId\":0,\"code\":\"3D-QZ\",\"name\":\"模型前置名字\",\"value\":2500,\"sort\":24}]', '40', '192.168.1.201', '2019-06-24 16:07:35');
INSERT INTO `sys_log` VALUES ('385', 'lljadmin', '修改字典', 'com.cx.modules.door.controller.DoorDictionaryController.update()', '[{\"dictionaryId\":262,\"parentId\":0,\"code\":\"3DMQZ\",\"name\":\"模型前置名字\",\"value\":2500,\"sort\":24}]', '3', '192.168.1.201', '2019-06-24 16:08:27');
INSERT INTO `sys_log` VALUES ('386', 'lljadmin', '保存字典', 'com.cx.modules.door.controller.DoorDictionaryController.save()', '[{\"parentId\":262,\"code\":\"DLXT-FDJ-QZ\",\"name\":\"EQB150-20型\",\"value\":2501,\"sort\":0}]', '3', '192.168.1.201', '2019-06-24 16:09:08');
INSERT INTO `sys_log` VALUES ('387', 'lljadmin', '保存字典', 'com.cx.modules.door.controller.DoorDictionaryController.save()', '[{\"parentId\":244,\"code\":\"DPBF-BSQ\",\"name\":\"变速器\",\"value\":2207,\"sort\":6}]', '29', '192.168.1.201', '2019-06-24 16:45:53');
INSERT INTO `sys_log` VALUES ('388', 'lljadmin', '保存字典', 'com.cx.modules.door.controller.DoorDictionaryController.save()', '[{\"parentId\":262,\"code\":\"DPBF-BSQ-QZ\",\"name\":\"A100\",\"value\":2502,\"sort\":1}]', '24', '192.168.1.201', '2019-06-24 16:46:47');
INSERT INTO `sys_log` VALUES ('389', 'lljadmin', '下架模型', 'com.cx.modules.web.controller.WebModelController.modelLowerShelf()', '[{\"t\":1561512863583,\"modelId\":237}]', '4', '192.168.1.201', '2019-06-26 09:34:24');
INSERT INTO `sys_log` VALUES ('390', 'hxxadmin', '修改轮播信息', 'com.cx.modules.web.controller.WebBannerController.updateBanner()', '[{\"bannerId\":5,\"bannerName\":\"555\",\"coverId\":12861,\"modelId\":221,\"createUser\":4,\"status\":1}]', '11', '192.168.1.203', '2019-06-26 14:57:38');
INSERT INTO `sys_log` VALUES ('391', 'hxxadmin', '修改轮播信息', 'com.cx.modules.web.controller.WebBannerController.updateBanner()', '[{\"bannerId\":1,\"bannerName\":\"111\",\"coverId\":12857,\"modelId\":201,\"createUser\":4,\"status\":1}]', '7', '192.168.1.203', '2019-06-26 14:57:57');
INSERT INTO `sys_log` VALUES ('392', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":27,\"valueId\":0,\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:00:52');
INSERT INTO `sys_log` VALUES ('393', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":24,\"valueId\":0,\"status\":0}]', '4', '192.168.1.203', '2019-06-26 15:02:30');
INSERT INTO `sys_log` VALUES ('394', 'hxxadmin', '新闻保存/发布', 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":24,\"newsName\":\"华为心里堵得慌！又有一家公司“背后捅刀”，北京公司起诉华为？\",\"newsContent\":\"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\\u003d\",\"userId\":4,\"valueId\":1,\"status\":1}]', '3', '192.168.1.203', '2019-06-26 15:02:34');
INSERT INTO `sys_log` VALUES ('395', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":24,\"valueId\":0,\"status\":0}]', '8', '192.168.1.203', '2019-06-26 15:02:40');
INSERT INTO `sys_log` VALUES ('396', 'hxxadmin', '新闻保存/发布', 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":24,\"newsName\":\"华为心里堵得慌！又有一家公司“背后捅刀”，北京公司起诉华为？\",\"newsContent\":\"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\\u003d\",\"userId\":4,\"valueId\":1,\"status\":0}]', '7', '192.168.1.203', '2019-06-26 15:02:42');
INSERT INTO `sys_log` VALUES ('397', 'hxxadmin', '新闻保存/发布', 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":24,\"newsName\":\"华为心里堵得慌！又有一家公司“背后捅刀”，北京公司起诉华为？\",\"newsContent\":\"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\\u003d\",\"userId\":4,\"valueId\":1,\"status\":0}]', '9', '192.168.1.203', '2019-06-26 15:02:47');
INSERT INTO `sys_log` VALUES ('398', 'hxxadmin', '新闻保存/发布', 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":24,\"newsName\":\"华为心里堵得慌！又有一家公司“背后捅刀”，北京公司起诉华为？\",\"newsContent\":\"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\\u003d\",\"userId\":4,\"valueId\":1,\"status\":1}]', '7', '192.168.1.203', '2019-06-26 15:02:51');
INSERT INTO `sys_log` VALUES ('399', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":27,\"valueId\":0,\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:02:57');
INSERT INTO `sys_log` VALUES ('400', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":27,\"valueId\":0,\"status\":0}]', '3', '192.168.1.203', '2019-06-26 15:03:29');
INSERT INTO `sys_log` VALUES ('401', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":27,\"valueId\":0,\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:04:17');
INSERT INTO `sys_log` VALUES ('402', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561532951362,\"videoId\":\"13\",\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:09:13');
INSERT INTO `sys_log` VALUES ('403', 'hxxadmin', '教程发布/保存', 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '42', '192.168.1.203', '2019-06-26 15:09:14');
INSERT INTO `sys_log` VALUES ('404', 'lljadmin', '新闻保存/发布', 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":24,\"newsName\":\"华为心里堵得慌！又有一家公司“背后捅刀”，北京公司起诉华为？\",\"newsContent\":\"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\\u003d\",\"userId\":2,\"valueId\":1,\"status\":1}]', '6', '192.168.1.201', '2019-06-26 15:10:07');
INSERT INTO `sys_log` VALUES ('405', 'lljadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":24,\"valueId\":0,\"status\":0}]', '4', '192.168.1.201', '2019-06-26 15:10:10');
INSERT INTO `sys_log` VALUES ('406', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '11', '192.168.1.203', '2019-06-26 15:13:03');
INSERT INTO `sys_log` VALUES ('407', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533196145,\"videoId\":\"13\",\"status\":0}]', '4', '192.168.1.203', '2019-06-26 15:13:18');
INSERT INTO `sys_log` VALUES ('408', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '15', '192.168.1.203', '2019-06-26 15:13:24');
INSERT INTO `sys_log` VALUES ('409', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533207754,\"videoId\":\"13\",\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:13:29');
INSERT INTO `sys_log` VALUES ('410', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '40', '192.168.1.203', '2019-06-26 15:13:31');
INSERT INTO `sys_log` VALUES ('411', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533212657,\"videoId\":\"13\",\"status\":0}]', '3', '192.168.1.203', '2019-06-26 15:13:34');
INSERT INTO `sys_log` VALUES ('412', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '39', '192.168.1.203', '2019-06-26 15:13:37');
INSERT INTO `sys_log` VALUES ('413', 'hxxadmin', '文档取消发布/删除', 'com.cx.modules.web.controller.WebDocController.publishDoc()', '[{\"t\":1561533247243,\"docId\":\"12\",\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:14:09');
INSERT INTO `sys_log` VALUES ('414', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '54', '192.168.1.203', '2019-06-26 15:14:13');
INSERT INTO `sys_log` VALUES ('415', 'hxxadmin', '文档取消发布/删除', 'com.cx.modules.web.controller.WebDocController.publishDoc()', '[{\"t\":1561533260849,\"docId\":\"10\",\"status\":0}]', '4', '192.168.1.203', '2019-06-26 15:14:22');
INSERT INTO `sys_log` VALUES ('416', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '42', '192.168.1.203', '2019-06-26 15:14:25');
INSERT INTO `sys_log` VALUES ('417', 'hxxadmin', '文档取消发布/删除', 'com.cx.modules.web.controller.WebDocController.publishDoc()', '[{\"t\":1561533266081,\"docId\":\"11\",\"status\":0}]', '7', '192.168.1.203', '2019-06-26 15:14:27');
INSERT INTO `sys_log` VALUES ('418', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '20', '192.168.1.203', '2019-06-26 15:14:28');
INSERT INTO `sys_log` VALUES ('419', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '86', '192.168.1.203', '2019-06-26 15:14:33');
INSERT INTO `sys_log` VALUES ('420', 'hxxadmin', '文档取消发布/删除', 'com.cx.modules.web.controller.WebDocController.publishDoc()', '[{\"t\":1561533274723,\"docId\":\"11\",\"status\":0}]', '4', '192.168.1.203', '2019-06-26 15:14:36');
INSERT INTO `sys_log` VALUES ('421', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '9', '192.168.1.203', '2019-06-26 15:14:37');
INSERT INTO `sys_log` VALUES ('422', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '11', '192.168.1.203', '2019-06-26 15:14:44');
INSERT INTO `sys_log` VALUES ('423', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '72', '192.168.1.203', '2019-06-26 15:14:49');
INSERT INTO `sys_log` VALUES ('424', 'hxxadmin', '文档取消发布/删除', 'com.cx.modules.web.controller.WebDocController.publishDoc()', '[{\"t\":1561533307930,\"docId\":\"12\",\"status\":0}]', '4', '192.168.1.203', '2019-06-26 15:15:09');
INSERT INTO `sys_log` VALUES ('425', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '16', '192.168.1.203', '2019-06-26 15:15:10');
INSERT INTO `sys_log` VALUES ('426', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '61', '192.168.1.203', '2019-06-26 15:15:15');
INSERT INTO `sys_log` VALUES ('427', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '8', '192.168.1.203', '2019-06-26 15:15:35');
INSERT INTO `sys_log` VALUES ('428', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533341020,\"videoId\":14,\"status\":2}]', '4', '192.168.1.203', '2019-06-26 15:15:42');
INSERT INTO `sys_log` VALUES ('429', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533343081,\"videoId\":\"13\",\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:15:44');
INSERT INTO `sys_log` VALUES ('430', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '40', '192.168.1.203', '2019-06-26 15:15:46');
INSERT INTO `sys_log` VALUES ('431', 'hxxadmin', '修改网站基本设置', 'com.cx.modules.web.controller.WebHeadController.updateHead()', '[{\"headId\":4,\"headName\":\"模型网站\",\"relatedLink\":\"[{\\\"name\\\":\\\"百度\\\",\\\"url\\\":\\\"https://www.baidu.com\\\"}]\"}]', '32', '192.168.1.203', '2019-06-26 15:16:09');
INSERT INTO `sys_log` VALUES ('432', 'hxxadmin', '修改网站底部信息', 'com.cx.modules.web.controller.WebAboutController.updateAbout()', '[{\"aboutId\":7,\"aboutContent\":\"UEsDBBQACAgIAAd62k4AAAAAAAAAAAAAAAABAAAAMK1VS28aVxT+K8iLqpXS8LCN08T2povuu+g2Io7rkGAb2Y6U7gabN8PDMfgB2AS/oLEZIBAYZsDzX5J77txZ9S/03LnIAUVq1SrSCM3j3O+c833fOSwGlxe3g74Nx/bOH4HVpZmVzcDm1mPH1tqz773eB455zwPH3PwPT2aWv9t4th18Apd/0u4VPanT4wqrVs2rK7O2T5MSLSeskxxEbiGr0njOvEkRLeNxub0OGHQdLg8tx/8ayrRTh6jMPoat2D5RNTJMk1GLqDGI7BFNo619UEMYRlSdXYeIniFa6rdf2UmRpipmpgXKmfkuD9l9iPfIqPxZCv38CyTrZl4XL8xGgqhFSFY/S7v0uElUCZQeUQ+so7rAYqMm0XswlBADT48flSIen3g8o4cjsxgWfcFZigxDCIuYCGLqYdA1DBY94g0vp11gsQ7Rk1i6YAD6H2jqCjnBGmhiYBUMWq78aw2YFKvFXJyLRNpG63NiS2HIFPGrzXNTnMU6IVmyY+r0cEBGaapXWa8DuTCrynbBIUzHCUkX8CsHN6o01AT5EFtgyp1Vlmh7F/tadHIDLC860Qr/zQ3TPkhQOfRJKpPhMevWaTmNSqDIUNHMqmSrynsTPeB7+k4FYw/fs9h7FBziJXrYEmx+kk55uTbvZi4KxkfOPkIp5zTep9kcuStZN3aWQgsaR1C6g70sHuEg4Sz2xpQq18a2BbyVBctWKYqyicI4cXKEpm6t6sAsKWPVlSqmw4PcbGVMl2AXEdbaY80Cl7wQsYplmnlrnVwKEJ6iMmBKQzyi/1AM6/T8XiqabyIn4itEI6AMeF5FhsMwjxEUjQ7Mjk5GBtwdjd0T6cNlDBukhTgYN5ZUsZ0xbp/VLiDKZTZraetIsc6P8SvbGwk3oMmYJBPjlDVDIp5oNTgI8Zhu3YplkUmHqWeZEePzMehyp+tZ671s1ppmtzlpYVEH0aJEbUFTxsjpYfxqDEUq4U+iZkDLm/m6QOe4gx5vMd5CRBgYtFPiRRk5jEGJhPJYnRCE9hKQTVoHIdZvsm6Nja7phUQMLhTyDYMOZFuYeTKASVwo5NLUK0Jw2xGixl0uciItphLkI6Ld4oXbDOqh8aTbBUzuMa5545q2EyILtCU+U2oDc0E+B+02LWs8L1530cmD3AiXtfHqmJ5BGj82C1eQi2NVZHhChl2sDWINkCpj3sv1SRo5MzaNX/bSPZ/9D8yIoDvQ1NwdpRFabEyIvQEmteJy2BqJDTo5HFZegjz6KAqViu3KBFrJvDkjWoJJkX/eD898K6/WtjZfbzz/cbwq/Bv+Hb8vgCti0b++5tjeWlmaebGzE3zsdK68efHm1cuHK5vrztfBwKbv+e/+wKrTv+5bW3XiX8WCy+Py3t+451yPPK6nC65Zr/vhy+DajMMX2Fmacbnm/h/ywv2N+xH+IvL8wsL8FPLsN6p5zjU765pC9nwLZPdPT72zXq9nCtmNyF/k+RtQSwcIIqpcNVcEAADNBwAA\",\"status\":0}]', '32', '192.168.1.203', '2019-06-26 15:16:15');
INSERT INTO `sys_log` VALUES ('433', 'hxxadmin', '人员审核', 'com.cx.modules.web.controller.WebUserController.updateExamine()', '[{\"t\":1561533384121,\"userId\":66,\"examine\":\"2\",\"adminUserId\":4}]', '78', '192.168.1.203', '2019-06-26 15:16:26');
INSERT INTO `sys_log` VALUES ('434', 'hxxadmin', '修改用户信息', 'com.cx.modules.web.controller.WebUserController.update()', null, '65', '192.168.1.203', '2019-06-26 15:16:30');
INSERT INTO `sys_log` VALUES ('435', 'hxxadmin', '为单人增加或者减少积分', 'com.cx.modules.web.controller.WebUserController.updateUserIntegral()', '[{\"t\":1561533396194,\"userId\":72,\"valueId\":9,\"status\":0,\"integral\":57}]', '8', '192.168.1.203', '2019-06-26 15:16:38');
INSERT INTO `sys_log` VALUES ('436', 'hxxadmin', '为单人增加或者减少积分', 'com.cx.modules.web.controller.WebUserController.updateUserIntegral()', '[{\"t\":1561533399386,\"userId\":72,\"valueId\":10,\"status\":1,\"integral\":56}]', '19', '192.168.1.203', '2019-06-26 15:16:41');
INSERT INTO `sys_log` VALUES ('437', 'hxxadmin', '修改积分信息', 'com.cx.modules.web.controller.WebIntegralRuleController.updateDoc()', '[{\"ruleId\":1,\"valueId\":0,\"integral\":10,\"explains\":1}]', '36', '192.168.1.203', '2019-06-26 15:16:56');
INSERT INTO `sys_log` VALUES ('438', 'hxxadmin', '修改等级信息', 'com.cx.modules.web.controller.WebIntegralClassController.updateClass()', '[{\"classId\":1,\"valueId\":0,\"classIntegral\":0}]', '61', '192.168.1.203', '2019-06-26 15:17:00');
INSERT INTO `sys_log` VALUES ('439', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533432777,\"videoId\":\"12\",\"status\":0}]', '4', '192.168.1.203', '2019-06-26 15:17:14');
INSERT INTO `sys_log` VALUES ('440', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '49', '192.168.1.203', '2019-06-26 15:17:15');
INSERT INTO `sys_log` VALUES ('441', 'hxxadmin', '教程取消发布/删除', 'com.cx.modules.web.controller.WebVideoController.publishVideo()', '[{\"t\":1561533436426,\"videoId\":\"9\",\"status\":0}]', '5', '192.168.1.203', '2019-06-26 15:17:18');
INSERT INTO `sys_log` VALUES ('442', 'hxxadmin', null, 'com.cx.modules.web.controller.WebVideoController.updateVideo()', null, '24', '192.168.1.203', '2019-06-26 15:17:19');
INSERT INTO `sys_log` VALUES ('443', 'hxxadmin', null, 'com.cx.modules.web.controller.WebDocController.updateDoc()', null, '12', '192.168.1.203', '2019-06-26 15:17:23');
INSERT INTO `sys_log` VALUES ('444', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":27,\"valueId\":0,\"status\":0}]', '66', '192.168.1.203', '2019-06-26 15:17:30');
INSERT INTO `sys_log` VALUES ('445', 'hxxadmin', null, 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":27,\"newsName\":\"鞠传江：“让美国再次伟大”是否会成为空中楼阁？\",\"newsContent\":\"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', '30', '192.168.1.203', '2019-06-26 15:17:32');
INSERT INTO `sys_log` VALUES ('446', 'hxxadmin', '修改轮播信息', 'com.cx.modules.web.controller.WebBannerController.updateBanner()', '[{\"bannerId\":5,\"bannerName\":\"555\",\"coverId\":12861,\"modelId\":221,\"createUser\":4,\"status\":1}]', '3', '192.168.1.203', '2019-06-26 15:17:37');
INSERT INTO `sys_log` VALUES ('447', 'hxxadmin', '修改轮播信息', 'com.cx.modules.web.controller.WebBannerController.updateBanner()', '[{\"bannerId\":1,\"bannerName\":\"111\",\"coverId\":12857,\"modelId\":201,\"createUser\":4,\"status\":1}]', '28', '192.168.1.203', '2019-06-26 15:17:41');
INSERT INTO `sys_log` VALUES ('448', 'hxxadmin', '新闻取消发布/删除', 'com.cx.modules.web.controller.WebNewsController.publishDoc()', '[{\"newsId\":27,\"valueId\":0,\"status\":0}]', '8', '192.168.1.203', '2019-06-26 15:19:15');
INSERT INTO `sys_log` VALUES ('449', 'hxxadmin', null, 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":27,\"newsName\":\"鞠传江：“让美国再次伟大”是否会成为空中楼阁？\",\"newsContent\":\"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', '53', '192.168.1.203', '2019-06-26 15:19:17');
INSERT INTO `sys_log` VALUES ('450', 'hxxadmin', null, 'com.cx.modules.web.controller.WebNewsController.updateNews()', '[{\"newsId\":27,\"newsName\":\"鞠传江：“让美国再次伟大”是否会成为空中楼阁？\",\"newsContent\":\"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', '27', '192.168.1.203', '2019-06-26 15:19:23');
INSERT INTO `sys_log` VALUES ('451', 'dyadmin', '人员审核', 'com.cx.modules.web.controller.WebUserController.updateExamine()', '[{\"t\":1561533966963,\"userId\":72,\"examine\":\"2\",\"adminUserId\":3}]', '59', '192.168.1.202', '2019-06-26 15:26:07');
INSERT INTO `sys_log` VALUES ('452', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561534216136,\"modelId\":241,\"type\":1,\"adminUserId\":2}]', '18', '192.168.1.201', '2019-06-26 15:30:16');
INSERT INTO `sys_log` VALUES ('453', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561535021521,\"modelId\":242,\"type\":1,\"adminUserId\":2}]', '34', '192.168.1.201', '2019-06-26 15:43:42');
INSERT INTO `sys_log` VALUES ('454', 'llj123', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561535077715,\"modelId\":237,\"type\":1,\"adminUserId\":66}]', '35', '192.168.1.202', '2019-06-26 15:44:38');
INSERT INTO `sys_log` VALUES ('455', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561535380115,\"modelId\":243,\"type\":1,\"adminUserId\":2}]', '14', '192.168.1.201', '2019-06-26 15:49:40');
INSERT INTO `sys_log` VALUES ('456', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561535727104,\"modelId\":245,\"type\":1,\"adminUserId\":2}]', '39', '192.168.1.201', '2019-06-26 15:55:27');
INSERT INTO `sys_log` VALUES ('457', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561535732101,\"modelId\":244,\"type\":1,\"adminUserId\":2}]', '49', '192.168.1.201', '2019-06-26 15:55:32');
INSERT INTO `sys_log` VALUES ('458', 'dyadmin', '保存字典', 'com.cx.modules.door.controller.DoorDictionaryController.save()', '[{\"parentId\":8,\"code\":\"MXGS_FBX\",\"name\":\"fbx\",\"value\":632,\"sort\":31}]', '19', '192.168.1.202', '2019-06-27 09:22:42');
INSERT INTO `sys_log` VALUES ('459', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561599805018,\"modelId\":250,\"type\":1,\"adminUserId\":2}]', '37', '192.168.1.201', '2019-06-27 09:43:25');
INSERT INTO `sys_log` VALUES ('460', 'lljadmin', '模型审核', 'com.cx.modules.web.controller.WebModelController.saveModelVerify()', '[{\"t\":1561599814294,\"modelId\":249,\"type\":1,\"adminUserId\":2}]', '28', '192.168.1.201', '2019-06-27 09:43:34');
INSERT INTO `sys_log` VALUES ('461', 'lljadmin', '修改字典', 'com.cx.modules.door.controller.DoorDictionaryController.update()', '[{\"dictionaryId\":262,\"parentId\":0,\"code\":\"3DMQZ\",\"name\":\"模型前置名字\",\"value\":2500,\"sort\":24}]', '2', '192.168.1.201', '2019-07-01 11:43:29');
INSERT INTO `sys_log` VALUES ('462', 'admin', '删除菜单', 'com.cx.modules.sys.controller.SysMenuController.delete()', '[36]', '112', '192.168.1.203', '2019-07-02 11:03:11');
INSERT INTO `sys_log` VALUES ('463', 'admin', '删除菜单', 'com.cx.modules.sys.controller.SysMenuController.delete()', '[37]', '1', '192.168.1.203', '2019-07-02 11:03:19');
INSERT INTO `sys_log` VALUES ('464', 'admin', '删除菜单', 'com.cx.modules.sys.controller.SysMenuController.delete()', '[38]', '8', '192.168.1.203', '2019-07-02 11:03:25');
INSERT INTO `sys_log` VALUES ('465', 'hxxadmin', '保存菜单', 'com.cx.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":0,\"name\":\"测试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0,\"sta\":1}]', '12', '0:0:0:0:0:0:0:1', '2019-07-04 10:53:55');
INSERT INTO `sys_log` VALUES ('466', 'admin', '修改菜单', 'com.cx.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":69,\"parentId\":0,\"name\":\"测试\",\"type\":0,\"orderNum\":0,\"sta\":1}]', '7', '0:0:0:0:0:0:0:1', '2019-07-04 10:54:44');
INSERT INTO `sys_log` VALUES ('467', 'admin', '修改角色', 'com.cx.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[69,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,50,5,6,7,8,9,10,11,12,13,14,27,30,29,-666666]}]', '73', '0:0:0:0:0:0:0:1', '2019-07-04 10:54:52');
INSERT INTO `sys_log` VALUES ('468', 'admin', '保存菜单', 'com.cx.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":0,\"name\":\"上传图片管理\",\"url\":\"/test/upload-img-mannager\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"sta\":1}]', '17', '0:0:0:0:0:0:0:1', '2019-07-04 10:56:40');
INSERT INTO `sys_log` VALUES ('469', 'admin', '修改菜单', 'com.cx.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":70,\"parentId\":69,\"name\":\"上传图片管理\",\"url\":\"/test/upload-img-mannager\",\"type\":1,\"orderNum\":0,\"sta\":1}]', '12', '0:0:0:0:0:0:0:1', '2019-07-04 10:56:50');
INSERT INTO `sys_log` VALUES ('470', 'admin', '修改角色', 'com.cx.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[69,70,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,50,5,6,7,8,9,10,11,12,13,14,27,30,29,-666666]}]', '15', '0:0:0:0:0:0:0:1', '2019-07-04 10:57:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `sta` int(11) DEFAULT '0' COMMENT '隐藏/显示',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '后台系统管理', null, null, '0', 'system', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2', '1');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3', '1');
INSERT INTO `sys_menu` VALUES ('5', '31', 'SQL监控', 'http://192.168.1.201:8090/ModelServer/druid/sql.html', null, '1', 'sql', '4', '1');
INSERT INTO `sys_menu` VALUES ('6', '31', '定时任务', 'job/schedule', null, '1', 'job', '5', '1');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', '0');
INSERT INTO `sys_menu` VALUES ('27', '31', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6', '1');
INSERT INTO `sys_menu` VALUES ('29', '31', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7', '1');
INSERT INTO `sys_menu` VALUES ('30', '31', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6', '1');
INSERT INTO `sys_menu` VALUES ('31', '0', '后台操作管理', null, null, '0', 'shezhi', '3', '1');
INSERT INTO `sys_menu` VALUES ('50', '31', 'DB数据库备份', 'sys/db', null, '1', 'config', '0', '1');
INSERT INTO `sys_menu` VALUES ('69', '0', '测试', null, null, '0', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('70', '69', '上传图片管理', '/test/upload-img-mannager', null, '1', null, '0', '1');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '管理员', '1', '2019-02-13 14:14:06');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('955', '1', '69');
INSERT INTO `sys_role_menu` VALUES ('956', '1', '70');
INSERT INTO `sys_role_menu` VALUES ('957', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('958', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('959', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('960', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('961', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('962', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('963', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('964', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('965', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('966', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('967', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('968', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('969', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('970', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('971', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('972', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('973', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('974', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('975', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('976', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('977', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('978', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('979', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('980', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('981', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('982', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('983', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('984', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('985', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('986', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('987', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('988', '1', '-666666');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '4', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'lljadmin', '1a535ed81d7135ee8e1ce87b21375d70f8d5dfd6bfd538264de6303f62af52ec', 'xoYsi7DcAh3UynzQpK8U', '1@qq.com', '12345678911', '1', '4', '2019-02-13 14:13:22');
INSERT INTO `sys_user` VALUES ('3', 'dyadmin', '1732f3971d637a7a571825fcbdacf4c664280b36ccbc215966c7c54eebbab67b', '29Tll1EiLT81ckMwVUSI', '1@qq.com', '13245679812', '1', '1', '2019-02-13 14:14:28');
INSERT INTO `sys_user` VALUES ('4', 'hxxadmin', 'c6951f3e77fe1adc91c910d7420bb8f5d4453000b2afb2841ba8a32560c1e730', 'YeGzaH60XGWWyCbcslgG', '1@qq.com', '13246578912', '1', '4', '2019-02-13 14:14:42');
INSERT INTO `sys_user` VALUES ('5', 'lykadmin', '1732f3971d637a7a571825fcbdacf4c664280b36ccbc215966c7c54eebbab67b', '29Tll1EiLT81ckMwVUSI', '123@qq.com', '13678900987', '1', '4', '2019-05-07 17:11:05');
INSERT INTO `sys_user` VALUES ('6', 'zadmin', 'e4abb2088c4596c55ec05019eb8d2d2d3ed8135de642cc11b2751a6a12cb02d4', 'vheOAdfjrga39Df6J4Z9', '1@qq.com', '12345678912', '1', '4', '2019-05-17 14:52:53');
INSERT INTO `sys_user` VALUES ('66', 'llj123', '56aace3d5b250ddc449f4df62cfccc6a7fa5f7d0f58e61d015c74191f032955d', 'yOchsiZ6Q1oUgeDoRKfb', null, null, '1', '0', '2019-06-20 09:10:36');
INSERT INTO `sys_user` VALUES ('69', 'dy1234', '6737480e5a884686054f920ebc9f73f21ae75f451b915449a7bcbf0f5c86baf8', 'NxTiFfO64iLp3R4NQCAe', null, null, '1', '0', '2019-06-20 14:12:52');
INSERT INTO `sys_user` VALUES ('70', 'hxx123', 'cff950fae00f8ab11635a47d6f1e90b35569559c34fe1582b9adfcb1821d8a03', 'wXfIv1MvHHn83gaaG0Pd', null, null, '1', '0', '2019-06-20 14:14:01');
INSERT INTO `sys_user` VALUES ('71', 'lyklyk', '912f187fbc0004b2cf243e6b6ac84b591cfd3c12f194a75bae78ef9bae0a0518', 'vBS9UCDkJRMsKpbFyXS8', null, null, '1', '0', '2019-06-21 16:43:10');
INSERT INTO `sys_user` VALUES ('72', 'llj124', '2b5943378f24a061bc6667a753e9956737c41ccc0e41f27aeb4e727833168aa5', '7BtKRMEilvEEKohJgLy9', null, null, '1', '0', '2019-06-24 13:55:26');

-- ----------------------------
-- Table structure for sys_user_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_file`;
CREATE TABLE `sys_user_file` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `fileSize` double(20,0) DEFAULT NULL,
  `originalName` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_file
-- ----------------------------
INSERT INTO `sys_user_file` VALUES ('6', '259587ad0036adccc0ccc1e0a7ef1e9c', './public/download/', '107920', '1559241193499_1.jpg', 'jpg');
INSERT INTO `sys_user_file` VALUES ('7', '20a7bdb8231f5302a27da3764ac890be', './public/download/', '65949', 'e0dc1e3d787e4a959ff1c1c2df3ad40c.jpg', 'jpg');
INSERT INTO `sys_user_file` VALUES ('8', 'd29ff44d12a59af3e36e1ea10c973da9', './public/download/', '49839', 'large (10).jpg', 'jpg');
INSERT INTO `sys_user_file` VALUES ('9', '1d5fbd8c1c9ac03d87361f95b2055750', './public/download/', '149287', 'large.png', 'png');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('10', '3', '1');
INSERT INTO `sys_user_role` VALUES ('31', '4', '1');
INSERT INTO `sys_user_role` VALUES ('33', '2', '1');
INSERT INTO `sys_user_role` VALUES ('35', '6', '1');
INSERT INTO `sys_user_role` VALUES ('37', '1', '1');
INSERT INTO `sys_user_role` VALUES ('39', '5', '1');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'f8eb16f4a6c97c436b92df2172a1d14f', '2019-07-04 22:54:17', '2019-07-04 10:54:17');
INSERT INTO `sys_user_token` VALUES ('2', '8295396563093e0fe8b6fd2fb343e486', '2019-07-02 21:17:29', '2019-07-02 09:17:29');
INSERT INTO `sys_user_token` VALUES ('3', '1c64c7deaf3646a38cd2d8d304767686', '2019-06-28 21:19:37', '2019-06-28 09:19:37');
INSERT INTO `sys_user_token` VALUES ('4', '84187b568441992b28d6bb44252023fb', '2019-07-04 22:58:39', '2019-07-04 10:58:39');
INSERT INTO `sys_user_token` VALUES ('5', '045b46a57e03979ba62c19f06a163b3b', '2019-06-22 04:41:47', '2019-06-21 16:41:47');
INSERT INTO `sys_user_token` VALUES ('9', 'c6006fa0da40b582686f00f230ae3ec9', '2019-04-13 02:23:51', '2019-04-12 14:23:51');
INSERT INTO `sys_user_token` VALUES ('10', 'b0341d9104b066a42ff44b6cc9214f1d', '2019-04-13 02:26:53', '2019-04-12 14:26:53');
INSERT INTO `sys_user_token` VALUES ('11', '3c62c7e1a26682f476acdcd1e3704ca9', '2019-04-13 02:27:24', '2019-04-12 14:27:24');
INSERT INTO `sys_user_token` VALUES ('12', 'c73b5a3562dbf01081730899ea4b6e5b', '2019-04-13 02:32:31', '2019-04-12 14:32:31');
INSERT INTO `sys_user_token` VALUES ('13', '763f0b4f1f2aa0ccc08ab17e36a0f81c', '2019-04-13 02:35:13', '2019-04-12 14:35:13');
INSERT INTO `sys_user_token` VALUES ('14', 'e12be6f1901744db0f5c223013b8262f', '2019-04-13 02:36:17', '2019-04-12 14:36:17');
INSERT INTO `sys_user_token` VALUES ('15', '5ef147a8e57060fb51f8e0fbef557c54', '2019-04-13 02:37:15', '2019-04-12 14:37:15');
INSERT INTO `sys_user_token` VALUES ('16', 'e86cb38ba203c3eaecc8df1c0e47aa4a', '2019-04-13 02:41:22', '2019-04-12 14:41:22');
INSERT INTO `sys_user_token` VALUES ('17', '7b61a3c3e2bcde3820b204ed19c9984a', '2019-04-13 02:44:12', '2019-04-12 14:44:12');
INSERT INTO `sys_user_token` VALUES ('18', '56a885c166faadb2c6f8db274abf1d61', '2019-04-13 04:11:58', '2019-04-12 16:11:58');
INSERT INTO `sys_user_token` VALUES ('19', 'b2ef9918e4f800b9e1d53ef9119df9eb', '2019-05-15 04:17:48', '2019-05-14 16:17:48');
INSERT INTO `sys_user_token` VALUES ('20', '2ce65c33c39360369409991e2a564e21', '2019-05-05 23:02:34', '2019-05-05 11:02:34');
INSERT INTO `sys_user_token` VALUES ('21', '8d5942277e19e42fe3d7d6bc51306780', '2019-05-05 23:07:19', '2019-05-05 11:07:19');
INSERT INTO `sys_user_token` VALUES ('22', '64bbea83af35feeaf7880c8ae2164048', '2019-05-06 04:06:15', '2019-05-05 16:06:15');
INSERT INTO `sys_user_token` VALUES ('23', 'f828dafc7aac66507d68126d87e4a3c1', '2019-05-06 05:44:22', '2019-05-05 17:44:22');
INSERT INTO `sys_user_token` VALUES ('24', '2accec662755542deaf1c7e5d4825f94', '2019-05-15 04:39:46', '2019-05-14 16:39:46');
INSERT INTO `sys_user_token` VALUES ('28', 'faf47604687cfa94064c0dc5578241db', '2019-06-15 03:01:22', '2019-06-14 15:01:22');
INSERT INTO `sys_user_token` VALUES ('29', '02e4120916693633b8b817452b8c6f3e', '2019-05-09 02:30:07', '2019-05-08 14:30:07');
INSERT INTO `sys_user_token` VALUES ('34', 'f0df833e64916a1eb949b5f6855f2a60', '2019-06-19 02:51:02', '2019-06-18 14:51:02');
INSERT INTO `sys_user_token` VALUES ('35', '2d6256c4c0f529570b9c9ecaab7e26dd', '2019-06-19 04:21:12', '2019-06-18 16:21:12');
INSERT INTO `sys_user_token` VALUES ('36', 'e897ff384b04b33d8ef760023f61d937', '2019-05-17 22:27:09', '2019-05-17 10:27:09');
INSERT INTO `sys_user_token` VALUES ('37', 'cf9902939b017ea0aaf961489032b11a', '2019-06-15 02:30:54', '2019-06-14 14:30:54');
INSERT INTO `sys_user_token` VALUES ('38', '7c6ec5dc5648b9c9d6d727ec72b4e774', '2019-06-19 02:04:55', '2019-06-18 14:04:55');
INSERT INTO `sys_user_token` VALUES ('40', 'fb848e2a0b766ed489946fe5fb6a53e8', '2019-05-18 02:53:34', '2019-05-17 14:53:34');
INSERT INTO `sys_user_token` VALUES ('41', '28ba132edd634685e7ddd9d73ef0e0d6', '2019-05-18 02:55:06', '2019-05-17 14:55:06');
INSERT INTO `sys_user_token` VALUES ('44', '737cc5cdcfbcb6d6c84f2a3da7b12900', '2019-06-18 03:37:48', '2019-06-17 15:37:48');
INSERT INTO `sys_user_token` VALUES ('45', 'ee5b736b86a9e951e8964a6ffa54e7a0', '2019-05-31 02:33:45', '2019-05-30 14:33:45');
INSERT INTO `sys_user_token` VALUES ('47', 'f7dd36e4bd2fb1e53e17060507832476', '2019-06-13 23:04:33', '2019-06-13 11:04:33');
INSERT INTO `sys_user_token` VALUES ('54', '6e3026e418ddfbc9e714b6bcb2aaed80', '2019-06-13 02:33:30', '2019-06-12 14:33:30');
INSERT INTO `sys_user_token` VALUES ('55', '6414e1ffb503b44cc7346b23b695f3f4', '2019-06-14 01:56:02', '2019-06-13 13:56:02');
INSERT INTO `sys_user_token` VALUES ('56', '8d44317c87c7e81852b65d60a4816b0f', '2019-06-19 05:29:34', '2019-06-18 17:29:34');
INSERT INTO `sys_user_token` VALUES ('58', '1caf1cc8b236b4cfea2e2005e99fd35e', '2019-06-14 23:15:55', '2019-06-14 11:15:55');
INSERT INTO `sys_user_token` VALUES ('59', 'f04fb9aaae6301f8bb94cd49fe75aec1', '2019-06-20 03:53:12', '2019-06-19 15:53:12');
INSERT INTO `sys_user_token` VALUES ('60', 'd285c0279f8e9f13d960f605afe9b6c8', '2019-06-14 23:00:40', '2019-06-14 11:00:40');
INSERT INTO `sys_user_token` VALUES ('62', '0c9e50f725f1a3f204cf9041d43052be', '2019-06-14 00:01:33', '2019-06-13 12:01:33');
INSERT INTO `sys_user_token` VALUES ('63', 'd1f031d9ebc66d40290c186bd68539ea', '2019-06-18 03:56:12', '2019-06-17 15:56:12');
INSERT INTO `sys_user_token` VALUES ('64', 'a473856961f12a789e50219ccd6a1053', '2019-06-18 04:36:06', '2019-06-17 16:36:06');
INSERT INTO `sys_user_token` VALUES ('66', 'ab77ec6d2787caedff761f8603408539', '2019-07-02 04:46:16', '2019-07-01 16:46:16');
INSERT INTO `sys_user_token` VALUES ('68', 'a19b8b65b708f566eab0867e4b63dfd4', '2019-06-20 21:32:27', '2019-06-20 09:32:27');
INSERT INTO `sys_user_token` VALUES ('69', '144bcb1d01a1a22de82aa9120eb54262', '2019-06-26 21:43:10', '2019-06-26 09:43:10');
INSERT INTO `sys_user_token` VALUES ('70', '5c6b58739b4ab89c8aab88a8b3365344', '2019-06-27 03:20:54', '2019-06-26 15:20:54');
INSERT INTO `sys_user_token` VALUES ('71', '1c93a9af30afe3452c09e30121e2964e', '2019-06-26 04:24:38', '2019-06-25 16:24:38');
INSERT INTO `sys_user_token` VALUES ('72', 'eb6bc058c6397954ef7be0a0e89f339e', '2019-06-27 03:13:52', '2019-06-26 15:13:52');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
