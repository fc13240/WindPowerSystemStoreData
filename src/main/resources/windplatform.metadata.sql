/*
Navicat PGSQL Data Transfer

Source Server         : vm101
Source Server Version : 90602
Source Host           : 10.0.2.101:5432
Source Database       : windpowerdb
Source Schema         : metadata

Target Server Type    : PGSQL
Target Server Version : 90602
File Encoding         : 65001

Date: 2017-06-01 20:44:54
*/


-- ----------------------------
-- Sequence structure for hibernate_sequence
-- ----------------------------
DROP SEQUENCE IF EXISTS "metadata"."hibernate_sequence";
CREATE SEQUENCE "metadata"."hibernate_sequence"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 17
 CACHE 1;
SELECT setval('"metadata"."hibernate_sequence"', 17, true);

-- ----------------------------
-- Sequence structure for plcs
-- ----------------------------
DROP SEQUENCE IF EXISTS "metadata"."plcs";
CREATE SEQUENCE "metadata"."plcs"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 127
 CACHE 1;
SELECT setval('"metadata"."plcs"', 127, true);

-- ----------------------------
-- Table structure for plcfile
-- ----------------------------
DROP TABLE IF EXISTS "metadata"."plcfile";
CREATE TABLE "metadata"."plcfile" (
"file_id" int2 DEFAULT nextval('"metadata".plcs'::regclass) NOT NULL,
"farm_id" int2 NOT NULL,
"file_name" varchar(255) COLLATE "default",
"file_store" oid,
"file_type" varchar(255) COLLATE "default",
"from_timestamp" timestamp(6),
"machine_id" int2 NOT NULL,
"to_timestamp" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of plcfile
-- ----------------------------

-- ----------------------------
-- Table structure for t_farm_info
-- ----------------------------
DROP TABLE IF EXISTS "metadata"."t_farm_info";
CREATE TABLE "metadata"."t_farm_info" (
"farm_id" int2 NOT NULL,
"farm_directory_name" text COLLATE "default",
"farm_name" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_farm_info
-- ----------------------------
INSERT INTO "metadata"."t_farm_info" VALUES ('1', 'C:\hxydData', '贵州花溪云顶风场');
INSERT INTO "metadata"."t_farm_info" VALUES ('2', 'C:\longfengData', '株洲龙凤风场');

-- ----------------------------
-- Table structure for t_machine_info
-- ----------------------------
DROP TABLE IF EXISTS "metadata"."t_machine_info";
CREATE TABLE "metadata"."t_machine_info" (
"machine_id" int2 NOT NULL,
"farm_id" int2 NOT NULL,
"ip" varchar(255) COLLATE "default",
"machine_comment" varchar(255) COLLATE "default",
"machine_type" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_machine_info
-- ----------------------------
INSERT INTO "metadata"."t_machine_info" VALUES ('101', '1', '193.168.1.130', '花溪云顶1号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('102', '1', '193.168.10.130', '花溪云顶10号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('103', '1', '193.168.1.131', '花溪云顶2号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('104', '1', '193.168.1.132', '花溪云顶3号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('105', '1', '193.168.1.133', '花溪云顶4号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('106', '1', '193.168.1.134', '花溪云顶5号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('107', '1', '193.168.1.136', '花溪云顶6号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('108', '1', '193.168.1.137', '花溪云顶7号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('109', '1', '193.168.1.138', '花溪云顶8号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('110', '1', '193.168.1.139', '花溪云顶9号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('201', '2', '172.17.1.230', '株洲龙凤1号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('202', '2', '172.17.2.230', '株洲龙凤2号风机', 'WT1500-AC500');
INSERT INTO "metadata"."t_machine_info" VALUES ('203', '2', '172.17.1.231', '株洲龙凤3号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('204', '2', '172.17.1.232', '株洲龙凤4号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('205', '2', '172.17.1.233', '株洲龙凤5号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('206', '2', '172.17.1.234', '株洲龙凤6号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('207', '2', '172.17.1.235', '株洲龙凤7号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('208', '2', '172.17.1.236', '株洲龙凤8号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('209', '2', '172.17.1.237', '株洲龙凤9号风机', 'WT2000D110');
INSERT INTO "metadata"."t_machine_info" VALUES ('210', '2', '172.17.1.238', '株洲龙凤9号风机', 'WT2000D110');

-- ----------------------------
-- Table structure for t_measurements_info
-- ----------------------------
DROP TABLE IF EXISTS "metadata"."t_measurements_info";
CREATE TABLE "metadata"."t_measurements_info" (
"id" int4 NOT NULL,
"machine_type" text COLLATE "default",
"measurement_datatype" text COLLATE "default",
"measurement_name" text COLLATE "default",
"measurement_namecn" text COLLATE "default",
"store_precision" numeric(10)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_measurements_info
-- ----------------------------
INSERT INTO "metadata"."t_measurements_info" VALUES ('1', 'WT2000D110', 'BOOL', 'UC_ResetAlarms', '故障复位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('2', 'WT2000D110', 'BOOL', 'UC_ScadaReset', '急停复位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('3', 'WT2000D110', 'BOOL', 'UC_ScadaStop', '远程监控停机', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('4', 'WT2000D110', 'BOOL', 'UC_ScadaEnableTowerDoorAlarms', 'Scada使能塔筒声光报警', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('5', 'WT2000D110', 'BOOL', 'S_ScadaToggleBit', 'Scada通信握手位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('6', 'WT2000D110', 'BOOL', 'S_ScadaActivePowerControlFlag', 'Scada有功控制标志位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('7', 'WT2000D110', 'BOOL', 'S_ScadaReactivePowerControlFlag', 'Scada无功控制标志位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('8', 'WT2000D110', 'BOOL', 'S_ScadaTimeSyncFlag', 'Scada对时标志位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('9', 'WT2000D110', 'BOOL', 'CI_SsPersonnelLevelOk', '人身级别安全链', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('10', 'WT2000D110', 'BOOL', 'CI_SsCableTwistOk', '风机扭缆', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('11', 'WT2000D110', 'BOOL', 'CI_SsWatchdogOk', '看门狗', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('12', 'WT2000D110', 'BOOL', 'CI_SsYawLevelOk', '偏航级别安全链', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('13', 'WT2000D110', 'BOOL', 'CI_SsRotorSpeedOk', 'Turk超速', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('14', 'WT2000D110', 'BOOL', 'CI_SsPchSsdOk', '振动监测', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('15', 'WT2000D110', 'BOOL', 'CI_SsControllerActiveOk', '控制器级别安全链', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('16', 'WT2000D110', 'BOOL', 'CI_SsTurbineLevelOk', '风机级别安全链', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('17', 'WT2000D110', 'BOOL', 'CI_SsPowerOnReset', '上电复位安全链', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('18', 'WT2000D110', 'BOOL', 'CI_SsResetButtonOrPowerOnReset', '安全链复位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('19', 'WT2000D110', 'BOOL', 'CI_NacelleCabinetEStopPressed', '机舱柜急停按钮按下', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('20', 'WT2000D110', 'BOOL', 'CI_GearboxEStopPressed', '齿轮箱紧急停机按钮按下', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('21', 'WT2000D110', 'BOOL', 'CI_SafetyChainFuse5', '安全链24V保险5反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('22', 'WT2000D110', 'BOOL', 'CI_SafetyChainFuse6', '安全链24V保险6反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('23', 'WT2000D110', 'BOOL', 'CI_SafetyChainFuse', '安全链24V保险正常', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('24', 'WT2000D110', 'BOOL', 'CI_UpsError', '机舱UPS故障', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('25', 'WT2000D110', 'BOOL', 'CI_NacellePositionCw', '机舱左右位置', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('26', 'WT2000D110', 'BOOL', 'CI_CableTwistLimitOk', '机舱扭缆', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('27', 'WT2000D110', 'BOOL', 'CI_CableTwistCwNoWarning', '机舱顺时针扭缆', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('28', 'WT2000D110', 'BOOL', 'CI_CableTwistCcwNoWarning', '机舱逆时针扭缆', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('29', 'WT2000D110', 'BOOL', 'CI_CableTwistLimitSwitchesBypassed', '旁路扭缆', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('30', 'WT2000D110', 'BOOL', 'CI_RlpInchingRequest', '叶片缓动', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('31', 'WT2000D110', 'BOOL', 'CI_RlpMoveCw', '向顺桨位移动', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('32', 'WT2000D110', 'BOOL', 'CI_RlpMoveCcw', '向工作位移动', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('33', 'WT2000D110', 'BOOL', 'CI_PitchPowerSupplyOverVoltageProtectionOk', '变桨供电防雷保护反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('34', 'WT2000D110', 'BOOL', 'CI_Nacelle400VAcSwitchOn', '机舱400V保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('35', 'WT2000D110', 'BOOL', 'CI_NacelleHeater1CircuitBreaker', '机舱加热器1保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('36', 'WT2000D110', 'BOOL', 'CI_NacelleHeater2CircuitBreaker', '机舱加热器2保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('37', 'WT2000D110', 'BOOL', 'CI_NacelleServiceSwitch', '机舱服务开关', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('38', 'WT2000D110', 'BOOL', 'CI_ControlCabinetHeatingCircuitBreakers', '柜内环境控制保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('39', 'WT2000D110', 'BOOL', 'CI_CabinetHeatingsContactor', '柜体加热器接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('40', 'WT2000D110', 'BOOL', 'CI_NacelleEncoderPulsOfA', '机舱位置编码器通道A', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('41', 'WT2000D110', 'BOOL', 'CI_NacelleEncoderPulsOfB', '机舱位置编码器通道B', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('42', 'WT2000D110', 'BOOL', 'CI_NacelleFanFuse002', '机舱风扇保险2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('43', 'WT2000D110', 'BOOL', 'CI_NacelleFireFgt', '消防系统反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('44', 'WT2000D110', 'BOOL', 'CI_MainsSupplyFuse', '主电源供电保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('45', 'WT2000D110', 'BOOL', 'CI_230VSupplyCircuitBreakerOk', '机舱230V供电保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('46', 'WT2000D110', 'BOOL', 'CI_CabineHumidity1', '300柜体湿度高', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('47', 'WT2000D110', 'BOOL', 'CI_CabineHumidity2', '310柜体湿度高', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('48', 'WT2000D110', 'BOOL', 'CI_24VFuse001Ok', '柜外24V保险1反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('49', 'WT2000D110', 'BOOL', 'CI_24VFuse002Ok', '柜内模块24V保险2反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('50', 'WT2000D110', 'BOOL', 'CI_24VFuse003Ok', '柜内辅助24V保险3反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('51', 'WT2000D110', 'BOOL', 'CI_24VSupplyOk', '24V上电控制', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('52', 'WT2000D110', 'BOOL', 'CI_CabinetHeatingCircuitBreakerOk', '柜体加热器保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('53', 'WT2000D110', 'BOOL', 'CI_CabinetFansCircuitBreakers', '柜体风扇保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('54', 'WT2000D110', 'BOOL', 'CI_HubManualModeOn', '轮毂手动控制开关', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('55', 'WT2000D110', 'BOOL', 'CI_HubPowerSupplyCircuitBreakerOk', '轮毂供电保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('56', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackPressureBelowHigh', '液压系统压力高', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('57', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackPressureAboveLow', '液压系统压力低', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('58', 'WT2000D110', 'BOOL', 'CI_HydraulicOilLevelNotError', '液压系统油位低故障', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('59', 'WT2000D110', 'BOOL', 'CI_HydraulicOilLevelNotWarning', '液压系统油位低警告', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('60', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackFilterNotBlocked1', '液压系统过滤器1堵塞', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('61', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackFilterNotBlocked2', '液压系统过滤器2堵塞', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('62', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackOilTempOk', '液压系统油温正常', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('63', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackBrakeMotorProtSwitchOk', '制动泵保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('64', 'WT2000D110', 'BOOL', 'CI_HydraulicPowerPackContactor', '制动器泵接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('65', 'WT2000D110', 'BOOL', 'CI_BrakePadWearNotWorn', '主轴制动摩擦片反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('66', 'WT2000D110', 'BOOL', 'CI_BrakePadWearNotSevere', '主轴制动摩擦片故障', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('67', 'WT2000D110', 'BOOL', 'CI_HssBrakeApplied', '主轴制动抱闸', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('68', 'WT2000D110', 'BOOL', 'CI_YawBearingLubricationOK', '偏航润滑反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('69', 'WT2000D110', 'BOOL', 'CI_YawManualOperationOn', '偏航手动模式', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('70', 'WT2000D110', 'BOOL', 'CI_YawConverterCircuitBreaker', '偏航变频器保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('71', 'WT2000D110', 'BOOL', 'CI_YawBrakeCircuitBreaker', '偏航制动保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('72', 'WT2000D110', 'BOOL', 'CI_MainBearingLubricationCircuitBreaker', '主轴润滑保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('73', 'WT2000D110', 'BOOL', 'CI_MainBearingLubricationOK', '主轴润滑反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('74', 'WT2000D110', 'BOOL', 'CI_GearboxOilCoolingMotorProtSwitch', '齿轮箱油冷电机保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('75', 'WT2000D110', 'BOOL', 'CI_GearboxFansMotorProtSwitch1Ok', '齿轮箱油冷风扇保护反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('76', 'WT2000D110', 'BOOL', 'CI_GearboxHeatingCircuitBreakers', '发电机齿轮箱加热保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('77', 'WT2000D110', 'BOOL', 'CI_GearboxCoolingFan1Contactor', '齿轮箱冷却风扇接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('78', 'WT2000D110', 'BOOL', 'CI_GearboxOilFilterPressureOk', '齿轮箱油压正常', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('79', 'WT2000D110', 'BOOL', 'CI_GearboxOilCoolingPumpContactor', '齿轮箱油冷泵接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('80', 'WT2000D110', 'BOOL', 'CI_GearboxHeatingContactor', '齿轮箱加热器接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('81', 'WT2000D110', 'BOOL', 'CI_GearboxOilLevelOk', '齿轮箱油位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('82', 'WT2000D110', 'BOOL', 'CI_GeneratorLubricationError', '发电机润滑错误', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('83', 'WT2000D110', 'BOOL', 'CI_GeneratorFan1Contactor', '发电机风扇M1接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('84', 'WT2000D110', 'BOOL', 'CI_GeneratorFan2Contactor', '发电机风扇M2接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('85', 'WT2000D110', 'BOOL', 'CI_GeneratorFan3Contactor', '发电机风扇M3接触器反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('86', 'WT2000D110', 'BOOL', 'CI_GeneratorFanFuse1Ok', '发电机风扇1保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('87', 'WT2000D110', 'BOOL', 'CI_GeneratorFanFuse2Ok', '发电机风扇2保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('88', 'WT2000D110', 'BOOL', 'CI_GeneratorFanFuse3Ok', '发电机风扇3保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('89', 'WT2000D110', 'BOOL', 'CI_GeneratorEarthingBrushNotWorn', '发电机接地碳刷反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('90', 'WT2000D110', 'BOOL', 'CI_RotorLockFullyInserted', '风轮锁定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('91', 'WT2000D110', 'BOOL', 'CI_RotorLockFullyReleased', '风轮释放', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('92', 'WT2000D110', 'BOOL', 'CI_GeneratorOverVoltageProtectionOk', '发电机定子熔断器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('93', 'WT2000D110', 'BOOL', 'CI_PitchManualBypassLimitSwitch', '旁路限位开关按钮按下', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('94', 'WT2000D110', 'BOOL', 'CI_FTAnemometer24VCircuitBreakerOk', '风速仪24V保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('95', 'WT2000D110', 'BOOL', 'CO_ScadaResetSaftyChain', '远程复位安全链', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('96', 'WT2000D110', 'BOOL', 'CO_ResetPch', '复位PCH', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('97', 'WT2000D110', 'BOOL', 'CO_SsTurbineNoTrip', '控制器有效', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('98', 'WT2000D110', 'BOOL', 'CO_ControllerWatchdog', '看门狗信号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('99', 'WT2000D110', 'BOOL', 'CO_NacelleCabinetFans', '柜内风扇', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('100', 'WT2000D110', 'BOOL', 'CO_CabinetHeater', '柜体加热器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('101', 'WT2000D110', 'BOOL', 'CO_MainBearingLubrication', '主轴润滑', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('102', 'WT2000D110', 'BOOL', 'CO_YawBearingLubrication', '偏航轴承润滑', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('103', 'WT2000D110', 'BOOL', 'CO_YawApplyBrakeValveY3', '液压阀3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('104', 'WT2000D110', 'BOOL', 'CO_YawApplyBrakeValveY4', '液压阀4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('105', 'WT2000D110', 'BOOL', 'CO_YawApplyBrakeValveY5', '液压阀5', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('106', 'WT2000D110', 'BOOL', 'CO_HssBrakeImmediate', '立即施加主轴制动', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('107', 'WT2000D110', 'BOOL', 'CO_HydraulicPowerPackPump', '液压泵运行', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('108', 'WT2000D110', 'BOOL', 'CO_HydraulicPowerPackOilHeater', '液压系统加热器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('109', 'WT2000D110', 'BOOL', 'CO_GearboxFansAndPumpHeaters', '齿轮箱风扇加热及油泵加热', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('110', 'WT2000D110', 'BOOL', 'CO_GearboxOilHeater', '齿轮箱加热', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('111', 'WT2000D110', 'BOOL', 'CO_GearboxCoolingFan1', '齿轮箱风扇1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('112', 'WT2000D110', 'BOOL', 'CO_GearboxOilPump', '齿轮箱油泵', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('113', 'WT2000D110', 'BOOL', 'CO_GeneratorFan1', '发电机风扇1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('114', 'WT2000D110', 'BOOL', 'CO_GeneratorFan2', '发电机风扇2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('115', 'WT2000D110', 'BOOL', 'CO_GeneratorFan3', '发电机风扇3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('116', 'WT2000D110', 'BOOL', 'CO_GeneratorHeater', '发电机加热器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('117', 'WT2000D110', 'BOOL', 'CO_GeneratorFan3Heater', '发电机风扇加热器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('118', 'WT2000D110', 'BOOL', 'CO_AutomaticModeLamp', '自动运行模式指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('119', 'WT2000D110', 'BOOL', 'CO_ServiceModeLamp', '服务模式指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('120', 'WT2000D110', 'BOOL', 'CO_ErrorLamp', '机舱故障指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('121', 'WT2000D110', 'BOOL', 'CO_AllowedInHubLamp', '机舱允许进入轮毂指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('122', 'WT2000D110', 'BOOL', 'CO_NotAllowedInHubLamp', '机舱禁止进入轮毂指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('123', 'WT2000D110', 'BOOL', 'CO_SafetyChainTrippedLamp', '安全链断开指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('124', 'WT2000D110', 'BOOL', 'CO_GeneratorSlipRingHeater', '发电机滑环加热器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('125', 'WT2000D110', 'BOOL', 'CO_NacelleFan1', '机舱柜体风扇1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('126', 'WT2000D110', 'BOOL', 'CI_GridMonOverPower', '电网监视器过功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('127', 'WT2000D110', 'BOOL', 'CI_TowerBaseEStopPressed', '塔基急停按钮按下', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('128', 'WT2000D110', 'BOOL', 'CI_TowerBasePcsFault', '塔基变流器故障', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('129', 'WT2000D110', 'BOOL', 'CI_TowerBase400VAcSwitchOn', '塔基柜进线防雷器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('130', 'WT2000D110', 'BOOL', 'CI_TowerBaseHeatingCircuitBreaker', '塔基柜加热保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('131', 'WT2000D110', 'BOOL', 'CI_UpsIsBuffering', '塔基UPS放电', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('132', 'WT2000D110', 'BOOL', 'CI_UpsReplaceBattery', '塔基UPS电池需更换', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('133', 'WT2000D110', 'BOOL', 'CI_TowerBaseHumidtyHigh', '塔基柜湿度高', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('134', 'WT2000D110', 'BOOL', 'CI_TowerBase24VInputCircuitBreakerOk', '塔基230转24V回路保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('135', 'WT2000D110', 'BOOL', 'CI_TowerBaseManualKeySwitch', '塔基主开关手动模式', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('136', 'WT2000D110', 'BOOL', 'CI_TowerBaseRemoteKeySwitch', '塔基主开关自动模式', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('137', 'WT2000D110', 'BOOL', 'CI_TowerBaseOffKeySwitchActive', '塔基主关闭模式', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('138', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput1', '箱变开关信号1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('139', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput2', '箱变开关信号2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('140', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput3', '箱变开关信号3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('141', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput4', '箱变开关信号4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('142', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput5', '箱变开关信号5', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('143', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput6', '箱变开关信号6', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('144', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput7', '箱变开关信号7', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('145', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput8', '箱变开关信号8', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('146', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput9', '箱变开关信号9', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('147', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput10', '箱变开关信号10', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('148', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput11', '箱变开关信号11', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('149', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput12', '箱变开关信号12', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('150', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput13', '箱变开关信号13', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('151', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput14', '箱变开关信号14', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('152', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput15', '箱变开关信号15', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('153', 'WT2000D110', 'BOOL', 'CI_BoxTransformerDigitalInput16', '箱变开关信号16', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('154', 'WT2000D110', 'BOOL', 'CI_TowerBaseHeatExchangerCircuitBreakerOk', '塔基加热器保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('155', 'WT2000D110', 'BOOL', 'CI_TowerBaseCoolingPumpCircuitBreakerOk', '水冷泵保险反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('156', 'WT2000D110', 'BOOL', 'CI_CoolingSystemWaterPressureLow', '水压低', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('157', 'WT2000D110', 'BOOL', 'CI_TowerDoor1', '塔筒门报警信号1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('158', 'WT2000D110', 'BOOL', 'CI_TowerDoor2', '塔筒门报警信号2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('159', 'WT2000D110', 'BOOL', 'CO_WaterCoolingPcsWaterPump', '变流器水泵运行', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('160', 'WT2000D110', 'BOOL', 'CO_TowerBasePcsHeater', '变流器柜内加热器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('161', 'WT2000D110', 'BOOL', 'CO_TowerBasePersonnelLevelLamp', '塔基紧急停机指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('162', 'WT2000D110', 'BOOL', 'CO_TowerBaseSafetyChainLamp', '塔基安全链指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('163', 'WT2000D110', 'BOOL', 'CO_TowerBaseAutomaticModeLamp', '自动模式指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('164', 'WT2000D110', 'BOOL', 'CO_TowerBaseErrorLamp', '塔基故障指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('165', 'WT2000D110', 'BOOL', 'CO_TowerBaseServiceModeLamp', '服务模式灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('166', 'WT2000D110', 'BOOL', 'CO_TowerBaseAllowedInHubLamp', '塔基允许进入轮毂指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('167', 'WT2000D110', 'BOOL', 'CO_TowerBaseNotAllowedInHubLamp', '塔基禁止进入轮毂指示灯', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('168', 'WT2000D110', 'BOOL', 'CO_BoxTransformerDigitalOutput1', '箱变遥控信号1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('169', 'WT2000D110', 'BOOL', 'CO_BoxTransformerDigitalOutput2', '箱变遥控信号2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('170', 'WT2000D110', 'BOOL', 'CO_BoxTransformerDigitalOutput3', '箱变遥控信号3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('171', 'WT2000D110', 'BOOL', 'CO_BoxTransformerDigitalOutput4', '箱变遥控信号4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('172', 'WT2000D110', 'BOOL', 'CO_TowerBaseAirCoolingFan', '塔基空冷器', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('173', 'WT2000D110', 'BOOL', 'CI_SubPitchAllBladesAtFeather', '叶片都在顺桨位', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('174', 'WT2000D110', 'BOOL', 'CI_SubPitchPrivSafetyFeedback', '变桨系统安全链反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('175', 'WT2000D110', 'BOOL', 'CO_SubPitchEfc', '紧急顺桨', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('176', 'WT2000D110', 'LONG', 'P_ControllerSoftwareVersion', '主控软件版本号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('177', 'WT2000D110', 'LONG', 'P_PitchType', '变桨型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('178', 'WT2000D110', 'LONG', 'P_PcsType', '变流器型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('179', 'WT2000D110', 'LONG', 'P_YawDriveType', '偏航驱动器型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('180', 'WT2000D110', 'LONG', 'P_HydraulicType', '液压站型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('181', 'WT2000D110', 'LONG', 'P_GeneratorType', '发电机型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('182', 'WT2000D110', 'LONG', 'P_GearBoxType', '齿轮箱型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('183', 'WT2000D110', 'LONG', 'P_WindSensorType', '风速仪型号', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('184', 'WT2000D110', 'FLOAT', 'CI_Ncc310Temperature1', '控制柜300温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('185', 'WT2000D110', 'FLOAT', 'CI_Ncc310Temperature2', '控制柜310温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('186', 'WT2000D110', 'FLOAT', 'CI_NacelleTemperature1', '机舱温度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('187', 'WT2000D110', 'FLOAT', 'CI_NacelleTemperature2', '机舱温度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('188', 'WT2000D110', 'FLOAT', 'CI_OutsideAirTemperature', '机舱外部环境温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('189', 'WT2000D110', 'FLOAT', 'CI_NacellePosition', '机舱角度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('190', 'WT2000D110', 'FLOAT', 'CI_HydraulicPpAccumPrechargePressure', '液压站系统压力', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('191', 'WT2000D110', 'FLOAT', 'CI_HssHydraulicBrakePressure', '主轴制动压力', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('192', 'WT2000D110', 'FLOAT', 'CI_YawHydraulicBrakePressure', '偏航制动压力', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('193', 'WT2000D110', 'FLOAT', 'CI_GearboxSumpOilTemperature', '齿轮箱油池温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('194', 'WT2000D110', 'FLOAT', 'CI_GearboxOilTemperatureInlet', '齿轮箱进口温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('195', 'WT2000D110', 'FLOAT', 'CI_GearboxHssBearingTemperature', '齿轮箱高速轴轴承温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('196', 'WT2000D110', 'FLOAT', 'CI_GearboxLssBearingTemperature', '齿轮箱低速轴轴承温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('197', 'WT2000D110', 'FLOAT', 'CI_GearboxOilPressure', '齿轮箱油压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('198', 'WT2000D110', 'FLOAT', 'CI_GeneratorWindingUTemperature1', '发电机U相绕组温度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('199', 'WT2000D110', 'FLOAT', 'CI_GeneratorWindingVTemperature1', '发电机V相绕组温度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('200', 'WT2000D110', 'FLOAT', 'CI_GeneratorWindingWTemperature1', '发电机W相绕组温度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('201', 'WT2000D110', 'FLOAT', 'CI_GeneratorWindingUTemperature2', '发电机U相绕组温度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('202', 'WT2000D110', 'FLOAT', 'CI_GeneratorWindingVTemperature2', '发电机V相绕组温度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('203', 'WT2000D110', 'FLOAT', 'CI_GeneratorWindingWTemperature2', '发电机W相绕组温度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('204', 'WT2000D110', 'FLOAT', 'CI_GeneratorSlipRingTemperature', '发电机滑环温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('205', 'WT2000D110', 'FLOAT', 'CI_GeneratorBearingDrivetrainTemperature', '发电机驱动端温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('206', 'WT2000D110', 'FLOAT', 'CI_GeneratorBearingNonDrivetrainTemperature', '发电机非驱动端温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('207', 'WT2000D110', 'FLOAT', 'CI_RotorSpeed', '轮毂转速', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('208', 'WT2000D110', 'FLOAT', 'CI_WindSpeed1', '风速1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('209', 'WT2000D110', 'FLOAT', 'CI_YawError1', '机舱与风向偏差1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('210', 'WT2000D110', 'FLOAT', 'CI_WindSpeed2', '风速2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('211', 'WT2000D110', 'FLOAT', 'CI_YawError2', '机舱与风向偏差2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('212', 'WT2000D110', 'FLOAT', 'CI_TowerBasePcsCoolingWaterTemperature', '变流器水温', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('213', 'WT2000D110', 'FLOAT', 'CI_TowerBaseEnvironmentTemperature', '塔基环境温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('214', 'WT2000D110', 'FLOAT', 'CI_TowerBaseCabinetTemperature', '塔基柜温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('215', 'WT2000D110', 'FLOAT', 'CI_TowerBaseTransformerTempHV1', '箱变温度信号1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('216', 'WT2000D110', 'FLOAT', 'CI_TowerBaseTransformerTempHV2', '箱变温度信号2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('217', 'WT2000D110', 'FLOAT', 'CI_TowerBaseTransformerTempHV3', '箱变温度信号3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('218', 'WT2000D110', 'FLOAT', 'CI_TowerBaseTransformerTempHV4', '箱变温度信号4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('219', 'WT2000D110', 'FLOAT', 'CI_BoxTransformerAnalogInput1', '箱变模拟量输入信号1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('220', 'WT2000D110', 'FLOAT', 'CI_BoxTransformerAnalogInput2', '箱变模拟量输入信号2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('221', 'WT2000D110', 'FLOAT', 'CI_BoxTransformerAnalogInput3', '箱变模拟量输入信号3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('222', 'WT2000D110', 'FLOAT', 'CI_BoxTransformerAnalogInput4', '箱变模拟量输入信号4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('223', 'WT2000D110', 'LONG', 'CI_SubPitchPrivSoftwareVersion1', '变桨1软件版本', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('224', 'WT2000D110', 'LONG', 'CI_SubPitchPrivSoftwareVersion2', '变桨2软件版本', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('225', 'WT2000D110', 'LONG', 'CI_SubPitchPrivSoftwareVersion3', '变桨3软件版本', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('226', 'WT2000D110', 'FLOAT', 'CI_SubPitchPosition1', '变桨角度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('227', 'WT2000D110', 'FLOAT', 'CI_SubPitchPosition2', '变桨角度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('228', 'WT2000D110', 'FLOAT', 'CI_SubPitchPosition3', '变桨角度3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('229', 'WT2000D110', 'FLOAT', 'CI_SubPitchRate1', '变桨速度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('230', 'WT2000D110', 'FLOAT', 'CI_SubPitchRate2', '变桨速度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('231', 'WT2000D110', 'FLOAT', 'CI_SubPitchRate3', '变桨速度3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('232', 'WT2000D110', 'FLOAT', 'CI_SubPitchPrivMotorCurrentBlade1', '变桨电机1电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('233', 'WT2000D110', 'FLOAT', 'CI_SubPitchPrivMotorCurrentBlade2', '变桨电机2电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('234', 'WT2000D110', 'FLOAT', 'CI_SubPitchPrivMotorCurrentBlade3', '变桨电机3电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('235', 'WT2000D110', 'FLOAT', 'CI_SubPitchPrivVoltage1', '变桨1备用电源电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('236', 'WT2000D110', 'FLOAT', 'CI_SubPitchPrivVoltage2', '变桨2备用电源电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('237', 'WT2000D110', 'FLOAT', 'CI_SubPitchPrivVoltage3', '变桨3备用电源电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('238', 'WT2000D110', 'FLOAT', 'CO_SubPitchPositionDemand1', '变桨1位置给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('239', 'WT2000D110', 'FLOAT', 'CO_SubPitchPositionDemand2', '变桨2位置给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('240', 'WT2000D110', 'FLOAT', 'CO_SubPitchPositionDemand3', '变桨3位置给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('241', 'WT2000D110', 'FLOAT', 'CO_SubPitchRateDemand1', '变桨1速度给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('242', 'WT2000D110', 'FLOAT', 'CO_SubPitchRateDemand2', '变桨2速度给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('243', 'WT2000D110', 'FLOAT', 'CO_SubPitchRateDemand3', '变桨3速度给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('244', 'WT2000D110', 'FLOAT', 'CI_SubPcsDcVoltage', '变流器直流母线电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('245', 'WT2000D110', 'FLOAT', 'CI_SubPcsMainsVoltage', '网侧线电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('246', 'WT2000D110', 'FLOAT', 'CI_SubPcsMainsCurrent', '网侧线电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('247', 'WT2000D110', 'FLOAT', 'CI_SubPcsReactivePower', '变流器无功功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('248', 'WT2000D110', 'FLOAT', 'CI_SubPcsActivePower', '变流器有功功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('249', 'WT2000D110', 'FLOAT', 'CI_SubPcsMeasuredGeneratorSpeed', '发电机转速', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('250', 'WT2000D110', 'FLOAT', 'CI_SubPcsMeasuredElectricalTorque', '转矩反馈', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('251', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridFrequency', '电网频率(变流器)', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('252', 'WT2000D110', 'FLOAT', 'CI_SubPcsGroundCurrent', '发电机接地电流有效值', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('253', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridVoltageAB', '电网电压AB', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('254', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridVoltageBC', '电网电压BC', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('255', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridVoltageCA', '电网电压CA', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('256', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridCurrentA', '电网A相电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('257', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridCurrentB', '电网B相电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('258', 'WT2000D110', 'FLOAT', 'CI_SubPcsGridCurrentC', '电网C相电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('259', 'WT2000D110', 'FLOAT', 'CI_SubPcsLineSideCurrent', '网侧电流有效值', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('260', 'WT2000D110', 'FLOAT', 'CI_SubPcsGeneratorSideCurrent', '机侧电流有效值', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('261', 'WT2000D110', 'FLOAT', 'CI_SubPcsStatorCurrent', '定子电流有效值', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('262', 'WT2000D110', 'FLOAT', 'CI_SubPcsIGBTTemp1', 'IGBT温度1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('263', 'WT2000D110', 'FLOAT', 'CI_SubPcsIGBTTemp2', 'IGBT温度2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('264', 'WT2000D110', 'FLOAT', 'CI_SubPcsIGBTTemp3', 'IGBT温度3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('265', 'WT2000D110', 'FLOAT', 'CO_SubPcsTorqueDemand', '转矩给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('266', 'WT2000D110', 'FLOAT', 'CO_SubPcsReactivePowerDemand', '无功给定', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('267', 'WT2000D110', 'FLOAT', 'CI_SubVibNacelleForeAftAcceleration', '机舱前后加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('268', 'WT2000D110', 'FLOAT', 'CI_SubVibNacelleSideSideAcceleration', '机舱左右加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('269', 'WT2000D110', 'FLOAT', 'CI_SubVibGearboxAcceleration', '齿轮箱加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('270', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand1', '波段1振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('271', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand2', '波段2振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('272', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand3', '波段3振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('273', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand4', '波段4振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('274', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand5', '波段5振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('275', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand6', '波段6振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('276', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand7', '波段7振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('277', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand8', '波段8振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('278', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand9', '波段9振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('279', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand10', '波段10振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('280', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand11', '波段11振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('281', 'WT2000D110', 'FLOAT', 'CI_SubVibPrivBand12', '波段12振动加速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('282', 'WT2000D110', 'FLOAT', 'CI_SubIprVoltageL1L2', '电网线电压L1L2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('283', 'WT2000D110', 'FLOAT', 'CI_SubIprVoltageL2L3', '电网线电压L2L3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('284', 'WT2000D110', 'FLOAT', 'CI_SubIprVoltageL3L1', '电网线电压L3L1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('285', 'WT2000D110', 'FLOAT', 'CI_SubIprCurrentL1', '电网出口线电流L1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('286', 'WT2000D110', 'FLOAT', 'CI_SubIprCurrentL2', '电网出口线电流L2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('287', 'WT2000D110', 'FLOAT', 'CI_SubIprCurrentL3', '电网出口线电流L3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('288', 'WT2000D110', 'FLOAT', 'CI_SubIprRealPower', '风机出口有功功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('289', 'WT2000D110', 'FLOAT', 'CI_SubIprReactivePower', '风机出口无功功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('290', 'WT2000D110', 'FLOAT', 'CI_SubIprPrivPowerFactor', '功率因数', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('291', 'WT2000D110', 'FLOAT', 'CI_SubIprFrequency', '电网频率(电网监视器)', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('292', 'WT2000D110', 'FLOAT', 'CI_SubIprEnergyReal', '发电量', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('293', 'WT2000D110', 'FLOAT', 'CI_AC400VActivePower', '400V 功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('294', 'WT2000D110', 'FLOAT', 'CI_AC400VReactivePower', '400V 无功功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('295', 'WT2000D110', 'FLOAT', 'CI_AC400VApparentPower', '400V 视在功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('296', 'WT2000D110', 'FLOAT', 'CI_AC400VConsume', '400V 耗电量', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('297', 'WT2000D110', 'FLOAT', 'CI_YawActivePower', '偏航功率', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('298', 'WT2000D110', 'FLOAT', 'CI_YawModuleTemperature', '偏航模块温度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('299', 'WT2000D110', 'FLOAT', 'CI_YawGeneratorCurrent', '偏航电机电流', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('300', 'WT2000D110', 'FLOAT', 'CI_YawMotorVoltage', '偏航电机电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('301', 'WT2000D110', 'FLOAT', 'CI_YawDCVoltage', '偏航直流母线电压', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('302', 'WT2000D110', 'DWORD', 'S_HighestActiveAlarm', '最高级别报警', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('303', 'WT2000D110', 'DWORD', 'S_HighestActiveAlarmId', '最高级别报警ID', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('304', 'WT2000D110', 'LONG', 'S_ActiveAlarmCategory', '报警属性', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('305', 'WT2000D110', 'LONG', 'S_UtcTimeSeconds', '时间(utc)', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('306', 'WT2000D110', 'DWORD', 'S_ControllerState', '控制器主状态', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('307', 'WT2000D110', 'DWORD', 'S_SubPitchPrivState', '变桨状态', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('308', 'WT2000D110', 'DWORD', 'S_YawState', '偏航状态', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('309', 'WT2000D110', 'DWORD', 'S_YawDriveState', '偏航驱动状态', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('310', 'WT2000D110', 'DWORD', 'S_YawBrakeState', '偏航制动状态', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('311', 'WT2000D110', 'DWORD', 'S_SubPcsPrivState', '变流器状态', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('312', 'WT2000D110', 'FLOAT', 'D_TShortAverageWindSpeed', '3s平均风速', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('313', 'WT2000D110', 'FLOAT', 'D_TMedAverageWindSpeed', '30s平均风速', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('314', 'WT2000D110', 'FLOAT', 'D_TLongAverageWindSpeed', '5分钟平均风速', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('315', 'WT2000D110', 'FLOAT', 'D_YawRate', '偏航速度', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('316', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID1', '主控故障代码1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('317', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID2', '主控故障代码2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('318', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID3', '主控故障代码3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('319', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID4', '主控故障代码4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('320', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID5', '主控故障代码5', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('321', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID6', '主控故障代码6', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('322', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID7', '主控故障代码7', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('323', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID8', '主控故障代码8', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('324', 'WT2000D110', 'SHORT', 'D_ControllerAlarmID9', '主控故障代码9', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('325', 'WT2000D110', 'SHORT', 'D_ControllerAlarmIDA', '主控故障代码A', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('326', 'WT2000D110', 'SHORT', 'D_ControllerWarningID1', '主控警告代码1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('327', 'WT2000D110', 'SHORT', 'D_ControllerWarningID2', '主控警告代码2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('328', 'WT2000D110', 'SHORT', 'D_ControllerWarningID3', '主控警告代码3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('329', 'WT2000D110', 'SHORT', 'D_ControllerWarningID4', '主控警告代码4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('330', 'WT2000D110', 'SHORT', 'D_ControllerWarningID5', '主控警告代码5', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('331', 'WT2000D110', 'SHORT', 'D_ControllerWarningID6', '主控警告代码6', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('332', 'WT2000D110', 'SHORT', 'D_ControllerWarningID7', '主控警告代码7', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('333', 'WT2000D110', 'SHORT', 'D_ControllerWarningID8', '主控警告代码8', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('334', 'WT2000D110', 'SHORT', 'D_ControllerWarningID9', '主控警告代码9', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('335', 'WT2000D110', 'SHORT', 'D_ControllerWarningIDA', '主控警告代码A', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('336', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID1', '变桨故障代码1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('337', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID2', '变桨故障代码2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('338', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID3', '变桨故障代码3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('339', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID4', '变桨故障代码4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('340', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID5', '变桨故障代码5', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('341', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID6', '变桨故障代码6', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('342', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID7', '变桨故障代码7', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('343', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID8', '变桨故障代码8', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('344', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmID9', '变桨故障代码9', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('345', 'WT2000D110', 'SHORT', 'D_SubPitchPrivAlarmIDA', '变桨故障代码A', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('346', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID1', '变流器警告代码1', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('347', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID2', '变流器警告代码2', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('348', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID3', '变流器警告代码3', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('349', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID4', '变流器警告代码4', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('350', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID5', '变流器警告代码5', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('351', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID6', '变流器警告代码6', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('352', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID7', '变流器警告代码7', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('353', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID8', '变流器警告代码8', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('354', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmID9', '变流器警告代码9', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('355', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmIDA', '变流器警告代码A', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('356', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmIDB', '变流器警告代码B', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('357', 'WT2000D110', 'SHORT', 'D_SubPcsPrivAlarmIDC', '变流器警告代码C', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('358', 'WT2000D110', 'FLOAT', 'UC_ScadaActivePowerLimit', '远程监控有功调度指令', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('359', 'WT2000D110', 'FLOAT', 'UC_ScadaReactivePowerLimit', '远程监控无功调度指令', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('360', 'WT2000D110', 'LONG', 'S_UtcTimeSecondsSync', 'Scada对时时间(utc)', '1');
INSERT INTO "metadata"."t_measurements_info" VALUES ('361', 'WT2000D110', 'FLOAT', 'P_ActivePowerLimit', 'HMI限功', '1');

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS "metadata"."template";
CREATE TABLE "metadata"."template" (
"id" int8 NOT NULL,
"create_time" varchar(255) COLLATE "default",
"data_json" text COLLATE "default",
"remark" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO "metadata"."template" VALUES ('16', '2017-5-19', '{"machines":[{"factory_id":"1","fans":[{"ID":"1_WT2000D110_101"},{"ID":"1_WT2000D110_102"}]}],"measurements":[{"id":"45","name":"CI_230VSupplyCircuitBreakerOk","nameCN":"机舱230V供电保险反馈","methods":["avg"]},{"id":"49","name":"CI_24VFuse002Ok","nameCN":"柜内模块24V保险2反馈","methods":["avg","max"]},{"id":"50","name":"CI_24VFuse003Ok","nameCN":"柜内辅助24V保险3反馈","methods":["avg","max"]}],"timescope":"2017-05-15 00:00:00,2017-05-01 00:00:00","groupUnit":"1h"}', '未添加备注');
INSERT INTO "metadata"."template" VALUES ('17', '2017-5-31', '{"machines":[{"factory_id":"1","fans":[{"ID":"1_WT2000D110_101"},{"ID":"1_WT2000D110_102"}]}],"measurements":[{"id":"45","name":"CI_230VSupplyCircuitBreakerOk","nameCN":"机舱230V供电保险反馈","methods":["avg"]},{"id":"49","name":"CI_24VFuse002Ok","nameCN":"柜内模块24V保险2反馈","methods":["avg","max"]},{"id":"50","name":"CI_24VFuse003Ok","nameCN":"柜内辅助24V保险3反馈","methods":["avg","max"]}],"timescope":"2017-05-15 00:00:00,2017-05-01 00:00:00","groupUnit":"1h"}', '未添加备注');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table plcfile
-- ----------------------------
CREATE INDEX "fki_machineid_fk" ON "metadata"."plcfile" USING btree ("machine_id");

-- ----------------------------
-- Primary Key structure for table plcfile
-- ----------------------------
ALTER TABLE "metadata"."plcfile" ADD PRIMARY KEY ("file_id");

-- ----------------------------
-- Primary Key structure for table t_farm_info
-- ----------------------------
ALTER TABLE "metadata"."t_farm_info" ADD PRIMARY KEY ("farm_id");

-- ----------------------------
-- Indexes structure for table t_machine_info
-- ----------------------------
CREATE INDEX "fki_farmid_fk" ON "metadata"."t_machine_info" USING btree ("farm_id");

-- ----------------------------
-- Primary Key structure for table t_machine_info
-- ----------------------------
ALTER TABLE "metadata"."t_machine_info" ADD PRIMARY KEY ("machine_id");

-- ----------------------------
-- Primary Key structure for table t_measurements_info
-- ----------------------------
ALTER TABLE "metadata"."t_measurements_info" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table template
-- ----------------------------
ALTER TABLE "metadata"."template" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "metadata"."plcfile"
-- ----------------------------
ALTER TABLE "metadata"."plcfile" ADD FOREIGN KEY ("machine_id") REFERENCES "metadata"."t_machine_info" ("machine_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "metadata"."t_machine_info"
-- ----------------------------
ALTER TABLE "metadata"."t_machine_info" ADD FOREIGN KEY ("farm_id") REFERENCES "metadata"."t_farm_info" ("farm_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
