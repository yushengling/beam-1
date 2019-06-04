/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : beam

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2019-04-24 13:49:00
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
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
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
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1080345897063223297', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');

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
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1080345897063223297', 'DEFAULT', null, 'com.hsshy.beam.common.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002B636F6D2E68737368792E6265616D2E7379732E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000269647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872002C636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E52657374456E74697479EE8CF07CFDCA369C0200024C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000A75706461746554696D6571007E000D78720030636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E4162737472616374456E74697479040721C4286B1A7C0200024A000B63757272656E74506167654A00087061676553697A6578720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C000000000000000102000078700000000000000000000000000000000A737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001680D307CA078163B87407371007E00117708000001680D307CA078163B8740740008746573745461736B74000B30202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700EFE28DE95011001740005746573743270740006E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0018000000007800);

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
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-JP1B0EBJ1556084639631', '1556084927671', '15000');

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
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
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
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
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
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1080345897063223297', 'DEFAULT', 'TASK_1080345897063223297', 'DEFAULT', null, '1546409520000', '-1', '5', 'PAUSED', 'CRON', '1546409508000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002B636F6D2E68737368792E6265616D2E7379732E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000269647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872002C636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E52657374456E74697479EE8CF07CFDCA369C0200024C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000A75706461746554696D6571007E000D78720030636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E4162737472616374456E74697479040721C4286B1A7C0200024A000B63757272656E74506167654A00087061676553697A6578720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C000000000000000102000078700000000000000000000000000000000A7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001680D307CA0787371007E00117708000001680D3654B878740008746573745461736B74000B30202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700EFE28DE95011001740005746573743270740006E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0017000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080345897063223298 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1080345897063223297', 'testTask', 'test2', null, '0 * * * * ?', '0', '测试', '2019-01-02 06:11:48', '2019-01-02 06:18:11');

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
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"\",\"qiniuBucketName\":\"\",\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuSecretKey\":\"\",\"type\":1}', '1', '云存储配置信息', null, null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总公司', '0', '0', '2018-12-18 21:43:48', '2018-12-18 21:43:53');
INSERT INTO `sys_dept` VALUES ('2', '1', '厦门分公司', '1', '0', '2018-12-22 23:28:09', '2018-12-22 23:28:11');
INSERT INTO `sys_dept` VALUES ('3', '1', '福州分公司', '2', '0', '2018-12-22 23:28:14', '2018-12-22 23:28:16');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0', '2018-12-22 23:28:18', '2018-12-22 23:28:21');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售部', '1', '0', '2018-12-22 23:28:23', '2018-12-22 15:30:34');
INSERT INTO `sys_dept` VALUES ('1076499576671084546', '2', '技术部', '1', '0', '2018-12-22 15:27:54', '2018-12-22 15:27:54');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0', '0', '顶级', '顶级', null, '0', '2019-04-13 15:55:58', '2019-04-13 15:56:01');
INSERT INTO `sys_dict` VALUES ('16', '0', '状态', '', 'frozen', '1', '2019-04-12 10:50:21', '2019-04-13 07:30:04');
INSERT INTO `sys_dict` VALUES ('17', '16', '启用', null, '1', '1', '2019-04-12 10:50:25', '2019-04-12 10:50:28');
INSERT INTO `sys_dict` VALUES ('18', '16', '禁用', null, '0', '2', '2019-04-12 10:50:30', '2019-04-12 10:50:33');
INSERT INTO `sys_dict` VALUES ('29', '0', '性别', '', 'sex', '2', '2019-04-12 10:50:36', '2019-04-13 07:29:59');
INSERT INTO `sys_dict` VALUES ('30', '29', '男', null, '1', '1', '2019-04-12 10:50:41', '2019-04-12 10:50:43');
INSERT INTO `sys_dict` VALUES ('31', '29', '女', null, '2', '2', '2019-04-12 10:50:46', '2019-04-12 10:50:48');
INSERT INTO `sys_dict` VALUES ('32', '0', '菜单类型', null, 'menu_type', '3', '2019-04-12 18:30:54', '2019-04-12 18:30:57');
INSERT INTO `sys_dict` VALUES ('33', '32', '目录', null, '0', '1', '2019-04-12 18:31:48', '2019-04-12 18:31:50');
INSERT INTO `sys_dict` VALUES ('34', '32', '菜单', null, '1', '2', '2019-04-12 18:32:10', '2019-04-12 18:32:12');
INSERT INTO `sys_dict` VALUES ('35', '32', '按钮', null, '2', '3', '2019-04-12 18:32:25', '2019-04-12 18:32:28');
INSERT INTO `sys_dict` VALUES ('36', '0', '定时任务状态', null, 'schedule_status', '4', '2019-04-13 11:49:28', '2019-04-13 11:49:30');
INSERT INTO `sys_dict` VALUES ('37', '36', '正常', null, '1', '1', '2019-04-13 11:50:08', '2019-04-13 11:50:10');
INSERT INTO `sys_dict` VALUES ('38', '36', '暂停', null, '0', '2', '2019-04-13 11:50:24', '2019-04-13 11:50:27');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_name` varchar(64) DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `succeed` varchar(32) DEFAULT NULL COMMENT '是否成功',
  `message` varchar(64) DEFAULT NULL COMMENT '消息',
  `ip_address` varchar(64) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1120926408462315523 DEFAULT CHARSET=utf8mb4 COMMENT='登陆日志';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1116607692266295298', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 07:43:14', '2019-04-12 07:43:14');
INSERT INTO `sys_login_log` VALUES ('1116610428894478338', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 07:54:07', '2019-04-12 07:54:07');
INSERT INTO `sys_login_log` VALUES ('1116613559560773634', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 08:06:33', '2019-04-12 08:06:33');
INSERT INTO `sys_login_log` VALUES ('1116617330449788930', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 08:21:32', '2019-04-12 08:21:32');
INSERT INTO `sys_login_log` VALUES ('1116630937606553602', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 09:15:36', '2019-04-12 09:15:36');
INSERT INTO `sys_login_log` VALUES ('1116640975788244994', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 09:55:29', '2019-04-12 09:55:29');
INSERT INTO `sys_login_log` VALUES ('1116643733232709634', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:06:27', '2019-04-12 10:06:27');
INSERT INTO `sys_login_log` VALUES ('1116647553618681857', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:21:38', '2019-04-12 10:21:38');
INSERT INTO `sys_login_log` VALUES ('1116648308782178305', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:24:38', '2019-04-12 10:24:38');
INSERT INTO `sys_login_log` VALUES ('1116648642766176258', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:25:57', '2019-04-12 10:25:57');
INSERT INTO `sys_login_log` VALUES ('1116892866972930049', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 02:36:25', '2019-04-13 02:36:25');
INSERT INTO `sys_login_log` VALUES ('1116893706152497153', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 02:39:45', '2019-04-13 02:39:45');
INSERT INTO `sys_login_log` VALUES ('1116898478788104193', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 02:58:43', '2019-04-13 02:58:43');
INSERT INTO `sys_login_log` VALUES ('1116907040935505922', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 03:32:44', '2019-04-13 03:32:44');
INSERT INTO `sys_login_log` VALUES ('1116911588097863681', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 03:50:48', '2019-04-13 03:50:48');
INSERT INTO `sys_login_log` VALUES ('1116932311302459394', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 05:13:09', '2019-04-13 05:13:09');
INSERT INTO `sys_login_log` VALUES ('1116961679538049025', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 07:09:51', '2019-04-13 07:09:51');
INSERT INTO `sys_login_log` VALUES ('1116962286449688578', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 07:12:16', '2019-04-13 07:12:16');
INSERT INTO `sys_login_log` VALUES ('1117681444483776514', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-04-15 06:49:57', '2019-04-15 06:49:57');
INSERT INTO `sys_login_log` VALUES ('1117686787204988929', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-15 07:11:10', '2019-04-15 07:11:10');
INSERT INTO `sys_login_log` VALUES ('1118047087594897410', '登录日志', '1', '成功', null, '0:0:0:0:0:0:0:1', '2019-04-16 07:02:53', '2019-04-16 07:02:53');
INSERT INTO `sys_login_log` VALUES ('1118395174683222018', '登录日志', '1', '成功', null, '0:0:0:0:0:0:0:1', '2019-04-17 06:06:03', '2019-04-17 06:06:03');
INSERT INTO `sys_login_log` VALUES ('1120926408462315522', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-24 05:44:16', '2019-04-24 05:44:16');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统首页', 'dashboard', 'sys:dashboard:info', '1', 'el-icon-lx-home', '0', '1', '1', '2018-12-06 14:54:07', '2018-12-06 14:54:09', '0');
INSERT INTO `sys_menu` VALUES ('15', '0', '系统管理', 'sys', null, '0', 'el-icon-lx-settings', '15', '1', '1', '2018-12-10 17:52:34', '2018-12-10 17:52:37', '0');
INSERT INTO `sys_menu` VALUES ('16', '15', '用户管理', 'sysuser', 'sys:user:list', '1', null, '16', '1', '1', '2018-12-10 18:28:59', '2019-01-02 10:38:09', '0');
INSERT INTO `sys_menu` VALUES ('17', '15', '角色管理', 'sysrole', 'sys:role:list', '1', null, '17', '1', '1', '2018-12-10 18:35:34', '2019-01-03 01:33:09', '0');
INSERT INTO `sys_menu` VALUES ('18', '15', '菜单管理', 'sysmenu', 'sys:menu:tree', '1', null, '18', '1', '1', '2018-12-10 18:36:16', '2019-01-03 01:39:01', '0');
INSERT INTO `sys_menu` VALUES ('19', '15', '部门管理', 'sysdept', 'sys:dept:tree', '1', null, '19', '1', '1', '2018-12-10 18:37:20', '2019-01-03 01:41:49', '0');
INSERT INTO `sys_menu` VALUES ('21', '15', '定时任务', 'schedulejob', 'sys:schedule:list', '1', null, '21', '1', '1', '2018-12-10 18:39:14', '2019-01-03 01:42:33', '0');
INSERT INTO `sys_menu` VALUES ('1080412372541181953', '16', '新增/编辑', 'sys/user/save', 'sys:user:save', '2', null, '1', null, null, '2019-01-02 10:35:57', '2019-04-15 07:21:26', '0');
INSERT INTO `sys_menu` VALUES ('1080413095496585218', '16', '删除', 'sys/user/del', 'sys:user:del', '2', null, '2', null, null, '2019-01-02 10:38:50', '2019-04-15 07:21:36', '0');
INSERT INTO `sys_menu` VALUES ('1080636440926232577', '16', '重置密码', 'sys/user/reset/password', 'sys:user:resetPassword', '2', null, '3', null, null, '2019-01-03 01:26:19', '2019-04-15 07:21:46', '0');
INSERT INTO `sys_menu` VALUES ('1080636634896015362', '16', '修改密码', 'sys/user/change/password', 'sys:user:changePassword', '2', null, '4', null, null, '2019-01-03 01:27:06', '2019-04-15 07:21:52', '0');
INSERT INTO `sys_menu` VALUES ('1080637598663188481', '17', '新增/编辑', 'sys/role/save', 'sys:role:save', '2', null, '1', null, null, '2019-01-03 01:30:55', '2019-04-15 07:22:07', '0');
INSERT INTO `sys_menu` VALUES ('1080637823859564545', '17', '删除', 'sys/role/del', 'sys:role:del', '2', null, '2', null, null, '2019-01-03 01:31:49', '2019-04-15 07:22:21', '0');
INSERT INTO `sys_menu` VALUES ('1080638043456544769', '17', '权限配置', 'sys/role/save/menu/perm', 'sys:role:saveMenuPerm', '2', null, '3', null, null, '2019-01-03 01:32:42', '2019-04-15 07:22:28', '0');
INSERT INTO `sys_menu` VALUES ('1080639293405274114', '18', '保存', 'sys/menu/save', 'sys:menu:save', '2', null, '1', null, null, '2019-01-03 01:37:40', '2019-04-15 07:22:43', '0');
INSERT INTO `sys_menu` VALUES ('1080639432148656130', '18', '删除', 'sys/menu/del', 'sys:menu:delete', '2', null, '2', null, null, '2019-01-03 01:38:13', '2019-04-15 07:22:48', '0');
INSERT INTO `sys_menu` VALUES ('1080639575438663681', '18', '详情', 'sys/menu/info', 'sys:menu:info', '2', null, '3', null, null, '2019-01-03 01:38:47', '2019-04-15 07:22:54', '0');
INSERT INTO `sys_menu` VALUES ('1080639863587348482', '19', '保存', 'sys/dept/save', 'sys:dept:save', '2', null, '1', null, null, '2019-01-03 01:39:55', '2019-04-15 07:23:01', '0');
INSERT INTO `sys_menu` VALUES ('1080640119691550722', '19', '删除', 'sys/dept/del', 'sys:dept:del', '2', null, '2', null, null, '2019-01-03 01:40:57', '2019-04-15 07:23:07', '0');
INSERT INTO `sys_menu` VALUES ('1080640228772814849', '19', '详情', 'sys/dept/info', 'sys:dept:info', '2', null, '3', null, null, '2019-01-03 01:41:23', '2019-04-15 07:23:13', '0');
INSERT INTO `sys_menu` VALUES ('1080640763785650177', '21', '新增', 'sys/schedule/save', 'sys:schedule:save', '2', null, '1', null, null, '2019-01-03 01:43:30', '2019-04-15 07:23:35', '0');
INSERT INTO `sys_menu` VALUES ('1080640900176027650', '21', '修改', 'sys/schedule/update', 'sys:schedule:update', '2', null, '2', null, null, '2019-01-03 01:44:03', '2019-04-15 07:23:28', '0');
INSERT INTO `sys_menu` VALUES ('1080641066287243266', '21', '删除', 'sys/schedule/del', 'sys:schedule:del', '2', null, '3', null, null, '2019-01-03 01:44:42', '2019-04-15 07:23:44', '0');
INSERT INTO `sys_menu` VALUES ('1116603445676101634', '15', '登陆日志', 'loginlog', 'sys:loginLog:list', '1', null, '22', null, null, '2019-04-12 07:26:22', '2019-04-15 07:14:49', '0');
INSERT INTO `sys_menu` VALUES ('1116613754159702018', '15', '业务日志', 'operationlog', 'sys:operationLog:list', '1', null, '23', null, null, '2019-04-12 08:07:19', '2019-04-15 07:18:14', '0');
INSERT INTO `sys_menu` VALUES ('1116961835054452737', '15', '字典管理', 'sysdict', 'sys:dict:list', '1', null, '24', null, null, '2019-04-13 07:10:28', '2019-04-15 07:18:41', '0');
INSERT INTO `sys_menu` VALUES ('1117688867416195074', '1116961835054452737', '新增/编辑', 'sys/dict/save', 'sys:dict:save', '2', null, '1', null, null, '2019-04-15 07:19:26', '2019-04-15 07:24:11', '0');
INSERT INTO `sys_menu` VALUES ('1117689069371932674', '1116961835054452737', '删除', 'sys/dict/delete', 'sys:dict:del', '2', null, '2', null, null, '2019-04-15 07:20:14', '2019-04-15 07:24:16', '0');
INSERT INTO `sys_menu` VALUES ('1117690423326818305', '1116603445676101634', '清空日志', 'sys/loginLog/clear', 'sys:loginLog:clear', '2', null, '1', null, null, '2019-04-15 07:25:37', '2019-04-15 07:25:37', '0');
INSERT INTO `sys_menu` VALUES ('1117690805209808898', '1116613754159702018', '清空日志', 'sys/operationLog/clear', 'sys:operationLog:clear', '2', null, '2', null, null, '2019-04-15 07:27:08', '2019-04-15 07:27:08', '0');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(32) DEFAULT NULL COMMENT '日志类型',
  `log_name` varchar(64) DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `class_name` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `succeed` varchar(32) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1116618489721860098 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('1116618489721860097', '业务日志', '清空日志', '1', 'com.hsshy.beam.sys.controller.OperationLogController', 'clear', '成功', '', '2019-04-12 08:26:08', '2019-04-12 08:26:08');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '超级管理员', '2018-10-10 22:39:38', '2018-12-23 11:45:49');
INSERT INTO `sys_role` VALUES ('1076685137679704065', '游客', '游客', '2018-12-23 03:45:15', '2019-04-12 07:12:41');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('168', '1076685137679704065', '1');
INSERT INTO `sys_role_menu` VALUES ('169', '1076685137679704065', '15');
INSERT INTO `sys_role_menu` VALUES ('170', '1076685137679704065', '16');
INSERT INTO `sys_role_menu` VALUES ('171', '1076685137679704065', '17');
INSERT INTO `sys_role_menu` VALUES ('172', '1076685137679704065', '18');
INSERT INTO `sys_role_menu` VALUES ('173', '1076685137679704065', '19');
INSERT INTO `sys_role_menu` VALUES ('174', '1076685137679704065', '21');
INSERT INTO `sys_role_menu` VALUES ('175', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('176', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('177', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('178', '1', '1080412372541181953');
INSERT INTO `sys_role_menu` VALUES ('179', '1', '1080413095496585218');
INSERT INTO `sys_role_menu` VALUES ('180', '1', '1080636440926232577');
INSERT INTO `sys_role_menu` VALUES ('181', '1', '1080636634896015362');
INSERT INTO `sys_role_menu` VALUES ('182', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('183', '1', '1080637598663188481');
INSERT INTO `sys_role_menu` VALUES ('184', '1', '1080637823859564545');
INSERT INTO `sys_role_menu` VALUES ('185', '1', '1080638043456544769');
INSERT INTO `sys_role_menu` VALUES ('186', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('187', '1', '1080639293405274114');
INSERT INTO `sys_role_menu` VALUES ('188', '1', '1080639432148656130');
INSERT INTO `sys_role_menu` VALUES ('189', '1', '1080639575438663681');
INSERT INTO `sys_role_menu` VALUES ('190', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('191', '1', '1080639863587348482');
INSERT INTO `sys_role_menu` VALUES ('192', '1', '1080640119691550722');
INSERT INTO `sys_role_menu` VALUES ('193', '1', '1080640228772814849');
INSERT INTO `sys_role_menu` VALUES ('194', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('195', '1', '1080640763785650177');
INSERT INTO `sys_role_menu` VALUES ('196', '1', '1080640900176027650');
INSERT INTO `sys_role_menu` VALUES ('197', '1', '1080641066287243266');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `dept_id` bigint(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'https://wx.qlogo.cn/mmopen/vi_32/WgSOjJRaQq8FbBHGAr5gLHdaVia7SrnOwRZ9TL8lcDicXuMgqSR8rVgebFa9uIRiaLzYrPdtIia3jqjzkHVVOS38sw/132', 'admin', 'aa0d7f0f4fc75910c2cab9a3547d4ec5fdfea6095c27fd2d13e17dc216df3581', 'BFDze8hBJwwhOw3BDvhg', 'admin', '4', '2018-10-08 16:05:42', '1', '457030599@qq.com', '1', '1', null, null, null, '2018-10-31 17:48:40', '2019-01-06 05:57:02', '0');
INSERT INTO `sys_user` VALUES ('1072429679148908546', 'https://wx.qlogo.cn/mmopen/vi_32/WgSOjJRaQq8FbBHGAr5gLHdaVia7SrnOwRZ9TL8lcDicXuMgqSR8rVgebFa9uIRiaLzYrPdtIia3jqjzkHVVOS38sw/132', 'test', '7848e5f0b4a6d48ad145984735bf98efe2ff2ab4f99a92b2c29201207ea3fe5f', 'ZCCRZ4gOfa8WzorCBFii', 'test', '3', null, null, null, null, '1', null, null, null, '2018-12-11 09:55:35', '2019-03-22 10:10:57', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '1058283224922398721', '1');
INSERT INTO `sys_user_role` VALUES ('20', '1', '1');
INSERT INTO `sys_user_role` VALUES ('21', '1072429679148908546', '1076685137679704065');
