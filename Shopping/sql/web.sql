/*
Navicat MySQL Data Transfer

Source Server         : mysql_host
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : web

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-06-20 16:21:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `price` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('天选之子：卡卡传 (精装)', '1', '银鞍照白马，飒沓如流星；陌上人如玉，公子世无双。CCTV5《天下足球》栏目重磅作品，卡卡退役纪念传记。致青春，忆追风少年。大16开精装全彩，特制书套保护书体，赠“4张10寸写真相片+大幅海报” ', '《天下足球》', '/pic/1.jpg', '149.10');
INSERT INTO `book` VALUES ('那不勒斯的萤火', '2', '（被誉为欧美文坛近十年来的“灯塔”巨作，跟《追风筝的人》《阿甘正传》一样震撼灵魂、给人力量。）', '马西米利亚诺· 威尔吉利奥', '/pic/2.jpg', '27.30');
INSERT INTO `book` VALUES ('复旦名师陈果：好的爱情', '3', '（陈果的爱情哲学课，用哲学的方式告诉你，怎样的爱情才能更长久）', '陈果', '/pic/3.jpg', '28.30');
INSERT INTO `book` VALUES ('太平天国兴亡录', '4', '史料 文学 实证 推理，以史诗笔法、工匠精神，写尽乱世浩劫中的血性与人性。', '[日]陈舜臣', '/pic/4.jpg', '34.99');
INSERT INTO `book` VALUES ('银火箭少年科幻系列', '5', '（亚洲首位“雨果奖”得主刘慈欣主编，全球销量超500万册。套装共8册，含流浪地球等科幻大作）', '刘慈欣、[英]赫伯特·乔治·威尔斯、[英]玛丽·雪莱等', '/pic/5.jpg', '176.70');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userName` varchar(50) NOT NULL,
  `books` varchar(200) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('zmx', '5,1,2', '123456');
