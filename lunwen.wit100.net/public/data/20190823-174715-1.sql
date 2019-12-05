
-- -----------------------------
-- Table structure for `tp_account_log`
-- -----------------------------
DROP TABLE IF EXISTS `tp_account_log`;
CREATE TABLE `tp_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_money` decimal(10,2) DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `pay_points` mediumint(9) NOT NULL DEFAULT '0' COMMENT '支付积分',
  `change_time` int(10) unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `order_id` int(10) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_ad`
-- -----------------------------
DROP TABLE IF EXISTS `tp_ad`;
CREATE TABLE `tp_ad` (
  `ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(10) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `link_color` varchar(60) NOT NULL,
  `b_title` varchar(60) NOT NULL,
  `s_title` varchar(60) NOT NULL,
  `ad_code` text NOT NULL,
  `ad_bg_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `public_ruid` int(11) unsigned NOT NULL DEFAULT '0',
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `kemu_id` int(10) NOT NULL DEFAULT '0',
  `shop_id` int(10) NOT NULL DEFAULT '0',
  `ad_img` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`),
  KEY `ad_name` (`ad_name`),
  KEY `media_type` (`media_type`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=MyISAM AUTO_INCREMENT=720 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_ad`
-- -----------------------------
INSERT INTO `tp_ad` VALUES ('710', '79', '0', '综合', 'http://', '', '', '', '', '', '1556669894', '1559348296', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '7', '2', '/upload/system/20190501/5e00eba0cb3d36125a3eda38105f29d5.jpg');
INSERT INTO `tp_ad` VALUES ('711', '79', '0', '历史', 'http://', '', '', '', '', '', '1556670047', '1559348447', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '6', '1', '/upload/system/20190501/d079d5a7f1807e7ab269333b03eddd30.jpg');
INSERT INTO `tp_ad` VALUES ('712', '79', '0', '诗词', 'http://', '', '', '', '', '', '1556670095', '1559348495', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '8', '1', '/upload/system/20190501/e18dd6925c772686e67ee69f748bf3f4.jpg');
INSERT INTO `tp_ad` VALUES ('713', '79', '0', '网络', 'http://', '', '', '', '', '', '1556670117', '1559348517', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '5', '1', '/upload/system/20190501/b27230a6c36f1f427aa9ec62ee88e5b4.jpg');
INSERT INTO `tp_ad` VALUES ('714', '79', '0', '自然', 'http://', '', '', '', '', '', '1556670146', '1559348546', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '4', '1', '/upload/system/20190501/f9544c082a278be7583e83fe01853f31.jpg');
INSERT INTO `tp_ad` VALUES ('715', '79', '0', '科学', 'http://', '', '', '', '', '', '1556670173', '1559348573', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '3', '1', '/upload/system/20190501/0c177873caa99881a15f7948e3e14ede.jpg');
INSERT INTO `tp_ad` VALUES ('716', '79', '0', '地理', 'http://', '', '', '', '', '', '1556670197', '1559348597', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '2', '1', '/upload/system/20190501/21804ec11183d15c12e2a775f57abfe4.jpg');
INSERT INTO `tp_ad` VALUES ('717', '79', '0', '自然2', 'http://', '', '', '', '', '', '1556670919', '1558571719', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '4', '1', '/upload/system/20190501/cf651249d0e37bffcc7f6e90857436d8.jpg');
INSERT INTO `tp_ad` VALUES ('718', '354', '0', '测试1', 'http://', '', '', '', '', '', '1556676763', '1557367963', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '0', '2', '/upload/system/20190501/aac665080357dfe64aea03537fe84433.jpg');
INSERT INTO `tp_ad` VALUES ('719', '354', '0', '广告', 'http://', '', '', '', '', '', '1556677596', '1559355996', '', '', '', '0', '1', '0', '0', '0', '0', '0', '', '0', '1', '/upload/system/20190501/afacda9d3e2b3e908796f2946356d35b.jpg');

-- -----------------------------
-- Table structure for `tp_ad_position`
-- -----------------------------
DROP TABLE IF EXISTS `tp_ad_position`;
CREATE TABLE `tp_ad_position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_model` varchar(255) NOT NULL,
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `postion_wz` int(5) NOT NULL DEFAULT '0',
  `hide` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`position_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_ad_position`
-- -----------------------------
INSERT INTO `tp_ad_position` VALUES ('79', '0', '自主出题', '375', '200', 'users_a[num_id]_[merchant_id]', '自主出题模块广告投放', '1', '1', '0');
INSERT INTO `tp_ad_position` VALUES ('354', '0', '测试', '375', '200', '', '', '3', '1', '0');
INSERT INTO `tp_ad_position` VALUES ('91', '0', '限时抢答', '375', '200', 'cat_tree_[cat_id]_[num_id]', '限时抢答模块功能投放', '2', '1', '0');

-- -----------------------------
-- Table structure for `tp_admin`
-- -----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `role_id` smallint(5) DEFAULT '0' COMMENT '角色id',
  `is_delete` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_admin`
-- -----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'admin', '1221@qq.com', 'a940130f27dc03e34513e8c84161872a', '1542088804', '1566527364', '123.168.198.124', '', '1', '0');
INSERT INTO `tp_admin` VALUES ('2', 'admin1', '322552@qq.com', '519475228fe35ad067744465c42a19b2', '1548491377', '1551153299', '123.168.220.92', '', '2', '0');

-- -----------------------------
-- Table structure for `tp_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `tp_admin_log`;
CREATE TABLE `tp_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(50) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_admin_log`
-- -----------------------------
INSERT INTO `tp_admin_log` VALUES ('777', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1556695517');
INSERT INTO `tp_admin_log` VALUES ('778', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1556699723');
INSERT INTO `tp_admin_log` VALUES ('779', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1556704389');
INSERT INTO `tp_admin_log` VALUES ('780', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1556710797');
INSERT INTO `tp_admin_log` VALUES ('781', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1556750776');
INSERT INTO `tp_admin_log` VALUES ('782', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1556751318');
INSERT INTO `tp_admin_log` VALUES ('783', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1556777472');
INSERT INTO `tp_admin_log` VALUES ('784', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1556805882');
INSERT INTO `tp_admin_log` VALUES ('785', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1556842042');
INSERT INTO `tp_admin_log` VALUES ('786', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1556930529');
INSERT INTO `tp_admin_log` VALUES ('787', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557016413');
INSERT INTO `tp_admin_log` VALUES ('788', '1', '后台登录', '175.167.152.3', '/admin/login/index.html', '1557041659');
INSERT INTO `tp_admin_log` VALUES ('789', '1', '后台登录', '36.102.4.208', '/admin/login/index.html', '1557045006');
INSERT INTO `tp_admin_log` VALUES ('790', '1', '后台登录', '175.146.72.161', '/admin/login/index.html', '1557055450');
INSERT INTO `tp_admin_log` VALUES ('791', '1', '后台登录', '123.186.30.79', '/admin/login/index.html', '1557056518');
INSERT INTO `tp_admin_log` VALUES ('792', '1', '后台登录', '60.19.137.194', '/admin/login/index.html', '1557060211');
INSERT INTO `tp_admin_log` VALUES ('793', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1557061628');
INSERT INTO `tp_admin_log` VALUES ('794', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1557062153');
INSERT INTO `tp_admin_log` VALUES ('795', '1', '后台登录', '36.102.4.208', '/admin/login/index.html', '1557104150');
INSERT INTO `tp_admin_log` VALUES ('796', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557106520');
INSERT INTO `tp_admin_log` VALUES ('797', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557107350');
INSERT INTO `tp_admin_log` VALUES ('798', '1', '后台登录', '36.102.4.208', '/admin/login/index.html', '1557125877');
INSERT INTO `tp_admin_log` VALUES ('799', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557189632');
INSERT INTO `tp_admin_log` VALUES ('800', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557190992');
INSERT INTO `tp_admin_log` VALUES ('801', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557197640');
INSERT INTO `tp_admin_log` VALUES ('802', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557198198');
INSERT INTO `tp_admin_log` VALUES ('803', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557201293');
INSERT INTO `tp_admin_log` VALUES ('804', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1557232454');
INSERT INTO `tp_admin_log` VALUES ('805', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557276711');
INSERT INTO `tp_admin_log` VALUES ('806', '1', '后台登录', '123.168.221.72', '/admin/login/index.html', '1557297386');
INSERT INTO `tp_admin_log` VALUES ('807', '1', '后台登录', '123.168.201.222', '/admin/login/index.html', '1557313513');
INSERT INTO `tp_admin_log` VALUES ('808', '1', '后台登录', '123.168.198.124', '/admin/login/index.html', '1565407427');

-- -----------------------------
-- Table structure for `tp_admin_role`
-- -----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `act_list` text COMMENT '权限列表',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `sort` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_admin_role`
-- -----------------------------
INSERT INTO `tp_admin_role` VALUES ('1', '超级管理员', 'all', '管理全站', '0');
INSERT INTO `tp_admin_role` VALUES ('2', '编辑', '2,286,31,45,46,287,300,290,291,297,298,299,32,249,250,284,319,175,283,176,178,282,179', '测试', '0');

-- -----------------------------
-- Table structure for `tp_application`
-- -----------------------------
DROP TABLE IF EXISTS `tp_application`;
CREATE TABLE `tp_application` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `company` varchar(40) NOT NULL,
  `position` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `descrips` varchar(255) NOT NULL,
  `scene` varchar(50) NOT NULL,
  `scene_two` varchar(50) NOT NULL,
  `textareanames` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `hide` int(2) NOT NULL COMMENT '是否查看0：未查看1：已查看',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_application`
-- -----------------------------
INSERT INTO `tp_application` VALUES ('9', '夏娃', '测试', '测试', '18053640781', '测', '1', '1', '', '1551603671', '1');
INSERT INTO `tp_application` VALUES ('10', '测试', '测试', '测', '15036584444', '测', '1', '1', '', '1551603717', '1');

-- -----------------------------
-- Table structure for `tp_arctype`
-- -----------------------------
DROP TABLE IF EXISTS `tp_arctype`;
CREATE TABLE `tp_arctype` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `channeltype` int(10) DEFAULT '0' COMMENT '栏目顶级模型ID',
  `parent_id` int(10) DEFAULT '0' COMMENT '栏目上级ID',
  `typename` varchar(200) DEFAULT '' COMMENT '栏目名称',
  `dirpath` varchar(200) DEFAULT '' COMMENT '目录存放HTML路径',
  `englist_name` varchar(200) DEFAULT '' COMMENT '栏目英文名',
  `grade` tinyint(1) DEFAULT '0' COMMENT '栏目等级',
  `typelink` varchar(200) DEFAULT '' COMMENT '栏目链接',
  `litpic` varchar(250) DEFAULT '' COMMENT '栏目图片',
  `templist` varchar(200) DEFAULT '' COMMENT '列表模板文件名',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'seo关键字',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏栏目：0=显示，1=隐藏',
  `is_part` tinyint(1) DEFAULT '0' COMMENT '栏目属性：0=内容栏目，1=外部链接',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '启用 (1=正常，0=屏蔽)',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `description` varchar(255) NOT NULL,
  `listorder` int(5) NOT NULL DEFAULT '0',
  `banner` varchar(120) DEFAULT NULL,
  `dirname` varchar(40) DEFAULT NULL,
  `seo_description` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `cat_url` varchar(100) DEFAULT NULL,
  `other_1` varchar(60) DEFAULT NULL,
  `other_2` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`channeltype`,`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='文档栏目表';

-- -----------------------------
-- Records of `tp_arctype`
-- -----------------------------
INSERT INTO `tp_arctype` VALUES ('21', '2', '2', '教团头条', '', 'hot news', '0', '', '', '', '', '', '', '0', '1', '0', '0', '0', '0', '1', 'cn', '0', '0', '', '1', '', '', '', '', '', '', '');

-- -----------------------------
-- Table structure for `tp_article`
-- -----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` int(10) NOT NULL DEFAULT '0' COMMENT '文章作者',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT NULL COMMENT '文章缩略图',
  `hide` int(2) NOT NULL DEFAULT '1',
  `orderid` int(5) NOT NULL DEFAULT '0',
  `catid` int(5) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_article`
-- -----------------------------
INSERT INTO `tp_article` VALUES ('31', '购物流程', '<p>的发射点发是打发斯蒂芬</p>', '0', '', '1554343030', '', '亲，不可以哦！同程旅游奖金是由同程旅游给予会员的特定优惠，与提供服务的酒店、机票、航空公司、景区、租车供应商、旅行社、导游等无关。', '0', '', '', '1', '1', '21');
INSERT INTO `tp_article` VALUES ('32', '支付方式', '<p>的发射点发是打发斯蒂芬</p>', '0', '', '1554343100', '', '亲，不可以哦！同程旅游奖金是由同程旅游给予会员的特定优惠，与提供服务的酒店、机票、航空公司、景区、租车供应商、旅行社、导游等无关。', '0', '', '', '1', '2', '21');
INSERT INTO `tp_article` VALUES ('33', '售后规则', '<p>的发射点发是打发斯蒂芬</p>', '0', '', '1554343128', '', '亲，不可以哦！同程旅游奖金是由同程旅游给予会员的特定优惠，与提供服务的酒店、机票、航空公司、景区、租车供应商、旅行社、导游等无关。', '0', '', '', '1', '3', '21');

-- -----------------------------
-- Table structure for `tp_audition`
-- -----------------------------
DROP TABLE IF EXISTS `tp_audition`;
CREATE TABLE `tp_audition` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `goods_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL,
  `progress` int(2) NOT NULL DEFAULT '0',
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `is_check` int(2) NOT NULL DEFAULT '0' COMMENT '是否审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_audition`
-- -----------------------------
INSERT INTO `tp_audition` VALUES ('1', '1', '1', '1', '1557192631', '', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('2', '1', '1', '1', '1557192662', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('3', '1', '1', '1', '1557192707', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('4', '1', '1', '1', '1557192707', '', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('5', '1', '0', '1', '1557194187', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('6', '1', '0', '1', '1557194193', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('7', '1', '0', '1', '1557194193', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('8', '6', '0', '2', '1557194347', '13626362011', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('9', '6', '0', '2', '1557194466', '13626363044', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('10', '6', '0', '2', '1557194692', '13625478541', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('11', '6', '0', '8', '1557194750', '18266365712', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('12', '1', '0', '1', '1557197060', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('13', '1', '1', '1', '1557197060', '15098771238', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('14', '6', '0', '2', '1557210887', '12365742155', '0', '0', '0');
INSERT INTO `tp_audition` VALUES ('15', '1', '0', '1', '1557215229', '15098771238', '0', '0', '0');

-- -----------------------------
-- Table structure for `tp_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '' COMMENT '权限点',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型（拓展字段）',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(50) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL COMMENT '菜单状态',
  `mname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=402 DEFAULT CHARSET=utf8 COMMENT='权限节点';

-- -----------------------------
-- Records of `tp_auth_rule`
-- -----------------------------
INSERT INTO `tp_auth_rule` VALUES ('1', 'System/index', '系统设置', '1', '1', '0', 'layui-icon-set', '', '0', '0', '1446535750', '1', '1', 'menuplatform');
INSERT INTO `tp_auth_rule` VALUES ('2', 'System/index', '系统设置', '1', '1', '0', 'icon_01_system', '', '1', '1', '1446535789', '1', '1', 'system/index');
INSERT INTO `tp_auth_rule` VALUES ('4', 'Database/restore', '还原数据库', '1', '1', '0', '', '', '3', '10', '1446535750', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('5', 'Database/database', '数据库备份', '1', '1', '0', '', '', '3', '1', '1446535834', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('9', 'Category/index', '栏目列表', '1', '1', '0', '', '', '7', '0', '1446535750', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('13', 'Category/edit', '操作-修改', '1', '1', '0', '', '', '9', '3', '1446535750', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('14', 'Category/add', '操作-添加', '1', '1', '0', '', '', '9', '0', '1446535750', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('16', 'Auth/adminList', '管理员列表', '1', '1', '0', '', '', '15', '0', '1446535750', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('17', 'Auth/adminGroup', '用户组列表', '1', '1', '0', '', '', '15', '1', '1446535750', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('18', 'Auth/adminRule', '权限管理', '1', '1', '0', '', '', '286', '2', '1446535750', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('23', 'Help/soft', '软件下载', '1', '1', '0', '', '', '22', '50', '1446711421', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('28', 'Member/index', '会员管理', '1', '1', '0', 'layui-icon-user', '', '0', '1', '1447231590', '1', '1', 'menuproduct');
INSERT INTO `tp_auth_rule` VALUES ('29', 'Users/memindex', '会员管理', '1', '1', '0', '', '', '27', '10', '1447232085', '1', '1', 'user_memindex');
INSERT INTO `tp_auth_rule` VALUES ('31', 'Member/index', '会员列表', '1', '1', '0', 'icon_02_cat_and_goods', '', '28', '0', '1447232183', '1', '1', 'camping');
INSERT INTO `tp_auth_rule` VALUES ('32', 'Shop/index', '商品列表', '1', '1', '0', '', '', '31', '1', '1447639935', '0', '1', 'camp_cate');
INSERT INTO `tp_auth_rule` VALUES ('36', 'We/we_menu', '自定义菜单', '1', '1', '0', '', '', '35', '50', '1447842477', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('38', 'Users/money', '充值提现', '1', '1', '0', '', '', '27', '50', '1448413248', '1', '1', 'user_money');
INSERT INTO `tp_auth_rule` VALUES ('39', 'We/we_menu', '自定义菜单', '1', '1', '0', '', '', '36', '50', '1448501584', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('45', 'Member/group', '会员组', '1', '1', '0', 'icon_04_order', '', '28', '1', '1450314297', '1', '1', 'homestay');
INSERT INTO `tp_auth_rule` VALUES ('46', 'System/email', '邮箱设置', '1', '1', '0', 'icon_07_content', '', '1', '5', '1450314324', '1', '0', 'winery');
INSERT INTO `tp_auth_rule` VALUES ('283', 'Article/catlist', '文章分类', '1', '1', '1', '', '', '46', '1', '0', '0', '1', 'winprotype');
INSERT INTO `tp_auth_rule` VALUES ('105', 'System/runsys', '操作-保存', '1', '1', '0', '', '', '6', '50', '1461036331', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('106', 'System/runwesys', '操作-保存', '1', '1', '0', '', '', '10', '50', '1461037680', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('107', 'System/runemail', '操作-保存', '1', '1', '0', '', '', '19', '50', '1461039346', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('108', 'Auth/ruleAdd', '操作-添加', '1', '1', '0', '', '', '18', '0', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('109', 'Auth/ruleState', '操作-状态', '1', '1', '0', '', '', '18', '5', '1461550949', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('110', 'Auth/ruleTz', '操作-验证', '1', '1', '0', '', '', '18', '6', '1461551129', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('111', 'Auth/ruleorder', '操作-排序', '1', '1', '0', '', '', '18', '7', '1461551263', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('112', 'Auth/ruleDel', '操作-删除', '1', '1', '0', '', '', '18', '4', '1461551536', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('114', 'Auth/ruleEdit', '操作-修改', '1', '1', '0', '', '', '18', '2', '1461551913', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('116', 'Auth/groupEdit', '操作-修改', '1', '1', '0', '', '', '17', '3', '1461552326', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('117', 'Auth/groupDel', '操作-删除', '1', '1', '0', '', '', '17', '30', '1461552349', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('118', 'Auth/groupAccess', '操作-权限', '1', '1', '0', '', '', '17', '40', '1461552404', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('119', 'Auth/adminAdd', '操作-添加', '1', '1', '0', '', '', '16', '0', '1461553162', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('120', 'Auth/adminEdit', '操作-修改', '1', '1', '0', '', '', '16', '2', '1461554130', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('121', 'Auth/adminDel', '操作-删除', '1', '1', '0', '', '', '16', '4', '1461554152', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('122', 'System/source_runadd', '操作-添加', '1', '1', '0', '', '', '43', '10', '1461036331', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('123', 'System/source_order', '操作-排序', '1', '1', '0', '', '', '43', '50', '1461037680', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('124', 'System/source_runedit', '操作-改存', '1', '1', '0', '', '', '43', '30', '1461039346', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('125', 'System/source_del', '操作-删除', '1', '1', '0', '', '', '43', '40', '146103934', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('126', 'Database/export', '操作-备份', '1', '1', '0', '', '', '5', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('127', 'Database/optimize', '操作-优化', '1', '1', '0', '', '', '5', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('128', 'Database/repair', '操作-修复', '1', '1', '0', '', '', '5', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('129', 'Database/delSqlFiles', '操作-删除', '1', '1', '0', '', '', '4', '3', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('130', 'System/bxgs_state', '操作-状态', '1', '1', '0', '', '', '67', '5', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('131', 'System/bxgs_edit', '操作-修改', '1', '1', '0', '', '', '67', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('132', 'System/bxgs_runedit', '操作-改存', '1', '1', '0', '', '', '67', '2', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('134', 'System/myinfo_runedit', '个人资料修改', '1', '1', '0', '', '', '68', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('236', 'Category/del', '操作-删除', '1', '1', '0', '', '', '9', '5', '1497424900', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('230', 'Database/restoreData', '操作-还原', '1', '1', '0', '', '', '4', '1', '1497423595', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('145', 'Auth/adminState', '操作-状态', '1', '1', '0', '', '', '16', '5', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('149', 'Auth/groupAdd', '操作-添加', '1', '1', '0', '', '', '17', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('151', 'Auth/groupRunaccess', '操作-权存', '1', '1', '0', '', '', '17', '50', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('153', 'System/bxgs_runadd', '操作-添存', '1', '1', '0', '', '', '66', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('234', 'Category/insert', '操作-添存', '1', '1', '0', '', '', '9', '2', '1497424143', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('240', 'Module/del', '操作-删除', '1', '1', '0', '', '', '190', '4', '1497425850', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('239', 'Module/moduleState', '操作-状态', '1', '1', '0', '', '', '190', '5', '1497425764', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('238', 'page/edit', '单页编辑', '1', '1', '0', '', '', '7', '2', '1497425142', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('237', 'Category/cOrder', '操作-排序', '1', '1', '0', '', '', '9', '6', '1497424979', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('161', 'Users/usersState', '操作-状态', '1', '1', '0', '', '', '29', '1', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('162', 'Users/delall', '操作-全部删除', '1', '1', '0', '', '', '29', '4', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('163', 'Users/edit', '操作-编辑', '1', '1', '0', '', '', '29', '2', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('164', 'Users/usersDel', '操作-删除', '1', '1', '0', '', '', '29', '3', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('247', 'Message/del', '操作-删除', '1', '1', '0', '', '', '48', '1', '1497427449', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('166', 'Users/groupOrder', '操作-排序', '1', '1', '0', '', '', '38', '50', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('167', 'Users/groupAdd', '操作-添加', '1', '1', '0', '', '', '38', '10', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('169', 'Users/groupDel', '操作-删除', '1', '1', '0', '', '', '38', '30', '1461550835', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('170', 'Order/order_list', '订单列表', '1', '1', '0', '', '', '45', '1', '1461550835', '0', '1', 'order_list');
INSERT INTO `tp_auth_rule` VALUES ('171', 'Order/order_query', '订单查询', '1', '1', '0', '', '', '45', '2', '1461550835', '0', '0', 'hreviewslist');
INSERT INTO `tp_auth_rule` VALUES ('173', 'Order/order_list', '合并订单', '1', '1', '0', '', '', '45', '3', '1461550835', '0', '0', 'hquestions');
INSERT INTO `tp_auth_rule` VALUES ('174', 'Order/delivery_list', '发货单列表', '1', '1', '0', '', '', '45', '4', '1461550835', '0', '1', 'himpression');
INSERT INTO `tp_auth_rule` VALUES ('175', 'Order/back_list', '退货单列表', '1', '1', '0', '', '', '45', '5', '1461550835', '0', '1', 'htopics');
INSERT INTO `tp_auth_rule` VALUES ('176', 'Article/index', '文章列表', '1', '1', '0', '', '', '46', '2', '1461550835', '1', '1', 'wreviewslist');
INSERT INTO `tp_auth_rule` VALUES ('252', 'Counts/details', '积分明细', '1', '1', '0', '', '', '203', '1', '1497428906', '0', '1', 'about_index');
INSERT INTO `tp_auth_rule` VALUES ('178', 'Article/vote', '在线调查', '1', '1', '0', '', '', '46', '3', '1461550835', '1', '0', 'wquestions');
INSERT INTO `tp_auth_rule` VALUES ('179', 'Originality/apply_list', '合作申请列表', '1', '1', '0', '', '', '46', '5', '1461550835', '1', '0', 'winery_topics');
INSERT INTO `tp_auth_rule` VALUES ('180', 'System/source_edit', '操作-修改', '1', '1', '0', '', '', '43', '20', '1461832933', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('181', 'Auth/groupState', '操作-状态', '1', '1', '0', '', '', '17', '50', '1461834340', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('182', 'Users/groupEdit', '操作-修改', '1', '1', '0', '', '', '38', '15', '1461834780', '1', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('183', 'Winery/impression', '点评印象', '1', '1', '0', '', '', '46', '3', '1461834988', '1', '0', 'wimpression');
INSERT INTO `tp_auth_rule` VALUES ('188', 'Plug/donation', '捐赠列表', '1', '1', '0', '', '', '187', '50', '1466563673', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('284', 'Order/invoice_list', '发票列表', '1', '1', '1', '', '', '45', '6', '0', '1', '0', 'homeprolist');
INSERT INTO `tp_auth_rule` VALUES ('190', 'Module/index', '模型列表', '1', '1', '0', '', '', '189', '1', '1466826681', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('192', 'Module/edit', '操作-修改', '1', '1', '0', '', '', '190', '2', '1467007920', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('193', 'Module/add', '操作-添加', '1', '1', '0', '', '', '190', '1', '1467007955', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('196', 'Article/index', '活动管理', '1', '1', '0', 'layui-icon-app', '', '0', '7', '1481857304', '0', '1', 'menuarc');
INSERT INTO `tp_auth_rule` VALUES ('197', 'Article/index', '项目列表', '1', '1', '0', '', '', '196', '1', '1481857540', '0', '1', 'arc_index');
INSERT INTO `tp_auth_rule` VALUES ('198', 'Counts/member', '客户统计', '1', '1', '0', '', '', '203', '2', '1481857587', '0', '1', 'about_message');
INSERT INTO `tp_auth_rule` VALUES ('203', 'Counts/index', '统计', '1', '1', '0', 'icon_06_stats', '', '196', '2', '1484797759', '0', '0', 'about_index');
INSERT INTO `tp_auth_rule` VALUES ('204', 'Counts/Order', '订单统计', '1', '1', '0', '', '', '203', '3', '1484797849', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('205', 'Counts/ranking', '会员排行', '1', '1', '0', '', '', '203', '4', '1484797878', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('306', 'Article/arclist', '新闻列表', '1', '1', '1', '', '', '197', '0', '0', '0', '1', 'arc_list');
INSERT INTO `tp_auth_rule` VALUES ('207', 'Wechat/config', '公众号管理', '1', '1', '0', '', '', '206', '1', '1487063705', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('208', 'Wechat/menu', '菜单管理', '1', '1', '0', '', '', '206', '2', '1487063765', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('209', 'Wechat/materialmessage', '消息素材', '1', '1', '0', '', '', '206', '3', '1487063834', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('212', 'Wechat/weixin', '操作-设置', '1', '1', '0', '', '', '207', '1', '1487064541', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('213', 'Wechat/addMenu', '操作-添加', '1', '1', '0', '', '', '208', '1', '1487149151', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('214', 'Wechat/editText', '操作-编辑', '1', '1', '0', '', '', '209', '2', '1487233984', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('215', 'Wechat/addText', '操作-添加', '1', '1', '0', '', '', '209', '1', '1487234062', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('232', 'Database/downFile', '操作-下载', '1', '1', '0', '', '', '4', '2', '1497423744', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('235', 'Category/catUpdate', '操作-该存', '1', '1', '0', '', '', '9', '4', '1497424301', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('241', 'Module/field', '模型字段', '1', '1', '0', '', '', '190', '6', '1497425972', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('242', 'Module/fieldStatus', '操作-状态', '1', '1', '0', '', '', '241', '4', '1497426044', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('243', 'Module/fieldAdd', '操作-添加', '1', '1', '0', '', '', '241', '1', '1497426089', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('244', 'Module/fieldEdit', '操作-修改', '1', '1', '0', '', '', '241', '2', '1497426134', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('245', 'Module/listOrder', '操作-排序', '1', '1', '0', '', '', '241', '3', '1497426179', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('246', 'Module/fieldDel', '操作-删除', '1', '1', '0', '', '', '241', '5', '1497426241', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('248', 'Message/delall', '操作-删除全部', '1', '1', '0', '', '', '48', '2', '1497427534', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('249', 'Shop/add_goods', '添加新商品', '1', '1', '0', '', '', '31', '2', '1497427694', '0', '1', 'camp_index');
INSERT INTO `tp_auth_rule` VALUES ('250', 'Shop/catlist', '商品分类', '1', '1', '0', '', '', '31', '3', '1497427734', '0', '1', 'camp_topics');
INSERT INTO `tp_auth_rule` VALUES ('253', 'Help/index', '帮助列表', '1', '1', '0', '', '', '272', '4', '1497428951', '0', '1', 'help_index');
INSERT INTO `tp_auth_rule` VALUES ('254', 'Help/typelist', '帮助分类', '1', '1', '0', '', '', '272', '5', '1497429018', '0', '1', 'help_typelist');
INSERT INTO `tp_auth_rule` VALUES ('256', 'Template/imgDel', '操作-文件删除', '1', '1', '0', '', '', '255', '1', '1497429217', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('257', 'Counts/sale', '销售统计', '1', '1', '0', '', '', '203', '5', '1497429416', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('258', 'Wechat/editMenu', '操作-编辑', '1', '1', '0', '', '', '208', '2', '1497429671', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('259', 'Wechat/menuOrder', '操作-排序', '1', '1', '0', '', '', '208', '3', '1497429707', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('260', 'Wechat/menuState', '操作-状态', '1', '1', '0', '', '', '208', '4', '1497429764', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('261', 'Wechat/delMenu', '操作-删除', '1', '1', '0', '', '', '208', '5', '1497429822', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('262', 'Wechat/createMenu', '操作-生成菜单', '1', '1', '0', '', '', '208', '6', '1497429886', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('263', 'Wechat/delText', '操作-删除', '1', '1', '0', '', '', '209', '3', '1497430020', '0', '0', '');
INSERT INTO `tp_auth_rule` VALUES ('282', 'Originality/apply', '合作申请设置', '1', '1', '1', '', '', '46', '4', '0', '1', '0', 'winprolist');
INSERT INTO `tp_auth_rule` VALUES ('273', 'Wechat/replay', '回复设置', '1', '1', '0', '', '', '206', '4', '1508215988', '0', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('267', 'Database/index', '数据库管理', '1', '1', '1', 'layui-icon-template-1', '', '0', '2', '1501466560', '1', '1', 'menuorder');
INSERT INTO `tp_auth_rule` VALUES ('269', 'Promotion/index', '促销', '1', '1', '1', 'icon_02_promotion', '', '28', '1', '1501466732', '1', '0', 'orderline_index');
INSERT INTO `tp_auth_rule` VALUES ('270', 'System/wechat', '公众号设置', '1', '1', '0', 'icon_05_banner', '', '1', '2', '1502331829', '0', '1', 'ad_index');
INSERT INTO `tp_auth_rule` VALUES ('272', 'Help/index', '订单统计', '1', '1', '1', '', '', '196', '3', '1504082720', '0', '0', 'help_index');
INSERT INTO `tp_auth_rule` VALUES ('279', 'Storage/index', '仓库', '1', '1', '1', 'icon_03_goods_storage', '', '28', '3', '1533955249', '1', '0', 'shopindex');
INSERT INTO `tp_auth_rule` VALUES ('280', 'Stock/put_in', '库存入库记录', '1', '1', '1', '', '', '279', '10', '1533955318', '0', '1', 'shop_prolist');
INSERT INTO `tp_auth_rule` VALUES ('285', 'Link/index', '友链', '1', '1', '1', '', '', '1', '3', '0', '0', '0', 'link_index');
INSERT INTO `tp_auth_rule` VALUES ('286', 'Admin/index', '权限', '1', '1', '1', 'icon_10_priv_admin', '', '1', '4', '0', '0', '0', 'admin_index');
INSERT INTO `tp_auth_rule` VALUES ('288', 'System/sms_template', '短信模板', '1', '1', '1', '', '', '2', '5', '0', '0', '1', 'sysmember');
INSERT INTO `tp_auth_rule` VALUES ('287', 'System/index', '系统配置', '1', '1', '1', 'ico-system-0', '', '2', '0', '0', '0', '1', 'sysindex');
INSERT INTO `tp_auth_rule` VALUES ('289', 'Slide/index', '幻灯管理', '1', '1', '1', '', '', '2', '1', '0', '0', '1', 'syscity');
INSERT INTO `tp_auth_rule` VALUES ('290', 'Tools/index', '数据备份', '1', '1', '1', '', '', '353', '3', '0', '0', '1', 'syssupplier');
INSERT INTO `tp_auth_rule` VALUES ('291', 'System/clear_cache', '清除缓存', '1', '1', '1', '', '', '2', '4', '0', '0', '1', 'sysnavlist');
INSERT INTO `tp_auth_rule` VALUES ('292', 'Ad/ad_position', '广告位置', '1', '1', '1', '', '', '270', '0', '0', '0', '1', 'adwords');
INSERT INTO `tp_auth_rule` VALUES ('293', 'Ad/index', '广告列表', '1', '1', '1', '', '', '270', '1', '0', '0', '1', 'adpicture');
INSERT INTO `tp_auth_rule` VALUES ('294', 'Ad/code', '代码', '1', '1', '1', '', '', '270', '2', '0', '0', '0', 'adcode');
INSERT INTO `tp_auth_rule` VALUES ('295', 'Link/index', '文字链接', '1', '1', '1', '', '', '285', '1', '0', '0', '1', 'linktextlink');
INSERT INTO `tp_auth_rule` VALUES ('296', 'Link/piclink', '图片链接', '1', '1', '1', '', '', '285', '2', '0', '0', '1', 'linkpiclink');
INSERT INTO `tp_auth_rule` VALUES ('297', 'Admin/index', '管理员列表', '1', '1', '1', '', '', '286', '0', '0', '0', '1', 'adminmlist');
INSERT INTO `tp_auth_rule` VALUES ('298', 'Admin/jlist', '角色列表', '1', '1', '1', '', '', '286', '1', '0', '0', '1', 'adminjlist');
INSERT INTO `tp_auth_rule` VALUES ('299', 'Admin/log', '操作日志', '1', '1', '1', '', '', '286', '2', '0', '0', '1', 'adminlog');
INSERT INTO `tp_auth_rule` VALUES ('300', 'System/navlist', '导航管理', '1', '1', '1', '', '', '2', '2', '0', '0', '0', 'smstemplate');
INSERT INTO `tp_auth_rule` VALUES ('301', 'Users/memlist', '会员列表', '1', '1', '1', '', '', '29', '0', '0', '1', '1', 'user_memlist');
INSERT INTO `tp_auth_rule` VALUES ('302', 'Users/memtype', '会员等级', '1', '1', '1', '', '', '29', '1', '0', '0', '1', 'user_memtype');
INSERT INTO `tp_auth_rule` VALUES ('303', 'Users/recharge', '充值记录', '1', '1', '1', '', '', '38', '0', '0', '0', '1', 'user_recharge');
INSERT INTO `tp_auth_rule` VALUES ('304', 'Users/withdrawal', '提现申请', '1', '1', '1', '', '', '38', '0', '0', '0', '1', 'user_withdrawal');
INSERT INTO `tp_auth_rule` VALUES ('305', 'Users/cash', '提现设置', '1', '1', '1', '', '', '38', '0', '0', '0', '1', 'user_cash');
INSERT INTO `tp_auth_rule` VALUES ('307', 'Article/typelist', '新闻分类', '1', '1', '1', '', '', '197', '0', '0', '0', '1', 'arc_typelist');
INSERT INTO `tp_auth_rule` VALUES ('359', 'Stock/put_out', '库存出库记录', '1', '1', '1', '', '', '279', '11', '1533955318', '0', '1', 'put_out');
INSERT INTO `tp_auth_rule` VALUES ('317', 'Supper/index', '商家', '1', '1', '1', 'icon_17_merchants', '', '28', '2', '0', '1', '0', 'cquestions');
INSERT INTO `tp_auth_rule` VALUES ('318', 'Shop/comment', '用户评论', '1', '1', '1', '', '', '31', '6', '0', '1', '0', 'creviewslist');
INSERT INTO `tp_auth_rule` VALUES ('319', 'Order/order_excel', '订单导出', '1', '1', '1', '', '', '45', '7', '0', '1', '0', 'hcategory');
INSERT INTO `tp_auth_rule` VALUES ('320', 'Tools/index', '数据库备份', '1', '1', '1', 'icon_06_seo', '', '267', '2', '0', '1', '1', 'Orderwinery_index');
INSERT INTO `tp_auth_rule` VALUES ('321', 'Tools/restore', '还原数据库', '1', '1', '1', '', '', '267', '3', '0', '1', '1', 'ordercamping_index');
INSERT INTO `tp_auth_rule` VALUES ('322', 'Orderhomestay/index', '民宿', '1', '1', '1', '', '', '267', '4', '0', '1', '0', 'Orderhomestay_index');
INSERT INTO `tp_auth_rule` VALUES ('323', 'Promotion/group_buying', '团购活动', '1', '1', '1', '', '', '269', '0', '0', '1', '1', 'Orderline_index');
INSERT INTO `tp_auth_rule` VALUES ('324', 'Promotion/discount', '优惠促销', '1', '1', '1', '', '', '269', '1', '0', '1', '0', 'Orderline_index_dcl');
INSERT INTO `tp_auth_rule` VALUES ('384', 'Users/withdrawal', '提现申请', '1', '1', '1', '', '', '366', '0', '0', '1', '1', 'withdrawals');
INSERT INTO `tp_auth_rule` VALUES ('383', 'Users/recharge', '充值记录', '1', '1', '1', '', '', '366', '0', '0', '1', '1', 'recharge');
INSERT INTO `tp_auth_rule` VALUES ('382', 'Users/message', '会员留言', '1', '1', '1', '', '', '363', '0', '0', '1', '1', 'member_message');
INSERT INTO `tp_auth_rule` VALUES ('381', 'Users/memtype', '会员等级', '1', '1', '1', '', '', '363', '1', '0', '1', '1', 'Member_rank');
INSERT INTO `tp_auth_rule` VALUES ('380', 'Users/memlist', '会员列表', '1', '1', '1', '', '', '363', '0', '0', '1', '1', 'Member_memlist');
INSERT INTO `tp_auth_rule` VALUES ('379', 'Promotion/coupon', '优惠券', '1', '1', '1', '', '', '269', '5', '0', '1', '1', 'promotion_coupon');
INSERT INTO `tp_auth_rule` VALUES ('332', 'Mall/index', '积分商城', '1', '1', '1', '', '', '320', '0', '0', '1', '1', 'Orderwinery_index');
INSERT INTO `tp_auth_rule` VALUES ('333', 'Orderwinery/index?mark=-1', '待处理', '1', '1', '1', '', '', '320', '1', '0', '1', '0', 'Orderwinery_index_dcl');
INSERT INTO `tp_auth_rule` VALUES ('334', 'Orderwinery/index?mark=1', '已取消', '1', '1', '1', '', '', '320', '2', '0', '1', '0', 'Orderwinery_index1');
INSERT INTO `tp_auth_rule` VALUES ('335', 'Orderwinery/index?mark=2', '待付款', '1', '1', '1', '', '', '320', '3', '0', '1', '0', 'Orderwinery_index2');
INSERT INTO `tp_auth_rule` VALUES ('336', 'Orderwinery/index?mark=3', '待点评', '1', '1', '1', '', '', '320', '4', '0', '1', '0', 'Orderwinery_index3');
INSERT INTO `tp_auth_rule` VALUES ('337', 'Orderwinery/index?mark=4', '已点评', '1', '1', '1', '', '', '320', '5', '0', '1', '0', 'Orderwinery_index_4');
INSERT INTO `tp_auth_rule` VALUES ('338', 'Orderwinery/index?mark=5', '已完成', '1', '1', '1', '', '', '320', '6', '0', '1', '0', 'Orderwinery_index5');
INSERT INTO `tp_auth_rule` VALUES ('339', 'Ordercamping/index', '全部订单', '1', '1', '1', '', '', '321', '0', '0', '1', '1', 'ordercamping_index');
INSERT INTO `tp_auth_rule` VALUES ('340', 'Ordercamping/index?mark=-1', '待处理', '1', '1', '1', '', '', '321', '1', '0', '1', '1', 'ordercamping_index_dcl');
INSERT INTO `tp_auth_rule` VALUES ('341', 'Ordercamping/index?mark=1', '已取消', '1', '1', '1', '', '', '321', '2', '0', '1', '1', 'ordercamping_index_1');
INSERT INTO `tp_auth_rule` VALUES ('342', 'Ordercamping/index?mark=2', '待付款', '1', '1', '1', '', '', '321', '3', '0', '1', '1', 'ordercamping_index2');
INSERT INTO `tp_auth_rule` VALUES ('343', 'Ordercamping/index?mark=3', '待点评', '1', '1', '1', '', '', '321', '4', '0', '1', '1', 'ordercamping_index3');
INSERT INTO `tp_auth_rule` VALUES ('344', 'Ordercamping/index?mark=4', '已点评', '1', '1', '1', '', '', '321', '5', '0', '1', '1', 'ordercamping_index4');
INSERT INTO `tp_auth_rule` VALUES ('345', 'Ordercamping/index?mark=5', '已完成', '1', '1', '1', '', '', '321', '6', '0', '1', '1', 'ordercamping_index5');
INSERT INTO `tp_auth_rule` VALUES ('346', 'Orderhomestay/index', '全部订单', '1', '1', '1', '', '', '322', '0', '0', '1', '1', 'Orderhomestay_index');
INSERT INTO `tp_auth_rule` VALUES ('347', 'Orderhomestay/index?mark=-1', '待处理', '1', '1', '1', '', '', '322', '1', '0', '1', '1', 'Orderhomestay_index_dcl');
INSERT INTO `tp_auth_rule` VALUES ('348', 'Orderhomestay/index?mark=1', '已取消', '1', '1', '1', '', '', '322', '2', '0', '1', '1', 'Orderhomestay_index1');
INSERT INTO `tp_auth_rule` VALUES ('349', 'Orderhomestay/index?mark=2', '待付款', '1', '1', '1', '', '', '322', '3', '0', '1', '1', 'Orderhomestay_index2');
INSERT INTO `tp_auth_rule` VALUES ('350', 'Orderhomestay/index?mark=3', '待点评', '1', '1', '1', '', '', '322', '4', '0', '1', '1', 'Orderhomestay_index3');
INSERT INTO `tp_auth_rule` VALUES ('351', 'Orderhomestay/index?mark=4', '已点评', '1', '1', '1', '', '', '322', '5', '0', '1', '1', 'Orderhomestay_index4');
INSERT INTO `tp_auth_rule` VALUES ('352', 'Orderhomestay/index?mark=5', '已完成', '1', '1', '1', '', '', '322', '6', '0', '1', '1', 'Orderhomestay_index5');
INSERT INTO `tp_auth_rule` VALUES ('353', 'Tools/index', '数据', '1', '1', '1', 'icon_13_backup', '', '1', '5', '0', '1', '0', 'tools_index');
INSERT INTO `tp_auth_rule` VALUES ('354', 'shop/consult', '用户咨询', '1', '1', '1', '', '', '31', '7', '0', '1', '0', 'shop_college_admission');
INSERT INTO `tp_auth_rule` VALUES ('355', 'shop/mold', '商品类型', '1', '1', '1', '', '', '31', '8', '0', '1', '0', 'professional_admission');
INSERT INTO `tp_auth_rule` VALUES ('356', 'shop/trash', '商品回收站', '1', '1', '1', '', '', '31', '4', '0', '1', '1', 'shop_plan');
INSERT INTO `tp_auth_rule` VALUES ('357', 'store/merchants_steps', '店铺设置', '1', '1', '1', '', '', '317', '1', '0', '1', '1', 'merchants_steps');
INSERT INTO `tp_auth_rule` VALUES ('358', 'store/merchants_users_list', '店铺列表', '1', '1', '1', '', '', '317', '2', '0', '1', '1', 'merchants_users_list');
INSERT INTO `tp_auth_rule` VALUES ('360', 'System/linklist', '友情链接', '1', '1', '1', '', '', '2', '6', '0', '1', '1', 'System_linklist');
INSERT INTO `tp_auth_rule` VALUES ('361', 'Tools/restore', '数据还原', '1', '1', '1', '', '', '353', '5', '0', '1', '1', 'Tools_restore');
INSERT INTO `tp_auth_rule` VALUES ('362', 'Users', '会员', '1', '1', '1', '', '', '0', '8', '0', '1', '0', 'member_nav');
INSERT INTO `tp_auth_rule` VALUES ('363', 'Users/memindex', '会员管理', '1', '1', '1', 'icon_08_members', '', '362', '1', '0', '1', '1', 'mem_memlist');
INSERT INTO `tp_auth_rule` VALUES ('364', 'Marketing/promotion', '促销', '1', '1', '1', '', '', '267', '2', '0', '1', '0', 'Marketing_promotion');
INSERT INTO `tp_auth_rule` VALUES ('365', 'shop/self_mention', '自提点', '1', '1', '1', 'icon_23_drp', '', '28', '10', '0', '1', '0', 'shop_self_mention');
INSERT INTO `tp_auth_rule` VALUES ('366', 'Member/money', '资金', '1', '1', '1', 'icon_13_backup', '', '362', '2', '0', '1', '1', 'member_money');
INSERT INTO `tp_auth_rule` VALUES ('367', 'Shop/brand', '品牌管理', '1', '1', '1', '', '', '31', '10', '0', '1', '0', 'Shop_brand');
INSERT INTO `tp_auth_rule` VALUES ('368', 'Shop/tag', '标签管理', '1', '1', '1', '', '', '31', '11', '0', '1', '0', 'Shop_tag');
INSERT INTO `tp_auth_rule` VALUES ('369', 'Shop/auto', '商品自动上下架', '1', '1', '1', '', '', '31', '12', '0', '1', '0', 'shop_auto');
INSERT INTO `tp_auth_rule` VALUES ('386', 'News/index', '新闻', '1', '1', '1', 'icon_07_content', '', '28', '11', '0', '1', '0', 'news_index');
INSERT INTO `tp_auth_rule` VALUES ('370', 'Stock/purchase', '生成采购单', '1', '1', '1', '', '', '279', '3', '0', '1', '1', 'purchase_order');
INSERT INTO `tp_auth_rule` VALUES ('371', 'Stock/warehouse', '仓库列表', '1', '1', '1', '', '', '279', '4', '0', '1', '1', 'warehouse');
INSERT INTO `tp_auth_rule` VALUES ('372', 'Stock/sorter', '分拣员列表', '1', '1', '1', '', '', '279', '5', '0', '1', '1', 'stock_sorter');
INSERT INTO `tp_auth_rule` VALUES ('373', 'Stock/dispatching', '配送员列表', '1', '1', '1', '', '', '279', '6', '0', '1', '1', 'dispatching');
INSERT INTO `tp_auth_rule` VALUES ('374', 'Stock/baler', '打包员列表', '1', '1', '1', '', 'stock_baler', '279', '7', '0', '1', '1', 'stock_baler');
INSERT INTO `tp_auth_rule` VALUES ('375', 'Stock/buyer', '采购员列表', '1', '1', '1', '', '', '279', '0', '0', '1', '1', 'stock_buyer');
INSERT INTO `tp_auth_rule` VALUES ('376', 'Shop/self_mention_add', '添加自提点', '1', '1', '1', '', '', '365', '1', '0', '1', '1', 'self_mention_add');
INSERT INTO `tp_auth_rule` VALUES ('377', 'Shop/self_mention_adds', '自提点批量上传', '1', '1', '1', '', '', '365', '2', '0', '1', '0', 'self_mention_adds');
INSERT INTO `tp_auth_rule` VALUES ('378', 'Shop/self_mention_list', '自提点列表', '1', '1', '1', '', '', '365', '3', '0', '1', '1', 'self_mention_list');
INSERT INTO `tp_auth_rule` VALUES ('385', 'Users/cash', '提现设置', '1', '1', '1', '', '', '366', '0', '0', '1', '1', 'Member_cash');
INSERT INTO `tp_auth_rule` VALUES ('387', 'News/index', '新闻列表', '1', '1', '1', '', '', '386', '1', '0', '1', '1', 'news_index');
INSERT INTO `tp_auth_rule` VALUES ('388', 'news/catlist', '新闻分类', '1', '1', '1', '', '', '386', '2', '0', '1', '1', 'news_catlist');
INSERT INTO `tp_auth_rule` VALUES ('389', 'Promotion/seckill', '积分商城', '1', '1', '1', '', '', '269', '5', '0', '1', '1', 'Promotion_seckill');
INSERT INTO `tp_auth_rule` VALUES ('390', 'Exam', '题库', '1', '1', '0', 'icon-cog', '', '0', '3', '1447231590', '1', '0', 'examproduct');
INSERT INTO `tp_auth_rule` VALUES ('391', 'Exam/index', '题库', '1', '1', '0', 'icon_02_cat_and_goods', '', '390', '0', '1447232183', '1', '1', 'examlist');
INSERT INTO `tp_auth_rule` VALUES ('392', 'Exam/index', '题库列表', '1', '1', '1', '', '', '391', '1', '1447639935', '1', '1', 'examcate');
INSERT INTO `tp_auth_rule` VALUES ('393', 'Exam/typeindex', '题库科目', '1', '1', '1', '', '', '391', '2', '1447639935', '1', '1', 'examcate2');
INSERT INTO `tp_auth_rule` VALUES ('394', 'Exam/score', '题库设置', '1', '1', '1', '', '', '391', '3', '1447639935', '1', '1', 'examcate3');
INSERT INTO `tp_auth_rule` VALUES ('395', 'Exam/all_settime', '时间段设置', '1', '1', '1', '', '', '391', '4', '1447639935', '1', '1', 'examcate4');
INSERT INTO `tp_auth_rule` VALUES ('396', 'Exam/examination', '考试记录', '1', '1', '1', '', '', '391', '5', '1447639935', '1', '1', 'examcate5');
INSERT INTO `tp_auth_rule` VALUES ('397', 'store/merchants_commission', '店铺结算', '1', '1', '1', '', '', '317', '3', '0', '1', '1', 'merchants_commission');
INSERT INTO `tp_auth_rule` VALUES ('398', 'store/merchants_account', '店铺账户', '1', '1', '1', '', '', '317', '4', '0', '1', '1', 'merchants_account');
INSERT INTO `tp_auth_rule` VALUES ('399', 'store/application', '入住申请', '1', '1', '1', '', '', '317', '5', '0', '1', '1', 'store_application');
INSERT INTO `tp_auth_rule` VALUES ('400', 'store/district', '商圈管理', '1', '1', '1', '', '', '317', '6', '0', '1', '1', 'store_district');
INSERT INTO `tp_auth_rule` VALUES ('401', 'store/supplier', '供应商管理', '1', '1', '1', '', '', '317', '0', '0', '1', '1', 'shop_supplier');

-- -----------------------------
-- Table structure for `tp_batch`
-- -----------------------------
DROP TABLE IF EXISTS `tp_batch`;
CREATE TABLE `tp_batch` (
  `b_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `hide` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_batch`
-- -----------------------------
INSERT INTO `tp_batch` VALUES ('1', '提前本科', '1', '0');
INSERT INTO `tp_batch` VALUES ('2', '提前专项', '1', '0');

-- -----------------------------
-- Table structure for `tp_brand`
-- -----------------------------
DROP TABLE IF EXISTS `tp_brand`;
CREATE TABLE `tp_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_letter` varchar(60) NOT NULL,
  `brand_first_char` char(1) NOT NULL,
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `index_img` varchar(80) NOT NULL,
  `brand_bg` varchar(80) NOT NULL,
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `audit_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` varchar(120) NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `is_show` (`is_show`),
  KEY `audit_status` (`audit_status`),
  KEY `brand_name` (`brand_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_brand_extend`
-- -----------------------------
DROP TABLE IF EXISTS `tp_brand_extend`;
CREATE TABLE `tp_brand_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL COMMENT '品牌id',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 是否推荐0否1是',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_cart`
-- -----------------------------
DROP TABLE IF EXISTS `tp_cart`;
CREATE TABLE `tp_cart` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint(5) unsigned DEFAULT '0' COMMENT '购买数量',
  `item_id` int(11) DEFAULT '0' COMMENT '规格ID',
  `spec_key` varchar(64) DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `spec_key_name` varchar(64) DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,7 搭配购',
  `prom_id` int(11) DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `combination_group_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT ' 搭配购的组id/cart_id',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `spec_key` (`spec_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_cart`
-- -----------------------------
INSERT INTO `tp_cart` VALUES ('1', '1', '', '27', '00027', '甬苗紫魁长茄 紫红长茄 堪比杭茄2010浙茄引茄丰田五号亮紫长茄', '150.00', '100.00', '0.00', '2', '0', '', '', '', '1', '1554600048', '0', '0', '', '0');
INSERT INTO `tp_cart` VALUES ('2', '1', '', '30', '00030', '新鲜蔬菜有机花菜农家有机肥种植长梗松花菜青梗白面菜花头四斤', '80.00', '69.80', '0.00', '3', '0', '', '', '', '1', '1554601021', '0', '0', '', '0');

-- -----------------------------
-- Table structure for `tp_case`
-- -----------------------------
DROP TABLE IF EXISTS `tp_case`;
CREATE TABLE `tp_case` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` int(10) NOT NULL DEFAULT '0' COMMENT '文章作者',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  `hide` int(2) NOT NULL DEFAULT '1',
  `orderid` int(5) NOT NULL DEFAULT '0',
  `catid` int(5) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_case`
-- -----------------------------
INSERT INTO `tp_case` VALUES ('5', 'Castor®分支型主动脉覆膜支架及输送系统项目', '<p><strong>合作目标</strong></p><p>完成课题，最终实现产品转化。</p><p><strong>案例描述</strong></p><p>随着动脉粥样硬化发病率增加，以主动脉瘤和主动脉夹层为代表的动脉扩张病在我国已成为常见病。这类疾病存在破裂、肢体内脏缺血和截瘫等严重并发症，致残致死率高。</p><p>主动脉扩张病传统的治疗方法是病变段主动脉置换，创伤巨大，并发症率死亡率高。现有支架型腔内修复术的出现大大降低了手术创伤，逐渐成为主动脉扩张病主要治疗方法。但目前市场上的产品只适用于没有累及分支动脉的病变，治疗范围局限于降主动脉瘤和降主动脉夹层（Standford-B型或Debakey-Ⅲ）。如图9所示：</p><p style=\"text-align: center;\"><img src=\"/upload/temp/20190309/1103ff6f90578116d1d5130ee72cba51.png\" title=\"1103ff6f90578116d1d5130ee72cba51.png\" alt=\"1103ff6f90578116d1d5130ee72cba51.png\"/>&nbsp;</p><p style=\"text-align: center;\">图9 &nbsp;Standford-B型或Debakey-Ⅲ</p><p>然而临床上胸主动脉瘤和胸主动脉夹层有相当一部分涉及到带有重要分支动脉的升主动脉和主动脉弓。这类病变用传统的人工血管置换术极为复杂、创伤非常大、死亡率极高，更加有必要用微创伤介入式微创的方法治疗，但是由于缺乏合适的移植物系统，这一类病变目前仍是支架型腔内修复术的相对禁忌症（Standford-A型或Debakey-Ⅰ型、Debakey-Ⅱ型）。如图10所示：</p><p style=\"text-align: center;\"><img src=\"/upload/temp/20190309/0e7529022ee30676fa887f80bd128556.png\" title=\"0e7529022ee30676fa887f80bd128556.png\" alt=\"0e7529022ee30676fa887f80bd128556.png\"/>&nbsp;</p><p style=\"text-align: center;\">图10 &nbsp;Standford-A型或Debakey-Ⅰ型、Debakey-Ⅱ型</p><p>Castor®分支型主动脉覆膜支架及输送系统（以下简称Castor®系统）是为了治疗累及主动脉弓部病变的要求而研发的全新产品，可以用于胸主动脉瘤和主动脉夹层的腔内治疗，并将现有的胸主动脉瘤和主动脉夹层支架型腔内修复术的运用范围从降主动脉扩展到升主动脉和主动脉弓。该产品不仅可以治疗升主动脉和主动脉弓的病变，而且可以取代现有的治疗降主动脉病变的覆膜支架，克服现有产品的部分弱点，降低手术并发症，使治疗更为安全和可靠。如下图11所示：</p><p>&nbsp;</p><p>&nbsp;</p><p style=\"text-align: center;\">&nbsp;<img src=\"/upload/temp/20190309/d6439b15bca76bc840055899f05b94d2.png\" title=\"d6439b15bca76bc840055899f05b94d2.png\" alt=\"d6439b15bca76bc840055899f05b94d2.png\"/></p><p>&nbsp;</p><p>&nbsp;</p><p style=\"text-align: center;\">图11 &nbsp;常规支架与Castor®支架的治疗方式</p><p><strong>案例成果</strong></p><p>Castor®系统是国家863项目（涉及分支动脉的主动脉腔内隔绝移植物系统研制，2006-2009）的延续，是在863课题的有效结果基础上开发出的新一代产品。</p><p>在863项目期间，微创®与长海医院血管外科合作，完成了分支型支架的样品定型和动物实验。</p><p>2008年微创®正式将Castor®项目立项，并制定了项目开发计划。2013年4月8日，Castor®项目终于完成了首例临床植入。至2015年5月，Castor®项目完成了全国11家中心的73例临床植入和1年随访。临床实验取得了成功。</p><p>2017年7月，Castor®获得了医疗器械注册证。成为全球首个批准上市的分支型主动脉覆膜支架产品。截止2018年9月，Castor®完成了约350例临床植入。在国内血管外科界引起了不小的轰动，使腔内技术向主动脉弓部病变拓展首先在我国落地开花</p><p><br/></p>', '1', 'Castor®分支型主动脉覆膜支架及输送系统项目', '1536479017', '', 'Castor®分支型主动脉覆膜支架及输送系统项目', '0', '', '/upload/system/20190309/05cb931262358d054f5d367ca02c3a32.png', '1', '3', '17');
INSERT INTO `tp_case` VALUES ('6', 'Fontus®动物试验项目', '<p><strong>合作目标</strong></p><p>完成动物实验，并为后续的研究奠定基础。</p><p><strong>案例描述</strong></p><p>主动脉夹层动脉瘤是主动脉血流通过内膜破裂处进入主动脉壁，在主动脉壁内形成血肿，血肿扩大时，将主动脉壁中层剥离成为内、外两层。主动脉夹层动脉瘤的发病率，每年每百万人口约为5～10例。主动脉夹层动脉瘤病情异常凶险，发生夹层动脉瘤后24小时生存率仅40％，3个月生存率仅10％。病变累及升主动脉者预后更差，1个月生存率仅8％，夹层动脉瘤病例主动脉壁组织脆弱，易破碎，手术操作难度大，死亡率高。</p><p>目前治疗方法为四分支血管全主动脉弓替换+支架象鼻术，该支架象鼻术采用的就是微创®心脉公司自主研发的Cronus®术中支架系统，通过降主动脉手术切口将一覆以人造血管的支架植入其中，支架弹开后将病变部位封闭，再将支架覆盖的人造血管与降主动脉切口共同与弓部的人造血管缝合，这样便一次完成了全部手术。且主动脉手术总体死亡率由20%已降低到4.34%。但Cronus®术中支架上市已10余年，随着外科技术的发展和主动脉疾病的需求，原有术中支架逐渐体现出一些劣势。如近端覆膜段过短，医生自主操作空间太小；无涂层，不能作为升主部位人造血管使用；支架主体为焊接一体式，柔顺性不够；结构简单，对于左锁骨下动脉附近的缝合不便，难以进一步减少手术操作时间。因此，急需开发新产品以应对市场出现的新需求。</p><p>本课题在原有术中支架的基础上进一步开发带分支的术中支架系统，旨在以本产品进一步降低术中出血、手术时间及难度。增加单分支结构，侧支支架直接植入左锁骨下动脉，不仅避免了难度最大、时间最长的左锁骨下动脉的吻和，并且使主动脉远端吻合口上移，降低的吻合的操作难度，缩短了手术时间；支架近端带有不同长度的胶原蛋白涂层人工血管，长度增加使医生自主操作空间加大，可适用更多病例；人工血管段增加蛋白涂层可以防止渗血，适用病例更广。如下图14所示：</p><p style=\"text-align: center;\"><img src=\"/upload/temp/20190309/67ac56a123d1a63b31c4090a5661a178.png\" title=\"67ac56a123d1a63b31c4090a5661a178.png\" alt=\"67ac56a123d1a63b31c4090a5661a178.png\"/>&nbsp;</p><p style=\"text-align: center;\">图14 &nbsp;涂层自然状态（30mm）</p><p>样品制作定型后，为了有更好的临床效果，需要进行临床前研究动物实验。中山医院王主任对新产品创新意识的认可促成了这次的合作之旅。</p><p>王主任及其临床团队对于开胸手术了解颇深。了解了新产品的设计理念后，王主任觉得该产品会大大普及手术，使更多患者受益。王主任让其临床团队中经验丰富的孙副主任担当动物实验的主刀者，评价产品的可操作性。</p><p>工程师抱着与医生合作，造福患者的信念，不惧困难，反复地与王主任、孙主任及其团队进行动物实验方案讨论并制定了评价方案。</p><p>由于猪的主动脉血管比人的要细很多，我们现有产品基础上需要重新制作小规格样品。术中由于需要深低温停循环，第一批支架是根据术中动物血管尺寸进行定制支架。植入几头动物，并术后恢复情况良好的情况下，对试验动物进行造影确认支架植入情况。发现支架规格偏小，后续和王主任和孙主任讨论此类情况，确认不能以术中血管情况制定支架规格，因术中整体动物处于无血流状态，虽然植入后会感觉动物血管被撑很大，但实际有血流后支架可以马上匹配动物血管规格。后对支架规格进行调整再植入后动物实验随访情况良好。</p><p>无论是Fontus®分支型术中支架系统的研发者还是应用者，其目的都是为了更好地帮助病人、帮助更多病人，因此普及此项技术是大家共同的心愿。研发出分支型术中支架后，首先可以降低手术难度，缩短手术时间，因独特的分支结构使得术中无需游离和缝合左锁骨下动脉，手术过程中直接将侧支支架放入左锁骨下动脉，易对准，易释放，降低了手术的复杂程度，大量减少手术时间。然后本产品可以降低术后神经系统及其他脏器并发症：避免了因深度游离左锁骨下动脉带来的神经、血管损伤，特别是减少喉返神经损伤导致的永久性的声音嘶哑。同时由于手术时间缩短，体外循环时间、脑灌注时间和停循环时间相应缩短，术后神经系统及各脏器并发症风险降低。再者，因为产品带有不同长度的胶原蛋白涂层人工血管，缝合过程中涂层人工血管不渗血，避免吻合口和针眼出血，可以减少术中出血，提高手术成功率：</p><p>开发出的Fontus®分支型术中支架系统，可以使手术时间缩短、手术难度降低，因此可以使更多医生尝试此类手术；且主动脉夹层疾病发病急，如此类手术能够普及，就可以使更多医疗条件落后地区的患者得到及时救治，从而真正提高手术普及率，使更多病人受益于该产品。</p><p><strong>案例成果</strong></p><p>动物实验过程非常艰辛。对于开胸手术，考虑动物的耐受情况，术中必须做到快速高效的植入缝合，中山医院的临床团队完美的完成了术中支架的动物实验，证明产品的可操作性良好，并为后续的临床试验提供了使用经验。</p><p><br/></p>', '1', 'Fontus®动物试验项目', '1552119618', '', 'Fontus®动物试验项目', '0', '', '/upload/system/20190311/56aaac7c7551f7158c42f08730f9a3c3.jpg', '1', '2', '17');
INSERT INTO `tp_case` VALUES ('7', '术中阻断用球囊项目', '<p><strong>合作目标</strong></p><p>完成样品输出。</p><p><strong>案例描述</strong></p><p>主动脉夹层是一种非常凶险的动脉疾病，具有很高的死亡率和并发症发生率。其临床症状为突发剧烈疼痛、休克和血肿压迫相应的主动脉分支血管时出现的脏器缺血症状等。据调查统计，在我国高血压病的发病率较高、知晓率和控制率又相对较低，主动脉夹层的发病年龄明显低于国外。其发病率每年每百万人口约为5～10例。男女之比约为3:1，发病年龄大多数在40岁以上。主动脉夹层动脉瘤病情异常凶险，手术操作难度大，死亡率高。发病后24小时生存率仅40％，1星期生存率为25％，3个月生存率仅10％。根据估算，我国每年因为主动脉瘤死亡的患者超过10万，同时主动脉瘤发病率也呈逐年上升的趋势。传统手术采用四分支血管全主动脉弓替换＋软象鼻术，但需两次开放手术，治疗周期长，手术成功率低且术后并发症高。自2003年起，孙教授结合上海微创心脉医疗科技股份有限公司自主研制的术中支架系统（CRONUS®）和四分支人工血管，根据我国主动脉疾病的病情，开发应用了主动脉全弓置换结合支架的象鼻术（简称孙氏手术）。孙氏手术简化了原来手术步骤，使手术并发症和死亡率降低，减少了再次手术率。</p><p>孙氏手术的基本方法有右腋动脉插管、深低温或中低温体外循环、选择性脑灌注、麻醉与术中监测、重要脏器与血液保护技术等。主要手术步骤描述如下：游离右腋动脉、正中开胸游离头臂血管，建立体外循环；降温停心跳，处理主动脉近端血管；阻断头臂分支血管，同时经右腋动脉选择性脑灌注，剖开主动脉弓，横断头臂血管，置入支架血管；选择合适四分支人工血管与血管支架吻合，后通过四分支人工血管灌注分支灌注恢复下半身循环，用吸引器持续吸走吻合过程中返流的血液。接下来吻合左颈总动脉开始复温；吻合四分支人工血管近端恢复心肌灌注。接着吻合左锁骨与无名动脉。完成全部血管吻合、充分排气后开放主动脉，心脏电击复跳。最后是复苏、中和、术后止血、关胸等常规手术步骤。</p><p>远端吻合口出血是孙氏手术术中一大难点，吻合口远、吻合过程中血液返流等因素皆增加了吻合操作的难度。助手手持吸引器持续抽吸返流血液时，往往会挡住医生吻合操作的视线，而且返流持续不断，手持抽吸总有间断。在释放血管支架与吻合远端期间，患者下半身是深低温停循环的状态，停循环的时间越长，术后脏器并发症风险越高。</p><p>能否有一种产品，可在吻合过程中暂时阻断血管，同时又能给下半身提供血流灌注，最后在吻合快结束时撤出体外呢？带着这个问题，南京市第一医院心胸外科黄主任与微创®心脉研发部技术人员进行了沟通交流。黄主任提出，如果能借鉴现有球囊产品的设计，将球囊充盈之后的外径增大至4公分左右，用于封堵降主动脉返流的血液；并增加一个血流通道用于下半身灌注，减少下半身停循环的时间，将在一定程度上降低远端吻合的操作难度，同时降低患者术后因长时间的深低温停循环引起的并发症发生率。</p><p>带着主任的建议，微创®心脉研发人员回到实验室展开了初期样品的摸索工作。实验室现有的球囊是匹配约3mm的导管。但是为满足足够量的血液灌注量，至少需要8mm左右的导管。然而球囊与粗导管连接时，很容易在球囊管段开裂，导致在预期压力下泄漏。经过不断的尝试与摸索，通过冷扩定型的方式巧妙解决了球囊与粗导管的密封连接问题。如下图15所示：</p><p><br/></p><p style=\"text-align:center\"><img src=\"/upload/temp/20190309/5faa5880a3b1bafbc7c652c3b89eab73.png\" title=\"5faa5880a3b1bafbc7c652c3b89eab73.png\" alt=\"5faa5880a3b1bafbc7c652c3b89eab73.png\"/></p><p>&nbsp;</p><p style=\"text-align: center;\">图15 &nbsp;术中阻断用球囊</p><p><strong>案例成果</strong></p><p>在实验室所能提供的现有原材料的基础上，成功制作出下图所示的术中阻断用球囊产品。实验表明，将该产品的球囊充盈至4公分左右，在3atm下球囊能保压半小时以上，能够满足预期的使用需求。目前合作阶段是仅完成样品制作并交付主任。</p><p><br/></p>', '1', '术中阻断用球囊项目', '1552119676', '', '术中阻断用球囊项目', '0', '', '/upload/system/20190311/7039618f6eba9c82456b8ac06cf47a5c.jpg', '1', '1', '17');
INSERT INTO `tp_case` VALUES ('8', 'APOLLO™颅内动脉支架系统项目', '<p><strong>合作目标</strong></p><p>科研合作，最终实现产品转化。</p><p><strong>案例描述</strong></p><p>2000年微创®由于制造冠脉支架而具备了制造血管支架的能力。2002年初首都医科大学宣武医院凌教授和姜教授分别联系到微创®，希望能开发出一款针对脑血管狭窄的支架，治疗那些由于动脉粥样硬化引起的症状性颅内动脉狭窄患者。两位教授认为，利用微创®公司的加工制造能力，根据脑血管迂曲纤弱的特点，设计一款“更细更小更柔软”的脑血管支架，能穿越迂曲颈内动脉曲虹吸弯段到达、撑开靶血管，将会恢复ICAS患者的脑供血状态，预防卒中发生。</p><p>在微创®董事长常兆华博士、首席技术官罗七一博士支持下，微创®公司调配技术人员组成了研发团队，着手开发中国神经介入的第一个脑血管支架。设计上采用了低压扩张、延长的快速交换输送系统、精确释放的理念，经过技术攻关和动物实验，姜教授于2003年12月10日开始了第一例APOLLO™颅内支架的临床评价。于2004年11月19日，获得国家食品药品监督管理局(SFDA)颁发的医疗器械注册证。</p><p>公司特意命名该产品为APOLLO™，并在产品包装上设计了月球图案：美国APOLLO飞船登上月球，中国APOLLO™支架植入脑血管。其时，美国Boston Scientific公司的同类产品在4年后的2008年才获得国家药监局的上市许可，而国产的APOLLO™支架使中国患者提早4年获得治疗机会。</p><p><strong>案例成果</strong></p><p>2005年APOLLO™推向市场，得到脑血管病医学专家的一致认可。自此，中国的神经介入有了“脑血管专用”的颅内支架。APOLLO™支架如下图16所示：</p><p style=\"text-align: center;\"><img src=\"/upload/temp/20190309/daefc4c0a5eeeb1f7a30775ebf6fa1d3.png\" title=\"daefc4c0a5eeeb1f7a30775ebf6fa1d3.png\" alt=\"daefc4c0a5eeeb1f7a30775ebf6fa1d3.png\"/>&nbsp;</p><p style=\"text-align: center;\">图16 &nbsp;&nbsp;APOLLO™支架示意图</p><p>伴随着 “中国脑血管病论坛”、 “天坛国际脑血管病会议”、 “东方脑血管病介入治疗大会”重要学术会议平台的推动，从2005年开始，掌握此项技术的医院也从北京上海广州几家逐渐扩展到全国700家医疗机构，每年开展的颅内支架术逐步从有百例左右逐渐攀升至万例，截至2018年，已有5万名脑血管狭窄患者受益。</p><p>2005年 1月, 基于姜教授主持的“中国颅内血管支架研究”，被知名期刊《Stroke》评价为“2004年世界卒中治疗重大进展”。10年后，《Stroke》杂志发表了另一份重量级的“中国症状性颅内动脉狭窄支架治疗多中心登记研究”，该项研究由缪中荣教授发起，国内12家临床中心参与，植入APOLLO™支架159例，数据显示，在30天死亡和卒中发生率4.3%。优于之前美国著名的SAMMPRIS实验中14.7%的实验结果。再次证明中国的ICAS支架术处于世界领先水平。事实上，中国医生拥有巨大的门诊量和手术量，最有可能在手术方案和器材上进行创新创造，中国企业更有优势也更有必要将这些创新创造“想得到做得到”，将医学、科研和临床更好的结合在一起，研发适用于中国人群的产品，获得更好的救治效果。</p><p>2009年，基于APOLLO™支架研究的《颅内动脉支架系统的开发与应用》亦获得上海市科技进步二等奖。</p><p><br/></p>', '1', 'APOLLO™颅内动脉支架系统项目', '1552119741', '', 'APOLLO™颅内动脉支架系统项目', '0', '', '/upload/system/20190311/174d40306de2b76aa3e019168f85c14a.jpg', '1', '0', '17');

-- -----------------------------
-- Table structure for `tp_category`
-- -----------------------------
DROP TABLE IF EXISTS `tp_category`;
CREATE TABLE `tp_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(8) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_hidden` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  `is_top_style` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `top_style_tpl` varchar(255) NOT NULL,
  `style_icon` varchar(250) NOT NULL DEFAULT 'other',
  `cat_icon` varchar(255) NOT NULL,
  `is_top_show` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `category_links` text NOT NULL,
  `category_topic` text NOT NULL,
  `pinyin_keyword` text NOT NULL,
  `cat_alias_name` varchar(90) NOT NULL,
  `commission_rate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `touch_icon` varchar(255) NOT NULL,
  `cate_title` varchar(200) NOT NULL DEFAULT '' COMMENT '关键词',
  `cate_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `cate_description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_top_visual` int(11) DEFAULT '0',
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_description` text,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `is_show` (`is_hidden`),
  KEY `cat_name` (`cat_name`),
  KEY `show_in_nav` (`show_in_nav`),
  KEY `grade` (`grade`),
  KEY `is_top_style` (`is_top_style`),
  KEY `top_style_tpl` (`top_style_tpl`),
  KEY `is_top_show` (`is_top_show`)
) ENGINE=MyISAM AUTO_INCREMENT=1496 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_category`
-- -----------------------------
INSERT INTO `tp_category` VALUES ('1', '少儿早教', '', '', '0', '0', '', '', '0', '', '1', '0', '', '0', '0', '/upload/category/20190501/5d240016b57897650435b98f3bb5535b.png', '', '0', '', '图书频道|#\r\n音像|#\r\n电子书|#\r\n图书榜|#\r\n音乐榜|#\r\n影视榜|#', 'tushuyinxiangdianzishu', '早教', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('3', '少儿英语', '', '', '0', '1', '', '', '0', '', '1', '6', '18', '0', '0', '/upload/category/20190501/706be7fd5e2c801bcc440d1076d3d158.png', '', '0', 'category.php?id=33\r\ncategory.php?id=64\r\ncategory.php?id=37', '手机频道|#\r\n网上营业厅|#\r\n配件城|#\r\n影像Club|#\r\n手机社区|#\r\n以旧换新|#', 'shoujishumatongxin', '英语', '0', 'data/touch_icon/14908412833238.png', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1487', '少儿美术', '', '', '0', '2', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/177c3724aadc82e7b53fc0328680516b.png', '', '0', '', '', '', '美术', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1488', '少儿音乐', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/3eccf677ef84a73dc102b629e5c1834b.png', '', '0', '', '', '', '音乐', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1489', '少儿书法', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/cf9e3091b54a950890ea3e5891810892.png', '', '0', '', '', '', '书法', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1490', '少儿舞蹈', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/d76880f783be6303c32ea1a669fcdf8d.png', '', '0', '', '', '', '舞蹈', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1491', '机器人', '', '', '0', '5', '', '100000', '0', '', '1', '0', '0', '0', '', '/upload/category/20190506/f2898559afc93264243f263f2efe8e6b.jpg', '', '0', '', '', '', '机器人', '0', '/upload/category/20190506/550899b2f0563e21865f0d6780668bf5.jpg', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1492', '少儿书法1', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/cf9e3091b54a950890ea3e5891810892.png', '', '0', '', '', '', '书法', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1493', '少儿书法2', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/cf9e3091b54a950890ea3e5891810892.png', '', '0', '', '', '', '书法', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1494', '少儿书法3', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/cf9e3091b54a950890ea3e5891810892.png', '', '0', '', '', '', '书法', '0', '', '', '', '', '0', '', '', '');
INSERT INTO `tp_category` VALUES ('1495', '少儿舞蹈4', '', '', '0', '0', '', '', '0', '', '1', '0', '0', '0', '', '/upload/category/20190501/d76880f783be6303c32ea1a669fcdf8d.png', '', '0', '', '', '', '舞蹈', '0', '', '', '', '', '0', '', '', '');

-- -----------------------------
-- Table structure for `tp_config`
-- -----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  `is_del` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_config`
-- -----------------------------
INSERT INTO `tp_config` VALUES ('1', 'site_url', 'http://toupiao.wit100.net', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('2', 'record_no', '', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('3', 'store_name', '教团网', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('5', 'store_title', '设备部', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('6', 'store_desc', '教团网', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('7', 'store_keyword', '教团网', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('8', 'contact', '张小姐', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('9', 'phone', '400-668-8888', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('10', 'address', '南山区西丽镇留仙大道1001号', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('11', 'qq', '123456789', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('12', 'qq2', '123456789', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('13', 'qq3', '123456789', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('14', 'freight_free', '0', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('15', 'point_rate', '10', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('16', 'is_mark', '0', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('17', 'mark_txt', 'Tpshop商城', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('18', 'mark_img', '/public/upload/water/2018/01-26/9da13305eb67822d8403b13d7fc29827.png', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('19', 'mark_width', '40', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('20', 'mark_height', '40', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('21', 'mark_degree', '32', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('22', 'mark_quality', '100', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('23', 'sel', '9', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('24', 'sms_url', 'https://yunpan.cn/OcRgiKWxZFmjSJ', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('25', 'sms_user', '', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('26', 'sms_pwd', '访问密码 080e', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('27', 'regis_sms_enable', '1', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('28', 'sms_time_out', '300', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('29', 'reg_integral', '100', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('30', 'file_size', '2', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('31', 'default_storage', '100', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('32', 'warning_storage', '10', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('33', 'tax', '6', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('34', 'is_remind', '0', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('35', 'order_finish_time', '', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('36', 'order_cancel_time', '', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('37', 'hot_keywords', '手机|小米|iphone|三星|华为|冰箱', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('38', '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('40', 'app_test', '0', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('41', 'switch', '1', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('42', 'condition', '0', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('43', 'name', '我的分销商', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('44', 'pattern', '0', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('45', 'order_rate', '20', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('46', 'first_name', '一级分销', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('47', 'first_rate', '70', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('48', 'second_name', '二级分销', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('49', 'second_rate', '20', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('50', 'third_name', '三级分销', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('51', 'third_rate', '10', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('52', 'date', '1', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('53', 'need', '100', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('54', 'min', '50', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('55', 'auto_confirm_date', '1', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('56', 'sms_appkey', '123456', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('57', 'sms_secretKey', '123456', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('58', 'sms_product', 'TPshop 开源商城', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('59', 'sms_templateCode', 'SMS_101234567890', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('60', 'smtp_server', 'ssl://smtp.qq.com', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('61', 'smtp_port', '465', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('62', 'smtp_user', '123456@qq.com', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('63', 'smtp_pwd', '123456', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('64', 'regis_smtp_enable', '1', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('65', 'test_eamil', '123456@qq.com', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('66', 'mobile', '12345678911', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('67', 'province', '636', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('68', 'city', '1188', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('69', 'district', '1218', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('70', 'forget_pwd_sms_enable', '1', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('71', 'bind_mobile_sms_enable', '1', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('72', 'order_add_sms_enable', '0', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('73', 'order_pay_sms_enable', '0', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('74', 'order_shipping_sms_enable', '0', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('75', 'form_submit', 'ok', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('76', 'form_submit', 'ok', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('77', 'form_submit', 'ok', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('78', 'reduce', '2', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('79', 'form_submit', 'ok', '', '', '0');
INSERT INTO `tp_config` VALUES ('80', 'reg_integral', '100', '', '', '0');
INSERT INTO `tp_config` VALUES ('81', 'file_size', '2', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('82', 'default_storage', '100', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('84', 'need', '100', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('85', 'min', '50', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('86', 'tax', '6', '', '', '0');
INSERT INTO `tp_config` VALUES ('87', 'hot_keywords', '手机|小米|iphone|三星|华为|冰箱', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('88', 'point_min_limit', '10', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('89', 'point_use_percent', '100', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('90', 'inc_type', 'smtp', 'smtp', '', '0');
INSERT INTO `tp_config` VALUES ('91', 'mark_type', 'img', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('92', 'need', '100', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('93', 'min', '50', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('94', 'form_submit', 'ok', 'push', '', '0');
INSERT INTO `tp_config` VALUES ('95', 'jpush_app_key', '123456', 'push', '', '0');
INSERT INTO `tp_config` VALUES ('96', 'jpush_master_secret', '123456', 'push', '', '0');
INSERT INTO `tp_config` VALUES ('98', 'sms_platform', '2', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('99', 'form_submit', 'ok', 'oss', '', '0');
INSERT INTO `tp_config` VALUES ('100', 'oss_key_id', '123456', 'oss', '', '0');
INSERT INTO `tp_config` VALUES ('101', 'oss_key_secret', '1', 'oss', '', '0');
INSERT INTO `tp_config` VALUES ('102', 'oss_endpoint', 'oss-cn-shenzhen.aliyuncs.com', 'oss', '', '0');
INSERT INTO `tp_config` VALUES ('103', 'oss_bucket', 'how1', 'oss', '', '0');
INSERT INTO `tp_config` VALUES ('104', 'android_app_path', 'public/upload/appfile/androidapp_0.12.1_170706_104041.apk', 'mobile_app', '', '0');
INSERT INTO `tp_config` VALUES ('105', 'android_app_version', '0.12.1', 'mobile_app', '', '0');
INSERT INTO `tp_config` VALUES ('106', 'android_app_log', '测试日记', 'mobile_app', '', '0');
INSERT INTO `tp_config` VALUES ('107', 'oss_switch', '0', 'oss', '', '0');
INSERT INTO `tp_config` VALUES ('108', 'mark_txt_size', '12', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('109', 'mark_txt_color', '#000000', 'water', '', '0');
INSERT INTO `tp_config` VALUES ('110', 'qrcode_menu_word', 'distribut_qrcode', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('111', 'qrcode_input_word', '我的二维码', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('112', 'qr_back', '/public/upload/weixin/2017/10-27/e9823d589b202818c86511be60a6b65a.jpg', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('113', 'qr_big_back', '/public/upload/weixin/2017/10-27/ddbf260c88c706b38473dc6972b66c42.jpg', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('114', 'auto_service_date', '16', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('115', 'integral_use_enable', '1', 'shopping', '', '0');
INSERT INTO `tp_config` VALUES ('116', 'store_logo', '/upload/system/20190404/f957db95bc36c3a372de79eb3791fc87.jpg', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('117', 'invite', '1', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('118', 'invite_integral', '200', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('119', 'store_user_logo', '/upload/system/20190117/c108828b37ccf2bc5b7358e6cbdc3cc6.png', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('120', 'sign_on_off', '1', 'sign', '', '0');
INSERT INTO `tp_config` VALUES ('121', 'sign_integral', '10', 'sign', '', '0');
INSERT INTO `tp_config` VALUES ('122', 'sign_signcount', '7', 'sign', '', '0');
INSERT INTO `tp_config` VALUES ('123', 'sign_award', '20', 'sign', '', '0');
INSERT INTO `tp_config` VALUES ('124', 'own_rate', '10', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('125', 'store_ico', '/upload/system/20190404/2dc0f30a3837594bae654625b46d44a4.jpg', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('126', 'regrade', '1', 'distribut', '', '0');
INSERT INTO `tp_config` VALUES ('127', 'rechargevip_on_off', '1', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('128', 'rechargevip_price', '1', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('129', 'rechargevip_rebate_on_off', '0', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('130', 'rechargevip_rebate', '1', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('131', 'is_bind_account', '0', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('132', 'virtual_goods_sms_enable', '1', 'sms', '', '0');
INSERT INTO `tp_config` VALUES ('133', 'form_submit', 'ok', 'kdniao', '', '0');
INSERT INTO `tp_config` VALUES ('134', 'kdniao_switch', '1', 'kdniao', '', '0');
INSERT INTO `tp_config` VALUES ('135', 'kdniao_id', '123456', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('136', 'kdniao_key', '123456', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('137', 'form_submit', 'ok', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('138', 'express_switch', '0', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('139', 'kd100_key', '123456', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('140', 'kdniao_id', '123456', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('141', 'kdniao_key', '123456', 'express', '', '0');
INSERT INTO `tp_config` VALUES ('142', 'admin_login_logo', '/public/upload/logo/2018/11-13/5e4047e43dc2828b315c1ee1d4b95e6e.png', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('143', 'admin_home_logo', '/public/upload/logo/2018/11-13/5e4047e43dc2828b315c1ee1d4b95e6e.png', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('144', 'wap_home_logo', '/public/upload/logo/2018/11-30/77577a634fe989ae9347d63768978877.jpg', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('145', 'wap_login_logo', '/public/upload/logo/2018/11-30/77577a634fe989ae9347d63768978877.jpg', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('146', 't_number', '687474703a2f2f61706974657374322e747073686f702e636e2f686f6d652f546a2f7032', '', '', '0');
INSERT INTO `tp_config` VALUES ('147', 'point_rate', '10', 'integral', '', '0');
INSERT INTO `tp_config` VALUES ('148', 'header_background', '#dd0f20', 'basic', '', '0');
INSERT INTO `tp_config` VALUES ('149', 'web_cmsurl', '', 'web', '', '0');
INSERT INTO `tp_config` VALUES ('150', 'web_templets_dir', '/template', 'web', '', '0');
INSERT INTO `tp_config` VALUES ('151', 'web_templeturl', '/template', 'web', '', '0');
INSERT INTO `tp_config` VALUES ('152', 'web_templets_pc', '/template/pc', 'web', '', '0');
INSERT INTO `tp_config` VALUES ('153', 'web_templets_m', '/template/mobile', 'web', '', '0');
INSERT INTO `tp_config` VALUES ('154', 'id', '1', '', '', '0');
INSERT INTO `tp_config` VALUES ('155', 'web_keywords', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('156', 'web_description', '111', '', '', '0');
INSERT INTO `tp_config` VALUES ('157', 'web_copyright', 'Copyright © 2014-2018 教团网有限公司 版权所有', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('158', 'web_recordnum', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('159', 'web_thirdcode', '', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('160', 'web_illegal', '', 'shop_info', '', '0');
INSERT INTO `tp_config` VALUES ('161', 'info_email', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('162', 'info_tel', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('163', 'info_address', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('164', 'info_online_qq', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('165', 'info_online_tel', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('166', 'image_type', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('167', 'file_type', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('168', 'media_type', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('169', 'view_home', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('170', 'view_spacer', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('171', 'view_time', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('172', 'view_money', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('173', 'view_litpic_width', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('174', 'view_litpic_height', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('175', 'view_salelist_num', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('176', 'view_history_num', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('177', 'view_comment_num', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('178', 'view_newarc_num', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('179', 'view_title_len', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('180', 'other_units', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('181', 'other_minwithdraw', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('182', 'other_bank', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('183', 'email_smtp', '122', '', '', '0');
INSERT INTO `tp_config` VALUES ('184', 'email_mail_port', '1212', '', '', '0');
INSERT INTO `tp_config` VALUES ('185', 'email_mail_from', '1221', '', '', '0');
INSERT INTO `tp_config` VALUES ('186', 'email_mail_user', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('187', 'email_mail_password', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('193', 'foot_logo', '/upload/system/20190404/009e0d57cc8d0cb5ff61eb3c72622a62.jpg', '', '', '0');
INSERT INTO `tp_config` VALUES ('194', 'brand', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('195', 'service_no', '（沪）- 非经营性 - 2016 - 0131', '', '', '0');
INSERT INTO `tp_config` VALUES ('196', 'video_url', 'fresh-fankui@jd.com', '', '', '0');
INSERT INTO `tp_config` VALUES ('197', 'sina_url', '', '', '', '0');
INSERT INTO `tp_config` VALUES ('198', 'weichuang_url', 'http://ctt.hooweb.cn', '', '', '0');
INSERT INTO `tp_config` VALUES ('199', 'arcpic', '/upload/system/20190404/b89f18ea478d3d07b1bdf669a5416aad.jpg', '', '', '0');
INSERT INTO `tp_config` VALUES ('200', 'casepic', '/upload/system/20190404/61729be779aef186d190981dfbb7f925.jpg', '', '', '0');
INSERT INTO `tp_config` VALUES ('201', 'cash_open', '1', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('202', 'service_ratio', '1', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('203', 'min_service_money', '10', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('204', 'max_service_money', '100', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('205', 'min_cash', '100', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('206', 'max_cash', '10000', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('207', 'count_cash', '20000', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('208', 'cash_times', '2', 'cash', '', '0');
INSERT INTO `tp_config` VALUES ('209', 'web_name', '管理后台', '', '', '0');
INSERT INTO `tp_config` VALUES ('210', 'seo_name', '管理后台', '', '', '0');
INSERT INTO `tp_config` VALUES ('211', 'seo_keyword', '管理后台', '', '', '0');
INSERT INTO `tp_config` VALUES ('212', 'seo_dec', '管理后台', '', '', '0');
INSERT INTO `tp_config` VALUES ('213', 'wechat_name', '测试', '', '', '0');
INSERT INTO `tp_config` VALUES ('214', 'wechat_appid', '544545454', '', '', '0');
INSERT INTO `tp_config` VALUES ('215', 'wechat_secret', '', '', '', '0');

-- -----------------------------
-- Table structure for `tp_contact`
-- -----------------------------
DROP TABLE IF EXISTS `tp_contact`;
CREATE TABLE `tp_contact` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `hide` int(2) NOT NULL,
  `sort` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_contact`
-- -----------------------------
INSERT INTO `tp_contact` VALUES ('1', '知行学院', '上海市 · 浦东新区 · 张江科学城 · 张东路1601号', '021-38954600', 'xxxx@microport.com', '1', '2');
INSERT INTO `tp_contact` VALUES ('2', '良知创意中心1', '上海市 · 浦东新区 · 张江科学城 · 张东路1601号1', '021-38954600', 'ccenter@microport.com', '1', '1');

-- -----------------------------
-- Table structure for `tp_district`
-- -----------------------------
DROP TABLE IF EXISTS `tp_district`;
CREATE TABLE `tp_district` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `banner` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `province` int(10) NOT NULL,
  `city` int(10) NOT NULL,
  `district` int(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `business_hours` varchar(255) NOT NULL,
  `xzb` varchar(100) NOT NULL,
  `yzb` varchar(100) NOT NULL,
  `hide` int(2) NOT NULL DEFAULT '1',
  `is_recommend` int(2) NOT NULL DEFAULT '0' COMMENT '推荐',
  `show_order` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_district`
-- -----------------------------
INSERT INTO `tp_district` VALUES ('2', '/upload/system/20190501/7d3b8feaee4472835f09b2ca838a41ff.jpg', '/upload/system/20190426/fa22619ac922334698c1ed56be02fe33.png', '益达广场', '3', '39', '421', '012321', '5368532684', '营业时间：周一到周五：9：00-20：0', '118.7119500000', '36.8917500000', '1', '1', '1');
INSERT INTO `tp_district` VALUES ('9', '/upload/system/20190505/83833e2e8c6a612e2b920aa3cceb9d17.jpg', '/upload/system/20190426/fa22619ac922334698c1ed56be02fe33.png', '', '3', '39', '421', '012321', '5368532684', '营业时间：周一到周五：9：00-20：00', '118.7119500000', '36.8917500000', '1', '1', '1');
INSERT INTO `tp_district` VALUES ('10', '/upload/system/20190506/faad745af1bedae7b33533d5bf557083.jpg', '/upload/system/20190506/19363d92490787292ccec0a2e8383ddc.jpg', '佳兆业广场', '18', '246', '2086', '千路650号', '0412-7136668', '早9:00-晚9:00', '122.96963', '41.119885', '1', '0', '0');
INSERT INTO `tp_district` VALUES ('11', '/upload/system/20190506/50306ddd3827076899680fddfdea90c6.jpg', '/upload/system/20190506/5c4e362a92a3e70a38f878ac0e4903dd.jpg', '苏宁生活广场', '18', '246', '2086', '人民路81号', '0412-7135999', '早9:00-晚9:00', '122.96963', '41.119885', '1', '0', '0');
INSERT INTO `tp_district` VALUES ('12', '/upload/system/20190506/d79a1759b40a69e9db3995c3f95911ad.jpg', '/upload/system/20190506/b460ee145524b3566f06dc79f8cf67e8.jpg', '供销广场', '18', '246', '2085', '越岭路45号', '0412-5061555', '早9:00-晚9:00', '123.067315', '41.089933', '1', '0', '0');

-- -----------------------------
-- Table structure for `tp_equipment`
-- -----------------------------
DROP TABLE IF EXISTS `tp_equipment`;
CREATE TABLE `tp_equipment` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `capacity` int(20) NOT NULL COMMENT '容量',
  `content` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `publish_time` int(10) NOT NULL,
  `author` int(10) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `hide` int(2) NOT NULL DEFAULT '1' COMMENT '1:显示0：不显示',
  `click` int(11) NOT NULL COMMENT '点击量',
  `sort` int(20) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_equipment`
-- -----------------------------
INSERT INTO `tp_equipment` VALUES ('1', '模拟DSA手术室', '60', '<p><span style=\"color: rgb(96, 96, 96); font-family: 微软雅黑, Arial, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, STHeiti, Helvetica, Verdana, sans-serif; background-color: rgb(255, 255, 255);\">该手术室用于模拟冠脉、神内介入手术，配备了液压式手术床、C臂机，配合介入手术模拟器的使用，可 更加逼真地模拟介入手术室情境。外侧电脑可用于直播手术室的真实情况，达到手术过程中同步在线反馈。球管 经过特殊设计，不产生射线辐射，更加逼真地模拟介入手术室情境。</span></p>', '1550907441', '1551617690', '1', '模拟DSA手术室', '1', '10', '1', '模拟DSA手术室');
INSERT INTO `tp_equipment` VALUES ('2', '3D体验中心', '90', '<p><span style=\"color: rgb(96, 96, 96); font-family: 微软雅黑, Arial, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, STHeiti, Helvetica, Verdana, sans-serif; background-color: rgb(255, 255, 255);\">3D体验中心配备有3D打印机、zSpace 3D教学设备。投影仪可直接投影3D效果，参与者佩戴主 动式3D眼镜，可直观观察立体人体解剖模型。</span></p>', '1550909589', '1551617671', '1', '3D体验中心', '1', '10', '2', '3D体验中心');
INSERT INTO `tp_equipment` VALUES ('3', '3D体验中心', '90', '<p><span style=\"color: rgb(96, 96, 96); font-family: 微软雅黑, Arial, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, STHeiti, Helvetica, Verdana, sans-serif; background-color: rgb(255, 255, 255);\">3D体验中心配备有3D打印机、zSpace 3D教学设备。投影仪可直接投影3D效果，参与者佩戴主 动式3D眼镜，可直观观察立体人体解剖模型。</span></p>', '1550909589', '1551617655', '1', '3D体验中心', '1', '10', '3', '3D体验中心');

-- -----------------------------
-- Table structure for `tp_equipment_image`
-- -----------------------------
DROP TABLE IF EXISTS `tp_equipment_image`;
CREATE TABLE `tp_equipment_image` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `equipment_id` mediumint(8) NOT NULL,
  `images` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_equipment_image`
-- -----------------------------
INSERT INTO `tp_equipment_image` VALUES ('10', '3', '/upload/good/20190303/6509cc990c1bcc0b6bedb213ed1caa9d.jpg');
INSERT INTO `tp_equipment_image` VALUES ('11', '3', '/upload/good/20190303/25ced6ee2c12c9e27ab8b348dfe42b2e.jpg');
INSERT INTO `tp_equipment_image` VALUES ('12', '3', '/upload/good/20190303/50036d9317e1de0040517697cf452de1.jpg');
INSERT INTO `tp_equipment_image` VALUES ('13', '2', '/upload/good/20190303/18516d695dc8da354f7081a41b29b658.jpg');
INSERT INTO `tp_equipment_image` VALUES ('14', '2', '/upload/good/20190303/d1efc37a8c6b98d3d33156db029a2960.jpg');
INSERT INTO `tp_equipment_image` VALUES ('15', '2', '/upload/good/20190303/e4067b759fa8c36c59842a1d78c66959.jpg');
INSERT INTO `tp_equipment_image` VALUES ('16', '1', '/upload/good/20190303/ae5282de7ced34f73689eb6482af3317.jpg');
INSERT INTO `tp_equipment_image` VALUES ('17', '1', '/upload/good/20190303/083b2a1ca38f65596249ce005900bdbb.jpg');
INSERT INTO `tp_equipment_image` VALUES ('18', '1', '/upload/good/20190303/e3989330f1aa6854cb063f2be5d85bd7.jpg');

-- -----------------------------
-- Table structure for `tp_exam`
-- -----------------------------
DROP TABLE IF EXISTS `tp_exam`;
CREATE TABLE `tp_exam` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) NOT NULL COMMENT '科目',
  `title` varchar(255) NOT NULL COMMENT '题目',
  `option_a` varchar(255) NOT NULL COMMENT '选项A',
  `option_b` varchar(255) NOT NULL COMMENT '选项B',
  `option_c` varchar(255) NOT NULL COMMENT '选项C',
  `option_d` varchar(255) NOT NULL COMMENT '选项D',
  `answer` int(2) NOT NULL COMMENT '答案',
  `hide` int(2) NOT NULL DEFAULT '1' COMMENT '1显示0不显示',
  `sort_order` int(10) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_exam`
-- -----------------------------
INSERT INTO `tp_exam` VALUES ('125', '1', '太阳系中哪几个行星体积最大', '地球', '木星', '火星', '水星', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('126', '4', '大家都害怕猛兽，但猛兽也有致命的弱点如狼。以凶狡猾著称，但它却害怕火和鲜红的颜色，而且它的腰最怕打，请问：老虎最害怕什么？', '攻击其鼻子', '黄颜色', '山雀的粪便', '火', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('127', '6', '“中华人民共和国”这一国名最早是由谁提出的？', '张奚若', '任弼时', '毛泽东', '周恩来', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('128', '3', '世界上最大的海是哪一个？', '中国的南海', '黑海', '中国的黄海', '红海', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('129', '7', '世界上是被称为“教育王国”的哪一个国家？', '中国', '美国', '以色列', '日本', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('130', '1', '雨后彩虹、美丽可目，但在1928年1月7日，由马德拉岛到开普敦的海面上，出现了一道奇特的彩虹，在能见度很差的雾霭中有一光晕，晕环下部似乎能触及船侧，你知道这道彩虹成什么颜色吗？', '红色', '蓝白色', '蓝色', '白色', '4', '1', '50');
INSERT INTO `tp_exam` VALUES ('131', '3', '美丽奇特的“海市蜃楼”是光的折射产生的一种现象，它通常发生在什么时候？', '春天', '夏天', '秋天', '冬天', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('132', '1', '我国海拔最高的山峰是哪一座？', '黄山的莲花峰', '华山的洛雁峰', '泰山的玉皇顶', '神农架的神农顶', '4', '1', '50');
INSERT INTO `tp_exam` VALUES ('133', '7', '“豆寇年华”是指几岁？', '13岁', '14岁', '15岁', '16岁', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('134', '1', '从飞机上往下看，彩虹是什么形状的？', '平面', '拱桥', '圆环', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('135', '4', '企鹅为什么会经常流鼻涕？', '因为南极非常冷', '因为它要排除身体里多余的盐分', '因为他用鼻涕来滋润羽毛', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('136', '3', '把开水和冷水同时放入冰箱，那个先结冰？', '开水', '冷水', '一样快', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('137', '4', '鸡在喝水的时候不断地抬头望天，这是为了', '看云识天气', '注意空中猛禽', '让水流进胃里', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('138', '4', '雪花是一种美丽的结晶体，基本形状是', '五角形', '四角形', '六角形', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('139', '7', '我们平时吃水果为什么要削皮', '节约', '有农药污染', '皮不好吃', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('140', '3', '科学研究表明，室外锻炼最佳时间是什么时候', '下午或傍晚', '早晨、傍晚', '早晨、晚上', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('141', '4', '地球上最大的两栖动物是', '青蛙', '乌龟', '河马', '娃娃鱼', '4', '1', '50');
INSERT INTO `tp_exam` VALUES ('142', '4', '下面动物中不会流汗的是', '马', '猫', '狗', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('143', '4', '为什么海象要长长牙？', '方便嚼硬的食物', '觅食时清除地面杂物', '.既是抵抗敌害的武器，又可作为挖掘海底食物凿开冰块的工具', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('144', '4', '下面不属于昆虫的是', '苍蝇', '蜜蜂', '蜂鸟', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('145', '2', '世界上最高的山脉是', '喜马拉雅山', '喀喇昆仑山', '兴都库什山', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('146', '2', '世界上盐度最高、水温最高的海域是', '地中海', '红海', '珊瑚海', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('147', '3', '怎样才能让水壶热得快些', '把壶底做成波纹状', '壶盖打开', '壶嘴打开', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('148', '4', '地球上出现最多的自然现象是', '下雨', '地震', '火山喷发', '闪电', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('149', '4', '下列哪些蚊子会吸人血', '雌蚊', '雄蚊', '所有蚊子', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('150', '4', '世界上唯一一个4个膝盖的动物？', '大象', '老虎', '狮子', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('151', '4', '白蚁跟蚂蚁是同类动物吗？', '是', '不是', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('152', '4', '地球上最早出现的绿色植物是什么', '绿藻', '团藻', '蓝藻', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('153', '4', '青蛙是两栖动物，那么两栖动物的祖先是哪种动物', '鲸', '龟', '鱼', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('154', '4', '人体最大的器官是什么', '肠', '皮肤', '肾脏', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('155', '4', '人体含水量百分比最高的器官是？', '眼球', '胃', '口腔', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('156', '4', '霜叶红于二月花的原因是什么', '色素和温度的影响', '温度和湿度的影响', '光照的影响', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('157', '4', '一猪生九仔，连母十个样是生物的什么现象', '遗传现象', '变异现象', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('158', '4', '世界上最小的鸟？', '麻雀', '蜂鸟', '燕子', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('159', '7', '小明的肚子明明已经胀的很厉害了，为什么还要不停的喝水', '因为太渴了', '因为小明掉水里了', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('160', '4', '鱼、蛙、蛇等冷血动物的体温是？', '固定不变的', '随外界的变化而变化', '随体型的大小而变化', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('161', '7', '鸡蛋壳有什么作用', '保护蛋黄', '保护蛋清', '保护蛋黄和蛋清', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('162', '7', '人有时候会“触景生情”这属于生物的何种反应？', '条件反射', '非条件反射', '神经反射', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('163', '4', '蟑螂，也就是我们俗称的小强，它的头被切掉后还可以活多久', '5-10分钟', '1-3小时', '6-10天', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('164', '4', '海马是一种鱼吗', '是', '不是', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('165', '4', '鱼儿在一天中的时候什么时间最容易缺氧窒息', '早晨', '中午', '晚上', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('166', '3', '“龙生龙，凤生凤，老鼠儿子会打洞”说明生物的说明特征', '相似', '遗传', '变异', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('167', '4', '我们所说的“四不像”是指哪个动物', '麋鹿', '野马', '野牛', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('168', '4', '红蜘蛛是蜘蛛吗？', '是', '不是', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('169', '4', '一只燕子，一夏天能捕获多少苍蝇和蚊子', '80万', '100万', '120万', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('170', '4', '鱼会不会眨眼睛', '会', '不会', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('171', '1', 'UFO是什么意思', '不明飞行物', '联合国安理会', '美国中情局', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('172', '4', '为什么螃蟹会横着走', '腿关节只能向下弯曲', '关节只能向前弯曲', '关节能向前向后弯曲', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('173', '4', '肚子饿了为什么会咕咕叫', '肠子在蠕动', '是肚子里的气体在叫', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('174', '4', '狗为什么会伸着舌头喘气', '散热', '帮助呼吸', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('175', '2', '海水为什么有时涨高有时落低', '与气温有关', '与太阳和月亮远近有关', '与地球万有引力有关', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('176', '8', '“少壮不努力，老大徒（）”出自《汉乐府.长歌行》', '悲伤', '伤悲', '忧伤', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('177', '8', '李白号是什么？', '乐山居士', '青莲居士', '婧节居士', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('178', '8', '被誉为诗仙的人是？', '李白', '杜甫', '李商隐', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('179', '8', '“静夜思”的意思是？', '深夜沉思', '内心宁静，引起乡思', '宁静的夜晚所引起的乡思', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('180', '8', '“日照香炉生紫烟”中的“香炉”是什么意思', '烧香的火炉', '庐山的香炉峰', '就是指庐山', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('181', '8', '“桃花潭水深千尺”中的桃花潭在哪个省', '安徽省', '江苏省', '河北省', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('182', '8', '“烟花三月下扬州”中的“烟花”是指？', '柳树', '燃放漂亮的烟花', '柳如烟，花似锦的明媚春光', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('183', '8', '“早发白帝城”中的白帝城在什么地方？', '四川省', '山东省', '河南省', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('184', '8', '“轻舟已过万重山”中的“万重山”是指？', '一座山的名字', '层层叠叠的山', '山高而大', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('185', '8', '“何处得秋霜”中的“秋霜”是什么意思？', '秋天的天气凉', '形容头发像秋霜一样白', '秋天的寒夜露珠凝结为白霜', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('186', '2', '火山是多种多样的，根据它们的活动情况可以分为死火上、休眠火山和（）三类', '冰火山', '水火山', '活火山', '', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('187', '1', '月食可分为月偏食、月全食及（）三种。', '半影月食', '全影月食', '二影月食', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('188', '2', '四个位置方向按照顺时针正确的排序是（）？', '西北东南', '东西南北', '东北西南', '东南西北', '4', '1', '50');
INSERT INTO `tp_exam` VALUES ('189', '1', '春分前后太阳位于（）季星空', '春', '夏', '秋', '冬', '3', '1', '50');
INSERT INTO `tp_exam` VALUES ('190', '1', '二十四节气当中的十二个中气是从哪个节气开始选取的', '春分', '夏至', '秋分', '冬至', '4', '1', '50');
INSERT INTO `tp_exam` VALUES ('191', '8', '张继的《枫桥夜泊》描述的景象只可能发生在哪个农历日期', '初三', '初八', '十三', '十八', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('192', '8', '欧阳修的“月上柳梢头，人约黄昏后”描述的是哪一个月相', '新月', '残月', '弦月', '满月', '4', '1', '50');
INSERT INTO `tp_exam` VALUES ('193', '1', '日食只可能发生在农历的（）时期', '初一', '初七', '十五', '二十', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('194', '1', '天文单位是指（）与太阳的平均距离', '地球', '月亮', '水星', '冥王星', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('195', '1', '太阳的寿命预计还有（）亿年', '46', '50', '100', '700', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('196', '1', '自转方向与众不同的大行星包括', '水星', '金星', '地球', '火星', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('197', '1', '伽利略是第一个使用改进过的望远镜观察星空', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('198', '1', '在地球上看星空是永远不变的，恐龙时代的星空与今天完全一样', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('199', '1', '在地球上看日月同大，也就是说太阳和月亮的目视尺寸完全一样', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('200', '1', '当地球公转90°时，它自转也是90°', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('201', '8', '“天若有情天亦老，月如无恨月长圆”，是唐代诗人李贺写下的千古绝句', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('202', '1', '赤道上基本见不到极光', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('203', '4', '老虎被称为“兽中之王”', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('204', '4', '骆驼被称为“高原之舟”', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('205', '4', '壁虎属爬行动物，人们通常称它为爬山虎', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('206', '4', '海象，顾名思义，海中的大象', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('207', '4', '啄木鸟是十分敬业的“森林医生”，专为病树“治病\"', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('208', '4', '出现台风暴雨天气时，最好呆在家中，关好门窗', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('209', '4', '冬天不会打雷', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('210', '4', '雷雨天气时，躲到大型金属广告牌下避雨', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('211', '4', '打雷的时候往往伴有闪电，我们会先看见闪电后听见雷声', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('212', '7', '卫生纸是干净的，可以用来当餐巾纸用', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('213', '4', '珊瑚是一种水中植物', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('214', '4', '蜘蛛是八条腿的昆虫', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('215', '4', '有一句俗话叫做“万年的龟”。说明乌龟都能活到一万年以上。', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('216', '6', '钱学森是我国的导弹之父', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('217', '3', '牛顿是世界上第一个发现万有引力的人', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('218', '4', '最高的哺乳动物是长颈鹿', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('219', '7', '鸟晚上是睡在树林里的。', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('220', '7', '中秋节是我们中华民族所独有的佳节。', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('221', '4', '跑得最快的鸟是鸵鸟。', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('222', '3', '最大的动物是蓝鲸。', '√', 'X', '', '', '1', '1', '50');
INSERT INTO `tp_exam` VALUES ('223', '4', '飞得最高的鸟是海鸥。', '√', 'X', '', '', '2', '1', '50');
INSERT INTO `tp_exam` VALUES ('224', '3', '指南针是利用磁铁的南北极性而制成的一种指示方向的仪器。', '√', 'X', '', '', '1', '1', '50');

-- -----------------------------
-- Table structure for `tp_exam_record`
-- -----------------------------
DROP TABLE IF EXISTS `tp_exam_record`;
CREATE TABLE `tp_exam_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) NOT NULL COMMENT '答题类型',
  `add_time` varchar(255) NOT NULL COMMENT '时间',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `exam_id` text NOT NULL COMMENT '考试id',
  `exam_true` text NOT NULL COMMENT '正确的题',
  `exam_false` text NOT NULL COMMENT '错误的题',
  `fraction` int(10) NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_exam_record`
-- -----------------------------
INSERT INTO `tp_exam_record` VALUES ('1', '1', '1556193292', '1', '222,224,223,', '222,224,', '223,', '40');
INSERT INTO `tp_exam_record` VALUES ('15', '2', '1556677573', '2', '222,223,224,221,', '222,223,224,', '221,', '150');
INSERT INTO `tp_exam_record` VALUES ('16', '1', '1556677594', '2', '222,223,224,221,', '222,223,224,', '221,', '300');
INSERT INTO `tp_exam_record` VALUES ('17', '1', '1556681415', '1', '222,223,224,221', '222,223,224,', '221,', '300');
INSERT INTO `tp_exam_record` VALUES ('23', '1', '1556693105', '6', '150,172,165,214,178,129159,158,144,195', '150,172,165,214,178,129', '159,158,144,195', '600');
INSERT INTO `tp_exam_record` VALUES ('24', '1', '1556693304', '6', '222,211,202,224,218,156,147,171,193,146,', '222,211,202,224,218,156,147,171,193,', '146,', '900');
INSERT INTO `tp_exam_record` VALUES ('25', '2', '1556693365', '6', '167,222,133,138,176,179,146,135,209,141,', '167,222,133,', '138,176,179,146,135,209,141,', '150');
INSERT INTO `tp_exam_record` VALUES ('26', '1', '1556693401', '6', '193,129,171,155,156,177,128,135,182,175,', '193,129,171,155,156,', '177,128,135,182,175,', '500');
INSERT INTO `tp_exam_record` VALUES ('27', '1', '1557016116', '1', '222,223,224,,221,', '222,223,224,,', '221,', '400');
INSERT INTO `tp_exam_record` VALUES ('28', '1', '1557106356', '1', '222,223,224,,221,', '222,223,224,,', '221,', '400');
INSERT INTO `tp_exam_record` VALUES ('38', '2', '1557108914', '0', '161,185,131,194,125,137,181,162,132,133,', '161,185,131,', '194,125,137,181,162,132,133,', '150');
INSERT INTO `tp_exam_record` VALUES ('39', '1', '1557109888', '6', '222,153,185,152,151,135,146,192,213,177,', '222,', '153,185,152,151,135,146,192,213,177,', '100');
INSERT INTO `tp_exam_record` VALUES ('40', '1', '1557215296', '1', '222,223,224,,221,', '222,223,224,,', '221,', '400');

-- -----------------------------
-- Table structure for `tp_exam_score`
-- -----------------------------
DROP TABLE IF EXISTS `tp_exam_score`;
CREATE TABLE `tp_exam_score` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_exam_score`
-- -----------------------------
INSERT INTO `tp_exam_score` VALUES ('1', '自主出题', '100');
INSERT INTO `tp_exam_score` VALUES ('2', '限时抢答', '50');

-- -----------------------------
-- Table structure for `tp_exam_type`
-- -----------------------------
DROP TABLE IF EXISTS `tp_exam_type`;
CREATE TABLE `tp_exam_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) NOT NULL,
  `hide` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_exam_type`
-- -----------------------------
INSERT INTO `tp_exam_type` VALUES ('1', '天文', '1');
INSERT INTO `tp_exam_type` VALUES ('2', '地理', '1');
INSERT INTO `tp_exam_type` VALUES ('3', '科学', '1');
INSERT INTO `tp_exam_type` VALUES ('4', '自然', '1');
INSERT INTO `tp_exam_type` VALUES ('5', '网络', '1');
INSERT INTO `tp_exam_type` VALUES ('6', '历史', '1');
INSERT INTO `tp_exam_type` VALUES ('7', '综合', '1');
INSERT INTO `tp_exam_type` VALUES ('8', '诗词', '1');

-- -----------------------------
-- Table structure for `tp_feedback`
-- -----------------------------
DROP TABLE IF EXISTS `tp_feedback`;
CREATE TABLE `tp_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `message_img` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`),
  KEY `msg_type` (`msg_type`),
  KEY `msg_status` (`msg_status`),
  KEY `msg_area` (`msg_area`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_feedback`
-- -----------------------------
INSERT INTO `tp_feedback` VALUES ('10', '0', '1', '测试', '326784019@qq.com', '测试效果', '1', '0', '测试效果', '1554350527', '0', '0', '0');

-- -----------------------------
-- Table structure for `tp_friend_link`
-- -----------------------------
DROP TABLE IF EXISTS `tp_friend_link`;
CREATE TABLE `tp_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  `show_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`link_id`),
  KEY `show_order` (`show_order`),
  KEY `link_name` (`link_name`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_friend_link`
-- -----------------------------
INSERT INTO `tp_friend_link` VALUES ('54', '测试7', 'http://baidu.com', '', '0');
INSERT INTO `tp_friend_link` VALUES ('53', '测试6', 'http://baidu.com', '', '0');
INSERT INTO `tp_friend_link` VALUES ('49', '测试2', 'http://baidu.com', '', '2');
INSERT INTO `tp_friend_link` VALUES ('50', '测试3', 'http://baidu.com', '', '0');
INSERT INTO `tp_friend_link` VALUES ('51', '测试4', 'http://baidu.com', '', '0');
INSERT INTO `tp_friend_link` VALUES ('55', '测试8', 'http://baidu.com', '', '0');

-- -----------------------------
-- Table structure for `tp_goods`
-- -----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_cat` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `bar_code` varchar(60) NOT NULL,
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `default_shipping` int(11) unsigned NOT NULL,
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `desc_mobile` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_volume` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_fullcut` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `store_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_number` smallint(8) unsigned NOT NULL DEFAULT '0',
  `is_xiangou` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限购',
  `xiangou_start_date` int(11) NOT NULL DEFAULT '0' COMMENT '限购开始时间',
  `xiangou_end_date` int(11) NOT NULL DEFAULT '0' COMMENT '限购结束时间',
  `xiangou_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限购设定数量',
  `review_status` tinyint(1) NOT NULL DEFAULT '1',
  `review_content` varchar(255) NOT NULL,
  `goods_shipai` text NOT NULL,
  `comments_number` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_num` int(10) unsigned NOT NULL DEFAULT '0',
  `model_price` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_inventory` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_attr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `largest_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pinyin_keyword` text,
  `goods_product_tag` varchar(2000) DEFAULT NULL,
  `goods_tag` varchar(255) DEFAULT NULL COMMENT '商品标签',
  `stages` varchar(512) NOT NULL DEFAULT '',
  `stages_rate` decimal(10,2) NOT NULL DEFAULT '0.50',
  `freight` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_unit` varchar(15) NOT NULL DEFAULT '个',
  `goods_cause` varchar(10) NOT NULL,
  `dis_commission` decimal(10,0) NOT NULL COMMENT '分销佣金百分比',
  `is_distribution` int(1) NOT NULL COMMENT '商品是否参与分销',
  `commission_rate` varchar(10) NOT NULL DEFAULT '0',
  `from_seller` int(11) NOT NULL DEFAULT '0',
  `sales_volume_base` int(10) unsigned DEFAULT '0',
  `user_brand` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌统一使用平台品牌ID异步操作',
  `product_table` varchar(60) NOT NULL DEFAULT 'products',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品默认勾选属性货品',
  `product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品默认勾选属性货品价格',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `product_promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cloud_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cloud_goodsname` varchar(255) NOT NULL,
  `goods_video` varchar(255) NOT NULL DEFAULT '',
  `orderid` int(5) NOT NULL DEFAULT '0',
  `toggle_best` int(2) NOT NULL DEFAULT '0',
  `toggle_new` int(2) NOT NULL DEFAULT '0',
  `toggle_hot` int(2) NOT NULL DEFAULT '0',
  `click` int(10) NOT NULL DEFAULT '0',
  `illustration` text,
  `score` int(5) NOT NULL DEFAULT '0',
  `shop_id` int(5) NOT NULL DEFAULT '0',
  `package` text COMMENT '套餐',
  `description` varchar(100) NOT NULL COMMENT '商品简介',
  `coupon` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`),
  KEY `sales_volume` (`sales_volume`),
  KEY `xiangou_start_date` (`xiangou_start_date`),
  KEY `xiangou_end_date` (`xiangou_end_date`),
  KEY `user_id` (`user_id`),
  KEY `is_on_sale` (`is_on_sale`),
  KEY `is_alone_sale` (`is_alone_sale`),
  KEY `is_delete` (`is_delete`),
  KEY `user_cat` (`user_cat`),
  KEY `freight` (`freight`),
  KEY `tid` (`tid`),
  KEY `review_status` (`review_status`),
  KEY `user_brand` (`user_brand`),
  KEY `from_seller` (`from_seller`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_goods`
-- -----------------------------
INSERT INTO `tp_goods` VALUES ('42', '1487', '0', '0', '', '', '测试', '+', '0', '1', '', '1000', '0.000', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '1', '', '', '<p>方法发</p>', '', '/upload/system/20190426/da86800d223e02ee6568562f83da5c37.jpg', '', '', '1', '', '1', '1', '0', '0', '1556238891', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '', '0', '100', '0', '0', '0', '0', '0.00', '', '', '', '', '0.50', '2', '0.00', '0', '个', '', '0', '0', '0', '0', '0', '0', 'products', '0', '0.00', '1', '0.00', '0', '', '', '0', '0', '1', '0', '0', '<p>方法发等等</p>', '0', '8', '', '噶十多个', '1');
INSERT INTO `tp_goods` VALUES ('43', '1487', '0', '0', '', '', '学前班', '+', '0', '0', '', '1000', '0.000', '0', '760.00', '0.00', '279.00', '0.00', '0', '0', '1', '', '', '', '', '/upload/system/20190506/f03610a4b99acba8510c5c26dc937196.jpg', '', '', '1', '', '1', '1', '0', '0', '1557108590', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', '3', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '', '0', '0', '0', '0', '0', '0', '0.00', '', '', '', '', '0.50', '2', '0.00', '0', '个', '', '0', '0', '0', '0', '0', '0', 'products', '0', '0.00', '1', '0.00', '0', '', '', '1', '0', '0', '0', '0', '', '0', '8', '', '法师打发斯蒂芬', '1');
INSERT INTO `tp_goods` VALUES ('44', '1', '0', '0', '', '', '测试', '+', '0', '0', '', '1000', '0.000', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '1', '', '', '', '', '/upload/system/20190507/6b9f124f27be251e80e0168cc0c75549.jpg', '', '', '1', '', '1', '1', '0', '0', '1557193624', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', '3', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '', '0', '0', '0', '0', '0', '0', '0.00', '', '', '', '', '0.50', '2', '0.00', '0', '个', '', '0', '0', '0', '0', '0', '0', 'products', '0', '0.00', '1', '0.00', '0', '', '', '0', '0', '0', '0', '0', '', '0', '8', 'a:3:{s:9:\"price_min\";s:2:\"50\";s:9:\"price_max\";s:2:\"50\";s:6:\"prices\";a:1:{i:0;a:4:{s:5:\"tname\";s:7:\"套餐1\";s:9:\"price_one\";d:50;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:200;}}}', '各环节加个地方官', '1');
INSERT INTO `tp_goods` VALUES ('45', '3', '0', '0', '', '', '测试', '+', '0', '0', '', '1000', '0.000', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '1', '', '', '<p>cease</p>', '', '/upload/system/20190507/d376f69e87b0f1ec6d8d5159a01f1846.jpg', '', '', '1', '', '1', '1', '0', '0', '1557216764', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', '3', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '', '0', '0', '0', '0', '0', '0', '0.00', '', '', '', '', '0.50', '2', '0.00', '0', '个', '', '0', '0', '0', '0', '0', '0', 'products', '0', '0.00', '1', '0.00', '0', '', '', '0', '0', '0', '0', '0', '<p>短短的</p>', '0', '8', 'a:3:{s:9:\"price_min\";s:2:\"10\";s:9:\"price_max\";s:2:\"50\";s:6:\"prices\";a:5:{i:0;a:4:{s:5:\"tname\";s:7:\"套餐1\";s:9:\"price_one\";d:10;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:100;}i:1;a:4:{s:5:\"tname\";s:7:\"套餐2\";s:9:\"price_one\";d:20;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:200;}i:2;a:4:{s:5:\"tname\";s:7:\"套餐3\";s:9:\"price_one\";d:30;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:300;}i:3;a:4:{s:5:\"tname\";s:7:\"套餐4\";s:9:\"price_one\";d:40;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:500;}i:4;a:4:{s:5:\"tname\";s:7:\"套餐5\";s:9:\"price_one\";d:50;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:550;}}}', '', '1');

-- -----------------------------
-- Table structure for `tp_goods_activity`
-- -----------------------------
DROP TABLE IF EXISTS `tp_goods_activity`;
CREATE TABLE `tp_goods_activity` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_cat` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `bar_code` varchar(60) NOT NULL,
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `default_shipping` int(11) unsigned NOT NULL,
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `desc_mobile` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_volume` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_fullcut` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `store_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_number` smallint(8) unsigned NOT NULL DEFAULT '0',
  `is_xiangou` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限购',
  `xiangou_start_date` int(11) NOT NULL DEFAULT '0' COMMENT '限购开始时间',
  `xiangou_end_date` int(11) NOT NULL DEFAULT '0' COMMENT '限购结束时间',
  `xiangou_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限购设定数量',
  `review_status` tinyint(1) NOT NULL DEFAULT '1',
  `review_content` varchar(255) NOT NULL,
  `goods_shipai` text NOT NULL,
  `comments_number` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_num` int(10) unsigned NOT NULL DEFAULT '0',
  `model_price` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_inventory` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_attr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `largest_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pinyin_keyword` text,
  `goods_product_tag` varchar(2000) DEFAULT NULL,
  `goods_tag` varchar(255) DEFAULT NULL COMMENT '商品标签',
  `stages` varchar(512) NOT NULL DEFAULT '',
  `stages_rate` decimal(10,2) NOT NULL DEFAULT '0.50',
  `freight` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_unit` varchar(15) NOT NULL DEFAULT '个',
  `goods_cause` varchar(10) NOT NULL,
  `dis_commission` decimal(10,0) NOT NULL COMMENT '分销佣金百分比',
  `is_distribution` int(1) NOT NULL COMMENT '商品是否参与分销',
  `commission_rate` varchar(10) NOT NULL DEFAULT '0',
  `from_seller` int(11) NOT NULL DEFAULT '0',
  `sales_volume_base` int(10) unsigned DEFAULT '0',
  `user_brand` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌统一使用平台品牌ID异步操作',
  `product_table` varchar(60) NOT NULL DEFAULT 'products',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品默认勾选属性货品',
  `product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品默认勾选属性货品价格',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `product_promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cloud_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cloud_goods_activityname` varchar(255) NOT NULL,
  `goods_video` varchar(255) NOT NULL DEFAULT '',
  `orderid` int(5) NOT NULL DEFAULT '0',
  `toggle_best` int(2) NOT NULL DEFAULT '0',
  `toggle_new` int(2) NOT NULL DEFAULT '0',
  `toggle_hot` int(2) NOT NULL DEFAULT '0',
  `click` int(10) NOT NULL DEFAULT '0',
  `illustration` text,
  `score` int(5) NOT NULL DEFAULT '0',
  `shop_id` int(5) NOT NULL DEFAULT '0',
  `package` text COMMENT '套餐',
  `description` varchar(100) NOT NULL COMMENT '商品简介',
  `coupon` int(2) NOT NULL DEFAULT '1',
  `stime` varchar(100) DEFAULT NULL COMMENT '开课时间',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `min_num` int(10) NOT NULL DEFAULT '0' COMMENT '最低人数',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`),
  KEY `sales_volume` (`sales_volume`),
  KEY `xiangou_start_date` (`xiangou_start_date`),
  KEY `xiangou_end_date` (`xiangou_end_date`),
  KEY `user_id` (`user_id`),
  KEY `is_on_sale` (`is_on_sale`),
  KEY `is_alone_sale` (`is_alone_sale`),
  KEY `is_delete` (`is_delete`),
  KEY `user_cat` (`user_cat`),
  KEY `freight` (`freight`),
  KEY `tid` (`tid`),
  KEY `review_status` (`review_status`),
  KEY `user_brand` (`user_brand`),
  KEY `from_seller` (`from_seller`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_goods_activity`
-- -----------------------------
INSERT INTO `tp_goods_activity` VALUES ('1', '1', '0', '0', '', '', '测试', '+', '0', '0', '', '1000', '0.000', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '1', '', '过期自动退 教学环境良好', '', '', '/upload/system/20190508/20a52033faf2dcc8ad2324d53def9a0c.jpg', '', '', '1', '', '1', '1', '0', '0', '1557308733', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', '3', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '', '0', '0', '0', '0', '0', '0', '0.00', '', '', '', '', '0.50', '2', '0.00', '0', '个', '', '0', '0', '0', '0', '0', '0', 'products', '0', '0.00', '1', '0.00', '0', '', '', '0', '0', '0', '0', '0', '', '0', '8', 'a:3:{s:9:\"price_min\";s:2:\"10\";s:9:\"price_max\";s:2:\"10\";s:6:\"prices\";a:2:{i:0;a:4:{s:5:\"tname\";s:7:\"套餐1\";s:9:\"price_one\";d:10;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:100;}i:1;a:4:{s:5:\"tname\";s:7:\"套餐2\";s:9:\"price_one\";d:10;s:4:\"unit\";s:7:\"元/节\";s:5:\"price\";d:200;}}}', '', '1', '每周六、日  8:00-17:00', '1557308733', '1559296925', '10');

-- -----------------------------
-- Table structure for `tp_goods_depot`
-- -----------------------------
DROP TABLE IF EXISTS `tp_goods_depot`;
CREATE TABLE `tp_goods_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contacts` varchar(50) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `hide` int(2) NOT NULL DEFAULT '1',
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_goods_depot`
-- -----------------------------
INSERT INTO `tp_goods_depot` VALUES ('1', '公司主仓库', '测试地址1', '测试', '15055640781', '1', '1554691040');

-- -----------------------------
-- Table structure for `tp_goods_images`
-- -----------------------------
DROP TABLE IF EXISTS `tp_goods_images`;
CREATE TABLE `tp_goods_images` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_goods_images`
-- -----------------------------
INSERT INTO `tp_goods_images` VALUES ('1', '4', '/upload/good/20190404/806a5d249ee0e924f94797fbd18ecc92.jpg');
INSERT INTO `tp_goods_images` VALUES ('2', '4', '/upload/good/20190404/922fe3837040c08091f137eebc85def7.jpg');
INSERT INTO `tp_goods_images` VALUES ('3', '4', '/upload/good/20190404/af701fa4d660261d8ef55456b7b4a333.jpg');
INSERT INTO `tp_goods_images` VALUES ('4', '2', '/upload/good/20190404/65b128919b97df3acb8988fa40fa026e.jpg');
INSERT INTO `tp_goods_images` VALUES ('5', '1', '/upload/good/20190404/39d511e8d450221a2b626aee028a82a4.jpg');
INSERT INTO `tp_goods_images` VALUES ('6', '1', '/upload/good/20190406/58d6ed7c013cc38512bec2ecbf68281c.jpg');
INSERT INTO `tp_goods_images` VALUES ('7', '1', '/upload/good/20190406/e587b0c81456277f498feb950d9aa8d5.jpg');
INSERT INTO `tp_goods_images` VALUES ('8', '2', '/upload/good/20190406/bd1d0369cacf3c79030b4d57122a311c.jpg');
INSERT INTO `tp_goods_images` VALUES ('9', '2', '/upload/good/20190406/757f3a4d65a2c182b2b98a49bbc587d8.jpg');
INSERT INTO `tp_goods_images` VALUES ('10', '2', '/upload/good/20190406/3c8b414607d11d1db2d22ad0fb8041d4.jpg');
INSERT INTO `tp_goods_images` VALUES ('11', '3', '/upload/good/20190406/5d791276b7e074585a0e20121dbc6078.jpg');
INSERT INTO `tp_goods_images` VALUES ('12', '3', '/upload/good/20190406/a06ab3a6dbe9e413bd371f3f7d47b06c.jpg');
INSERT INTO `tp_goods_images` VALUES ('13', '3', '/upload/good/20190406/e0785e8fde62f748fbd24124e29edb80.jpg');
INSERT INTO `tp_goods_images` VALUES ('14', '3', '/upload/good/20190406/0d62951043f1daf46bf926ff9ff190ab.jpg');
INSERT INTO `tp_goods_images` VALUES ('15', '4', '/upload/good/20190406/755b7e66a893af4a89ceeae390c0ae3e.jpg');
INSERT INTO `tp_goods_images` VALUES ('16', '4', '/upload/good/20190406/457e802e5e53f6580982aa7d4f600516.jpg');
INSERT INTO `tp_goods_images` VALUES ('17', '4', '/upload/good/20190406/eea5f3c645cd345cb8f9ae4a72e25a69.jpg');
INSERT INTO `tp_goods_images` VALUES ('18', '4', '/upload/good/20190406/c101457a3a169d7dc6d17c72874e622d.jpg');
INSERT INTO `tp_goods_images` VALUES ('19', '5', '/upload/good/20190406/59296f30f0489a5f7525b37f7fe864e3.jpg');
INSERT INTO `tp_goods_images` VALUES ('20', '5', '/upload/good/20190406/0850e6d96993b6313a2ae1a0c894594b.jpg');
INSERT INTO `tp_goods_images` VALUES ('21', '5', '/upload/good/20190406/f114c2a589eec852f4ff17c8db633bba.jpg');
INSERT INTO `tp_goods_images` VALUES ('22', '6', '/upload/good/20190406/74dce753a167eb93ef9292ef92d5b5e1.jpg');
INSERT INTO `tp_goods_images` VALUES ('23', '6', '/upload/good/20190406/00504c1f6ef4c5308eccfd51a22eb311.jpg');
INSERT INTO `tp_goods_images` VALUES ('24', '6', '/upload/good/20190406/c5614b8ad35792efb90a91d2896db0cb.jpg');
INSERT INTO `tp_goods_images` VALUES ('25', '7', '/upload/good/20190406/686d2b6ee9e09fbfef959eee219f4d2d.jpg');
INSERT INTO `tp_goods_images` VALUES ('26', '7', '/upload/good/20190406/0e762e7653ca127cf52ae2c4750fb0c9.jpg');
INSERT INTO `tp_goods_images` VALUES ('27', '7', '/upload/good/20190406/bfda3a04f3b839863bd01e1820f75d54.jpg');
INSERT INTO `tp_goods_images` VALUES ('28', '7', '/upload/good/20190406/a982b831a17b1b420c316a68793fb64c.jpg');
INSERT INTO `tp_goods_images` VALUES ('29', '8', '/upload/good/20190406/338dd127f70017ebd610cbf9099806fa.jpg');
INSERT INTO `tp_goods_images` VALUES ('30', '8', '/upload/good/20190406/d8f7e1d31c8992be6793288e3d73eb89.jpg');
INSERT INTO `tp_goods_images` VALUES ('31', '8', '/upload/good/20190406/a493d4c1b910ad8b1c1bead8eafd5ae2.jpg');
INSERT INTO `tp_goods_images` VALUES ('32', '9', '/upload/good/20190406/a82fa77d7a35f80d27c36b591b4c19e7.jpg');
INSERT INTO `tp_goods_images` VALUES ('33', '9', '/upload/good/20190406/4bfd6f4a501bd69c6a4f3b2dd3c02d44.jpg');
INSERT INTO `tp_goods_images` VALUES ('34', '9', '/upload/good/20190406/3a4940166300fb7b59faaa897e9bd1de.jpg');
INSERT INTO `tp_goods_images` VALUES ('35', '9', '/upload/good/20190406/8a25605bda56cc40096a90ed56249480.jpg');
INSERT INTO `tp_goods_images` VALUES ('36', '9', '/upload/good/20190406/a82fa77d7a35f80d27c36b591b4c19e7.jpg');
INSERT INTO `tp_goods_images` VALUES ('37', '9', '/upload/good/20190406/4bfd6f4a501bd69c6a4f3b2dd3c02d44.jpg');
INSERT INTO `tp_goods_images` VALUES ('38', '9', '/upload/good/20190406/3a4940166300fb7b59faaa897e9bd1de.jpg');
INSERT INTO `tp_goods_images` VALUES ('39', '9', '/upload/good/20190406/8a25605bda56cc40096a90ed56249480.jpg');
INSERT INTO `tp_goods_images` VALUES ('40', '10', '/upload/good/20190406/c886f3ceb03adc77dfd4deb6eac391fe.jpg');
INSERT INTO `tp_goods_images` VALUES ('41', '10', '/upload/good/20190406/bc25f36e3b2b0af81d486140f8eeaf8a.jpg');
INSERT INTO `tp_goods_images` VALUES ('42', '10', '/upload/good/20190406/a48805442e6b31875a41a2625106e625.jpg');
INSERT INTO `tp_goods_images` VALUES ('43', '10', '/upload/good/20190406/e3085e1c75fd99e6d12bc48d1cdb2d9d.jpg');
INSERT INTO `tp_goods_images` VALUES ('44', '11', '/upload/good/20190406/4d164bad1a1de067693c7326c83e39a4.jpg');
INSERT INTO `tp_goods_images` VALUES ('45', '11', '/upload/good/20190406/204e0ff93e0c4838f9f2a7fbb9d1c939.jpg');
INSERT INTO `tp_goods_images` VALUES ('46', '11', '/upload/good/20190406/34f6f726ba20e32f5eb8f4d28bccf99a.jpg');
INSERT INTO `tp_goods_images` VALUES ('47', '11', '/upload/good/20190406/b729c1aa512fb901e07ff822bd8762a6.jpg');
INSERT INTO `tp_goods_images` VALUES ('48', '12', '/upload/good/20190406/97d990eda3be0f40b29c9150469d2d85.jpg');
INSERT INTO `tp_goods_images` VALUES ('49', '12', '/upload/good/20190406/2c5260f76f158d155da59b6a439529e2.jpg');
INSERT INTO `tp_goods_images` VALUES ('50', '12', '/upload/good/20190406/ed359683d3227ef77dafd617b25f23f7.jpg');
INSERT INTO `tp_goods_images` VALUES ('51', '12', '/upload/good/20190406/c99bdbed938e9d2be98c0af4a00e8a2c.jpg');
INSERT INTO `tp_goods_images` VALUES ('52', '13', '/upload/good/20190406/72f375886f724e99d236d38e1341ea45.jpg');
INSERT INTO `tp_goods_images` VALUES ('53', '13', '/upload/good/20190406/ed77254e8afad1b0ab6b6a299f08a7c6.jpg');
INSERT INTO `tp_goods_images` VALUES ('54', '13', '/upload/good/20190406/e53511c77f066e76cb802e4fc041ec08.jpg');
INSERT INTO `tp_goods_images` VALUES ('55', '13', '/upload/good/20190406/3c136c09457e991a9b8ae40ef06f1c5d.jpg');
INSERT INTO `tp_goods_images` VALUES ('56', '13', '/upload/good/20190406/2296660304f305f6513bc680d65b1035.jpg');
INSERT INTO `tp_goods_images` VALUES ('57', '14', '/upload/good/20190406/68096c1c7d462bba5a7fa4f60a249869.jpg');
INSERT INTO `tp_goods_images` VALUES ('58', '14', '/upload/good/20190406/f82694dd0b6e11a17d5efe39812f2f6b.jpg');
INSERT INTO `tp_goods_images` VALUES ('59', '14', '/upload/good/20190406/f39780972d0549ccfef8b2494b902d56.jpg');
INSERT INTO `tp_goods_images` VALUES ('60', '14', '/upload/good/20190406/4506387a65c0992a3b5324ec8593fd2e.jpg');
INSERT INTO `tp_goods_images` VALUES ('61', '14', '/upload/good/20190406/da9854a529e4c921772fb1d2f5d91be6.jpg');
INSERT INTO `tp_goods_images` VALUES ('62', '14', '/upload/good/20190406/fb2ac6db39d00dad49ebfae9797732a5.jpg');
INSERT INTO `tp_goods_images` VALUES ('63', '14', '/upload/good/20190406/1c8afcf54b80f117b6c593f3022f11dc.jpg');
INSERT INTO `tp_goods_images` VALUES ('64', '14', '/upload/good/20190406/2f3b84a712fe78226e80531bf656f6ad.jpg');
INSERT INTO `tp_goods_images` VALUES ('65', '14', '/upload/good/20190406/6bca840d41e53fddf1ddbd00508f4a0b.jpg');
INSERT INTO `tp_goods_images` VALUES ('66', '15', '/upload/good/20190406/7a5db900c7746b8f0996ec235368910b.jpg');
INSERT INTO `tp_goods_images` VALUES ('67', '15', '/upload/good/20190406/755f6e6906698e3b2463c2bc477165ee.jpg');
INSERT INTO `tp_goods_images` VALUES ('68', '15', '/upload/good/20190406/09fd497b473bcebf58494b8dd0864361.jpg');
INSERT INTO `tp_goods_images` VALUES ('69', '15', '/upload/good/20190406/afb8360045dce81f7341afc41d7720fb.jpg');
INSERT INTO `tp_goods_images` VALUES ('70', '15', '/upload/good/20190406/fa9692cb32665a8988ac3ea6ab25e397.jpg');
INSERT INTO `tp_goods_images` VALUES ('71', '16', '/upload/good/20190406/8a168bd7b76e8f34f139b7faf4612ebb.jpg');
INSERT INTO `tp_goods_images` VALUES ('72', '16', '/upload/good/20190406/1fee8bd3c1465083cad185c556972df7.jpg');
INSERT INTO `tp_goods_images` VALUES ('73', '16', '/upload/good/20190406/3402c3149b6468f348cdca7377b26c38.jpg');
INSERT INTO `tp_goods_images` VALUES ('74', '16', '/upload/good/20190406/75ada11344754f6155a58427685eb051.jpg');
INSERT INTO `tp_goods_images` VALUES ('75', '16', '/upload/good/20190406/b11580dd4e869eee193bbec7a04c3b9b.jpg');
INSERT INTO `tp_goods_images` VALUES ('76', '17', '/upload/good/20190406/be35a466a5f05f1093d5be866b4ded71.jpg');
INSERT INTO `tp_goods_images` VALUES ('77', '17', '/upload/good/20190406/52eeab10136585be7739cda24d88ea40.jpg');
INSERT INTO `tp_goods_images` VALUES ('78', '17', '/upload/good/20190406/13ba1afd8524fc60171caadcee1f764a.jpg');
INSERT INTO `tp_goods_images` VALUES ('79', '17', '/upload/good/20190406/db0af8b169ea30f6c3ed4cae1c24c59c.jpg');
INSERT INTO `tp_goods_images` VALUES ('80', '18', '/upload/good/20190406/2c8990332f21c4682e0282d69c597715.jpg');
INSERT INTO `tp_goods_images` VALUES ('81', '18', '/upload/good/20190406/34e9ef11b167e2adad7bd24dd050b0cc.jpg');
INSERT INTO `tp_goods_images` VALUES ('82', '18', '/upload/good/20190406/6d9cc2ea951e02126a642169ec546c84.jpg');
INSERT INTO `tp_goods_images` VALUES ('83', '18', '/upload/good/20190406/8d4255b96274ea095967222b28cf21df.jpg');
INSERT INTO `tp_goods_images` VALUES ('84', '18', '/upload/good/20190406/37bb245d696c1244bdbb9ad842512258.jpg');
INSERT INTO `tp_goods_images` VALUES ('85', '19', '/upload/good/20190406/220f73280d3362576d7ca31515df5a57.jpg');
INSERT INTO `tp_goods_images` VALUES ('86', '19', '/upload/good/20190406/f9c265e7b7a1245e81f136592758a342.jpg');
INSERT INTO `tp_goods_images` VALUES ('87', '19', '/upload/good/20190406/ba1c32b5d6f48866739efbc69ab13625.jpg');
INSERT INTO `tp_goods_images` VALUES ('88', '20', '/upload/good/20190406/09c8cea46337e0515ad5f0d162d7a446.jpg');
INSERT INTO `tp_goods_images` VALUES ('89', '20', '/upload/good/20190406/35e9fd0d80ee4684ca40cbbcc110e267.jpg');
INSERT INTO `tp_goods_images` VALUES ('90', '21', '/upload/good/20190406/7018db718a6c82a96f7686a628c922e6.jpg');
INSERT INTO `tp_goods_images` VALUES ('91', '21', '/upload/good/20190406/8512be1dd63e95c2d294632c815b3dd9.jpg');
INSERT INTO `tp_goods_images` VALUES ('92', '21', '/upload/good/20190406/2180ff89cf77cae71e8e2d8703b57570.jpg');
INSERT INTO `tp_goods_images` VALUES ('93', '22', '/upload/good/20190406/137937a3c5ba57814d3dc5c90eccbbdb.jpg');
INSERT INTO `tp_goods_images` VALUES ('94', '22', '/upload/good/20190406/5a6d717a4d02e7ef2ca73e55d8f4b321.jpg');
INSERT INTO `tp_goods_images` VALUES ('95', '22', '/upload/good/20190406/b55c22d3572990bc61ec8cf5bff5357e.jpg');
INSERT INTO `tp_goods_images` VALUES ('96', '22', '/upload/good/20190406/41a6503918c18b6c42a1ef75ef39fbcd.jpg');
INSERT INTO `tp_goods_images` VALUES ('97', '22', '/upload/good/20190406/3f6368e458f96d18ffba276c75e6dc8d.jpg');
INSERT INTO `tp_goods_images` VALUES ('98', '23', '/upload/good/20190406/b0f5f557f860a225880377f91769adfb.jpg');
INSERT INTO `tp_goods_images` VALUES ('99', '23', '/upload/good/20190406/8c5d763215f70b209c48271ed12f803d.jpg');
INSERT INTO `tp_goods_images` VALUES ('100', '23', '/upload/good/20190406/c4c0458d83840abb0aaaf9462f5531a2.jpg');
INSERT INTO `tp_goods_images` VALUES ('101', '23', '/upload/good/20190406/18c5cccfe75d0b7b02a9984a5f3bde27.jpg');
INSERT INTO `tp_goods_images` VALUES ('102', '24', '/upload/good/20190406/40957e35835671b818f7fd0a502fb490.jpg');
INSERT INTO `tp_goods_images` VALUES ('103', '24', '/upload/good/20190406/f2e3100c651388136a039c5b9fd2ac5f.jpg');
INSERT INTO `tp_goods_images` VALUES ('104', '24', '/upload/good/20190406/e87614861f0b2271a4d708f4b4e85d52.jpg');
INSERT INTO `tp_goods_images` VALUES ('105', '24', '/upload/good/20190406/d308d7d4022facdf5b70a400eb9a0acf.jpg');
INSERT INTO `tp_goods_images` VALUES ('106', '24', '/upload/good/20190406/db99c3192dc0de202bdec617eb2b65db.jpg');
INSERT INTO `tp_goods_images` VALUES ('107', '25', '/upload/good/20190406/18fadc237fc6da96c52cd67f8065e0c1.jpg');
INSERT INTO `tp_goods_images` VALUES ('108', '25', '/upload/good/20190406/33e449387ac90ab007c254562cb81a86.jpg');
INSERT INTO `tp_goods_images` VALUES ('109', '25', '/upload/good/20190406/e89d958570f6e5b563574cf3572b0d37.jpg');
INSERT INTO `tp_goods_images` VALUES ('110', '25', '/upload/good/20190406/27e60b97d3734a935f92ef882c62c177.jpg');
INSERT INTO `tp_goods_images` VALUES ('111', '25', '/upload/good/20190406/c0c655a830f1b8360710e73604001c54.jpg');
INSERT INTO `tp_goods_images` VALUES ('112', '26', '/upload/good/20190406/97de416e6ae2e1856d60143b44e32ddb.jpg');
INSERT INTO `tp_goods_images` VALUES ('113', '26', '/upload/good/20190406/fe7cfe48a8ded2ecc6d736eac5979e5c.jpg');
INSERT INTO `tp_goods_images` VALUES ('114', '26', '/upload/good/20190406/669eaa243f937af231b30c08eb2c7869.jpg');
INSERT INTO `tp_goods_images` VALUES ('115', '27', '/upload/good/20190406/fcaf39e312fa832bcddde876b20a1158.jpg');
INSERT INTO `tp_goods_images` VALUES ('116', '27', '/upload/good/20190406/68b495e08f3fc88909e85711268bd63f.jpg');
INSERT INTO `tp_goods_images` VALUES ('117', '28', '/upload/good/20190406/f4c276e49ab8292a62225d18cc87dcf0.jpg');
INSERT INTO `tp_goods_images` VALUES ('118', '28', '/upload/good/20190406/2b095c0c6f4abfa3b272b4f01a2f589f.jpg');
INSERT INTO `tp_goods_images` VALUES ('119', '28', '/upload/good/20190406/9f139bfcdf4e9e3c0c29fe50a7000c80.jpg');
INSERT INTO `tp_goods_images` VALUES ('120', '28', '/upload/good/20190406/72472ed1a117208fc027485c89b6f209.jpg');
INSERT INTO `tp_goods_images` VALUES ('121', '28', '/upload/good/20190406/92cbec788b578dc6f90c78024f8568fe.jpg');
INSERT INTO `tp_goods_images` VALUES ('122', '29', '/upload/good/20190406/094ba26f230b750e432e3b182c1520d8.jpg');
INSERT INTO `tp_goods_images` VALUES ('123', '29', '/upload/good/20190406/90d587d05965a42446acd63a9721bdac.jpg');
INSERT INTO `tp_goods_images` VALUES ('124', '29', '/upload/good/20190406/2e04c1ab26f91e86bb215db65fd52fcd.jpg');
INSERT INTO `tp_goods_images` VALUES ('125', '29', '/upload/good/20190406/cfbd2e9356047dea902c4b46132b2f79.jpg');
INSERT INTO `tp_goods_images` VALUES ('126', '30', '/upload/good/20190406/7747f3b1b98d40a4882cd7220a69bc8a.jpg');
INSERT INTO `tp_goods_images` VALUES ('127', '30', '/upload/good/20190406/28ffcdf702c7c852e7adab0399aa0088.jpg');
INSERT INTO `tp_goods_images` VALUES ('128', '30', '/upload/good/20190406/98f8a5f822250a23550921a656b677e0.jpg');
INSERT INTO `tp_goods_images` VALUES ('129', '30', '/upload/good/20190406/40ef597e5ee75fd2e8a7d30e471f9a05.jpg');
INSERT INTO `tp_goods_images` VALUES ('130', '31', '/upload/good/20190406/afc44db1c32c9a72f6363a8788100f9e.jpg');
INSERT INTO `tp_goods_images` VALUES ('131', '31', '/upload/good/20190406/d867b820dc00a8bdbf35c3e504c8c19b.jpg');
INSERT INTO `tp_goods_images` VALUES ('132', '31', '/upload/good/20190406/417903ed5838976533335dbc31225379.jpg');
INSERT INTO `tp_goods_images` VALUES ('133', '32', '/upload/good/20190406/890eacff1b852ab4c63267ac14eea91f.jpg');
INSERT INTO `tp_goods_images` VALUES ('134', '32', '/upload/good/20190406/100e11fbc5210bea247aa464e42459cc.jpg');
INSERT INTO `tp_goods_images` VALUES ('135', '32', '/upload/good/20190406/9b7eeeb5655ec3352066c748cf83a1f5.jpg');
INSERT INTO `tp_goods_images` VALUES ('136', '33', '/upload/good/20190406/c297d89a4bde287e4903214a84ccfc1e.jpg');
INSERT INTO `tp_goods_images` VALUES ('137', '33', '/upload/good/20190406/25a52c1c8ab26c1c2a82fd408b6cd97c.jpg');
INSERT INTO `tp_goods_images` VALUES ('138', '33', '/upload/good/20190406/a3818080cf4da7f58b0824c175fb1ddc.jpg');
INSERT INTO `tp_goods_images` VALUES ('139', '33', '/upload/good/20190406/5b4e32823594d85477da1661b1398ba2.jpg');
INSERT INTO `tp_goods_images` VALUES ('140', '33', '/upload/good/20190406/748758aa80a369948886f51cd6ab8c40.jpg');
INSERT INTO `tp_goods_images` VALUES ('141', '34', '/upload/good/20190406/3cb910bce8fd4d0a7c3ed6d4f98b6b43.jpg');
INSERT INTO `tp_goods_images` VALUES ('142', '34', '/upload/good/20190406/28afee245a7b1590517737f2a81e2fec.jpg');
INSERT INTO `tp_goods_images` VALUES ('143', '34', '/upload/good/20190406/66982c635ca253049d52b2c93c53dc57.jpg');
INSERT INTO `tp_goods_images` VALUES ('144', '34', '/upload/good/20190406/c1679ee75439126383d2dc50f34b26fb.jpg');
INSERT INTO `tp_goods_images` VALUES ('145', '35', '/upload/good/20190406/b2b4d8efb3dcff43868fcc3d3d5746c1.jpg');
INSERT INTO `tp_goods_images` VALUES ('146', '35', '/upload/good/20190406/e710bd694c7379ea2eaf39c920b161fb.jpg');
INSERT INTO `tp_goods_images` VALUES ('147', '35', '/upload/good/20190406/5cc67b430a9609dc78ca8a4487fa3dee.jpg');
INSERT INTO `tp_goods_images` VALUES ('148', '36', '/upload/good/20190406/645ba512a788759ef7556744b1c25449.jpg');
INSERT INTO `tp_goods_images` VALUES ('149', '36', '/upload/good/20190406/cc070098abf109d72956ef468e39be02.jpg');
INSERT INTO `tp_goods_images` VALUES ('150', '36', '/upload/good/20190406/ec8e19e81d538c8a6415c9e862f6c8b8.jpg');
INSERT INTO `tp_goods_images` VALUES ('151', '36', '/upload/good/20190406/e77f102a1fa9d88d572633c5b8884fef.jpg');
INSERT INTO `tp_goods_images` VALUES ('152', '37', '/upload/good/20190406/d8eb65b01bdfc9d3a961f41047200f6c.jpg');
INSERT INTO `tp_goods_images` VALUES ('153', '37', '/upload/good/20190406/dbf468dd919d48549ccd2f3b2ced6ff2.jpg');
INSERT INTO `tp_goods_images` VALUES ('154', '37', '/upload/good/20190406/439be5d891c806cd0d8e8060220bacca.jpg');
INSERT INTO `tp_goods_images` VALUES ('155', '37', '/upload/good/20190406/0c7429af2a01b37ee259116d41c3bbb9.jpg');
INSERT INTO `tp_goods_images` VALUES ('156', '37', '/upload/good/20190406/f8fc82e26654b070f05b43979d9f0600.jpg');
INSERT INTO `tp_goods_images` VALUES ('157', '38', '/upload/good/20190406/9361e78ce365bbd726a3a3748c588ff8.jpg');
INSERT INTO `tp_goods_images` VALUES ('158', '38', '/upload/good/20190406/3846087da38db4794388147a9e3476db.jpg');
INSERT INTO `tp_goods_images` VALUES ('159', '38', '/upload/good/20190406/92a8d6b2611c51e18c93b85611b785df.jpg');
INSERT INTO `tp_goods_images` VALUES ('160', '38', '/upload/good/20190406/13f9d962f45655b04f4a9353e09b649f.jpg');
INSERT INTO `tp_goods_images` VALUES ('161', '45', '/upload/good/20190508/2ccfe1aa1688bb7bee958ce2fedb9a7f.jpg');
INSERT INTO `tp_goods_images` VALUES ('162', '45', '/upload/good/20190508/3ac3ce04c4f5ffe8090b1d85079d2ac4.png');

-- -----------------------------
-- Table structure for `tp_goods_inventory_logs`
-- -----------------------------
DROP TABLE IF EXISTS `tp_goods_inventory_logs`;
CREATE TABLE `tp_goods_inventory_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL DEFAULT '0',
  `order_id` int(10) NOT NULL DEFAULT '0',
  `use_storage` tinyint(1) NOT NULL DEFAULT '0',
  `admin_id` int(10) NOT NULL DEFAULT '0',
  `number` varchar(160) NOT NULL,
  `model_inventory` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `model_attr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `warehouse_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `admin_id` (`admin_id`),
  KEY `model_inventory` (`model_inventory`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `area_id` (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_goods_inventory_logs`
-- -----------------------------
INSERT INTO `tp_goods_inventory_logs` VALUES ('1', '35', '1', '0', '0', '-1', '0', '0', '0', '2', '18', '0', '1504507232', '', '');
INSERT INTO `tp_goods_inventory_logs` VALUES ('2', '35', '2', '0', '0', '-1', '0', '0', '0', '2', '18', '0', '1508312241', '', '');
INSERT INTO `tp_goods_inventory_logs` VALUES ('3', '35', '3', '0', '0', '-2', '0', '0', '0', '2', '18', '0', '1508312376', '', '');

-- -----------------------------
-- Table structure for `tp_news`
-- -----------------------------
DROP TABLE IF EXISTS `tp_news`;
CREATE TABLE `tp_news` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` int(10) NOT NULL DEFAULT '0' COMMENT '文章作者',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int(11) DEFAULT '0' COMMENT '浏览量',
  `publish_time` int(11) DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT NULL COMMENT '文章缩略图',
  `hide` int(2) NOT NULL DEFAULT '1',
  `orderid` int(5) NOT NULL DEFAULT '0',
  `catid` int(5) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_news`
-- -----------------------------
INSERT INTO `tp_news` VALUES ('1', '新疆：大棚蔬菜新鲜上市（图）', '<p style=\"text-align: center;\"><img src=\"/upload/remote/20190407/5ca948589932e.png\"/></p><p><br/></p><p>　　近日，尉犁县兴平镇巴西阿瓦提村大自然果蔬合作社社员在温室大棚内采摘茄子。该合作社有102座标准大棚，主要种植西红柿、辣椒、茄子、黄瓜、豇豆、葫芦瓜等蔬菜。目前，茄子、葫芦瓜等蔬菜已陆续上市。</p><p><br/></p>', '0', '', '1554597859', '', '', '0', '', '', '1', '0', '1');
INSERT INTO `tp_news` VALUES ('2', '山东：蔬菜价格稳中偏涨（图）', '<p style=\"text-align: center;\"><img src=\"/upload/remote/20190407/5ca948995ca90.png\"/></p><p><br/></p><p>　　山东金乡县凯盛国际农产品物流园大数据信息服务中心对22种蔬菜进行了监测，监测数据显示，本周（4月1日的一周，下同）蔬菜平均价格为2.58元/公斤，与上周（3月25日-3月31日，下同）蔬菜平均价格2.22元/公斤相比，周环比上涨率为16.21%，平均价格上涨。</p><p>　　本周市场热销蔬菜：黄瓜、西葫芦、笋瓜、西红柿。本周蔬菜销量总体平稳，笋瓜销量较为火热，其次为西红柿、黄瓜。天气升温，很多餐厅对黄瓜的购买量增大，市场客户需求量增加，商户也相应加大库存量。本周香椿价格下降，销量也有所减少，相比上周香椿的火热销售，本周的情况显得冷清很多，而且香椿存放期较短，本地香椿也在逐渐上市，外地香椿虽然质量较好，但是价格偏贵，顾客接受力不明显，只能低价快销。</p><p>　　根据市场调研发现，本周市场上涨菜品为：蒜薹、卷心菜、青椒、茄子、豆角等，其中豆角价格浮动较为明显，周环比上升22.86%。价格下降菜品为：黄豆芽、扁豆、生姜等。其中生姜周环比下降11.89%价格陡降。本周价格持平菜品：大白菜、山药、韭黄，涨跌幅保持在1%~5%以内。</p><p>　　本周蔬菜总体价格稳定，部分价格上涨，涨跌幅+61.41%，周环比+59.08%。预计后期蔬菜价格稳定或上涨趋势，根据需求量来看，黄瓜销量以及价格有会所增加，本地蔬菜会大量上市，对外地蔬菜有一定的竞争力。</p><p><br/></p>', '0', '', '1554598009', '', '', '0', '', '', '1', '0', '1');
INSERT INTO `tp_news` VALUES ('3', '高邮：特殊的爱心蔬菜义卖', '<p>　　“叔叔阿姨们，卖大蒜、青菜、香菜、韭菜。”“无公害、纯自然。”“1.5元一斤……”在市荷花塘特殊教育学校门口，一群来自特殊教育学校的孩子正在用并不流畅的语言介绍着他们义卖的蔬菜，吸引了众多市民驻足。</p><p>　　据悉，这8名孩子来自荷花塘特殊教育学校培智班九年级，今年6月份他们即将毕业。为了增强孩子们的人际沟通能力，让他们能更好地融入社会，学校从3月份开始，每周五上午为孩子们增加了爱心蔬菜义卖的社会实践课，周四是农事课，孩子们将自己种植的蔬菜收割好，第二天一早进行爱心义卖。</p><p>　　当天早上8点多钟，当孩子们将蔬菜义卖亭推出来时，不少市民围拢过来。家住附近的王奶奶成了他们当天的第一个顾客。当王奶奶说买一斤青菜后，一个叫周周（化名）的孩子立刻笑脸相迎，非常熟练地拿起方便袋装菜，其他的孩子也分工合作。称重时，两三个孩子一起认真地操作着电子秤，由于把不准重量，只能反复地添减蔬菜，并不时向一旁的老师请教，一点也不马虎；找钱时，孩子们一边算一边大声地将算术念出来，在得到老师的认可后再小心翼翼地取出钱，交给王奶奶。虽然过程磕磕绊绊，但在成功交易后，孩子们的脸上都露出了笑容。周周将蔬菜递给王奶奶时，还大声叮嘱：“奶奶慢走！”</p><p>　　“通过几次社会实践课，孩子们比第一次出来义卖时进步明显。”站在一旁的特校老师戴素琴告诉记者，这群孩子智力较常人低下，刚开始义卖时，孩子们不敢主动叫卖，售卖的每一个环节都需要老师手把手反复教授。经过几个星期的锻炼，孩子们的胆量大了，现在能够主动与顾客沟通交流，也能相对熟练地算账、找钱，而且越来越懂礼貌。作为老师，看到孩子们一点一滴的进步，心里也深感欣慰。</p><p>　　“特校的这个活动搞得好，锻炼孩子的社交能力，理应支持。”在现场，不少市民得知情况后，纷纷掏钱购买蔬菜。孩子们忙得不亦乐乎，每做成一笔生意都大声地说“谢谢”。一位杨阿姨主动提出不需要找零，一旁的戴老师婉拒了她的好意。戴老师表示，希望孩子能够理解自己通过努力付出，得到同等的价值，而不是不劳而获。一番话说得杨阿姨连连点头，临走时还不忘鼓励孩子们“继续加油”。</p><p>　　不到一小时，几小筐蔬菜就已经售罄，总共卖了28元。专职收钱的孩子将收款箱紧紧地护在胸口，直到回到教室，才露出轻松的表情。</p><p>　　教导他们的老师柏佐岭说，他和孩子们还有一个小小的约定——等义卖的钱聚到200元时，就用这笔大家一起赚的钱去看一场电影。所以孩子们非常珍惜他们的劳动成果，每次义卖结束后，就一起将钱箱里的钱数一数。义卖活动已经开展4次，现在总共有87元了，200元的小目标很快就可以实现了。</p><p>　　荷花塘特殊教育学校副校长李霞说，学校开展这些活动的目的，就是让这些孩子学会正常的人际交往，让他们不断接触社会，从被社会接纳到融入社会。6月份孩子们即将毕业，学校目前也在积极和相关企业进行联系接洽，希望孩子们毕业后能够找到一份职业归宿，也希望有更多的社会力量能够关注帮助他们。</p><p><br/></p>', '0', '', '1554598078', '', '', '0', '', '', '1', '0', '1');
INSERT INTO `tp_news` VALUES ('4', '河北秦皇岛：无公害蔬菜产业化发展增产增收（图）', '<p style=\"text-align: center;\"><img src=\"/upload/remote/20190407/5ca9491200885.png\"/></p><p><br/></p><p>　　4月2日，秦皇岛市抚宁区茶棚乡后石河村的菜农在大棚内采摘西红柿。</p><p><br/></p>', '0', '', '1554598149', '', '', '0', '', '', '1', '0', '1');
INSERT INTO `tp_news` VALUES ('5', '白朗县：蔬菜产业 富乡民（图）', '<p style=\"text-align: center;\"><img src=\"/upload/remote/20190407/5ca949516da7a.png\"/></p><p><br/></p><p>　　近年来，白朗县大力发展蔬菜产业，在传统品种的基础上，借力山东援藏的优势，引进草莓、寿桃西红柿、杏鲍菇、拇指西瓜等新型果蔬品种，引导蔬菜产业向标准化、规范化、高端化发展。同时，通过与市区多家超市及日喀则农贸市场对接供货、重点企业统一收购销售等方式，推动产销对接，拓宽销售渠道，增加群众收入。</p><p><br/></p>', '0', '', '1554598213', '', '', '0', '', '', '1', '0', '1');
INSERT INTO `tp_news` VALUES ('6', '广元市朝天区平溪蔬菜专合社跻身全国500强', '<p>　　《2019农民合作社500强排行榜》近日公布，广元市朝天区平溪乡蔬菜专业合作社入选全国农民合作社500强，位列全国第155位。</p><p>　　据悉，本届农民合作社排名主要参考经营收入、农民（出资、入股）成员数、盈余返还额等3个指标，权重分别为50%、20%、30%，使用层次分析法进行分析得出排行结果。全国共有31个省（市、区）参与排名，朝天区平溪乡蔬菜专业合作社以经营收入3250.00万元、入社成员358户以及盈余返还额98.00万元的成绩成功入围。</p><p>　　朝天区平溪蔬菜专业合作社创建于2007年，是该区集蔬菜种植、收购、销售及蔬菜名优品种示范推广为一体的国家级农民合作社示范社。合作社实行“合作社+公司+基地+农户”产业化发展模式，以“四强四统四带”为重要抓手，持续推动高山露地绿色蔬菜生产标准化、营销信息化、监管安全化、品牌战略化、增收效益化，带动曾家山1.71万农户建立高山露地绿色蔬菜基地28万亩，基地乡镇农民人均蔬菜收入达1.4万元以上。该专业合作社已成为曾家山蔬菜转型升级的主力军。</p><p>　　朝天区依托实施规模经营，积极培育家庭农场、农民合作社等新型经营主体，不断加大财政扶持力度、拓展农特产品销售市场，不断完善利益联结机制，调动了农户生产积极性。至2018年底，该区共建成农民合作社63个，国家级示范合作社3家，省级示范合作社2家，市级示范合作社6家。</p><p><br/></p>', '0', '', '1554598238', '', '', '0', '', '', '1', '0', '1');
INSERT INTO `tp_news` VALUES ('7', '四川：种下“致富树”奔向小康路', '<p>　　花椒树种下去，以后收入就更多了。”近日，正在种植花椒树的四川省九寨沟县安乐乡阳坡村村民王侯代乐得合不拢嘴，“搬下山了，在山下住得好，现在还发展集体经济，致富的日子越来越有望了。”</p><p>　　阳春三月是植树的最佳时节，树苗的存活率最高。挖坑、放苗、培土……近日，在阳坡村老寨子，全体村民与全乡党员干部、帮扶单位人员一起在山上种植花椒树。“这一次共种植面积162亩，等花椒盛产后，预计每年可为村集体增收300余万元。”安乐乡党委书记蔡阳华算了算，村集体经济增长有望了。</p><p>　　阳坡村属于易地扶贫搬迁村，去年竣工后村民陆陆续续入住。如何实现全村村民“稳得住、能致富”？安乐乡党委政府通过反复考察、研究，根据当地地理环境并征求老百姓的同意，开创了一条致富新路。</p><p>　　“阳坡村村集体经济可持续性差，之前村集体经济收入只有两万多元，村里的公益事业全靠上级支持，长期下去总不是个办法，只有靠自身的发展才是长久之计。”蔡阳华说，阳坡村海拔2000米，水土气候适合种植花椒，为了增加集体经济收入，村里决定种植花椒树。花椒是九寨沟县推广的主打产业之一，产品销路不用愁，经济效益差不了。</p><p>　　阳坡村新种花椒园就在村庄路边和村庄背后，村里打算在花椒树下套种油菜，养殖中蜂，发展蜜园，不仅可以帮助村民经济增收，还可以用于观光游，促进乡村旅游产业的发展。</p><p><br/></p>', '0', '', '1554598287', '', '', '0', '', '', '1', '0', '1');

-- -----------------------------
-- Table structure for `tp_newstype`
-- -----------------------------
DROP TABLE IF EXISTS `tp_newstype`;
CREATE TABLE `tp_newstype` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `channeltype` int(10) DEFAULT '0' COMMENT '栏目顶级模型ID',
  `parent_id` int(10) DEFAULT '0' COMMENT '栏目上级ID',
  `typename` varchar(200) DEFAULT '' COMMENT '栏目名称',
  `dirpath` varchar(200) DEFAULT '' COMMENT '目录存放HTML路径',
  `englist_name` varchar(200) DEFAULT '' COMMENT '栏目英文名',
  `grade` tinyint(1) DEFAULT '0' COMMENT '栏目等级',
  `typelink` varchar(200) DEFAULT '' COMMENT '栏目链接',
  `litpic` varchar(250) DEFAULT '' COMMENT '栏目图片',
  `templist` varchar(200) DEFAULT '' COMMENT '列表模板文件名',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'seo关键字',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏栏目：0=显示，1=隐藏',
  `is_part` tinyint(1) DEFAULT '0' COMMENT '栏目属性：0=内容栏目，1=外部链接',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '启用 (1=正常，0=屏蔽)',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `description` varchar(255) NOT NULL,
  `listorder` int(5) NOT NULL DEFAULT '0',
  `banner` varchar(120) DEFAULT NULL,
  `dirname` varchar(40) DEFAULT NULL,
  `seo_description` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `cat_url` varchar(100) DEFAULT NULL,
  `other_1` varchar(60) DEFAULT NULL,
  `other_2` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`channeltype`,`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档栏目表';

-- -----------------------------
-- Records of `tp_newstype`
-- -----------------------------
INSERT INTO `tp_newstype` VALUES ('1', '2', '2', '妥妥头条', '', '', '0', '', '', '', '', '', '', '0', '1', '0', '0', '0', '0', '1', 'cn', '0', '0', '', '0', '', '', '', '', '', '', '');

-- -----------------------------
-- Table structure for `tp_oauth_users`
-- -----------------------------
DROP TABLE IF EXISTS `tp_oauth_users`;
CREATE TABLE `tp_oauth_users` (
  `tu_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户表ID',
  `openid` varchar(255) NOT NULL COMMENT '第三方开放平台openid',
  `oauth` varchar(50) NOT NULL COMMENT '第三方授权平台',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  `oauth_child` varchar(50) DEFAULT NULL COMMENT 'mp标识来自公众号, open标识来自开放平台,用于标识来自哪个第三方授权平台, 因为同是微信平台有来自公众号和开放平台',
  `nick_name` varchar(64) DEFAULT NULL COMMENT '绑定时的昵称',
  PRIMARY KEY (`tu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_oauth_users`
-- -----------------------------
INSERT INTO `tp_oauth_users` VALUES ('2', '2', 'oGMnQ1LfgerwTu1FJL835ib1aQpw', 'wx', 'oDZRzwxQaus-DTpLhOSJfkA0fkcA', '', '');
INSERT INTO `tp_oauth_users` VALUES ('3', '23', 'B0C344E52B6012FDABEE9ECD0557C0CC', 'qq', 'UID_7C1B0B2E4C9CF80BBD262D858DCCFD0F', '', '');
INSERT INTO `tp_oauth_users` VALUES ('4', '24', 'oGMnQ1B17wnBvpAw6xzjQWxqExuQ', 'wx', 'oDZRzw30TsZRLWSlUhGXV3_G96VY', '', '');
INSERT INTO `tp_oauth_users` VALUES ('5', '26', 'oGMnQ1HqUFRg4dum-GVONjO5jnno', 'wx', 'oDZRzw4nZI87j7Wy75AwnCahD9VA', '', '');
INSERT INTO `tp_oauth_users` VALUES ('6', '2', 'o9cTBwbBQ6HXoonM76VwVgGvmEqQ', 'weixin', 'oDZRzwxQaus-DTpLhOSJfkA0fkcA', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('8', '28', 'o9cTBwWqEYM8svh0ISDq5kBoL_Ko', 'weixin', 'oDZRzw0ZB9vFgw7Nr6oiqyxPQhX0', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('9', '29', 'o9cTBwb9m33ZB0MCH3N816ZKAjfg', 'weixin', 'oDZRzw72rtUO20crj0WXAfBXeghc', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('10', '30', 'o9cTBwZKi0GtnG1OKQdcyOxVH6RE', 'weixin', 'oDZRzw13e_Zua9ssc6gqXoyhpDzw', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('11', '24', 'o9cTBwev16ovxCbeynpnKfSTQVJk', 'weixin', 'oDZRzw30TsZRLWSlUhGXV3_G96VY', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('12', '32', 'o9cTBwS0VxKjNkxe6NM9sYIorhAM', 'weixin', 'oDZRzwwyzotr5oVB7EpnoGKLgIEc', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('13', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('14', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('15', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('16', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('17', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('18', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('19', '33', 'o9cTBwRAb2B6TeE9O75XeJbxXlhM', 'weixin', 'oDZRzw9CqkvlycW0wa78eOSSvUKo', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('20', '34', 'o9cTBwRpt_6Qdoi3egl4wL9mrtbs', 'weixin', 'oDZRzw6otRVEClGHh_c3qv8DPSpA', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('21', '35', 'o9cTBwX3gJORm_u6t9kAlbGATWmg', 'weixin', 'oDZRzw0yaJWvrPFKgdpv7mKpDEt0', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('22', '36', 'o9cTBwf6ki0bPzXi2ChKgl1r-HGA', 'weixin', 'oDZRzwyf6ow3yu291ToIwRtCFWmI', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('23', '37', 'o9cTBwRh80sCWjKs6UjmjAJQbbkg', 'weixin', 'oDZRzwxqYCdvTk_LOvlNsOj3J47A', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('24', '38', 'o9cTBwTeq1-doni8gIfD512RSRec', 'weixin', 'oDZRzwziwIEu_00ufvFuYxgVSInE', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('25', '39', 'o9cTBwdImlnFkA130oApo6UtStUc', 'weixin', 'oDZRzwyaFhzPJvUDFxm3rUyJeLCQ', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('26', '40', 'o9cTBwUDY08LVZUAXIvagXZrrp10', 'weixin', 'oDZRzwwwXaH56KgNIOcxopsgR8DY', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('27', '41', 'o9cTBwVlCnTf2rv9SGxDTpU4HQ_w', 'weixin', 'oDZRzw5n2cnE1fX4WQra-Savqgd4', 'mp', '');
INSERT INTO `tp_oauth_users` VALUES ('28', '42', 'o9cTBwRO6nW8bwmSfJnHnGNZkIqQ', 'weixin', 'oDZRzw2tSS9oaA-r_-_ExiRt7GB0', 'mp', '');

-- -----------------------------
-- Table structure for `tp_order_goods`
-- -----------------------------
DROP TABLE IF EXISTS `tp_order_goods`;
CREATE TABLE `tp_order_goods` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `cart_recid` text NOT NULL,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr` text NOT NULL,
  `send_number` int(10) unsigned NOT NULL DEFAULT '0',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_gift` int(10) unsigned NOT NULL DEFAULT '0',
  `model_attr` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` text NOT NULL,
  `ru_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shopping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `warehouse_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_single` tinyint(1) DEFAULT '0',
  `freight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `drp_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `is_distribution` int(1) NOT NULL COMMENT '商品是否参与分销',
  `commission_rate` varchar(10) NOT NULL DEFAULT '0',
  `stages_qishu` mediumint(5) NOT NULL DEFAULT '-1' COMMENT '用户选择的当前商品的分期期数 -1:不分期',
  PRIMARY KEY (`rec_id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_id` (`order_id`),
  KEY `ru_id` (`ru_id`),
  KEY `freight` (`freight`),
  KEY `tid` (`tid`),
  KEY `stages_qishu` (`stages_qishu`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `is_real` (`is_real`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `area_id` (`area_id`),
  KEY `is_gift` (`is_gift`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_order_info`
-- -----------------------------
DROP TABLE IF EXISTS `tp_order_info`;
CREATE TABLE `tp_order_info` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `main_order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_sn` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` int(10) unsigned NOT NULL DEFAULT '0',
  `province` int(10) unsigned NOT NULL DEFAULT '0',
  `city` int(10) unsigned NOT NULL DEFAULT '0',
  `district` int(10) unsigned NOT NULL DEFAULT '0',
  `street` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `shipping_id` text NOT NULL,
  `shipping_name` text NOT NULL,
  `shipping_code` text NOT NULL,
  `shipping_type` text NOT NULL,
  `pay_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `how_oos` varchar(120) NOT NULL DEFAULT '',
  `how_surplus` varchar(120) NOT NULL DEFAULT '',
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_message` varchar(255) NOT NULL DEFAULT '',
  `inv_payee` varchar(120) NOT NULL DEFAULT '',
  `inv_content` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单成本',
  `shipping_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `card_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `money_paid` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `surplus` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `integral_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `return_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单整站退款金额',
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_take_time` int(10) unsigned NOT NULL DEFAULT '0',
  `auto_delivery_time` int(11) unsigned NOT NULL DEFAULT '15',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(255) NOT NULL DEFAULT '',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `extension_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_buyer` varchar(255) NOT NULL DEFAULT '',
  `pay_note` varchar(255) NOT NULL DEFAULT '',
  `agency_id` int(10) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10,2) unsigned NOT NULL,
  `is_separate` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` decimal(10,2) unsigned NOT NULL,
  `discount_all` decimal(10,2) unsigned NOT NULL,
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_settlement` tinyint(1) NOT NULL DEFAULT '0',
  `sign_time` int(30) DEFAULT NULL,
  `is_single` tinyint(1) DEFAULT '0',
  `point_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `shipping_dateStr` varchar(255) NOT NULL,
  `supplier_id` int(10) NOT NULL DEFAULT '0',
  `froms` char(10) NOT NULL DEFAULT 'pc',
  `coupons` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `uc_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_zc_order` int(10) DEFAULT '0',
  `zc_goods_id` int(10) NOT NULL,
  `is_frozen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `chargeoff_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `invoice_type` tinyint(1) NOT NULL DEFAULT '0',
  `vat_id` int(10) NOT NULL DEFAULT '0' COMMENT '增值税发票信息ID 关联 users_vat_invoices_info表自增ID',
  `drp_is_separate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单分销状态',
  `tax_id` varchar(255) NOT NULL DEFAULT '',
  `is_update_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`(333)),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`),
  KEY `main_order_id` (`main_order_id`),
  KEY `uc_id` (`uc_id`),
  KEY `parent_id` (`parent_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `is_zc_order` (`is_zc_order`),
  KEY `zc_goods_id` (`zc_goods_id`),
  KEY `chargeoff_status` (`chargeoff_status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_personnel`
-- -----------------------------
DROP TABLE IF EXISTS `tp_personnel`;
CREATE TABLE `tp_personnel` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uname` varchar(40) NOT NULL COMMENT '登录账号',
  `nickname` varchar(40) DEFAULT NULL COMMENT '昵称',
  `job_number` varchar(20) NOT NULL COMMENT '工号',
  `password` varchar(40) NOT NULL,
  `department` int(2) NOT NULL COMMENT '部门',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login_time` int(11) NOT NULL DEFAULT '0',
  `remarks` varchar(200) NOT NULL,
  `forbidden` int(2) NOT NULL DEFAULT '0' COMMENT '1禁用0不限',
  `depot` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_personnel`
-- -----------------------------
INSERT INTO `tp_personnel` VALUES ('1', 'caigou001', '采购员1', 'cg001', '', '1', '1554641686', '1554641686', '', '0', '1');
INSERT INTO `tp_personnel` VALUES ('2', 'caigou002', '采购002', 'cg002', 'e10adc3949ba59abbe56e057f20f883e', '1', '1554644763', '1554644763', '', '0', '1');
INSERT INTO `tp_personnel` VALUES ('3', 'fenjian001', '分拣001', 'fj001', 'e10adc3949ba59abbe56e057f20f883e', '2', '1554648686', '1554648686', '测试', '0', '1');

-- -----------------------------
-- Table structure for `tp_pickup_point`
-- -----------------------------
DROP TABLE IF EXISTS `tp_pickup_point`;
CREATE TABLE `tp_pickup_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `supplier_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺标识',
  `hide` int(2) NOT NULL DEFAULT '1',
  `orderid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_pickup_point`
-- -----------------------------
INSERT INTO `tp_pickup_point` VALUES ('1', '云海超市', '河北大街西段', '15216766661', '倪庆洋', '10', '145', '1194', '0', '1', '0');
INSERT INTO `tp_pickup_point` VALUES ('2', '逸城超市', '111', '13211111111', '李先生', '10', '145', '1194', '0', '1', '0');
INSERT INTO `tp_pickup_point` VALUES ('3', '11111111', '11111', '123 ', '1111111', '10', '145', '1197', '0', '1', '0');
INSERT INTO `tp_pickup_point` VALUES ('4', '额发生大', '的撒', '大杀四方', '大', '10', '145', '1195', '0', '1', '0');
INSERT INTO `tp_pickup_point` VALUES ('5', '第三方', '第三方', '第三方', '第三方', '10', '145', '1195', '0', '1', '0');
INSERT INTO `tp_pickup_point` VALUES ('6', '第三方', '圣达菲', '圣达菲', '圣达菲', '10', '145', '1197', '0', '1', '0');
INSERT INTO `tp_pickup_point` VALUES ('7', '圣达菲', '第三方', '圣达菲', '第三方', '10', '145', '1196', '0', '1', '0');

-- -----------------------------
-- Table structure for `tp_ppt`
-- -----------------------------
DROP TABLE IF EXISTS `tp_ppt`;
CREATE TABLE `tp_ppt` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `images` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL,
  `author` mediumint(8) NOT NULL,
  `hide` int(2) NOT NULL,
  `sort` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_ppt`
-- -----------------------------
INSERT INTO `tp_ppt` VALUES ('2', '首页幻灯1', '幻灯2', '/upload/system/20190501/09a4341bd8639e09fba365cba2186720.jpg', '1551662463', '0', '1', '2');
INSERT INTO `tp_ppt` VALUES ('3', '首页幻灯2', '', '/upload/system/20190501/c8d26447053bd80ebf27d4e4dfbb080d.jpg', '1554367533', '0', '1', '0');

-- -----------------------------
-- Table structure for `tp_recharge`
-- -----------------------------
DROP TABLE IF EXISTS `tp_recharge`;
CREATE TABLE `tp_recharge` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `order_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '充值单号',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `ctime` int(11) DEFAULT NULL COMMENT '充值时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `pay_code` varchar(20) DEFAULT NULL,
  `pay_name` varchar(80) DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) DEFAULT '0' COMMENT '充值状态0:待支付 1:充值成功 2:交易关闭',
  `buy_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP充值，1是',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_region`
-- -----------------------------
DROP TABLE IF EXISTS `tp_region`;
CREATE TABLE `tp_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`),
  KEY `region_name` (`region_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3412 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_region`
-- -----------------------------
INSERT INTO `tp_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `tp_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `tp_region` VALUES ('3', '1', '安徽', '1', '0');
INSERT INTO `tp_region` VALUES ('4', '1', '福建', '1', '0');
INSERT INTO `tp_region` VALUES ('5', '1', '甘肃', '1', '0');
INSERT INTO `tp_region` VALUES ('6', '1', '广东', '1', '0');
INSERT INTO `tp_region` VALUES ('7', '1', '广西', '1', '0');
INSERT INTO `tp_region` VALUES ('8', '1', '贵州', '1', '0');
INSERT INTO `tp_region` VALUES ('9', '1', '海南', '1', '0');
INSERT INTO `tp_region` VALUES ('10', '1', '河北', '1', '0');
INSERT INTO `tp_region` VALUES ('11', '1', '河南', '1', '0');
INSERT INTO `tp_region` VALUES ('12', '1', '黑龙江', '1', '0');
INSERT INTO `tp_region` VALUES ('13', '1', '湖北', '1', '0');
INSERT INTO `tp_region` VALUES ('14', '1', '湖南', '1', '0');
INSERT INTO `tp_region` VALUES ('15', '1', '吉林', '1', '0');
INSERT INTO `tp_region` VALUES ('16', '1', '江苏', '1', '0');
INSERT INTO `tp_region` VALUES ('17', '1', '江西', '1', '0');
INSERT INTO `tp_region` VALUES ('18', '1', '辽宁', '1', '0');
INSERT INTO `tp_region` VALUES ('19', '1', '内蒙古', '1', '0');
INSERT INTO `tp_region` VALUES ('20', '1', '宁夏', '1', '0');
INSERT INTO `tp_region` VALUES ('21', '1', '青海', '1', '0');
INSERT INTO `tp_region` VALUES ('22', '1', '山东', '1', '0');
INSERT INTO `tp_region` VALUES ('23', '1', '山西', '1', '0');
INSERT INTO `tp_region` VALUES ('24', '1', '陕西', '1', '0');
INSERT INTO `tp_region` VALUES ('25', '1', '上海', '1', '0');
INSERT INTO `tp_region` VALUES ('26', '1', '四川', '1', '0');
INSERT INTO `tp_region` VALUES ('27', '1', '天津', '1', '0');
INSERT INTO `tp_region` VALUES ('28', '1', '西藏', '1', '0');
INSERT INTO `tp_region` VALUES ('29', '1', '新疆', '1', '0');
INSERT INTO `tp_region` VALUES ('30', '1', '云南', '1', '0');
INSERT INTO `tp_region` VALUES ('31', '1', '浙江', '1', '0');
INSERT INTO `tp_region` VALUES ('32', '1', '重庆', '1', '0');
INSERT INTO `tp_region` VALUES ('33', '1', '香港', '1', '0');
INSERT INTO `tp_region` VALUES ('34', '1', '澳门', '1', '0');
INSERT INTO `tp_region` VALUES ('35', '1', '台湾', '1', '0');
INSERT INTO `tp_region` VALUES ('36', '3', '安庆', '2', '0');
INSERT INTO `tp_region` VALUES ('37', '3', '蚌埠', '2', '0');
INSERT INTO `tp_region` VALUES ('38', '3', '巢湖', '2', '0');
INSERT INTO `tp_region` VALUES ('39', '3', '池州', '2', '0');
INSERT INTO `tp_region` VALUES ('40', '3', '滁州', '2', '0');
INSERT INTO `tp_region` VALUES ('41', '3', '阜阳', '2', '0');
INSERT INTO `tp_region` VALUES ('42', '3', '淮北', '2', '0');
INSERT INTO `tp_region` VALUES ('43', '3', '淮南', '2', '0');
INSERT INTO `tp_region` VALUES ('44', '3', '黄山', '2', '0');
INSERT INTO `tp_region` VALUES ('45', '3', '六安', '2', '0');
INSERT INTO `tp_region` VALUES ('46', '3', '马鞍山', '2', '0');
INSERT INTO `tp_region` VALUES ('47', '3', '宿州', '2', '0');
INSERT INTO `tp_region` VALUES ('48', '3', '铜陵', '2', '0');
INSERT INTO `tp_region` VALUES ('49', '3', '芜湖', '2', '0');
INSERT INTO `tp_region` VALUES ('50', '3', '宣城', '2', '0');
INSERT INTO `tp_region` VALUES ('51', '3', '亳州', '2', '0');
INSERT INTO `tp_region` VALUES ('52', '2', '北京', '2', '0');
INSERT INTO `tp_region` VALUES ('53', '4', '福州', '2', '0');
INSERT INTO `tp_region` VALUES ('54', '4', '龙岩', '2', '0');
INSERT INTO `tp_region` VALUES ('55', '4', '南平', '2', '0');
INSERT INTO `tp_region` VALUES ('56', '4', '宁德', '2', '0');
INSERT INTO `tp_region` VALUES ('57', '4', '莆田', '2', '0');
INSERT INTO `tp_region` VALUES ('58', '4', '泉州', '2', '0');
INSERT INTO `tp_region` VALUES ('59', '4', '三明', '2', '0');
INSERT INTO `tp_region` VALUES ('60', '4', '厦门', '2', '0');
INSERT INTO `tp_region` VALUES ('61', '4', '漳州', '2', '0');
INSERT INTO `tp_region` VALUES ('62', '5', '兰州', '2', '0');
INSERT INTO `tp_region` VALUES ('63', '5', '白银', '2', '0');
INSERT INTO `tp_region` VALUES ('64', '5', '定西', '2', '0');
INSERT INTO `tp_region` VALUES ('65', '5', '甘南', '2', '0');
INSERT INTO `tp_region` VALUES ('66', '5', '嘉峪关', '2', '0');
INSERT INTO `tp_region` VALUES ('67', '5', '金昌', '2', '0');
INSERT INTO `tp_region` VALUES ('68', '5', '酒泉', '2', '0');
INSERT INTO `tp_region` VALUES ('69', '5', '临夏', '2', '0');
INSERT INTO `tp_region` VALUES ('70', '5', '陇南', '2', '0');
INSERT INTO `tp_region` VALUES ('71', '5', '平凉', '2', '0');
INSERT INTO `tp_region` VALUES ('72', '5', '庆阳', '2', '0');
INSERT INTO `tp_region` VALUES ('73', '5', '天水', '2', '0');
INSERT INTO `tp_region` VALUES ('74', '5', '武威', '2', '0');
INSERT INTO `tp_region` VALUES ('75', '5', '张掖', '2', '0');
INSERT INTO `tp_region` VALUES ('76', '6', '广州', '2', '0');
INSERT INTO `tp_region` VALUES ('77', '6', '深圳', '2', '0');
INSERT INTO `tp_region` VALUES ('78', '6', '潮州', '2', '0');
INSERT INTO `tp_region` VALUES ('79', '6', '东莞', '2', '0');
INSERT INTO `tp_region` VALUES ('80', '6', '佛山', '2', '0');
INSERT INTO `tp_region` VALUES ('81', '6', '河源', '2', '0');
INSERT INTO `tp_region` VALUES ('82', '6', '惠州', '2', '0');
INSERT INTO `tp_region` VALUES ('83', '6', '江门', '2', '0');
INSERT INTO `tp_region` VALUES ('84', '6', '揭阳', '2', '0');
INSERT INTO `tp_region` VALUES ('85', '6', '茂名', '2', '0');
INSERT INTO `tp_region` VALUES ('86', '6', '梅州', '2', '0');
INSERT INTO `tp_region` VALUES ('87', '6', '清远', '2', '0');
INSERT INTO `tp_region` VALUES ('88', '6', '汕头', '2', '0');
INSERT INTO `tp_region` VALUES ('89', '6', '汕尾', '2', '0');
INSERT INTO `tp_region` VALUES ('90', '6', '韶关', '2', '0');
INSERT INTO `tp_region` VALUES ('91', '6', '阳江', '2', '0');
INSERT INTO `tp_region` VALUES ('92', '6', '云浮', '2', '0');
INSERT INTO `tp_region` VALUES ('93', '6', '湛江', '2', '0');
INSERT INTO `tp_region` VALUES ('94', '6', '肇庆', '2', '0');
INSERT INTO `tp_region` VALUES ('95', '6', '中山', '2', '0');
INSERT INTO `tp_region` VALUES ('96', '6', '珠海', '2', '0');
INSERT INTO `tp_region` VALUES ('97', '7', '南宁', '2', '0');
INSERT INTO `tp_region` VALUES ('98', '7', '桂林', '2', '0');
INSERT INTO `tp_region` VALUES ('99', '7', '百色', '2', '0');
INSERT INTO `tp_region` VALUES ('100', '7', '北海', '2', '0');
INSERT INTO `tp_region` VALUES ('101', '7', '崇左', '2', '0');
INSERT INTO `tp_region` VALUES ('102', '7', '防城港', '2', '0');
INSERT INTO `tp_region` VALUES ('103', '7', '贵港', '2', '0');
INSERT INTO `tp_region` VALUES ('104', '7', '河池', '2', '0');
INSERT INTO `tp_region` VALUES ('105', '7', '贺州', '2', '0');
INSERT INTO `tp_region` VALUES ('106', '7', '来宾', '2', '0');
INSERT INTO `tp_region` VALUES ('107', '7', '柳州', '2', '0');
INSERT INTO `tp_region` VALUES ('108', '7', '钦州', '2', '0');
INSERT INTO `tp_region` VALUES ('109', '7', '梧州', '2', '0');
INSERT INTO `tp_region` VALUES ('110', '7', '玉林', '2', '0');
INSERT INTO `tp_region` VALUES ('111', '8', '贵阳', '2', '0');
INSERT INTO `tp_region` VALUES ('112', '8', '安顺', '2', '0');
INSERT INTO `tp_region` VALUES ('113', '8', '毕节', '2', '0');
INSERT INTO `tp_region` VALUES ('114', '8', '六盘水', '2', '0');
INSERT INTO `tp_region` VALUES ('115', '8', '黔东南', '2', '0');
INSERT INTO `tp_region` VALUES ('116', '8', '黔南', '2', '0');
INSERT INTO `tp_region` VALUES ('117', '8', '黔西南', '2', '0');
INSERT INTO `tp_region` VALUES ('118', '8', '铜仁', '2', '0');
INSERT INTO `tp_region` VALUES ('119', '8', '遵义', '2', '0');
INSERT INTO `tp_region` VALUES ('120', '9', '海口', '2', '0');
INSERT INTO `tp_region` VALUES ('121', '9', '三亚', '2', '0');
INSERT INTO `tp_region` VALUES ('122', '9', '白沙', '2', '0');
INSERT INTO `tp_region` VALUES ('123', '9', '保亭', '2', '0');
INSERT INTO `tp_region` VALUES ('124', '9', '昌江', '2', '0');
INSERT INTO `tp_region` VALUES ('125', '9', '澄迈县', '2', '0');
INSERT INTO `tp_region` VALUES ('126', '9', '定安县', '2', '0');
INSERT INTO `tp_region` VALUES ('127', '9', '东方', '2', '0');
INSERT INTO `tp_region` VALUES ('128', '9', '乐东', '2', '0');
INSERT INTO `tp_region` VALUES ('129', '9', '临高县', '2', '0');
INSERT INTO `tp_region` VALUES ('130', '9', '陵水', '2', '0');
INSERT INTO `tp_region` VALUES ('131', '9', '琼海', '2', '0');
INSERT INTO `tp_region` VALUES ('132', '9', '琼中', '2', '0');
INSERT INTO `tp_region` VALUES ('133', '9', '屯昌县', '2', '0');
INSERT INTO `tp_region` VALUES ('134', '9', '万宁', '2', '0');
INSERT INTO `tp_region` VALUES ('135', '9', '文昌', '2', '0');
INSERT INTO `tp_region` VALUES ('136', '9', '五指山', '2', '0');
INSERT INTO `tp_region` VALUES ('137', '9', '儋州', '2', '0');
INSERT INTO `tp_region` VALUES ('138', '10', '石家庄', '2', '0');
INSERT INTO `tp_region` VALUES ('139', '10', '保定', '2', '0');
INSERT INTO `tp_region` VALUES ('140', '10', '沧州', '2', '0');
INSERT INTO `tp_region` VALUES ('141', '10', '承德', '2', '0');
INSERT INTO `tp_region` VALUES ('142', '10', '邯郸', '2', '0');
INSERT INTO `tp_region` VALUES ('143', '10', '衡水', '2', '0');
INSERT INTO `tp_region` VALUES ('144', '10', '廊坊', '2', '0');
INSERT INTO `tp_region` VALUES ('145', '10', '秦皇岛', '2', '0');
INSERT INTO `tp_region` VALUES ('146', '10', '唐山', '2', '0');
INSERT INTO `tp_region` VALUES ('147', '10', '邢台', '2', '0');
INSERT INTO `tp_region` VALUES ('148', '10', '张家口', '2', '0');
INSERT INTO `tp_region` VALUES ('149', '11', '郑州', '2', '0');
INSERT INTO `tp_region` VALUES ('150', '11', '洛阳', '2', '0');
INSERT INTO `tp_region` VALUES ('151', '11', '开封', '2', '0');
INSERT INTO `tp_region` VALUES ('152', '11', '安阳', '2', '0');
INSERT INTO `tp_region` VALUES ('153', '11', '鹤壁', '2', '0');
INSERT INTO `tp_region` VALUES ('154', '11', '济源', '2', '0');
INSERT INTO `tp_region` VALUES ('155', '11', '焦作', '2', '0');
INSERT INTO `tp_region` VALUES ('156', '11', '南阳', '2', '0');
INSERT INTO `tp_region` VALUES ('157', '11', '平顶山', '2', '0');
INSERT INTO `tp_region` VALUES ('158', '11', '三门峡', '2', '0');
INSERT INTO `tp_region` VALUES ('159', '11', '商丘', '2', '0');
INSERT INTO `tp_region` VALUES ('160', '11', '新乡', '2', '0');
INSERT INTO `tp_region` VALUES ('161', '11', '信阳', '2', '0');
INSERT INTO `tp_region` VALUES ('162', '11', '许昌', '2', '0');
INSERT INTO `tp_region` VALUES ('163', '11', '周口', '2', '0');
INSERT INTO `tp_region` VALUES ('164', '11', '驻马店', '2', '0');
INSERT INTO `tp_region` VALUES ('165', '11', '漯河', '2', '0');
INSERT INTO `tp_region` VALUES ('166', '11', '濮阳', '2', '0');
INSERT INTO `tp_region` VALUES ('167', '12', '哈尔滨', '2', '0');
INSERT INTO `tp_region` VALUES ('168', '12', '大庆', '2', '0');
INSERT INTO `tp_region` VALUES ('169', '12', '大兴安岭', '2', '0');
INSERT INTO `tp_region` VALUES ('170', '12', '鹤岗', '2', '0');
INSERT INTO `tp_region` VALUES ('171', '12', '黑河', '2', '0');
INSERT INTO `tp_region` VALUES ('172', '12', '鸡西', '2', '0');
INSERT INTO `tp_region` VALUES ('173', '12', '佳木斯', '2', '0');
INSERT INTO `tp_region` VALUES ('174', '12', '牡丹江', '2', '0');
INSERT INTO `tp_region` VALUES ('175', '12', '七台河', '2', '0');
INSERT INTO `tp_region` VALUES ('176', '12', '齐齐哈尔', '2', '0');
INSERT INTO `tp_region` VALUES ('177', '12', '双鸭山', '2', '0');
INSERT INTO `tp_region` VALUES ('178', '12', '绥化', '2', '0');
INSERT INTO `tp_region` VALUES ('179', '12', '伊春', '2', '0');
INSERT INTO `tp_region` VALUES ('180', '13', '武汉', '2', '0');
INSERT INTO `tp_region` VALUES ('181', '13', '仙桃', '2', '0');
INSERT INTO `tp_region` VALUES ('182', '13', '鄂州', '2', '0');
INSERT INTO `tp_region` VALUES ('183', '13', '黄冈', '2', '0');
INSERT INTO `tp_region` VALUES ('184', '13', '黄石', '2', '0');
INSERT INTO `tp_region` VALUES ('185', '13', '荆门', '2', '0');
INSERT INTO `tp_region` VALUES ('186', '13', '荆州', '2', '0');
INSERT INTO `tp_region` VALUES ('187', '13', '潜江', '2', '0');
INSERT INTO `tp_region` VALUES ('188', '13', '神农架林区', '2', '0');
INSERT INTO `tp_region` VALUES ('189', '13', '十堰', '2', '0');
INSERT INTO `tp_region` VALUES ('190', '13', '随州', '2', '0');
INSERT INTO `tp_region` VALUES ('191', '13', '天门', '2', '0');
INSERT INTO `tp_region` VALUES ('192', '13', '咸宁', '2', '0');
INSERT INTO `tp_region` VALUES ('193', '13', '襄樊', '2', '0');
INSERT INTO `tp_region` VALUES ('194', '13', '孝感', '2', '0');
INSERT INTO `tp_region` VALUES ('195', '13', '宜昌', '2', '0');
INSERT INTO `tp_region` VALUES ('196', '13', '恩施', '2', '0');
INSERT INTO `tp_region` VALUES ('197', '14', '长沙', '2', '0');
INSERT INTO `tp_region` VALUES ('198', '14', '张家界', '2', '0');
INSERT INTO `tp_region` VALUES ('199', '14', '常德', '2', '0');
INSERT INTO `tp_region` VALUES ('200', '14', '郴州', '2', '0');
INSERT INTO `tp_region` VALUES ('201', '14', '衡阳', '2', '0');
INSERT INTO `tp_region` VALUES ('202', '14', '怀化', '2', '0');
INSERT INTO `tp_region` VALUES ('203', '14', '娄底', '2', '0');
INSERT INTO `tp_region` VALUES ('204', '14', '邵阳', '2', '0');
INSERT INTO `tp_region` VALUES ('205', '14', '湘潭', '2', '0');
INSERT INTO `tp_region` VALUES ('206', '14', '湘西', '2', '0');
INSERT INTO `tp_region` VALUES ('207', '14', '益阳', '2', '0');
INSERT INTO `tp_region` VALUES ('208', '14', '永州', '2', '0');
INSERT INTO `tp_region` VALUES ('209', '14', '岳阳', '2', '0');
INSERT INTO `tp_region` VALUES ('210', '14', '株洲', '2', '0');
INSERT INTO `tp_region` VALUES ('211', '15', '长春', '2', '0');
INSERT INTO `tp_region` VALUES ('212', '15', '吉林', '2', '0');
INSERT INTO `tp_region` VALUES ('213', '15', '白城', '2', '0');
INSERT INTO `tp_region` VALUES ('214', '15', '白山', '2', '0');
INSERT INTO `tp_region` VALUES ('215', '15', '辽源', '2', '0');
INSERT INTO `tp_region` VALUES ('216', '15', '四平', '2', '0');
INSERT INTO `tp_region` VALUES ('217', '15', '松原', '2', '0');
INSERT INTO `tp_region` VALUES ('218', '15', '通化', '2', '0');
INSERT INTO `tp_region` VALUES ('219', '15', '延边', '2', '0');
INSERT INTO `tp_region` VALUES ('220', '16', '南京', '2', '0');
INSERT INTO `tp_region` VALUES ('221', '16', '苏州', '2', '0');
INSERT INTO `tp_region` VALUES ('222', '16', '无锡', '2', '0');
INSERT INTO `tp_region` VALUES ('223', '16', '常州', '2', '0');
INSERT INTO `tp_region` VALUES ('224', '16', '淮安', '2', '0');
INSERT INTO `tp_region` VALUES ('225', '16', '连云港', '2', '0');
INSERT INTO `tp_region` VALUES ('226', '16', '南通', '2', '0');
INSERT INTO `tp_region` VALUES ('227', '16', '宿迁', '2', '0');
INSERT INTO `tp_region` VALUES ('228', '16', '泰州', '2', '0');
INSERT INTO `tp_region` VALUES ('229', '16', '徐州', '2', '0');
INSERT INTO `tp_region` VALUES ('230', '16', '盐城', '2', '0');
INSERT INTO `tp_region` VALUES ('231', '16', '扬州', '2', '0');
INSERT INTO `tp_region` VALUES ('232', '16', '镇江', '2', '0');
INSERT INTO `tp_region` VALUES ('233', '17', '南昌', '2', '0');
INSERT INTO `tp_region` VALUES ('234', '17', '抚州', '2', '0');
INSERT INTO `tp_region` VALUES ('235', '17', '赣州', '2', '0');
INSERT INTO `tp_region` VALUES ('236', '17', '吉安', '2', '0');
INSERT INTO `tp_region` VALUES ('237', '17', '景德镇', '2', '0');
INSERT INTO `tp_region` VALUES ('238', '17', '九江', '2', '0');
INSERT INTO `tp_region` VALUES ('239', '17', '萍乡', '2', '0');
INSERT INTO `tp_region` VALUES ('240', '17', '上饶', '2', '0');
INSERT INTO `tp_region` VALUES ('241', '17', '新余', '2', '0');
INSERT INTO `tp_region` VALUES ('242', '17', '宜春', '2', '0');
INSERT INTO `tp_region` VALUES ('243', '17', '鹰潭', '2', '0');
INSERT INTO `tp_region` VALUES ('244', '18', '沈阳', '2', '0');
INSERT INTO `tp_region` VALUES ('245', '18', '大连', '2', '0');
INSERT INTO `tp_region` VALUES ('246', '18', '鞍山', '2', '0');
INSERT INTO `tp_region` VALUES ('247', '18', '本溪', '2', '0');
INSERT INTO `tp_region` VALUES ('248', '18', '朝阳', '2', '0');
INSERT INTO `tp_region` VALUES ('249', '18', '丹东', '2', '0');
INSERT INTO `tp_region` VALUES ('250', '18', '抚顺', '2', '0');
INSERT INTO `tp_region` VALUES ('251', '18', '阜新', '2', '0');
INSERT INTO `tp_region` VALUES ('252', '18', '葫芦岛', '2', '0');
INSERT INTO `tp_region` VALUES ('253', '18', '锦州', '2', '0');
INSERT INTO `tp_region` VALUES ('254', '18', '辽阳', '2', '0');
INSERT INTO `tp_region` VALUES ('255', '18', '盘锦', '2', '0');
INSERT INTO `tp_region` VALUES ('256', '18', '铁岭', '2', '0');
INSERT INTO `tp_region` VALUES ('257', '18', '营口', '2', '0');
INSERT INTO `tp_region` VALUES ('258', '19', '呼和浩特', '2', '0');
INSERT INTO `tp_region` VALUES ('259', '19', '阿拉善盟', '2', '0');
INSERT INTO `tp_region` VALUES ('260', '19', '巴彦淖尔盟', '2', '0');
INSERT INTO `tp_region` VALUES ('261', '19', '包头', '2', '0');
INSERT INTO `tp_region` VALUES ('262', '19', '赤峰', '2', '0');
INSERT INTO `tp_region` VALUES ('263', '19', '鄂尔多斯', '2', '0');
INSERT INTO `tp_region` VALUES ('264', '19', '呼伦贝尔', '2', '0');
INSERT INTO `tp_region` VALUES ('265', '19', '通辽', '2', '0');
INSERT INTO `tp_region` VALUES ('266', '19', '乌海', '2', '0');
INSERT INTO `tp_region` VALUES ('267', '19', '乌兰察布市', '2', '0');
INSERT INTO `tp_region` VALUES ('268', '19', '锡林郭勒盟', '2', '0');
INSERT INTO `tp_region` VALUES ('269', '19', '兴安盟', '2', '0');
INSERT INTO `tp_region` VALUES ('270', '20', '银川', '2', '0');
INSERT INTO `tp_region` VALUES ('271', '20', '固原', '2', '0');
INSERT INTO `tp_region` VALUES ('272', '20', '石嘴山', '2', '0');
INSERT INTO `tp_region` VALUES ('273', '20', '吴忠', '2', '0');
INSERT INTO `tp_region` VALUES ('274', '20', '中卫', '2', '0');
INSERT INTO `tp_region` VALUES ('275', '21', '西宁', '2', '0');
INSERT INTO `tp_region` VALUES ('276', '21', '果洛', '2', '0');
INSERT INTO `tp_region` VALUES ('277', '21', '海北', '2', '0');
INSERT INTO `tp_region` VALUES ('278', '21', '海东', '2', '0');
INSERT INTO `tp_region` VALUES ('279', '21', '海南', '2', '0');
INSERT INTO `tp_region` VALUES ('280', '21', '海西', '2', '0');
INSERT INTO `tp_region` VALUES ('281', '21', '黄南', '2', '0');
INSERT INTO `tp_region` VALUES ('282', '21', '玉树', '2', '0');
INSERT INTO `tp_region` VALUES ('283', '22', '济南', '2', '0');
INSERT INTO `tp_region` VALUES ('284', '22', '青岛', '2', '0');
INSERT INTO `tp_region` VALUES ('285', '22', '滨州', '2', '0');
INSERT INTO `tp_region` VALUES ('286', '22', '德州', '2', '0');
INSERT INTO `tp_region` VALUES ('287', '22', '东营', '2', '0');
INSERT INTO `tp_region` VALUES ('288', '22', '菏泽', '2', '0');
INSERT INTO `tp_region` VALUES ('289', '22', '济宁', '2', '0');
INSERT INTO `tp_region` VALUES ('290', '22', '莱芜', '2', '0');
INSERT INTO `tp_region` VALUES ('291', '22', '聊城', '2', '0');
INSERT INTO `tp_region` VALUES ('292', '22', '临沂', '2', '0');
INSERT INTO `tp_region` VALUES ('293', '22', '日照', '2', '0');
INSERT INTO `tp_region` VALUES ('294', '22', '泰安', '2', '0');
INSERT INTO `tp_region` VALUES ('295', '22', '威海', '2', '0');
INSERT INTO `tp_region` VALUES ('296', '22', '潍坊', '2', '0');
INSERT INTO `tp_region` VALUES ('297', '22', '烟台', '2', '0');
INSERT INTO `tp_region` VALUES ('298', '22', '枣庄', '2', '0');
INSERT INTO `tp_region` VALUES ('299', '22', '淄博', '2', '0');
INSERT INTO `tp_region` VALUES ('300', '23', '太原', '2', '0');
INSERT INTO `tp_region` VALUES ('301', '23', '长治', '2', '0');
INSERT INTO `tp_region` VALUES ('302', '23', '大同', '2', '0');
INSERT INTO `tp_region` VALUES ('303', '23', '晋城', '2', '0');
INSERT INTO `tp_region` VALUES ('304', '23', '晋中', '2', '0');
INSERT INTO `tp_region` VALUES ('305', '23', '临汾', '2', '0');
INSERT INTO `tp_region` VALUES ('306', '23', '吕梁', '2', '0');
INSERT INTO `tp_region` VALUES ('307', '23', '朔州', '2', '0');
INSERT INTO `tp_region` VALUES ('308', '23', '忻州', '2', '0');
INSERT INTO `tp_region` VALUES ('309', '23', '阳泉', '2', '0');
INSERT INTO `tp_region` VALUES ('310', '23', '运城', '2', '0');
INSERT INTO `tp_region` VALUES ('311', '24', '西安', '2', '0');
INSERT INTO `tp_region` VALUES ('312', '24', '安康', '2', '0');
INSERT INTO `tp_region` VALUES ('313', '24', '宝鸡', '2', '0');
INSERT INTO `tp_region` VALUES ('314', '24', '汉中', '2', '0');
INSERT INTO `tp_region` VALUES ('315', '24', '商洛', '2', '0');
INSERT INTO `tp_region` VALUES ('316', '24', '铜川', '2', '0');
INSERT INTO `tp_region` VALUES ('317', '24', '渭南', '2', '0');
INSERT INTO `tp_region` VALUES ('318', '24', '咸阳', '2', '0');
INSERT INTO `tp_region` VALUES ('319', '24', '延安', '2', '0');
INSERT INTO `tp_region` VALUES ('320', '24', '榆林', '2', '0');
INSERT INTO `tp_region` VALUES ('321', '25', '上海', '2', '0');
INSERT INTO `tp_region` VALUES ('322', '26', '成都', '2', '0');
INSERT INTO `tp_region` VALUES ('323', '26', '绵阳', '2', '0');
INSERT INTO `tp_region` VALUES ('324', '26', '阿坝', '2', '0');
INSERT INTO `tp_region` VALUES ('325', '26', '巴中', '2', '0');
INSERT INTO `tp_region` VALUES ('326', '26', '达州', '2', '0');
INSERT INTO `tp_region` VALUES ('327', '26', '德阳', '2', '0');
INSERT INTO `tp_region` VALUES ('328', '26', '甘孜', '2', '0');
INSERT INTO `tp_region` VALUES ('329', '26', '广安', '2', '0');
INSERT INTO `tp_region` VALUES ('330', '26', '广元', '2', '0');
INSERT INTO `tp_region` VALUES ('331', '26', '乐山', '2', '0');
INSERT INTO `tp_region` VALUES ('332', '26', '凉山', '2', '0');
INSERT INTO `tp_region` VALUES ('333', '26', '眉山', '2', '0');
INSERT INTO `tp_region` VALUES ('334', '26', '南充', '2', '0');
INSERT INTO `tp_region` VALUES ('335', '26', '内江', '2', '0');
INSERT INTO `tp_region` VALUES ('336', '26', '攀枝花', '2', '0');
INSERT INTO `tp_region` VALUES ('337', '26', '遂宁', '2', '0');
INSERT INTO `tp_region` VALUES ('338', '26', '雅安', '2', '0');
INSERT INTO `tp_region` VALUES ('339', '26', '宜宾', '2', '0');
INSERT INTO `tp_region` VALUES ('340', '26', '资阳', '2', '0');
INSERT INTO `tp_region` VALUES ('341', '26', '自贡', '2', '0');
INSERT INTO `tp_region` VALUES ('342', '26', '泸州', '2', '0');
INSERT INTO `tp_region` VALUES ('343', '27', '天津', '2', '0');
INSERT INTO `tp_region` VALUES ('344', '28', '拉萨', '2', '0');
INSERT INTO `tp_region` VALUES ('345', '28', '阿里', '2', '0');
INSERT INTO `tp_region` VALUES ('346', '28', '昌都', '2', '0');
INSERT INTO `tp_region` VALUES ('347', '28', '林芝', '2', '0');
INSERT INTO `tp_region` VALUES ('348', '28', '那曲', '2', '0');
INSERT INTO `tp_region` VALUES ('349', '28', '日喀则', '2', '0');
INSERT INTO `tp_region` VALUES ('350', '28', '山南', '2', '0');
INSERT INTO `tp_region` VALUES ('351', '29', '乌鲁木齐', '2', '0');
INSERT INTO `tp_region` VALUES ('352', '29', '阿克苏', '2', '0');
INSERT INTO `tp_region` VALUES ('353', '29', '阿拉尔', '2', '0');
INSERT INTO `tp_region` VALUES ('354', '29', '巴音郭楞', '2', '0');
INSERT INTO `tp_region` VALUES ('355', '29', '博尔塔拉', '2', '0');
INSERT INTO `tp_region` VALUES ('356', '29', '昌吉', '2', '0');
INSERT INTO `tp_region` VALUES ('357', '29', '哈密', '2', '0');
INSERT INTO `tp_region` VALUES ('358', '29', '和田', '2', '0');
INSERT INTO `tp_region` VALUES ('359', '29', '喀什', '2', '0');
INSERT INTO `tp_region` VALUES ('360', '29', '克拉玛依', '2', '0');
INSERT INTO `tp_region` VALUES ('361', '29', '克孜勒苏', '2', '0');
INSERT INTO `tp_region` VALUES ('362', '29', '石河子', '2', '0');
INSERT INTO `tp_region` VALUES ('363', '29', '图木舒克', '2', '0');
INSERT INTO `tp_region` VALUES ('364', '29', '吐鲁番', '2', '0');
INSERT INTO `tp_region` VALUES ('365', '29', '五家渠', '2', '0');
INSERT INTO `tp_region` VALUES ('366', '29', '伊犁', '2', '0');
INSERT INTO `tp_region` VALUES ('367', '30', '昆明', '2', '0');
INSERT INTO `tp_region` VALUES ('368', '30', '怒江', '2', '0');
INSERT INTO `tp_region` VALUES ('369', '30', '普洱', '2', '0');
INSERT INTO `tp_region` VALUES ('370', '30', '丽江', '2', '0');
INSERT INTO `tp_region` VALUES ('371', '30', '保山', '2', '0');
INSERT INTO `tp_region` VALUES ('372', '30', '楚雄', '2', '0');
INSERT INTO `tp_region` VALUES ('373', '30', '大理', '2', '0');
INSERT INTO `tp_region` VALUES ('374', '30', '德宏', '2', '0');
INSERT INTO `tp_region` VALUES ('375', '30', '迪庆', '2', '0');
INSERT INTO `tp_region` VALUES ('376', '30', '红河', '2', '0');
INSERT INTO `tp_region` VALUES ('377', '30', '临沧', '2', '0');
INSERT INTO `tp_region` VALUES ('378', '30', '曲靖', '2', '0');
INSERT INTO `tp_region` VALUES ('379', '30', '文山', '2', '0');
INSERT INTO `tp_region` VALUES ('380', '30', '西双版纳', '2', '0');
INSERT INTO `tp_region` VALUES ('381', '30', '玉溪', '2', '0');
INSERT INTO `tp_region` VALUES ('382', '30', '昭通', '2', '0');
INSERT INTO `tp_region` VALUES ('383', '31', '杭州', '2', '0');
INSERT INTO `tp_region` VALUES ('384', '31', '湖州', '2', '0');
INSERT INTO `tp_region` VALUES ('385', '31', '嘉兴', '2', '0');
INSERT INTO `tp_region` VALUES ('386', '31', '金华', '2', '0');
INSERT INTO `tp_region` VALUES ('387', '31', '丽水', '2', '0');
INSERT INTO `tp_region` VALUES ('388', '31', '宁波', '2', '0');
INSERT INTO `tp_region` VALUES ('389', '31', '绍兴', '2', '0');
INSERT INTO `tp_region` VALUES ('390', '31', '台州', '2', '0');
INSERT INTO `tp_region` VALUES ('391', '31', '温州', '2', '0');
INSERT INTO `tp_region` VALUES ('392', '31', '舟山', '2', '0');
INSERT INTO `tp_region` VALUES ('393', '31', '衢州', '2', '0');
INSERT INTO `tp_region` VALUES ('394', '32', '重庆', '2', '0');
INSERT INTO `tp_region` VALUES ('395', '33', '香港', '2', '0');
INSERT INTO `tp_region` VALUES ('396', '34', '澳门', '2', '0');
INSERT INTO `tp_region` VALUES ('397', '35', '台湾', '2', '0');
INSERT INTO `tp_region` VALUES ('398', '36', '迎江区', '3', '0');
INSERT INTO `tp_region` VALUES ('399', '36', '大观区', '3', '0');
INSERT INTO `tp_region` VALUES ('400', '36', '宜秀区', '3', '0');
INSERT INTO `tp_region` VALUES ('401', '36', '桐城市', '3', '0');
INSERT INTO `tp_region` VALUES ('402', '36', '怀宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('403', '36', '枞阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('404', '36', '潜山县', '3', '0');
INSERT INTO `tp_region` VALUES ('405', '36', '太湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('406', '36', '宿松县', '3', '0');
INSERT INTO `tp_region` VALUES ('407', '36', '望江县', '3', '0');
INSERT INTO `tp_region` VALUES ('408', '36', '岳西县', '3', '0');
INSERT INTO `tp_region` VALUES ('409', '37', '中市区', '3', '0');
INSERT INTO `tp_region` VALUES ('410', '37', '东市区', '3', '0');
INSERT INTO `tp_region` VALUES ('411', '37', '西市区', '3', '0');
INSERT INTO `tp_region` VALUES ('412', '37', '郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('413', '37', '怀远县', '3', '0');
INSERT INTO `tp_region` VALUES ('414', '37', '五河县', '3', '0');
INSERT INTO `tp_region` VALUES ('415', '37', '固镇县', '3', '0');
INSERT INTO `tp_region` VALUES ('416', '38', '居巢区', '3', '0');
INSERT INTO `tp_region` VALUES ('417', '38', '庐江县', '3', '0');
INSERT INTO `tp_region` VALUES ('418', '38', '无为县', '3', '0');
INSERT INTO `tp_region` VALUES ('419', '38', '含山县', '3', '0');
INSERT INTO `tp_region` VALUES ('420', '38', '和县', '3', '0');
INSERT INTO `tp_region` VALUES ('421', '39', '贵池区', '3', '0');
INSERT INTO `tp_region` VALUES ('422', '39', '东至县', '3', '0');
INSERT INTO `tp_region` VALUES ('423', '39', '石台县', '3', '0');
INSERT INTO `tp_region` VALUES ('424', '39', '青阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('425', '40', '琅琊区', '3', '0');
INSERT INTO `tp_region` VALUES ('426', '40', '南谯区', '3', '0');
INSERT INTO `tp_region` VALUES ('427', '40', '天长市', '3', '0');
INSERT INTO `tp_region` VALUES ('428', '40', '明光市', '3', '0');
INSERT INTO `tp_region` VALUES ('429', '40', '来安县', '3', '0');
INSERT INTO `tp_region` VALUES ('430', '40', '全椒县', '3', '0');
INSERT INTO `tp_region` VALUES ('431', '40', '定远县', '3', '0');
INSERT INTO `tp_region` VALUES ('432', '40', '凤阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('433', '41', '蚌山区', '3', '0');
INSERT INTO `tp_region` VALUES ('434', '41', '龙子湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('435', '41', '禹会区', '3', '0');
INSERT INTO `tp_region` VALUES ('436', '41', '淮上区', '3', '0');
INSERT INTO `tp_region` VALUES ('437', '41', '颍州区', '3', '0');
INSERT INTO `tp_region` VALUES ('438', '41', '颍东区', '3', '0');
INSERT INTO `tp_region` VALUES ('439', '41', '颍泉区', '3', '0');
INSERT INTO `tp_region` VALUES ('440', '41', '界首市', '3', '0');
INSERT INTO `tp_region` VALUES ('441', '41', '临泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('442', '41', '太和县', '3', '0');
INSERT INTO `tp_region` VALUES ('443', '41', '阜南县', '3', '0');
INSERT INTO `tp_region` VALUES ('444', '41', '颖上县', '3', '0');
INSERT INTO `tp_region` VALUES ('445', '42', '相山区', '3', '0');
INSERT INTO `tp_region` VALUES ('446', '42', '杜集区', '3', '0');
INSERT INTO `tp_region` VALUES ('447', '42', '烈山区', '3', '0');
INSERT INTO `tp_region` VALUES ('448', '42', '濉溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('449', '43', '田家庵区', '3', '0');
INSERT INTO `tp_region` VALUES ('450', '43', '大通区', '3', '0');
INSERT INTO `tp_region` VALUES ('451', '43', '谢家集区', '3', '0');
INSERT INTO `tp_region` VALUES ('452', '43', '八公山区', '3', '0');
INSERT INTO `tp_region` VALUES ('453', '43', '潘集区', '3', '0');
INSERT INTO `tp_region` VALUES ('454', '43', '凤台县', '3', '0');
INSERT INTO `tp_region` VALUES ('455', '44', '屯溪区', '3', '0');
INSERT INTO `tp_region` VALUES ('456', '44', '黄山区', '3', '0');
INSERT INTO `tp_region` VALUES ('457', '44', '徽州区', '3', '0');
INSERT INTO `tp_region` VALUES ('458', '44', '歙县', '3', '0');
INSERT INTO `tp_region` VALUES ('459', '44', '休宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('460', '44', '黟县', '3', '0');
INSERT INTO `tp_region` VALUES ('461', '44', '祁门县', '3', '0');
INSERT INTO `tp_region` VALUES ('462', '45', '金安区', '3', '0');
INSERT INTO `tp_region` VALUES ('463', '45', '裕安区', '3', '0');
INSERT INTO `tp_region` VALUES ('464', '45', '寿县', '3', '0');
INSERT INTO `tp_region` VALUES ('465', '45', '霍邱县', '3', '0');
INSERT INTO `tp_region` VALUES ('466', '45', '舒城县', '3', '0');
INSERT INTO `tp_region` VALUES ('467', '45', '金寨县', '3', '0');
INSERT INTO `tp_region` VALUES ('468', '45', '霍山县', '3', '0');
INSERT INTO `tp_region` VALUES ('469', '46', '雨山区', '3', '0');
INSERT INTO `tp_region` VALUES ('470', '46', '花山区', '3', '0');
INSERT INTO `tp_region` VALUES ('471', '46', '金家庄区', '3', '0');
INSERT INTO `tp_region` VALUES ('472', '46', '当涂县', '3', '0');
INSERT INTO `tp_region` VALUES ('473', '47', '埇桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('474', '47', '砀山县', '3', '0');
INSERT INTO `tp_region` VALUES ('475', '47', '萧县', '3', '0');
INSERT INTO `tp_region` VALUES ('476', '47', '灵璧县', '3', '0');
INSERT INTO `tp_region` VALUES ('477', '47', '泗县', '3', '0');
INSERT INTO `tp_region` VALUES ('478', '48', '铜官山区', '3', '0');
INSERT INTO `tp_region` VALUES ('479', '48', '狮子山区', '3', '0');
INSERT INTO `tp_region` VALUES ('480', '48', '郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('481', '48', '铜陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('482', '49', '镜湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('483', '49', '弋江区', '3', '0');
INSERT INTO `tp_region` VALUES ('484', '49', '鸠江区', '3', '0');
INSERT INTO `tp_region` VALUES ('485', '49', '三山区', '3', '0');
INSERT INTO `tp_region` VALUES ('486', '49', '芜湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('487', '49', '繁昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('488', '49', '南陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('489', '50', '宣州区', '3', '0');
INSERT INTO `tp_region` VALUES ('490', '50', '宁国市', '3', '0');
INSERT INTO `tp_region` VALUES ('491', '50', '郎溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('492', '50', '广德县', '3', '0');
INSERT INTO `tp_region` VALUES ('493', '50', '泾县', '3', '0');
INSERT INTO `tp_region` VALUES ('494', '50', '绩溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('495', '50', '旌德县', '3', '0');
INSERT INTO `tp_region` VALUES ('496', '51', '涡阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('497', '51', '蒙城县', '3', '0');
INSERT INTO `tp_region` VALUES ('498', '51', '利辛县', '3', '0');
INSERT INTO `tp_region` VALUES ('499', '51', '谯城区', '3', '0');
INSERT INTO `tp_region` VALUES ('500', '52', '东城区', '3', '0');
INSERT INTO `tp_region` VALUES ('501', '52', '西城区', '3', '0');
INSERT INTO `tp_region` VALUES ('502', '52', '海淀区', '3', '0');
INSERT INTO `tp_region` VALUES ('503', '52', '朝阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('504', '52', '崇文区', '3', '0');
INSERT INTO `tp_region` VALUES ('505', '52', '宣武区', '3', '0');
INSERT INTO `tp_region` VALUES ('506', '52', '丰台区', '3', '0');
INSERT INTO `tp_region` VALUES ('507', '52', '石景山区', '3', '0');
INSERT INTO `tp_region` VALUES ('508', '52', '房山区', '3', '0');
INSERT INTO `tp_region` VALUES ('509', '52', '门头沟区', '3', '0');
INSERT INTO `tp_region` VALUES ('510', '52', '通州区', '3', '0');
INSERT INTO `tp_region` VALUES ('511', '52', '顺义区', '3', '0');
INSERT INTO `tp_region` VALUES ('512', '52', '昌平区', '3', '0');
INSERT INTO `tp_region` VALUES ('513', '52', '怀柔区', '3', '0');
INSERT INTO `tp_region` VALUES ('514', '52', '平谷区', '3', '0');
INSERT INTO `tp_region` VALUES ('515', '52', '大兴区', '3', '0');
INSERT INTO `tp_region` VALUES ('516', '52', '密云县', '3', '0');
INSERT INTO `tp_region` VALUES ('517', '52', '延庆县', '3', '0');
INSERT INTO `tp_region` VALUES ('518', '53', '鼓楼区', '3', '0');
INSERT INTO `tp_region` VALUES ('519', '53', '台江区', '3', '0');
INSERT INTO `tp_region` VALUES ('520', '53', '仓山区', '3', '0');
INSERT INTO `tp_region` VALUES ('521', '53', '马尾区', '3', '0');
INSERT INTO `tp_region` VALUES ('522', '53', '晋安区', '3', '0');
INSERT INTO `tp_region` VALUES ('523', '53', '福清市', '3', '0');
INSERT INTO `tp_region` VALUES ('524', '53', '长乐市', '3', '0');
INSERT INTO `tp_region` VALUES ('525', '53', '闽侯县', '3', '0');
INSERT INTO `tp_region` VALUES ('526', '53', '连江县', '3', '0');
INSERT INTO `tp_region` VALUES ('527', '53', '罗源县', '3', '0');
INSERT INTO `tp_region` VALUES ('528', '53', '闽清县', '3', '0');
INSERT INTO `tp_region` VALUES ('529', '53', '永泰县', '3', '0');
INSERT INTO `tp_region` VALUES ('530', '53', '平潭县', '3', '0');
INSERT INTO `tp_region` VALUES ('531', '54', '新罗区', '3', '0');
INSERT INTO `tp_region` VALUES ('532', '54', '漳平市', '3', '0');
INSERT INTO `tp_region` VALUES ('533', '54', '长汀县', '3', '0');
INSERT INTO `tp_region` VALUES ('534', '54', '永定县', '3', '0');
INSERT INTO `tp_region` VALUES ('535', '54', '上杭县', '3', '0');
INSERT INTO `tp_region` VALUES ('536', '54', '武平县', '3', '0');
INSERT INTO `tp_region` VALUES ('537', '54', '连城县', '3', '0');
INSERT INTO `tp_region` VALUES ('538', '55', '延平区', '3', '0');
INSERT INTO `tp_region` VALUES ('539', '55', '邵武市', '3', '0');
INSERT INTO `tp_region` VALUES ('540', '55', '武夷山市', '3', '0');
INSERT INTO `tp_region` VALUES ('541', '55', '建瓯市', '3', '0');
INSERT INTO `tp_region` VALUES ('542', '55', '建阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('543', '55', '顺昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('544', '55', '浦城县', '3', '0');
INSERT INTO `tp_region` VALUES ('545', '55', '光泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('546', '55', '松溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('547', '55', '政和县', '3', '0');
INSERT INTO `tp_region` VALUES ('548', '56', '蕉城区', '3', '0');
INSERT INTO `tp_region` VALUES ('549', '56', '福安市', '3', '0');
INSERT INTO `tp_region` VALUES ('550', '56', '福鼎市', '3', '0');
INSERT INTO `tp_region` VALUES ('551', '56', '霞浦县', '3', '0');
INSERT INTO `tp_region` VALUES ('552', '56', '古田县', '3', '0');
INSERT INTO `tp_region` VALUES ('553', '56', '屏南县', '3', '0');
INSERT INTO `tp_region` VALUES ('554', '56', '寿宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('555', '56', '周宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('556', '56', '柘荣县', '3', '0');
INSERT INTO `tp_region` VALUES ('557', '57', '城厢区', '3', '0');
INSERT INTO `tp_region` VALUES ('558', '57', '涵江区', '3', '0');
INSERT INTO `tp_region` VALUES ('559', '57', '荔城区', '3', '0');
INSERT INTO `tp_region` VALUES ('560', '57', '秀屿区', '3', '0');
INSERT INTO `tp_region` VALUES ('561', '57', '仙游县', '3', '0');
INSERT INTO `tp_region` VALUES ('562', '58', '鲤城区', '3', '0');
INSERT INTO `tp_region` VALUES ('563', '58', '丰泽区', '3', '0');
INSERT INTO `tp_region` VALUES ('564', '58', '洛江区', '3', '0');
INSERT INTO `tp_region` VALUES ('565', '58', '清濛开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('566', '58', '泉港区', '3', '0');
INSERT INTO `tp_region` VALUES ('567', '58', '石狮市', '3', '0');
INSERT INTO `tp_region` VALUES ('568', '58', '晋江市', '3', '0');
INSERT INTO `tp_region` VALUES ('569', '58', '南安市', '3', '0');
INSERT INTO `tp_region` VALUES ('570', '58', '惠安县', '3', '0');
INSERT INTO `tp_region` VALUES ('571', '58', '安溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('572', '58', '永春县', '3', '0');
INSERT INTO `tp_region` VALUES ('573', '58', '德化县', '3', '0');
INSERT INTO `tp_region` VALUES ('574', '58', '金门县', '3', '0');
INSERT INTO `tp_region` VALUES ('575', '59', '梅列区', '3', '0');
INSERT INTO `tp_region` VALUES ('576', '59', '三元区', '3', '0');
INSERT INTO `tp_region` VALUES ('577', '59', '永安市', '3', '0');
INSERT INTO `tp_region` VALUES ('578', '59', '明溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('579', '59', '清流县', '3', '0');
INSERT INTO `tp_region` VALUES ('580', '59', '宁化县', '3', '0');
INSERT INTO `tp_region` VALUES ('581', '59', '大田县', '3', '0');
INSERT INTO `tp_region` VALUES ('582', '59', '尤溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('583', '59', '沙县', '3', '0');
INSERT INTO `tp_region` VALUES ('584', '59', '将乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('585', '59', '泰宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('586', '59', '建宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('587', '60', '思明区', '3', '0');
INSERT INTO `tp_region` VALUES ('588', '60', '海沧区', '3', '0');
INSERT INTO `tp_region` VALUES ('589', '60', '湖里区', '3', '0');
INSERT INTO `tp_region` VALUES ('590', '60', '集美区', '3', '0');
INSERT INTO `tp_region` VALUES ('591', '60', '同安区', '3', '0');
INSERT INTO `tp_region` VALUES ('592', '60', '翔安区', '3', '0');
INSERT INTO `tp_region` VALUES ('593', '61', '芗城区', '3', '0');
INSERT INTO `tp_region` VALUES ('594', '61', '龙文区', '3', '0');
INSERT INTO `tp_region` VALUES ('595', '61', '龙海市', '3', '0');
INSERT INTO `tp_region` VALUES ('596', '61', '云霄县', '3', '0');
INSERT INTO `tp_region` VALUES ('597', '61', '漳浦县', '3', '0');
INSERT INTO `tp_region` VALUES ('598', '61', '诏安县', '3', '0');
INSERT INTO `tp_region` VALUES ('599', '61', '长泰县', '3', '0');
INSERT INTO `tp_region` VALUES ('600', '61', '东山县', '3', '0');
INSERT INTO `tp_region` VALUES ('601', '61', '南靖县', '3', '0');
INSERT INTO `tp_region` VALUES ('602', '61', '平和县', '3', '0');
INSERT INTO `tp_region` VALUES ('603', '61', '华安县', '3', '0');
INSERT INTO `tp_region` VALUES ('604', '62', '皋兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('605', '62', '城关区', '3', '0');
INSERT INTO `tp_region` VALUES ('606', '62', '七里河区', '3', '0');
INSERT INTO `tp_region` VALUES ('607', '62', '西固区', '3', '0');
INSERT INTO `tp_region` VALUES ('608', '62', '安宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('609', '62', '红古区', '3', '0');
INSERT INTO `tp_region` VALUES ('610', '62', '永登县', '3', '0');
INSERT INTO `tp_region` VALUES ('611', '62', '榆中县', '3', '0');
INSERT INTO `tp_region` VALUES ('612', '63', '白银区', '3', '0');
INSERT INTO `tp_region` VALUES ('613', '63', '平川区', '3', '0');
INSERT INTO `tp_region` VALUES ('614', '63', '会宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('615', '63', '景泰县', '3', '0');
INSERT INTO `tp_region` VALUES ('616', '63', '靖远县', '3', '0');
INSERT INTO `tp_region` VALUES ('617', '64', '临洮县', '3', '0');
INSERT INTO `tp_region` VALUES ('618', '64', '陇西县', '3', '0');
INSERT INTO `tp_region` VALUES ('619', '64', '通渭县', '3', '0');
INSERT INTO `tp_region` VALUES ('620', '64', '渭源县', '3', '0');
INSERT INTO `tp_region` VALUES ('621', '64', '漳县', '3', '0');
INSERT INTO `tp_region` VALUES ('622', '64', '岷县', '3', '0');
INSERT INTO `tp_region` VALUES ('623', '64', '安定区', '3', '0');
INSERT INTO `tp_region` VALUES ('624', '64', '安定区', '3', '0');
INSERT INTO `tp_region` VALUES ('625', '65', '合作市', '3', '0');
INSERT INTO `tp_region` VALUES ('626', '65', '临潭县', '3', '0');
INSERT INTO `tp_region` VALUES ('627', '65', '卓尼县', '3', '0');
INSERT INTO `tp_region` VALUES ('628', '65', '舟曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('629', '65', '迭部县', '3', '0');
INSERT INTO `tp_region` VALUES ('630', '65', '玛曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('631', '65', '碌曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('632', '65', '夏河县', '3', '0');
INSERT INTO `tp_region` VALUES ('633', '66', '嘉峪关市', '3', '0');
INSERT INTO `tp_region` VALUES ('634', '67', '金川区', '3', '0');
INSERT INTO `tp_region` VALUES ('635', '67', '永昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('636', '68', '肃州区', '3', '0');
INSERT INTO `tp_region` VALUES ('637', '68', '玉门市', '3', '0');
INSERT INTO `tp_region` VALUES ('638', '68', '敦煌市', '3', '0');
INSERT INTO `tp_region` VALUES ('639', '68', '金塔县', '3', '0');
INSERT INTO `tp_region` VALUES ('640', '68', '瓜州县', '3', '0');
INSERT INTO `tp_region` VALUES ('641', '68', '肃北', '3', '0');
INSERT INTO `tp_region` VALUES ('642', '68', '阿克塞', '3', '0');
INSERT INTO `tp_region` VALUES ('643', '69', '临夏市', '3', '0');
INSERT INTO `tp_region` VALUES ('644', '69', '临夏县', '3', '0');
INSERT INTO `tp_region` VALUES ('645', '69', '康乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('646', '69', '永靖县', '3', '0');
INSERT INTO `tp_region` VALUES ('647', '69', '广河县', '3', '0');
INSERT INTO `tp_region` VALUES ('648', '69', '和政县', '3', '0');
INSERT INTO `tp_region` VALUES ('649', '69', '东乡族自治县', '3', '0');
INSERT INTO `tp_region` VALUES ('650', '69', '积石山', '3', '0');
INSERT INTO `tp_region` VALUES ('651', '70', '成县', '3', '0');
INSERT INTO `tp_region` VALUES ('652', '70', '徽县', '3', '0');
INSERT INTO `tp_region` VALUES ('653', '70', '康县', '3', '0');
INSERT INTO `tp_region` VALUES ('654', '70', '礼县', '3', '0');
INSERT INTO `tp_region` VALUES ('655', '70', '两当县', '3', '0');
INSERT INTO `tp_region` VALUES ('656', '70', '文县', '3', '0');
INSERT INTO `tp_region` VALUES ('657', '70', '西和县', '3', '0');
INSERT INTO `tp_region` VALUES ('658', '70', '宕昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('659', '70', '武都区', '3', '0');
INSERT INTO `tp_region` VALUES ('660', '71', '崇信县', '3', '0');
INSERT INTO `tp_region` VALUES ('661', '71', '华亭县', '3', '0');
INSERT INTO `tp_region` VALUES ('662', '71', '静宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('663', '71', '灵台县', '3', '0');
INSERT INTO `tp_region` VALUES ('664', '71', '崆峒区', '3', '0');
INSERT INTO `tp_region` VALUES ('665', '71', '庄浪县', '3', '0');
INSERT INTO `tp_region` VALUES ('666', '71', '泾川县', '3', '0');
INSERT INTO `tp_region` VALUES ('667', '72', '合水县', '3', '0');
INSERT INTO `tp_region` VALUES ('668', '72', '华池县', '3', '0');
INSERT INTO `tp_region` VALUES ('669', '72', '环县', '3', '0');
INSERT INTO `tp_region` VALUES ('670', '72', '宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('671', '72', '庆城县', '3', '0');
INSERT INTO `tp_region` VALUES ('672', '72', '西峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('673', '72', '镇原县', '3', '0');
INSERT INTO `tp_region` VALUES ('674', '72', '正宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('675', '73', '甘谷县', '3', '0');
INSERT INTO `tp_region` VALUES ('676', '73', '秦安县', '3', '0');
INSERT INTO `tp_region` VALUES ('677', '73', '清水县', '3', '0');
INSERT INTO `tp_region` VALUES ('678', '73', '秦州区', '3', '0');
INSERT INTO `tp_region` VALUES ('679', '73', '麦积区', '3', '0');
INSERT INTO `tp_region` VALUES ('680', '73', '武山县', '3', '0');
INSERT INTO `tp_region` VALUES ('681', '73', '张家川', '3', '0');
INSERT INTO `tp_region` VALUES ('682', '74', '古浪县', '3', '0');
INSERT INTO `tp_region` VALUES ('683', '74', '民勤县', '3', '0');
INSERT INTO `tp_region` VALUES ('684', '74', '天祝', '3', '0');
INSERT INTO `tp_region` VALUES ('685', '74', '凉州区', '3', '0');
INSERT INTO `tp_region` VALUES ('686', '75', '高台县', '3', '0');
INSERT INTO `tp_region` VALUES ('687', '75', '临泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('688', '75', '民乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('689', '75', '山丹县', '3', '0');
INSERT INTO `tp_region` VALUES ('690', '75', '肃南', '3', '0');
INSERT INTO `tp_region` VALUES ('691', '75', '甘州区', '3', '0');
INSERT INTO `tp_region` VALUES ('692', '76', '从化市', '3', '0');
INSERT INTO `tp_region` VALUES ('693', '76', '天河区', '3', '0');
INSERT INTO `tp_region` VALUES ('694', '76', '东山区', '3', '0');
INSERT INTO `tp_region` VALUES ('695', '76', '白云区', '3', '0');
INSERT INTO `tp_region` VALUES ('696', '76', '海珠区', '3', '0');
INSERT INTO `tp_region` VALUES ('697', '76', '荔湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('698', '76', '越秀区', '3', '0');
INSERT INTO `tp_region` VALUES ('699', '76', '黄埔区', '3', '0');
INSERT INTO `tp_region` VALUES ('700', '76', '番禺区', '3', '0');
INSERT INTO `tp_region` VALUES ('701', '76', '花都区', '3', '0');
INSERT INTO `tp_region` VALUES ('702', '76', '增城区', '3', '0');
INSERT INTO `tp_region` VALUES ('703', '76', '从化区', '3', '0');
INSERT INTO `tp_region` VALUES ('704', '76', '市郊', '3', '0');
INSERT INTO `tp_region` VALUES ('705', '77', '福田区', '3', '0');
INSERT INTO `tp_region` VALUES ('706', '77', '罗湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('707', '77', '南山区', '3', '0');
INSERT INTO `tp_region` VALUES ('708', '77', '宝安区', '3', '0');
INSERT INTO `tp_region` VALUES ('709', '77', '龙岗区', '3', '0');
INSERT INTO `tp_region` VALUES ('710', '77', '盐田区', '3', '0');
INSERT INTO `tp_region` VALUES ('711', '78', '湘桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('712', '78', '潮安县', '3', '0');
INSERT INTO `tp_region` VALUES ('713', '78', '饶平县', '3', '0');
INSERT INTO `tp_region` VALUES ('714', '79', '南城区', '3', '0');
INSERT INTO `tp_region` VALUES ('715', '79', '东城区', '3', '0');
INSERT INTO `tp_region` VALUES ('716', '79', '万江区', '3', '0');
INSERT INTO `tp_region` VALUES ('717', '79', '莞城区', '3', '0');
INSERT INTO `tp_region` VALUES ('718', '79', '石龙镇', '3', '0');
INSERT INTO `tp_region` VALUES ('719', '79', '虎门镇', '3', '0');
INSERT INTO `tp_region` VALUES ('720', '79', '麻涌镇', '3', '0');
INSERT INTO `tp_region` VALUES ('721', '79', '道滘镇', '3', '0');
INSERT INTO `tp_region` VALUES ('722', '79', '石碣镇', '3', '0');
INSERT INTO `tp_region` VALUES ('723', '79', '沙田镇', '3', '0');
INSERT INTO `tp_region` VALUES ('724', '79', '望牛墩镇', '3', '0');
INSERT INTO `tp_region` VALUES ('725', '79', '洪梅镇', '3', '0');
INSERT INTO `tp_region` VALUES ('726', '79', '茶山镇', '3', '0');
INSERT INTO `tp_region` VALUES ('727', '79', '寮步镇', '3', '0');
INSERT INTO `tp_region` VALUES ('728', '79', '大岭山镇', '3', '0');
INSERT INTO `tp_region` VALUES ('729', '79', '大朗镇', '3', '0');
INSERT INTO `tp_region` VALUES ('730', '79', '黄江镇', '3', '0');
INSERT INTO `tp_region` VALUES ('731', '79', '樟木头', '3', '0');
INSERT INTO `tp_region` VALUES ('732', '79', '凤岗镇', '3', '0');
INSERT INTO `tp_region` VALUES ('733', '79', '塘厦镇', '3', '0');
INSERT INTO `tp_region` VALUES ('734', '79', '谢岗镇', '3', '0');
INSERT INTO `tp_region` VALUES ('735', '79', '厚街镇', '3', '0');
INSERT INTO `tp_region` VALUES ('736', '79', '清溪镇', '3', '0');
INSERT INTO `tp_region` VALUES ('737', '79', '常平镇', '3', '0');
INSERT INTO `tp_region` VALUES ('738', '79', '桥头镇', '3', '0');
INSERT INTO `tp_region` VALUES ('739', '79', '横沥镇', '3', '0');
INSERT INTO `tp_region` VALUES ('740', '79', '东坑镇', '3', '0');
INSERT INTO `tp_region` VALUES ('741', '79', '企石镇', '3', '0');
INSERT INTO `tp_region` VALUES ('742', '79', '石排镇', '3', '0');
INSERT INTO `tp_region` VALUES ('743', '79', '长安镇', '3', '0');
INSERT INTO `tp_region` VALUES ('744', '79', '中堂镇', '3', '0');
INSERT INTO `tp_region` VALUES ('745', '79', '高埗镇', '3', '0');
INSERT INTO `tp_region` VALUES ('746', '80', '禅城区', '3', '0');
INSERT INTO `tp_region` VALUES ('747', '80', '南海区', '3', '0');
INSERT INTO `tp_region` VALUES ('748', '80', '顺德区', '3', '0');
INSERT INTO `tp_region` VALUES ('749', '80', '三水区', '3', '0');
INSERT INTO `tp_region` VALUES ('750', '80', '高明区', '3', '0');
INSERT INTO `tp_region` VALUES ('751', '81', '东源县', '3', '0');
INSERT INTO `tp_region` VALUES ('752', '81', '和平县', '3', '0');
INSERT INTO `tp_region` VALUES ('753', '81', '源城区', '3', '0');
INSERT INTO `tp_region` VALUES ('754', '81', '连平县', '3', '0');
INSERT INTO `tp_region` VALUES ('755', '81', '龙川县', '3', '0');
INSERT INTO `tp_region` VALUES ('756', '81', '紫金县', '3', '0');
INSERT INTO `tp_region` VALUES ('757', '82', '惠阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('758', '82', '惠城区', '3', '0');
INSERT INTO `tp_region` VALUES ('759', '82', '大亚湾', '3', '0');
INSERT INTO `tp_region` VALUES ('760', '82', '博罗县', '3', '0');
INSERT INTO `tp_region` VALUES ('761', '82', '惠东县', '3', '0');
INSERT INTO `tp_region` VALUES ('762', '82', '龙门县', '3', '0');
INSERT INTO `tp_region` VALUES ('763', '83', '江海区', '3', '0');
INSERT INTO `tp_region` VALUES ('764', '83', '蓬江区', '3', '0');
INSERT INTO `tp_region` VALUES ('765', '83', '新会区', '3', '0');
INSERT INTO `tp_region` VALUES ('766', '83', '台山市', '3', '0');
INSERT INTO `tp_region` VALUES ('767', '83', '开平市', '3', '0');
INSERT INTO `tp_region` VALUES ('768', '83', '鹤山市', '3', '0');
INSERT INTO `tp_region` VALUES ('769', '83', '恩平市', '3', '0');
INSERT INTO `tp_region` VALUES ('770', '84', '榕城区', '3', '0');
INSERT INTO `tp_region` VALUES ('771', '84', '普宁市', '3', '0');
INSERT INTO `tp_region` VALUES ('772', '84', '揭东县', '3', '0');
INSERT INTO `tp_region` VALUES ('773', '84', '揭西县', '3', '0');
INSERT INTO `tp_region` VALUES ('774', '84', '惠来县', '3', '0');
INSERT INTO `tp_region` VALUES ('775', '85', '茂南区', '3', '0');
INSERT INTO `tp_region` VALUES ('776', '85', '茂港区', '3', '0');
INSERT INTO `tp_region` VALUES ('777', '85', '高州市', '3', '0');
INSERT INTO `tp_region` VALUES ('778', '85', '化州市', '3', '0');
INSERT INTO `tp_region` VALUES ('779', '85', '信宜市', '3', '0');
INSERT INTO `tp_region` VALUES ('780', '85', '电白县', '3', '0');
INSERT INTO `tp_region` VALUES ('781', '86', '梅县', '3', '0');
INSERT INTO `tp_region` VALUES ('782', '86', '梅江区', '3', '0');
INSERT INTO `tp_region` VALUES ('783', '86', '兴宁市', '3', '0');
INSERT INTO `tp_region` VALUES ('784', '86', '大埔县', '3', '0');
INSERT INTO `tp_region` VALUES ('785', '86', '丰顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('786', '86', '五华县', '3', '0');
INSERT INTO `tp_region` VALUES ('787', '86', '平远县', '3', '0');
INSERT INTO `tp_region` VALUES ('788', '86', '蕉岭县', '3', '0');
INSERT INTO `tp_region` VALUES ('789', '87', '清城区', '3', '0');
INSERT INTO `tp_region` VALUES ('790', '87', '英德市', '3', '0');
INSERT INTO `tp_region` VALUES ('791', '87', '连州市', '3', '0');
INSERT INTO `tp_region` VALUES ('792', '87', '佛冈县', '3', '0');
INSERT INTO `tp_region` VALUES ('793', '87', '阳山县', '3', '0');
INSERT INTO `tp_region` VALUES ('794', '87', '清新县', '3', '0');
INSERT INTO `tp_region` VALUES ('795', '87', '连山', '3', '0');
INSERT INTO `tp_region` VALUES ('796', '87', '连南', '3', '0');
INSERT INTO `tp_region` VALUES ('797', '88', '南澳县', '3', '0');
INSERT INTO `tp_region` VALUES ('798', '88', '潮阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('799', '88', '澄海区', '3', '0');
INSERT INTO `tp_region` VALUES ('800', '88', '龙湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('801', '88', '金平区', '3', '0');
INSERT INTO `tp_region` VALUES ('802', '88', '濠江区', '3', '0');
INSERT INTO `tp_region` VALUES ('803', '88', '潮南区', '3', '0');
INSERT INTO `tp_region` VALUES ('804', '89', '城区', '3', '0');
INSERT INTO `tp_region` VALUES ('805', '89', '陆丰市', '3', '0');
INSERT INTO `tp_region` VALUES ('806', '89', '海丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('807', '89', '陆河县', '3', '0');
INSERT INTO `tp_region` VALUES ('808', '90', '曲江县', '3', '0');
INSERT INTO `tp_region` VALUES ('809', '90', '浈江区', '3', '0');
INSERT INTO `tp_region` VALUES ('810', '90', '武江区', '3', '0');
INSERT INTO `tp_region` VALUES ('811', '90', '曲江区', '3', '0');
INSERT INTO `tp_region` VALUES ('812', '90', '乐昌市', '3', '0');
INSERT INTO `tp_region` VALUES ('813', '90', '南雄市', '3', '0');
INSERT INTO `tp_region` VALUES ('814', '90', '始兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('815', '90', '仁化县', '3', '0');
INSERT INTO `tp_region` VALUES ('816', '90', '翁源县', '3', '0');
INSERT INTO `tp_region` VALUES ('817', '90', '新丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('818', '90', '乳源', '3', '0');
INSERT INTO `tp_region` VALUES ('819', '91', '江城区', '3', '0');
INSERT INTO `tp_region` VALUES ('820', '91', '阳春市', '3', '0');
INSERT INTO `tp_region` VALUES ('821', '91', '阳西县', '3', '0');
INSERT INTO `tp_region` VALUES ('822', '91', '阳东县', '3', '0');
INSERT INTO `tp_region` VALUES ('823', '92', '云城区', '3', '0');
INSERT INTO `tp_region` VALUES ('824', '92', '罗定市', '3', '0');
INSERT INTO `tp_region` VALUES ('825', '92', '新兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('826', '92', '郁南县', '3', '0');
INSERT INTO `tp_region` VALUES ('827', '92', '云安县', '3', '0');
INSERT INTO `tp_region` VALUES ('828', '93', '赤坎区', '3', '0');
INSERT INTO `tp_region` VALUES ('829', '93', '霞山区', '3', '0');
INSERT INTO `tp_region` VALUES ('830', '93', '坡头区', '3', '0');
INSERT INTO `tp_region` VALUES ('831', '93', '麻章区', '3', '0');
INSERT INTO `tp_region` VALUES ('832', '93', '廉江市', '3', '0');
INSERT INTO `tp_region` VALUES ('833', '93', '雷州市', '3', '0');
INSERT INTO `tp_region` VALUES ('834', '93', '吴川市', '3', '0');
INSERT INTO `tp_region` VALUES ('835', '93', '遂溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('836', '93', '徐闻县', '3', '0');
INSERT INTO `tp_region` VALUES ('837', '94', '肇庆市', '3', '0');
INSERT INTO `tp_region` VALUES ('838', '94', '高要市', '3', '0');
INSERT INTO `tp_region` VALUES ('839', '94', '四会市', '3', '0');
INSERT INTO `tp_region` VALUES ('840', '94', '广宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('841', '94', '怀集县', '3', '0');
INSERT INTO `tp_region` VALUES ('842', '94', '封开县', '3', '0');
INSERT INTO `tp_region` VALUES ('843', '94', '德庆县', '3', '0');
INSERT INTO `tp_region` VALUES ('844', '95', '石岐街道', '3', '0');
INSERT INTO `tp_region` VALUES ('845', '95', '东区街道', '3', '0');
INSERT INTO `tp_region` VALUES ('846', '95', '西区街道', '3', '0');
INSERT INTO `tp_region` VALUES ('847', '95', '环城街道', '3', '0');
INSERT INTO `tp_region` VALUES ('848', '95', '中山港街道', '3', '0');
INSERT INTO `tp_region` VALUES ('849', '95', '五桂山街道', '3', '0');
INSERT INTO `tp_region` VALUES ('850', '96', '香洲区', '3', '0');
INSERT INTO `tp_region` VALUES ('851', '96', '斗门区', '3', '0');
INSERT INTO `tp_region` VALUES ('852', '96', '金湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('853', '97', '邕宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('854', '97', '青秀区', '3', '0');
INSERT INTO `tp_region` VALUES ('855', '97', '兴宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('856', '97', '良庆区', '3', '0');
INSERT INTO `tp_region` VALUES ('857', '97', '西乡塘区', '3', '0');
INSERT INTO `tp_region` VALUES ('858', '97', '江南区', '3', '0');
INSERT INTO `tp_region` VALUES ('859', '97', '武鸣县', '3', '0');
INSERT INTO `tp_region` VALUES ('860', '97', '隆安县', '3', '0');
INSERT INTO `tp_region` VALUES ('861', '97', '马山县', '3', '0');
INSERT INTO `tp_region` VALUES ('862', '97', '上林县', '3', '0');
INSERT INTO `tp_region` VALUES ('863', '97', '宾阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('864', '97', '横县', '3', '0');
INSERT INTO `tp_region` VALUES ('865', '98', '秀峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('866', '98', '叠彩区', '3', '0');
INSERT INTO `tp_region` VALUES ('867', '98', '象山区', '3', '0');
INSERT INTO `tp_region` VALUES ('868', '98', '七星区', '3', '0');
INSERT INTO `tp_region` VALUES ('869', '98', '雁山区', '3', '0');
INSERT INTO `tp_region` VALUES ('870', '98', '阳朔县', '3', '0');
INSERT INTO `tp_region` VALUES ('871', '98', '临桂县', '3', '0');
INSERT INTO `tp_region` VALUES ('872', '98', '灵川县', '3', '0');
INSERT INTO `tp_region` VALUES ('873', '98', '全州县', '3', '0');
INSERT INTO `tp_region` VALUES ('874', '98', '平乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('875', '98', '兴安县', '3', '0');
INSERT INTO `tp_region` VALUES ('876', '98', '灌阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('877', '98', '荔浦县', '3', '0');
INSERT INTO `tp_region` VALUES ('878', '98', '资源县', '3', '0');
INSERT INTO `tp_region` VALUES ('879', '98', '永福县', '3', '0');
INSERT INTO `tp_region` VALUES ('880', '98', '龙胜', '3', '0');
INSERT INTO `tp_region` VALUES ('881', '98', '恭城', '3', '0');
INSERT INTO `tp_region` VALUES ('882', '99', '右江区', '3', '0');
INSERT INTO `tp_region` VALUES ('883', '99', '凌云县', '3', '0');
INSERT INTO `tp_region` VALUES ('884', '99', '平果县', '3', '0');
INSERT INTO `tp_region` VALUES ('885', '99', '西林县', '3', '0');
INSERT INTO `tp_region` VALUES ('886', '99', '乐业县', '3', '0');
INSERT INTO `tp_region` VALUES ('887', '99', '德保县', '3', '0');
INSERT INTO `tp_region` VALUES ('888', '99', '田林县', '3', '0');
INSERT INTO `tp_region` VALUES ('889', '99', '田阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('890', '99', '靖西县', '3', '0');
INSERT INTO `tp_region` VALUES ('891', '99', '田东县', '3', '0');
INSERT INTO `tp_region` VALUES ('892', '99', '那坡县', '3', '0');
INSERT INTO `tp_region` VALUES ('893', '99', '隆林', '3', '0');
INSERT INTO `tp_region` VALUES ('894', '100', '海城区', '3', '0');
INSERT INTO `tp_region` VALUES ('895', '100', '银海区', '3', '0');
INSERT INTO `tp_region` VALUES ('896', '100', '铁山港区', '3', '0');
INSERT INTO `tp_region` VALUES ('897', '100', '合浦县', '3', '0');
INSERT INTO `tp_region` VALUES ('898', '101', '江州区', '3', '0');
INSERT INTO `tp_region` VALUES ('899', '101', '凭祥市', '3', '0');
INSERT INTO `tp_region` VALUES ('900', '101', '宁明县', '3', '0');
INSERT INTO `tp_region` VALUES ('901', '101', '扶绥县', '3', '0');
INSERT INTO `tp_region` VALUES ('902', '101', '龙州县', '3', '0');
INSERT INTO `tp_region` VALUES ('903', '101', '大新县', '3', '0');
INSERT INTO `tp_region` VALUES ('904', '101', '天等县', '3', '0');
INSERT INTO `tp_region` VALUES ('905', '102', '港口区', '3', '0');
INSERT INTO `tp_region` VALUES ('906', '102', '防城区', '3', '0');
INSERT INTO `tp_region` VALUES ('907', '102', '东兴市', '3', '0');
INSERT INTO `tp_region` VALUES ('908', '102', '上思县', '3', '0');
INSERT INTO `tp_region` VALUES ('909', '103', '港北区', '3', '0');
INSERT INTO `tp_region` VALUES ('910', '103', '港南区', '3', '0');
INSERT INTO `tp_region` VALUES ('911', '103', '覃塘区', '3', '0');
INSERT INTO `tp_region` VALUES ('912', '103', '桂平市', '3', '0');
INSERT INTO `tp_region` VALUES ('913', '103', '平南县', '3', '0');
INSERT INTO `tp_region` VALUES ('914', '104', '金城江区', '3', '0');
INSERT INTO `tp_region` VALUES ('915', '104', '宜州市', '3', '0');
INSERT INTO `tp_region` VALUES ('916', '104', '天峨县', '3', '0');
INSERT INTO `tp_region` VALUES ('917', '104', '凤山县', '3', '0');
INSERT INTO `tp_region` VALUES ('918', '104', '南丹县', '3', '0');
INSERT INTO `tp_region` VALUES ('919', '104', '东兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('920', '104', '都安', '3', '0');
INSERT INTO `tp_region` VALUES ('921', '104', '罗城', '3', '0');
INSERT INTO `tp_region` VALUES ('922', '104', '巴马', '3', '0');
INSERT INTO `tp_region` VALUES ('923', '104', '环江', '3', '0');
INSERT INTO `tp_region` VALUES ('924', '104', '大化', '3', '0');
INSERT INTO `tp_region` VALUES ('925', '105', '八步区', '3', '0');
INSERT INTO `tp_region` VALUES ('926', '105', '钟山县', '3', '0');
INSERT INTO `tp_region` VALUES ('927', '105', '昭平县', '3', '0');
INSERT INTO `tp_region` VALUES ('928', '105', '富川', '3', '0');
INSERT INTO `tp_region` VALUES ('929', '106', '兴宾区', '3', '0');
INSERT INTO `tp_region` VALUES ('930', '106', '合山市', '3', '0');
INSERT INTO `tp_region` VALUES ('931', '106', '象州县', '3', '0');
INSERT INTO `tp_region` VALUES ('932', '106', '武宣县', '3', '0');
INSERT INTO `tp_region` VALUES ('933', '106', '忻城县', '3', '0');
INSERT INTO `tp_region` VALUES ('934', '106', '金秀', '3', '0');
INSERT INTO `tp_region` VALUES ('935', '107', '城中区', '3', '0');
INSERT INTO `tp_region` VALUES ('936', '107', '鱼峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('937', '107', '柳北区', '3', '0');
INSERT INTO `tp_region` VALUES ('938', '107', '柳南区', '3', '0');
INSERT INTO `tp_region` VALUES ('939', '107', '柳江县', '3', '0');
INSERT INTO `tp_region` VALUES ('940', '107', '柳城县', '3', '0');
INSERT INTO `tp_region` VALUES ('941', '107', '鹿寨县', '3', '0');
INSERT INTO `tp_region` VALUES ('942', '107', '融安县', '3', '0');
INSERT INTO `tp_region` VALUES ('943', '107', '融水', '3', '0');
INSERT INTO `tp_region` VALUES ('944', '107', '三江', '3', '0');
INSERT INTO `tp_region` VALUES ('945', '108', '钦南区', '3', '0');
INSERT INTO `tp_region` VALUES ('946', '108', '钦北区', '3', '0');
INSERT INTO `tp_region` VALUES ('947', '108', '灵山县', '3', '0');
INSERT INTO `tp_region` VALUES ('948', '108', '浦北县', '3', '0');
INSERT INTO `tp_region` VALUES ('949', '109', '万秀区', '3', '0');
INSERT INTO `tp_region` VALUES ('950', '109', '蝶山区', '3', '0');
INSERT INTO `tp_region` VALUES ('951', '109', '长洲区', '3', '0');
INSERT INTO `tp_region` VALUES ('952', '109', '岑溪市', '3', '0');
INSERT INTO `tp_region` VALUES ('953', '109', '苍梧县', '3', '0');
INSERT INTO `tp_region` VALUES ('954', '109', '藤县', '3', '0');
INSERT INTO `tp_region` VALUES ('955', '109', '蒙山县', '3', '0');
INSERT INTO `tp_region` VALUES ('956', '110', '玉州区', '3', '0');
INSERT INTO `tp_region` VALUES ('957', '110', '北流市', '3', '0');
INSERT INTO `tp_region` VALUES ('958', '110', '容县', '3', '0');
INSERT INTO `tp_region` VALUES ('959', '110', '陆川县', '3', '0');
INSERT INTO `tp_region` VALUES ('960', '110', '博白县', '3', '0');
INSERT INTO `tp_region` VALUES ('961', '110', '兴业县', '3', '0');
INSERT INTO `tp_region` VALUES ('962', '111', '南明区', '3', '0');
INSERT INTO `tp_region` VALUES ('963', '111', '云岩区', '3', '0');
INSERT INTO `tp_region` VALUES ('964', '111', '花溪区', '3', '0');
INSERT INTO `tp_region` VALUES ('965', '111', '乌当区', '3', '0');
INSERT INTO `tp_region` VALUES ('966', '111', '白云区', '3', '0');
INSERT INTO `tp_region` VALUES ('967', '111', '小河区', '3', '0');
INSERT INTO `tp_region` VALUES ('968', '111', '金阳新区', '3', '0');
INSERT INTO `tp_region` VALUES ('969', '111', '新天园区', '3', '0');
INSERT INTO `tp_region` VALUES ('970', '111', '清镇市', '3', '0');
INSERT INTO `tp_region` VALUES ('971', '111', '开阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('972', '111', '修文县', '3', '0');
INSERT INTO `tp_region` VALUES ('973', '111', '息烽县', '3', '0');
INSERT INTO `tp_region` VALUES ('974', '112', '西秀区', '3', '0');
INSERT INTO `tp_region` VALUES ('975', '112', '关岭', '3', '0');
INSERT INTO `tp_region` VALUES ('976', '112', '镇宁', '3', '0');
INSERT INTO `tp_region` VALUES ('977', '112', '紫云', '3', '0');
INSERT INTO `tp_region` VALUES ('978', '112', '平坝县', '3', '0');
INSERT INTO `tp_region` VALUES ('979', '112', '普定县', '3', '0');
INSERT INTO `tp_region` VALUES ('980', '113', '毕节市', '3', '0');
INSERT INTO `tp_region` VALUES ('981', '113', '大方县', '3', '0');
INSERT INTO `tp_region` VALUES ('982', '113', '黔西县', '3', '0');
INSERT INTO `tp_region` VALUES ('983', '113', '金沙县', '3', '0');
INSERT INTO `tp_region` VALUES ('984', '113', '织金县', '3', '0');
INSERT INTO `tp_region` VALUES ('985', '113', '纳雍县', '3', '0');
INSERT INTO `tp_region` VALUES ('986', '113', '赫章县', '3', '0');
INSERT INTO `tp_region` VALUES ('987', '113', '威宁', '3', '0');
INSERT INTO `tp_region` VALUES ('988', '114', '钟山区', '3', '0');
INSERT INTO `tp_region` VALUES ('989', '114', '六枝特区', '3', '0');
INSERT INTO `tp_region` VALUES ('990', '114', '水城县', '3', '0');
INSERT INTO `tp_region` VALUES ('991', '114', '盘县', '3', '0');
INSERT INTO `tp_region` VALUES ('992', '115', '凯里市', '3', '0');
INSERT INTO `tp_region` VALUES ('993', '115', '黄平县', '3', '0');
INSERT INTO `tp_region` VALUES ('994', '115', '施秉县', '3', '0');
INSERT INTO `tp_region` VALUES ('995', '115', '三穗县', '3', '0');
INSERT INTO `tp_region` VALUES ('996', '115', '镇远县', '3', '0');
INSERT INTO `tp_region` VALUES ('997', '115', '岑巩县', '3', '0');
INSERT INTO `tp_region` VALUES ('998', '115', '天柱县', '3', '0');
INSERT INTO `tp_region` VALUES ('999', '115', '锦屏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1000', '115', '剑河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1001', '115', '台江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1002', '115', '黎平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1003', '115', '榕江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1004', '115', '从江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1005', '115', '雷山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1006', '115', '麻江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1007', '115', '丹寨县', '3', '0');
INSERT INTO `tp_region` VALUES ('1008', '116', '都匀市', '3', '0');
INSERT INTO `tp_region` VALUES ('1009', '116', '福泉市', '3', '0');
INSERT INTO `tp_region` VALUES ('1010', '116', '荔波县', '3', '0');
INSERT INTO `tp_region` VALUES ('1011', '116', '贵定县', '3', '0');
INSERT INTO `tp_region` VALUES ('1012', '116', '瓮安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1013', '116', '独山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1014', '116', '平塘县', '3', '0');
INSERT INTO `tp_region` VALUES ('1015', '116', '罗甸县', '3', '0');
INSERT INTO `tp_region` VALUES ('1016', '116', '长顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('1017', '116', '龙里县', '3', '0');
INSERT INTO `tp_region` VALUES ('1018', '116', '惠水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1019', '116', '三都', '3', '0');
INSERT INTO `tp_region` VALUES ('1020', '117', '兴义市', '3', '0');
INSERT INTO `tp_region` VALUES ('1021', '117', '兴仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1022', '117', '普安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1023', '117', '晴隆县', '3', '0');
INSERT INTO `tp_region` VALUES ('1024', '117', '贞丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1025', '117', '望谟县', '3', '0');
INSERT INTO `tp_region` VALUES ('1026', '117', '册亨县', '3', '0');
INSERT INTO `tp_region` VALUES ('1027', '117', '安龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('1028', '118', '铜仁市', '3', '0');
INSERT INTO `tp_region` VALUES ('1029', '118', '江口县', '3', '0');
INSERT INTO `tp_region` VALUES ('1030', '118', '石阡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1031', '118', '思南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1032', '118', '德江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1033', '118', '玉屏', '3', '0');
INSERT INTO `tp_region` VALUES ('1034', '118', '印江', '3', '0');
INSERT INTO `tp_region` VALUES ('1035', '118', '沿河', '3', '0');
INSERT INTO `tp_region` VALUES ('1036', '118', '松桃', '3', '0');
INSERT INTO `tp_region` VALUES ('1037', '118', '万山特区', '3', '0');
INSERT INTO `tp_region` VALUES ('1038', '119', '红花岗区', '3', '0');
INSERT INTO `tp_region` VALUES ('1039', '119', '务川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1040', '119', '道真县', '3', '0');
INSERT INTO `tp_region` VALUES ('1041', '119', '汇川区', '3', '0');
INSERT INTO `tp_region` VALUES ('1042', '119', '赤水市', '3', '0');
INSERT INTO `tp_region` VALUES ('1043', '119', '仁怀市', '3', '0');
INSERT INTO `tp_region` VALUES ('1044', '119', '遵义县', '3', '0');
INSERT INTO `tp_region` VALUES ('1045', '119', '桐梓县', '3', '0');
INSERT INTO `tp_region` VALUES ('1046', '119', '绥阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1047', '119', '正安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1048', '119', '凤冈县', '3', '0');
INSERT INTO `tp_region` VALUES ('1049', '119', '湄潭县', '3', '0');
INSERT INTO `tp_region` VALUES ('1050', '119', '余庆县', '3', '0');
INSERT INTO `tp_region` VALUES ('1051', '119', '习水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1052', '119', '道真', '3', '0');
INSERT INTO `tp_region` VALUES ('1053', '119', '务川', '3', '0');
INSERT INTO `tp_region` VALUES ('1054', '120', '秀英区', '3', '0');
INSERT INTO `tp_region` VALUES ('1055', '120', '龙华区', '3', '0');
INSERT INTO `tp_region` VALUES ('1056', '120', '琼山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1057', '120', '美兰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1058', '137', '市区', '3', '0');
INSERT INTO `tp_region` VALUES ('1059', '137', '洋浦开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1060', '137', '那大镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1061', '137', '王五镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1062', '137', '雅星镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1063', '137', '大成镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1064', '137', '中和镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1065', '137', '峨蔓镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1066', '137', '南丰镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1067', '137', '白马井镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1068', '137', '兰洋镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1069', '137', '和庆镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1070', '137', '海头镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1071', '137', '排浦镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1072', '137', '东成镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1073', '137', '光村镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1074', '137', '木棠镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1075', '137', '新州镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1076', '137', '三都镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1077', '137', '其他', '3', '0');
INSERT INTO `tp_region` VALUES ('1078', '138', '长安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1079', '138', '桥东区', '3', '0');
INSERT INTO `tp_region` VALUES ('1080', '138', '桥西区', '3', '0');
INSERT INTO `tp_region` VALUES ('1081', '138', '新华区', '3', '0');
INSERT INTO `tp_region` VALUES ('1082', '138', '裕华区', '3', '0');
INSERT INTO `tp_region` VALUES ('1083', '138', '井陉矿区', '3', '0');
INSERT INTO `tp_region` VALUES ('1084', '138', '高新区', '3', '0');
INSERT INTO `tp_region` VALUES ('1085', '138', '辛集市', '3', '0');
INSERT INTO `tp_region` VALUES ('1086', '138', '藁城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1087', '138', '晋州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1088', '138', '新乐市', '3', '0');
INSERT INTO `tp_region` VALUES ('1089', '138', '鹿泉市', '3', '0');
INSERT INTO `tp_region` VALUES ('1090', '138', '井陉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1091', '138', '正定县', '3', '0');
INSERT INTO `tp_region` VALUES ('1092', '138', '栾城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1093', '138', '行唐县', '3', '0');
INSERT INTO `tp_region` VALUES ('1094', '138', '灵寿县', '3', '0');
INSERT INTO `tp_region` VALUES ('1095', '138', '高邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('1096', '138', '深泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('1097', '138', '赞皇县', '3', '0');
INSERT INTO `tp_region` VALUES ('1098', '138', '无极县', '3', '0');
INSERT INTO `tp_region` VALUES ('1099', '138', '平山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1100', '138', '元氏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1101', '138', '赵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1102', '139', '新市区', '3', '0');
INSERT INTO `tp_region` VALUES ('1103', '139', '南市区', '3', '0');
INSERT INTO `tp_region` VALUES ('1104', '139', '北市区', '3', '0');
INSERT INTO `tp_region` VALUES ('1105', '139', '涿州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1106', '139', '定州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1107', '139', '安国市', '3', '0');
INSERT INTO `tp_region` VALUES ('1108', '139', '高碑店市', '3', '0');
INSERT INTO `tp_region` VALUES ('1109', '139', '满城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1110', '139', '清苑县', '3', '0');
INSERT INTO `tp_region` VALUES ('1111', '139', '涞水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1112', '139', '阜平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1113', '139', '徐水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1114', '139', '定兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('1115', '139', '唐县', '3', '0');
INSERT INTO `tp_region` VALUES ('1116', '139', '高阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1117', '139', '容城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1118', '139', '涞源县', '3', '0');
INSERT INTO `tp_region` VALUES ('1119', '139', '望都县', '3', '0');
INSERT INTO `tp_region` VALUES ('1120', '139', '安新县', '3', '0');
INSERT INTO `tp_region` VALUES ('1121', '139', '易县', '3', '0');
INSERT INTO `tp_region` VALUES ('1122', '139', '曲阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1123', '139', '蠡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1124', '139', '顺平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1125', '139', '博野县', '3', '0');
INSERT INTO `tp_region` VALUES ('1126', '139', '雄县', '3', '0');
INSERT INTO `tp_region` VALUES ('1127', '140', '运河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1128', '140', '新华区', '3', '0');
INSERT INTO `tp_region` VALUES ('1129', '140', '泊头市', '3', '0');
INSERT INTO `tp_region` VALUES ('1130', '140', '任丘市', '3', '0');
INSERT INTO `tp_region` VALUES ('1131', '140', '黄骅市', '3', '0');
INSERT INTO `tp_region` VALUES ('1132', '140', '河间市', '3', '0');
INSERT INTO `tp_region` VALUES ('1133', '140', '沧县', '3', '0');
INSERT INTO `tp_region` VALUES ('1134', '140', '青县', '3', '0');
INSERT INTO `tp_region` VALUES ('1135', '140', '东光县', '3', '0');
INSERT INTO `tp_region` VALUES ('1136', '140', '海兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('1137', '140', '盐山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1138', '140', '肃宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1139', '140', '南皮县', '3', '0');
INSERT INTO `tp_region` VALUES ('1140', '140', '吴桥县', '3', '0');
INSERT INTO `tp_region` VALUES ('1141', '140', '献县', '3', '0');
INSERT INTO `tp_region` VALUES ('1142', '140', '孟村', '3', '0');
INSERT INTO `tp_region` VALUES ('1143', '141', '双桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('1144', '141', '双滦区', '3', '0');
INSERT INTO `tp_region` VALUES ('1145', '141', '鹰手营子矿区', '3', '0');
INSERT INTO `tp_region` VALUES ('1146', '141', '承德县', '3', '0');
INSERT INTO `tp_region` VALUES ('1147', '141', '兴隆县', '3', '0');
INSERT INTO `tp_region` VALUES ('1148', '141', '平泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1149', '141', '滦平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1150', '141', '隆化县', '3', '0');
INSERT INTO `tp_region` VALUES ('1151', '141', '丰宁', '3', '0');
INSERT INTO `tp_region` VALUES ('1152', '141', '宽城', '3', '0');
INSERT INTO `tp_region` VALUES ('1153', '141', '围场', '3', '0');
INSERT INTO `tp_region` VALUES ('1154', '142', '从台区', '3', '0');
INSERT INTO `tp_region` VALUES ('1155', '142', '复兴区', '3', '0');
INSERT INTO `tp_region` VALUES ('1156', '142', '邯山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1157', '142', '峰峰矿区', '3', '0');
INSERT INTO `tp_region` VALUES ('1158', '142', '武安市', '3', '0');
INSERT INTO `tp_region` VALUES ('1159', '142', '邯郸县', '3', '0');
INSERT INTO `tp_region` VALUES ('1160', '142', '临漳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1161', '142', '成安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1162', '142', '大名县', '3', '0');
INSERT INTO `tp_region` VALUES ('1163', '142', '涉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1164', '142', '磁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1165', '142', '肥乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1166', '142', '永年县', '3', '0');
INSERT INTO `tp_region` VALUES ('1167', '142', '邱县', '3', '0');
INSERT INTO `tp_region` VALUES ('1168', '142', '鸡泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('1169', '142', '广平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1170', '142', '馆陶县', '3', '0');
INSERT INTO `tp_region` VALUES ('1171', '142', '魏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1172', '142', '曲周县', '3', '0');
INSERT INTO `tp_region` VALUES ('1173', '143', '桃城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1174', '143', '冀州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1175', '143', '深州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1176', '143', '枣强县', '3', '0');
INSERT INTO `tp_region` VALUES ('1177', '143', '武邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('1178', '143', '武强县', '3', '0');
INSERT INTO `tp_region` VALUES ('1179', '143', '饶阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1180', '143', '安平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1181', '143', '故城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1182', '143', '景县', '3', '0');
INSERT INTO `tp_region` VALUES ('1183', '143', '阜城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1184', '144', '安次区', '3', '0');
INSERT INTO `tp_region` VALUES ('1185', '144', '广阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1186', '144', '霸州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1187', '144', '三河市', '3', '0');
INSERT INTO `tp_region` VALUES ('1188', '144', '固安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1189', '144', '永清县', '3', '0');
INSERT INTO `tp_region` VALUES ('1190', '144', '香河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1191', '144', '大城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1192', '144', '文安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1193', '144', '大厂', '3', '0');
INSERT INTO `tp_region` VALUES ('1194', '145', '海港区', '3', '0');
INSERT INTO `tp_region` VALUES ('1195', '145', '山海关区', '3', '0');
INSERT INTO `tp_region` VALUES ('1196', '145', '北戴河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1197', '145', '昌黎县', '3', '0');
INSERT INTO `tp_region` VALUES ('1198', '145', '抚宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1199', '145', '卢龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('1200', '145', '青龙', '3', '0');
INSERT INTO `tp_region` VALUES ('1201', '146', '路北区', '3', '0');
INSERT INTO `tp_region` VALUES ('1202', '146', '路南区', '3', '0');
INSERT INTO `tp_region` VALUES ('1203', '146', '古冶区', '3', '0');
INSERT INTO `tp_region` VALUES ('1204', '146', '开平区', '3', '0');
INSERT INTO `tp_region` VALUES ('1205', '146', '丰南区', '3', '0');
INSERT INTO `tp_region` VALUES ('1206', '146', '丰润区', '3', '0');
INSERT INTO `tp_region` VALUES ('1207', '146', '遵化市', '3', '0');
INSERT INTO `tp_region` VALUES ('1208', '146', '迁安市', '3', '0');
INSERT INTO `tp_region` VALUES ('1209', '146', '滦县', '3', '0');
INSERT INTO `tp_region` VALUES ('1210', '146', '滦南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1211', '146', '乐亭县', '3', '0');
INSERT INTO `tp_region` VALUES ('1212', '146', '迁西县', '3', '0');
INSERT INTO `tp_region` VALUES ('1213', '146', '玉田县', '3', '0');
INSERT INTO `tp_region` VALUES ('1214', '146', '唐海县', '3', '0');
INSERT INTO `tp_region` VALUES ('1215', '147', '桥东区', '3', '0');
INSERT INTO `tp_region` VALUES ('1216', '147', '桥西区', '3', '0');
INSERT INTO `tp_region` VALUES ('1217', '147', '南宫市', '3', '0');
INSERT INTO `tp_region` VALUES ('1218', '147', '沙河市', '3', '0');
INSERT INTO `tp_region` VALUES ('1219', '147', '邢台县', '3', '0');
INSERT INTO `tp_region` VALUES ('1220', '147', '临城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1221', '147', '内丘县', '3', '0');
INSERT INTO `tp_region` VALUES ('1222', '147', '柏乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1223', '147', '隆尧县', '3', '0');
INSERT INTO `tp_region` VALUES ('1224', '147', '任县', '3', '0');
INSERT INTO `tp_region` VALUES ('1225', '147', '南和县', '3', '0');
INSERT INTO `tp_region` VALUES ('1226', '147', '宁晋县', '3', '0');
INSERT INTO `tp_region` VALUES ('1227', '147', '巨鹿县', '3', '0');
INSERT INTO `tp_region` VALUES ('1228', '147', '新河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1229', '147', '广宗县', '3', '0');
INSERT INTO `tp_region` VALUES ('1230', '147', '平乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1231', '147', '威县', '3', '0');
INSERT INTO `tp_region` VALUES ('1232', '147', '清河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1233', '147', '临西县', '3', '0');
INSERT INTO `tp_region` VALUES ('1234', '148', '桥西区', '3', '0');
INSERT INTO `tp_region` VALUES ('1235', '148', '桥东区', '3', '0');
INSERT INTO `tp_region` VALUES ('1236', '148', '宣化区', '3', '0');
INSERT INTO `tp_region` VALUES ('1237', '148', '下花园区', '3', '0');
INSERT INTO `tp_region` VALUES ('1238', '148', '宣化县', '3', '0');
INSERT INTO `tp_region` VALUES ('1239', '148', '张北县', '3', '0');
INSERT INTO `tp_region` VALUES ('1240', '148', '康保县', '3', '0');
INSERT INTO `tp_region` VALUES ('1241', '148', '沽源县', '3', '0');
INSERT INTO `tp_region` VALUES ('1242', '148', '尚义县', '3', '0');
INSERT INTO `tp_region` VALUES ('1243', '148', '蔚县', '3', '0');
INSERT INTO `tp_region` VALUES ('1244', '148', '阳原县', '3', '0');
INSERT INTO `tp_region` VALUES ('1245', '148', '怀安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1246', '148', '万全县', '3', '0');
INSERT INTO `tp_region` VALUES ('1247', '148', '怀来县', '3', '0');
INSERT INTO `tp_region` VALUES ('1248', '148', '涿鹿县', '3', '0');
INSERT INTO `tp_region` VALUES ('1249', '148', '赤城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1250', '148', '崇礼县', '3', '0');
INSERT INTO `tp_region` VALUES ('1251', '149', '金水区', '3', '0');
INSERT INTO `tp_region` VALUES ('1252', '149', '邙山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1253', '149', '二七区', '3', '0');
INSERT INTO `tp_region` VALUES ('1254', '149', '管城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1255', '149', '中原区', '3', '0');
INSERT INTO `tp_region` VALUES ('1256', '149', '上街区', '3', '0');
INSERT INTO `tp_region` VALUES ('1257', '149', '惠济区', '3', '0');
INSERT INTO `tp_region` VALUES ('1258', '149', '郑东新区', '3', '0');
INSERT INTO `tp_region` VALUES ('1259', '149', '经济技术开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1260', '149', '高新开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1261', '149', '出口加工区', '3', '0');
INSERT INTO `tp_region` VALUES ('1262', '149', '巩义市', '3', '0');
INSERT INTO `tp_region` VALUES ('1263', '149', '荥阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1264', '149', '新密市', '3', '0');
INSERT INTO `tp_region` VALUES ('1265', '149', '新郑市', '3', '0');
INSERT INTO `tp_region` VALUES ('1266', '149', '登封市', '3', '0');
INSERT INTO `tp_region` VALUES ('1267', '149', '中牟县', '3', '0');
INSERT INTO `tp_region` VALUES ('1268', '150', '西工区', '3', '0');
INSERT INTO `tp_region` VALUES ('1269', '150', '老城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1270', '150', '涧西区', '3', '0');
INSERT INTO `tp_region` VALUES ('1271', '150', '瀍河回族区', '3', '0');
INSERT INTO `tp_region` VALUES ('1272', '150', '洛龙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1273', '150', '吉利区', '3', '0');
INSERT INTO `tp_region` VALUES ('1274', '150', '偃师市', '3', '0');
INSERT INTO `tp_region` VALUES ('1275', '150', '孟津县', '3', '0');
INSERT INTO `tp_region` VALUES ('1276', '150', '新安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1277', '150', '栾川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1278', '150', '嵩县', '3', '0');
INSERT INTO `tp_region` VALUES ('1279', '150', '汝阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1280', '150', '宜阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1281', '150', '洛宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1282', '150', '伊川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1283', '151', '鼓楼区', '3', '0');
INSERT INTO `tp_region` VALUES ('1284', '151', '龙亭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1285', '151', '顺河回族区', '3', '0');
INSERT INTO `tp_region` VALUES ('1286', '151', '金明区', '3', '0');
INSERT INTO `tp_region` VALUES ('1287', '151', '禹王台区', '3', '0');
INSERT INTO `tp_region` VALUES ('1288', '151', '杞县', '3', '0');
INSERT INTO `tp_region` VALUES ('1289', '151', '通许县', '3', '0');
INSERT INTO `tp_region` VALUES ('1290', '151', '尉氏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1291', '151', '开封县', '3', '0');
INSERT INTO `tp_region` VALUES ('1292', '151', '兰考县', '3', '0');
INSERT INTO `tp_region` VALUES ('1293', '152', '北关区', '3', '0');
INSERT INTO `tp_region` VALUES ('1294', '152', '文峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1295', '152', '殷都区', '3', '0');
INSERT INTO `tp_region` VALUES ('1296', '152', '龙安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1297', '152', '林州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1298', '152', '安阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1299', '152', '汤阴县', '3', '0');
INSERT INTO `tp_region` VALUES ('1300', '152', '滑县', '3', '0');
INSERT INTO `tp_region` VALUES ('1301', '152', '内黄县', '3', '0');
INSERT INTO `tp_region` VALUES ('1302', '153', '淇滨区', '3', '0');
INSERT INTO `tp_region` VALUES ('1303', '153', '山城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1304', '153', '鹤山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1305', '153', '浚县', '3', '0');
INSERT INTO `tp_region` VALUES ('1306', '153', '淇县', '3', '0');
INSERT INTO `tp_region` VALUES ('1307', '154', '济源市', '3', '0');
INSERT INTO `tp_region` VALUES ('1308', '155', '解放区', '3', '0');
INSERT INTO `tp_region` VALUES ('1309', '155', '中站区', '3', '0');
INSERT INTO `tp_region` VALUES ('1310', '155', '马村区', '3', '0');
INSERT INTO `tp_region` VALUES ('1311', '155', '山阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1312', '155', '沁阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1313', '155', '孟州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1314', '155', '修武县', '3', '0');
INSERT INTO `tp_region` VALUES ('1315', '155', '博爱县', '3', '0');
INSERT INTO `tp_region` VALUES ('1316', '155', '武陟县', '3', '0');
INSERT INTO `tp_region` VALUES ('1317', '155', '温县', '3', '0');
INSERT INTO `tp_region` VALUES ('1318', '156', '卧龙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1319', '156', '宛城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1320', '156', '邓州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1321', '156', '南召县', '3', '0');
INSERT INTO `tp_region` VALUES ('1322', '156', '方城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1323', '156', '西峡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1324', '156', '镇平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1325', '156', '内乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1326', '156', '淅川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1327', '156', '社旗县', '3', '0');
INSERT INTO `tp_region` VALUES ('1328', '156', '唐河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1329', '156', '新野县', '3', '0');
INSERT INTO `tp_region` VALUES ('1330', '156', '桐柏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1331', '157', '新华区', '3', '0');
INSERT INTO `tp_region` VALUES ('1332', '157', '卫东区', '3', '0');
INSERT INTO `tp_region` VALUES ('1333', '157', '湛河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1334', '157', '石龙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1335', '157', '舞钢市', '3', '0');
INSERT INTO `tp_region` VALUES ('1336', '157', '汝州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1337', '157', '宝丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1338', '157', '叶县', '3', '0');
INSERT INTO `tp_region` VALUES ('1339', '157', '鲁山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1340', '157', '郏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1341', '158', '湖滨区', '3', '0');
INSERT INTO `tp_region` VALUES ('1342', '158', '义马市', '3', '0');
INSERT INTO `tp_region` VALUES ('1343', '158', '灵宝市', '3', '0');
INSERT INTO `tp_region` VALUES ('1344', '158', '渑池县', '3', '0');
INSERT INTO `tp_region` VALUES ('1345', '158', '陕县', '3', '0');
INSERT INTO `tp_region` VALUES ('1346', '158', '卢氏县', '3', '0');
INSERT INTO `tp_region` VALUES ('1347', '159', '梁园区', '3', '0');
INSERT INTO `tp_region` VALUES ('1348', '159', '睢阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1349', '159', '永城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1350', '159', '民权县', '3', '0');
INSERT INTO `tp_region` VALUES ('1351', '159', '睢县', '3', '0');
INSERT INTO `tp_region` VALUES ('1352', '159', '宁陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1353', '159', '虞城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1354', '159', '柘城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1355', '159', '夏邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('1356', '160', '卫滨区', '3', '0');
INSERT INTO `tp_region` VALUES ('1357', '160', '红旗区', '3', '0');
INSERT INTO `tp_region` VALUES ('1358', '160', '凤泉区', '3', '0');
INSERT INTO `tp_region` VALUES ('1359', '160', '牧野区', '3', '0');
INSERT INTO `tp_region` VALUES ('1360', '160', '卫辉市', '3', '0');
INSERT INTO `tp_region` VALUES ('1361', '160', '辉县市', '3', '0');
INSERT INTO `tp_region` VALUES ('1362', '160', '新乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1363', '160', '获嘉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1364', '160', '原阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1365', '160', '延津县', '3', '0');
INSERT INTO `tp_region` VALUES ('1366', '160', '封丘县', '3', '0');
INSERT INTO `tp_region` VALUES ('1367', '160', '长垣县', '3', '0');
INSERT INTO `tp_region` VALUES ('1368', '161', '浉河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1369', '161', '平桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('1370', '161', '罗山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1371', '161', '光山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1372', '161', '新县', '3', '0');
INSERT INTO `tp_region` VALUES ('1373', '161', '商城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1374', '161', '固始县', '3', '0');
INSERT INTO `tp_region` VALUES ('1375', '161', '潢川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1376', '161', '淮滨县', '3', '0');
INSERT INTO `tp_region` VALUES ('1377', '161', '息县', '3', '0');
INSERT INTO `tp_region` VALUES ('1378', '162', '魏都区', '3', '0');
INSERT INTO `tp_region` VALUES ('1379', '162', '禹州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1380', '162', '长葛市', '3', '0');
INSERT INTO `tp_region` VALUES ('1381', '162', '许昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1382', '162', '鄢陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1383', '162', '襄城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1384', '163', '川汇区', '3', '0');
INSERT INTO `tp_region` VALUES ('1385', '163', '项城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1386', '163', '扶沟县', '3', '0');
INSERT INTO `tp_region` VALUES ('1387', '163', '西华县', '3', '0');
INSERT INTO `tp_region` VALUES ('1388', '163', '商水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1389', '163', '沈丘县', '3', '0');
INSERT INTO `tp_region` VALUES ('1390', '163', '郸城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1391', '163', '淮阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1392', '163', '太康县', '3', '0');
INSERT INTO `tp_region` VALUES ('1393', '163', '鹿邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('1394', '164', '驿城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1395', '164', '西平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1396', '164', '上蔡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1397', '164', '平舆县', '3', '0');
INSERT INTO `tp_region` VALUES ('1398', '164', '正阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1399', '164', '确山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1400', '164', '泌阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1401', '164', '汝南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1402', '164', '遂平县', '3', '0');
INSERT INTO `tp_region` VALUES ('1403', '164', '新蔡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1404', '165', '郾城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1405', '165', '源汇区', '3', '0');
INSERT INTO `tp_region` VALUES ('1406', '165', '召陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1407', '165', '舞阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1408', '165', '临颍县', '3', '0');
INSERT INTO `tp_region` VALUES ('1409', '166', '华龙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1410', '166', '清丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1411', '166', '南乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('1412', '166', '范县', '3', '0');
INSERT INTO `tp_region` VALUES ('1413', '166', '台前县', '3', '0');
INSERT INTO `tp_region` VALUES ('1414', '166', '濮阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1415', '167', '道里区', '3', '0');
INSERT INTO `tp_region` VALUES ('1416', '167', '南岗区', '3', '0');
INSERT INTO `tp_region` VALUES ('1417', '167', '动力区', '3', '0');
INSERT INTO `tp_region` VALUES ('1418', '167', '平房区', '3', '0');
INSERT INTO `tp_region` VALUES ('1419', '167', '香坊区', '3', '0');
INSERT INTO `tp_region` VALUES ('1420', '167', '太平区', '3', '0');
INSERT INTO `tp_region` VALUES ('1421', '167', '道外区', '3', '0');
INSERT INTO `tp_region` VALUES ('1422', '167', '阿城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1423', '167', '呼兰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1424', '167', '松北区', '3', '0');
INSERT INTO `tp_region` VALUES ('1425', '167', '尚志市', '3', '0');
INSERT INTO `tp_region` VALUES ('1426', '167', '双城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1427', '167', '五常市', '3', '0');
INSERT INTO `tp_region` VALUES ('1428', '167', '方正县', '3', '0');
INSERT INTO `tp_region` VALUES ('1429', '167', '宾县', '3', '0');
INSERT INTO `tp_region` VALUES ('1430', '167', '依兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1431', '167', '巴彦县', '3', '0');
INSERT INTO `tp_region` VALUES ('1432', '167', '通河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1433', '167', '木兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1434', '167', '延寿县', '3', '0');
INSERT INTO `tp_region` VALUES ('1435', '168', '萨尔图区', '3', '0');
INSERT INTO `tp_region` VALUES ('1436', '168', '红岗区', '3', '0');
INSERT INTO `tp_region` VALUES ('1437', '168', '龙凤区', '3', '0');
INSERT INTO `tp_region` VALUES ('1438', '168', '让胡路区', '3', '0');
INSERT INTO `tp_region` VALUES ('1439', '168', '大同区', '3', '0');
INSERT INTO `tp_region` VALUES ('1440', '168', '肇州县', '3', '0');
INSERT INTO `tp_region` VALUES ('1441', '168', '肇源县', '3', '0');
INSERT INTO `tp_region` VALUES ('1442', '168', '林甸县', '3', '0');
INSERT INTO `tp_region` VALUES ('1443', '168', '杜尔伯特', '3', '0');
INSERT INTO `tp_region` VALUES ('1444', '169', '呼玛县', '3', '0');
INSERT INTO `tp_region` VALUES ('1445', '169', '漠河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1446', '169', '塔河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1447', '170', '兴山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1448', '170', '工农区', '3', '0');
INSERT INTO `tp_region` VALUES ('1449', '170', '南山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1450', '170', '兴安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1451', '170', '向阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1452', '170', '东山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1453', '170', '萝北县', '3', '0');
INSERT INTO `tp_region` VALUES ('1454', '170', '绥滨县', '3', '0');
INSERT INTO `tp_region` VALUES ('1455', '171', '爱辉区', '3', '0');
INSERT INTO `tp_region` VALUES ('1456', '171', '五大连池市', '3', '0');
INSERT INTO `tp_region` VALUES ('1457', '171', '北安市', '3', '0');
INSERT INTO `tp_region` VALUES ('1458', '171', '嫩江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1459', '171', '逊克县', '3', '0');
INSERT INTO `tp_region` VALUES ('1460', '171', '孙吴县', '3', '0');
INSERT INTO `tp_region` VALUES ('1461', '172', '鸡冠区', '3', '0');
INSERT INTO `tp_region` VALUES ('1462', '172', '恒山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1463', '172', '城子河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1464', '172', '滴道区', '3', '0');
INSERT INTO `tp_region` VALUES ('1465', '172', '梨树区', '3', '0');
INSERT INTO `tp_region` VALUES ('1466', '172', '虎林市', '3', '0');
INSERT INTO `tp_region` VALUES ('1467', '172', '密山市', '3', '0');
INSERT INTO `tp_region` VALUES ('1468', '172', '鸡东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1469', '173', '前进区', '3', '0');
INSERT INTO `tp_region` VALUES ('1470', '173', '郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('1471', '173', '向阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1472', '173', '东风区', '3', '0');
INSERT INTO `tp_region` VALUES ('1473', '173', '同江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1474', '173', '富锦市', '3', '0');
INSERT INTO `tp_region` VALUES ('1475', '173', '桦南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1476', '173', '桦川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1477', '173', '汤原县', '3', '0');
INSERT INTO `tp_region` VALUES ('1478', '173', '抚远县', '3', '0');
INSERT INTO `tp_region` VALUES ('1479', '174', '爱民区', '3', '0');
INSERT INTO `tp_region` VALUES ('1480', '174', '东安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1481', '174', '阳明区', '3', '0');
INSERT INTO `tp_region` VALUES ('1482', '174', '西安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1483', '174', '绥芬河市', '3', '0');
INSERT INTO `tp_region` VALUES ('1484', '174', '海林市', '3', '0');
INSERT INTO `tp_region` VALUES ('1485', '174', '宁安市', '3', '0');
INSERT INTO `tp_region` VALUES ('1486', '174', '穆棱市', '3', '0');
INSERT INTO `tp_region` VALUES ('1487', '174', '东宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1488', '174', '林口县', '3', '0');
INSERT INTO `tp_region` VALUES ('1489', '175', '桃山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1490', '175', '新兴区', '3', '0');
INSERT INTO `tp_region` VALUES ('1491', '175', '茄子河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1492', '175', '勃利县', '3', '0');
INSERT INTO `tp_region` VALUES ('1493', '176', '龙沙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1494', '176', '昂昂溪区', '3', '0');
INSERT INTO `tp_region` VALUES ('1495', '176', '铁峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1496', '176', '建华区', '3', '0');
INSERT INTO `tp_region` VALUES ('1497', '176', '富拉尔基区', '3', '0');
INSERT INTO `tp_region` VALUES ('1498', '176', '碾子山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', '0');
INSERT INTO `tp_region` VALUES ('1500', '176', '讷河市', '3', '0');
INSERT INTO `tp_region` VALUES ('1501', '176', '龙江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1502', '176', '依安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1503', '176', '泰来县', '3', '0');
INSERT INTO `tp_region` VALUES ('1504', '176', '甘南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1505', '176', '富裕县', '3', '0');
INSERT INTO `tp_region` VALUES ('1506', '176', '克山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1507', '176', '克东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1508', '176', '拜泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1509', '177', '尖山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1510', '177', '岭东区', '3', '0');
INSERT INTO `tp_region` VALUES ('1511', '177', '四方台区', '3', '0');
INSERT INTO `tp_region` VALUES ('1512', '177', '宝山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1513', '177', '集贤县', '3', '0');
INSERT INTO `tp_region` VALUES ('1514', '177', '友谊县', '3', '0');
INSERT INTO `tp_region` VALUES ('1515', '177', '宝清县', '3', '0');
INSERT INTO `tp_region` VALUES ('1516', '177', '饶河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1517', '178', '北林区', '3', '0');
INSERT INTO `tp_region` VALUES ('1518', '178', '安达市', '3', '0');
INSERT INTO `tp_region` VALUES ('1519', '178', '肇东市', '3', '0');
INSERT INTO `tp_region` VALUES ('1520', '178', '海伦市', '3', '0');
INSERT INTO `tp_region` VALUES ('1521', '178', '望奎县', '3', '0');
INSERT INTO `tp_region` VALUES ('1522', '178', '兰西县', '3', '0');
INSERT INTO `tp_region` VALUES ('1523', '178', '青冈县', '3', '0');
INSERT INTO `tp_region` VALUES ('1524', '178', '庆安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1525', '178', '明水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1526', '178', '绥棱县', '3', '0');
INSERT INTO `tp_region` VALUES ('1527', '179', '伊春区', '3', '0');
INSERT INTO `tp_region` VALUES ('1528', '179', '带岭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1529', '179', '南岔区', '3', '0');
INSERT INTO `tp_region` VALUES ('1530', '179', '金山屯区', '3', '0');
INSERT INTO `tp_region` VALUES ('1531', '179', '西林区', '3', '0');
INSERT INTO `tp_region` VALUES ('1532', '179', '美溪区', '3', '0');
INSERT INTO `tp_region` VALUES ('1533', '179', '乌马河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1534', '179', '翠峦区', '3', '0');
INSERT INTO `tp_region` VALUES ('1535', '179', '友好区', '3', '0');
INSERT INTO `tp_region` VALUES ('1536', '179', '上甘岭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1537', '179', '五营区', '3', '0');
INSERT INTO `tp_region` VALUES ('1538', '179', '红星区', '3', '0');
INSERT INTO `tp_region` VALUES ('1539', '179', '新青区', '3', '0');
INSERT INTO `tp_region` VALUES ('1540', '179', '汤旺河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1541', '179', '乌伊岭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1542', '179', '铁力市', '3', '0');
INSERT INTO `tp_region` VALUES ('1543', '179', '嘉荫县', '3', '0');
INSERT INTO `tp_region` VALUES ('1544', '180', '江岸区', '3', '0');
INSERT INTO `tp_region` VALUES ('1545', '180', '武昌区', '3', '0');
INSERT INTO `tp_region` VALUES ('1546', '180', '江汉区', '3', '0');
INSERT INTO `tp_region` VALUES ('1547', '180', '硚口区', '3', '0');
INSERT INTO `tp_region` VALUES ('1548', '180', '汉阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1549', '180', '青山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1550', '180', '洪山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1551', '180', '东西湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1552', '180', '汉南区', '3', '0');
INSERT INTO `tp_region` VALUES ('1553', '180', '蔡甸区', '3', '0');
INSERT INTO `tp_region` VALUES ('1554', '180', '江夏区', '3', '0');
INSERT INTO `tp_region` VALUES ('1555', '180', '黄陂区', '3', '0');
INSERT INTO `tp_region` VALUES ('1556', '180', '新洲区', '3', '0');
INSERT INTO `tp_region` VALUES ('1557', '180', '经济开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1558', '181', '仙桃市', '3', '0');
INSERT INTO `tp_region` VALUES ('1559', '182', '鄂城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1560', '182', '华容区', '3', '0');
INSERT INTO `tp_region` VALUES ('1561', '182', '梁子湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1562', '183', '黄州区', '3', '0');
INSERT INTO `tp_region` VALUES ('1563', '183', '麻城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1564', '183', '武穴市', '3', '0');
INSERT INTO `tp_region` VALUES ('1565', '183', '团风县', '3', '0');
INSERT INTO `tp_region` VALUES ('1566', '183', '红安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1567', '183', '罗田县', '3', '0');
INSERT INTO `tp_region` VALUES ('1568', '183', '英山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1569', '183', '浠水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1570', '183', '蕲春县', '3', '0');
INSERT INTO `tp_region` VALUES ('1571', '183', '黄梅县', '3', '0');
INSERT INTO `tp_region` VALUES ('1572', '184', '黄石港区', '3', '0');
INSERT INTO `tp_region` VALUES ('1573', '184', '西塞山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1574', '184', '下陆区', '3', '0');
INSERT INTO `tp_region` VALUES ('1575', '184', '铁山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1576', '184', '大冶市', '3', '0');
INSERT INTO `tp_region` VALUES ('1577', '184', '阳新县', '3', '0');
INSERT INTO `tp_region` VALUES ('1578', '185', '东宝区', '3', '0');
INSERT INTO `tp_region` VALUES ('1579', '185', '掇刀区', '3', '0');
INSERT INTO `tp_region` VALUES ('1580', '185', '钟祥市', '3', '0');
INSERT INTO `tp_region` VALUES ('1581', '185', '京山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1582', '185', '沙洋县', '3', '0');
INSERT INTO `tp_region` VALUES ('1583', '186', '沙市区', '3', '0');
INSERT INTO `tp_region` VALUES ('1584', '186', '荆州区', '3', '0');
INSERT INTO `tp_region` VALUES ('1585', '186', '石首市', '3', '0');
INSERT INTO `tp_region` VALUES ('1586', '186', '洪湖市', '3', '0');
INSERT INTO `tp_region` VALUES ('1587', '186', '松滋市', '3', '0');
INSERT INTO `tp_region` VALUES ('1588', '186', '公安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1589', '186', '监利县', '3', '0');
INSERT INTO `tp_region` VALUES ('1590', '186', '江陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1591', '187', '潜江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1592', '188', '神农架林区', '3', '0');
INSERT INTO `tp_region` VALUES ('1593', '189', '张湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('1594', '189', '茅箭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1595', '189', '丹江口市', '3', '0');
INSERT INTO `tp_region` VALUES ('1596', '189', '郧县', '3', '0');
INSERT INTO `tp_region` VALUES ('1597', '189', '郧西县', '3', '0');
INSERT INTO `tp_region` VALUES ('1598', '189', '竹山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1599', '189', '竹溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('1600', '189', '房县', '3', '0');
INSERT INTO `tp_region` VALUES ('1601', '190', '曾都区', '3', '0');
INSERT INTO `tp_region` VALUES ('1602', '190', '广水市', '3', '0');
INSERT INTO `tp_region` VALUES ('1603', '191', '天门市', '3', '0');
INSERT INTO `tp_region` VALUES ('1604', '192', '咸安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1605', '192', '赤壁市', '3', '0');
INSERT INTO `tp_region` VALUES ('1606', '192', '嘉鱼县', '3', '0');
INSERT INTO `tp_region` VALUES ('1607', '192', '通城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1608', '192', '崇阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1609', '192', '通山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1610', '193', '襄城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1611', '193', '樊城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1612', '193', '襄阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1613', '193', '老河口市', '3', '0');
INSERT INTO `tp_region` VALUES ('1614', '193', '枣阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1615', '193', '宜城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1616', '193', '南漳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1617', '193', '谷城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1618', '193', '保康县', '3', '0');
INSERT INTO `tp_region` VALUES ('1619', '194', '孝南区', '3', '0');
INSERT INTO `tp_region` VALUES ('1620', '194', '应城市', '3', '0');
INSERT INTO `tp_region` VALUES ('1621', '194', '安陆市', '3', '0');
INSERT INTO `tp_region` VALUES ('1622', '194', '汉川市', '3', '0');
INSERT INTO `tp_region` VALUES ('1623', '194', '孝昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1624', '194', '大悟县', '3', '0');
INSERT INTO `tp_region` VALUES ('1625', '194', '云梦县', '3', '0');
INSERT INTO `tp_region` VALUES ('1626', '195', '长阳', '3', '0');
INSERT INTO `tp_region` VALUES ('1627', '195', '五峰', '3', '0');
INSERT INTO `tp_region` VALUES ('1628', '195', '西陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1629', '195', '伍家岗区', '3', '0');
INSERT INTO `tp_region` VALUES ('1630', '195', '点军区', '3', '0');
INSERT INTO `tp_region` VALUES ('1631', '195', '猇亭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1632', '195', '夷陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1633', '195', '宜都市', '3', '0');
INSERT INTO `tp_region` VALUES ('1634', '195', '当阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1635', '195', '枝江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1636', '195', '远安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1637', '195', '兴山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1638', '195', '秭归县', '3', '0');
INSERT INTO `tp_region` VALUES ('1639', '196', '恩施市', '3', '0');
INSERT INTO `tp_region` VALUES ('1640', '196', '利川市', '3', '0');
INSERT INTO `tp_region` VALUES ('1641', '196', '建始县', '3', '0');
INSERT INTO `tp_region` VALUES ('1642', '196', '巴东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1643', '196', '宣恩县', '3', '0');
INSERT INTO `tp_region` VALUES ('1644', '196', '咸丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1645', '196', '来凤县', '3', '0');
INSERT INTO `tp_region` VALUES ('1646', '196', '鹤峰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1647', '197', '岳麓区', '3', '0');
INSERT INTO `tp_region` VALUES ('1648', '197', '芙蓉区', '3', '0');
INSERT INTO `tp_region` VALUES ('1649', '197', '天心区', '3', '0');
INSERT INTO `tp_region` VALUES ('1650', '197', '开福区', '3', '0');
INSERT INTO `tp_region` VALUES ('1651', '197', '雨花区', '3', '0');
INSERT INTO `tp_region` VALUES ('1652', '197', '开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1653', '197', '浏阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1654', '197', '长沙县', '3', '0');
INSERT INTO `tp_region` VALUES ('1655', '197', '望城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1656', '197', '宁乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1657', '198', '永定区', '3', '0');
INSERT INTO `tp_region` VALUES ('1658', '198', '武陵源区', '3', '0');
INSERT INTO `tp_region` VALUES ('1659', '198', '慈利县', '3', '0');
INSERT INTO `tp_region` VALUES ('1660', '198', '桑植县', '3', '0');
INSERT INTO `tp_region` VALUES ('1661', '199', '武陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1662', '199', '鼎城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1663', '199', '津市市', '3', '0');
INSERT INTO `tp_region` VALUES ('1664', '199', '安乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1665', '199', '汉寿县', '3', '0');
INSERT INTO `tp_region` VALUES ('1666', '199', '澧县', '3', '0');
INSERT INTO `tp_region` VALUES ('1667', '199', '临澧县', '3', '0');
INSERT INTO `tp_region` VALUES ('1668', '199', '桃源县', '3', '0');
INSERT INTO `tp_region` VALUES ('1669', '199', '石门县', '3', '0');
INSERT INTO `tp_region` VALUES ('1670', '200', '北湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1671', '200', '苏仙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1672', '200', '资兴市', '3', '0');
INSERT INTO `tp_region` VALUES ('1673', '200', '桂阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1674', '200', '宜章县', '3', '0');
INSERT INTO `tp_region` VALUES ('1675', '200', '永兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('1676', '200', '嘉禾县', '3', '0');
INSERT INTO `tp_region` VALUES ('1677', '200', '临武县', '3', '0');
INSERT INTO `tp_region` VALUES ('1678', '200', '汝城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1679', '200', '桂东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1680', '200', '安仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1681', '201', '雁峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1682', '201', '珠晖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1683', '201', '石鼓区', '3', '0');
INSERT INTO `tp_region` VALUES ('1684', '201', '蒸湘区', '3', '0');
INSERT INTO `tp_region` VALUES ('1685', '201', '南岳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1686', '201', '耒阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1687', '201', '常宁市', '3', '0');
INSERT INTO `tp_region` VALUES ('1688', '201', '衡阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1689', '201', '衡南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1690', '201', '衡山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1691', '201', '衡东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1692', '201', '祁东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1693', '202', '鹤城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1694', '202', '靖州', '3', '0');
INSERT INTO `tp_region` VALUES ('1695', '202', '麻阳', '3', '0');
INSERT INTO `tp_region` VALUES ('1696', '202', '通道', '3', '0');
INSERT INTO `tp_region` VALUES ('1697', '202', '新晃', '3', '0');
INSERT INTO `tp_region` VALUES ('1698', '202', '芷江', '3', '0');
INSERT INTO `tp_region` VALUES ('1699', '202', '沅陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1700', '202', '辰溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('1701', '202', '溆浦县', '3', '0');
INSERT INTO `tp_region` VALUES ('1702', '202', '中方县', '3', '0');
INSERT INTO `tp_region` VALUES ('1703', '202', '会同县', '3', '0');
INSERT INTO `tp_region` VALUES ('1704', '202', '洪江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1705', '203', '娄星区', '3', '0');
INSERT INTO `tp_region` VALUES ('1706', '203', '冷水江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1707', '203', '涟源市', '3', '0');
INSERT INTO `tp_region` VALUES ('1708', '203', '双峰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1709', '203', '新化县', '3', '0');
INSERT INTO `tp_region` VALUES ('1710', '204', '城步', '3', '0');
INSERT INTO `tp_region` VALUES ('1711', '204', '双清区', '3', '0');
INSERT INTO `tp_region` VALUES ('1712', '204', '大祥区', '3', '0');
INSERT INTO `tp_region` VALUES ('1713', '204', '北塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('1714', '204', '武冈市', '3', '0');
INSERT INTO `tp_region` VALUES ('1715', '204', '邵东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1716', '204', '新邵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1717', '204', '邵阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1718', '204', '隆回县', '3', '0');
INSERT INTO `tp_region` VALUES ('1719', '204', '洞口县', '3', '0');
INSERT INTO `tp_region` VALUES ('1720', '204', '绥宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1721', '204', '新宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1722', '205', '岳塘区', '3', '0');
INSERT INTO `tp_region` VALUES ('1723', '205', '雨湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1724', '205', '湘乡市', '3', '0');
INSERT INTO `tp_region` VALUES ('1725', '205', '韶山市', '3', '0');
INSERT INTO `tp_region` VALUES ('1726', '205', '湘潭县', '3', '0');
INSERT INTO `tp_region` VALUES ('1727', '206', '吉首市', '3', '0');
INSERT INTO `tp_region` VALUES ('1728', '206', '泸溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('1729', '206', '凤凰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1730', '206', '花垣县', '3', '0');
INSERT INTO `tp_region` VALUES ('1731', '206', '保靖县', '3', '0');
INSERT INTO `tp_region` VALUES ('1732', '206', '古丈县', '3', '0');
INSERT INTO `tp_region` VALUES ('1733', '206', '永顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('1734', '206', '龙山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1735', '207', '赫山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1736', '207', '资阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1737', '207', '沅江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1738', '207', '南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1739', '207', '桃江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1740', '207', '安化县', '3', '0');
INSERT INTO `tp_region` VALUES ('1741', '208', '江华', '3', '0');
INSERT INTO `tp_region` VALUES ('1742', '208', '冷水滩区', '3', '0');
INSERT INTO `tp_region` VALUES ('1743', '208', '零陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1744', '208', '祁阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1745', '208', '东安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1746', '208', '双牌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1747', '208', '道县', '3', '0');
INSERT INTO `tp_region` VALUES ('1748', '208', '江永县', '3', '0');
INSERT INTO `tp_region` VALUES ('1749', '208', '宁远县', '3', '0');
INSERT INTO `tp_region` VALUES ('1750', '208', '蓝山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1751', '208', '新田县', '3', '0');
INSERT INTO `tp_region` VALUES ('1752', '209', '岳阳楼区', '3', '0');
INSERT INTO `tp_region` VALUES ('1753', '209', '君山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1754', '209', '云溪区', '3', '0');
INSERT INTO `tp_region` VALUES ('1755', '209', '汨罗市', '3', '0');
INSERT INTO `tp_region` VALUES ('1756', '209', '临湘市', '3', '0');
INSERT INTO `tp_region` VALUES ('1757', '209', '岳阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1758', '209', '华容县', '3', '0');
INSERT INTO `tp_region` VALUES ('1759', '209', '湘阴县', '3', '0');
INSERT INTO `tp_region` VALUES ('1760', '209', '平江县', '3', '0');
INSERT INTO `tp_region` VALUES ('1761', '210', '天元区', '3', '0');
INSERT INTO `tp_region` VALUES ('1762', '210', '荷塘区', '3', '0');
INSERT INTO `tp_region` VALUES ('1763', '210', '芦淞区', '3', '0');
INSERT INTO `tp_region` VALUES ('1764', '210', '石峰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1765', '210', '醴陵市', '3', '0');
INSERT INTO `tp_region` VALUES ('1766', '210', '株洲县', '3', '0');
INSERT INTO `tp_region` VALUES ('1767', '210', '攸县', '3', '0');
INSERT INTO `tp_region` VALUES ('1768', '210', '茶陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1769', '210', '炎陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('1770', '211', '朝阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1771', '211', '宽城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1772', '211', '二道区', '3', '0');
INSERT INTO `tp_region` VALUES ('1773', '211', '南关区', '3', '0');
INSERT INTO `tp_region` VALUES ('1774', '211', '绿园区', '3', '0');
INSERT INTO `tp_region` VALUES ('1775', '211', '双阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('1776', '211', '净月潭开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1777', '211', '高新技术开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1778', '211', '经济技术开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1779', '211', '汽车产业开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1780', '211', '德惠市', '3', '0');
INSERT INTO `tp_region` VALUES ('1781', '211', '九台市', '3', '0');
INSERT INTO `tp_region` VALUES ('1782', '211', '榆树市', '3', '0');
INSERT INTO `tp_region` VALUES ('1783', '211', '农安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1784', '212', '船营区', '3', '0');
INSERT INTO `tp_region` VALUES ('1785', '212', '昌邑区', '3', '0');
INSERT INTO `tp_region` VALUES ('1786', '212', '龙潭区', '3', '0');
INSERT INTO `tp_region` VALUES ('1787', '212', '丰满区', '3', '0');
INSERT INTO `tp_region` VALUES ('1788', '212', '蛟河市', '3', '0');
INSERT INTO `tp_region` VALUES ('1789', '212', '桦甸市', '3', '0');
INSERT INTO `tp_region` VALUES ('1790', '212', '舒兰市', '3', '0');
INSERT INTO `tp_region` VALUES ('1791', '212', '磐石市', '3', '0');
INSERT INTO `tp_region` VALUES ('1792', '212', '永吉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1793', '213', '洮北区', '3', '0');
INSERT INTO `tp_region` VALUES ('1794', '213', '洮南市', '3', '0');
INSERT INTO `tp_region` VALUES ('1795', '213', '大安市', '3', '0');
INSERT INTO `tp_region` VALUES ('1796', '213', '镇赉县', '3', '0');
INSERT INTO `tp_region` VALUES ('1797', '213', '通榆县', '3', '0');
INSERT INTO `tp_region` VALUES ('1798', '214', '江源区', '3', '0');
INSERT INTO `tp_region` VALUES ('1799', '214', '八道江区', '3', '0');
INSERT INTO `tp_region` VALUES ('1800', '214', '长白', '3', '0');
INSERT INTO `tp_region` VALUES ('1801', '214', '临江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1802', '214', '抚松县', '3', '0');
INSERT INTO `tp_region` VALUES ('1803', '214', '靖宇县', '3', '0');
INSERT INTO `tp_region` VALUES ('1804', '215', '龙山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1805', '215', '西安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1806', '215', '东丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1807', '215', '东辽县', '3', '0');
INSERT INTO `tp_region` VALUES ('1808', '216', '铁西区', '3', '0');
INSERT INTO `tp_region` VALUES ('1809', '216', '铁东区', '3', '0');
INSERT INTO `tp_region` VALUES ('1810', '216', '伊通', '3', '0');
INSERT INTO `tp_region` VALUES ('1811', '216', '公主岭市', '3', '0');
INSERT INTO `tp_region` VALUES ('1812', '216', '双辽市', '3', '0');
INSERT INTO `tp_region` VALUES ('1813', '216', '梨树县', '3', '0');
INSERT INTO `tp_region` VALUES ('1814', '217', '前郭尔罗斯', '3', '0');
INSERT INTO `tp_region` VALUES ('1815', '217', '宁江区', '3', '0');
INSERT INTO `tp_region` VALUES ('1816', '217', '长岭县', '3', '0');
INSERT INTO `tp_region` VALUES ('1817', '217', '乾安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1818', '217', '扶余县', '3', '0');
INSERT INTO `tp_region` VALUES ('1819', '218', '东昌区', '3', '0');
INSERT INTO `tp_region` VALUES ('1820', '218', '二道江区', '3', '0');
INSERT INTO `tp_region` VALUES ('1821', '218', '梅河口市', '3', '0');
INSERT INTO `tp_region` VALUES ('1822', '218', '集安市', '3', '0');
INSERT INTO `tp_region` VALUES ('1823', '218', '通化县', '3', '0');
INSERT INTO `tp_region` VALUES ('1824', '218', '辉南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1825', '218', '柳河县', '3', '0');
INSERT INTO `tp_region` VALUES ('1826', '219', '延吉市', '3', '0');
INSERT INTO `tp_region` VALUES ('1827', '219', '图们市', '3', '0');
INSERT INTO `tp_region` VALUES ('1828', '219', '敦化市', '3', '0');
INSERT INTO `tp_region` VALUES ('1829', '219', '珲春市', '3', '0');
INSERT INTO `tp_region` VALUES ('1830', '219', '龙井市', '3', '0');
INSERT INTO `tp_region` VALUES ('1831', '219', '和龙市', '3', '0');
INSERT INTO `tp_region` VALUES ('1832', '219', '安图县', '3', '0');
INSERT INTO `tp_region` VALUES ('1833', '219', '汪清县', '3', '0');
INSERT INTO `tp_region` VALUES ('1834', '220', '玄武区', '3', '0');
INSERT INTO `tp_region` VALUES ('1835', '220', '鼓楼区', '3', '0');
INSERT INTO `tp_region` VALUES ('1836', '220', '白下区', '3', '0');
INSERT INTO `tp_region` VALUES ('1837', '220', '建邺区', '3', '0');
INSERT INTO `tp_region` VALUES ('1838', '220', '秦淮区', '3', '0');
INSERT INTO `tp_region` VALUES ('1839', '220', '雨花台区', '3', '0');
INSERT INTO `tp_region` VALUES ('1840', '220', '下关区', '3', '0');
INSERT INTO `tp_region` VALUES ('1841', '220', '栖霞区', '3', '0');
INSERT INTO `tp_region` VALUES ('1842', '220', '浦口区', '3', '0');
INSERT INTO `tp_region` VALUES ('1843', '220', '江宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('1844', '220', '六合区', '3', '0');
INSERT INTO `tp_region` VALUES ('1845', '220', '溧水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1846', '220', '高淳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1847', '221', '沧浪区', '3', '0');
INSERT INTO `tp_region` VALUES ('1848', '221', '金阊区', '3', '0');
INSERT INTO `tp_region` VALUES ('1849', '221', '平江区', '3', '0');
INSERT INTO `tp_region` VALUES ('1850', '221', '虎丘区', '3', '0');
INSERT INTO `tp_region` VALUES ('1851', '221', '吴中区', '3', '0');
INSERT INTO `tp_region` VALUES ('1852', '221', '相城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1853', '221', '园区', '3', '0');
INSERT INTO `tp_region` VALUES ('1854', '221', '新区', '3', '0');
INSERT INTO `tp_region` VALUES ('1855', '221', '常熟市', '3', '0');
INSERT INTO `tp_region` VALUES ('1856', '221', '张家港市', '3', '0');
INSERT INTO `tp_region` VALUES ('1857', '221', '玉山镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1858', '221', '巴城镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1859', '221', '周市镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1860', '221', '陆家镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1861', '221', '花桥镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1862', '221', '淀山湖镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1863', '221', '张浦镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1864', '221', '周庄镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1865', '221', '千灯镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1866', '221', '锦溪镇', '3', '0');
INSERT INTO `tp_region` VALUES ('1867', '221', '开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1868', '221', '吴江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1869', '221', '太仓市', '3', '0');
INSERT INTO `tp_region` VALUES ('1870', '222', '崇安区', '3', '0');
INSERT INTO `tp_region` VALUES ('1871', '222', '北塘区', '3', '0');
INSERT INTO `tp_region` VALUES ('1872', '222', '南长区', '3', '0');
INSERT INTO `tp_region` VALUES ('1873', '222', '锡山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1874', '222', '惠山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1875', '222', '滨湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1876', '222', '新区', '3', '0');
INSERT INTO `tp_region` VALUES ('1877', '222', '江阴市', '3', '0');
INSERT INTO `tp_region` VALUES ('1878', '222', '宜兴市', '3', '0');
INSERT INTO `tp_region` VALUES ('1879', '223', '天宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('1880', '223', '钟楼区', '3', '0');
INSERT INTO `tp_region` VALUES ('1881', '223', '戚墅堰区', '3', '0');
INSERT INTO `tp_region` VALUES ('1882', '223', '郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('1883', '223', '新北区', '3', '0');
INSERT INTO `tp_region` VALUES ('1884', '223', '武进区', '3', '0');
INSERT INTO `tp_region` VALUES ('1885', '223', '溧阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1886', '223', '金坛市', '3', '0');
INSERT INTO `tp_region` VALUES ('1887', '224', '清河区', '3', '0');
INSERT INTO `tp_region` VALUES ('1888', '224', '清浦区', '3', '0');
INSERT INTO `tp_region` VALUES ('1889', '224', '楚州区', '3', '0');
INSERT INTO `tp_region` VALUES ('1890', '224', '淮阴区', '3', '0');
INSERT INTO `tp_region` VALUES ('1891', '224', '涟水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1892', '224', '洪泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('1893', '224', '盱眙县', '3', '0');
INSERT INTO `tp_region` VALUES ('1894', '224', '金湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('1895', '225', '新浦区', '3', '0');
INSERT INTO `tp_region` VALUES ('1896', '225', '连云区', '3', '0');
INSERT INTO `tp_region` VALUES ('1897', '225', '海州区', '3', '0');
INSERT INTO `tp_region` VALUES ('1898', '225', '赣榆县', '3', '0');
INSERT INTO `tp_region` VALUES ('1899', '225', '东海县', '3', '0');
INSERT INTO `tp_region` VALUES ('1900', '225', '灌云县', '3', '0');
INSERT INTO `tp_region` VALUES ('1901', '225', '灌南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1902', '226', '崇川区', '3', '0');
INSERT INTO `tp_region` VALUES ('1903', '226', '港闸区', '3', '0');
INSERT INTO `tp_region` VALUES ('1904', '226', '经济开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('1905', '226', '启东市', '3', '0');
INSERT INTO `tp_region` VALUES ('1906', '226', '如皋市', '3', '0');
INSERT INTO `tp_region` VALUES ('1907', '226', '通州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1908', '226', '海门市', '3', '0');
INSERT INTO `tp_region` VALUES ('1909', '226', '海安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1910', '226', '如东县', '3', '0');
INSERT INTO `tp_region` VALUES ('1911', '227', '宿城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1912', '227', '宿豫区', '3', '0');
INSERT INTO `tp_region` VALUES ('1913', '227', '宿豫县', '3', '0');
INSERT INTO `tp_region` VALUES ('1914', '227', '沭阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1915', '227', '泗阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1916', '227', '泗洪县', '3', '0');
INSERT INTO `tp_region` VALUES ('1917', '228', '海陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1918', '228', '高港区', '3', '0');
INSERT INTO `tp_region` VALUES ('1919', '228', '兴化市', '3', '0');
INSERT INTO `tp_region` VALUES ('1920', '228', '靖江市', '3', '0');
INSERT INTO `tp_region` VALUES ('1921', '228', '泰兴市', '3', '0');
INSERT INTO `tp_region` VALUES ('1922', '228', '姜堰市', '3', '0');
INSERT INTO `tp_region` VALUES ('1923', '229', '云龙区', '3', '0');
INSERT INTO `tp_region` VALUES ('1924', '229', '鼓楼区', '3', '0');
INSERT INTO `tp_region` VALUES ('1925', '229', '九里区', '3', '0');
INSERT INTO `tp_region` VALUES ('1926', '229', '贾汪区', '3', '0');
INSERT INTO `tp_region` VALUES ('1927', '229', '泉山区', '3', '0');
INSERT INTO `tp_region` VALUES ('1928', '229', '新沂市', '3', '0');
INSERT INTO `tp_region` VALUES ('1929', '229', '邳州市', '3', '0');
INSERT INTO `tp_region` VALUES ('1930', '229', '丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1931', '229', '沛县', '3', '0');
INSERT INTO `tp_region` VALUES ('1932', '229', '铜山县', '3', '0');
INSERT INTO `tp_region` VALUES ('1933', '229', '睢宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1934', '230', '城区', '3', '0');
INSERT INTO `tp_region` VALUES ('1935', '230', '亭湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1936', '230', '盐都区', '3', '0');
INSERT INTO `tp_region` VALUES ('1937', '230', '盐都县', '3', '0');
INSERT INTO `tp_region` VALUES ('1938', '230', '东台市', '3', '0');
INSERT INTO `tp_region` VALUES ('1939', '230', '大丰市', '3', '0');
INSERT INTO `tp_region` VALUES ('1940', '230', '响水县', '3', '0');
INSERT INTO `tp_region` VALUES ('1941', '230', '滨海县', '3', '0');
INSERT INTO `tp_region` VALUES ('1942', '230', '阜宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1943', '230', '射阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('1944', '230', '建湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('1945', '231', '广陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('1946', '231', '维扬区', '3', '0');
INSERT INTO `tp_region` VALUES ('1947', '231', '邗江区', '3', '0');
INSERT INTO `tp_region` VALUES ('1948', '231', '仪征市', '3', '0');
INSERT INTO `tp_region` VALUES ('1949', '231', '高邮市', '3', '0');
INSERT INTO `tp_region` VALUES ('1950', '231', '江都市', '3', '0');
INSERT INTO `tp_region` VALUES ('1951', '231', '宝应县', '3', '0');
INSERT INTO `tp_region` VALUES ('1952', '232', '京口区', '3', '0');
INSERT INTO `tp_region` VALUES ('1953', '232', '润州区', '3', '0');
INSERT INTO `tp_region` VALUES ('1954', '232', '丹徒区', '3', '0');
INSERT INTO `tp_region` VALUES ('1955', '232', '丹阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('1956', '232', '扬中市', '3', '0');
INSERT INTO `tp_region` VALUES ('1957', '232', '句容市', '3', '0');
INSERT INTO `tp_region` VALUES ('1958', '233', '东湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1959', '233', '西湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1960', '233', '青云谱区', '3', '0');
INSERT INTO `tp_region` VALUES ('1961', '233', '湾里区', '3', '0');
INSERT INTO `tp_region` VALUES ('1962', '233', '青山湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('1963', '233', '红谷滩新区', '3', '0');
INSERT INTO `tp_region` VALUES ('1964', '233', '昌北区', '3', '0');
INSERT INTO `tp_region` VALUES ('1965', '233', '高新区', '3', '0');
INSERT INTO `tp_region` VALUES ('1966', '233', '南昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1967', '233', '新建县', '3', '0');
INSERT INTO `tp_region` VALUES ('1968', '233', '安义县', '3', '0');
INSERT INTO `tp_region` VALUES ('1969', '233', '进贤县', '3', '0');
INSERT INTO `tp_region` VALUES ('1970', '234', '临川区', '3', '0');
INSERT INTO `tp_region` VALUES ('1971', '234', '南城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1972', '234', '黎川县', '3', '0');
INSERT INTO `tp_region` VALUES ('1973', '234', '南丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1974', '234', '崇仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('1975', '234', '乐安县', '3', '0');
INSERT INTO `tp_region` VALUES ('1976', '234', '宜黄县', '3', '0');
INSERT INTO `tp_region` VALUES ('1977', '234', '金溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('1978', '234', '资溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('1979', '234', '东乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('1980', '234', '广昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1981', '235', '章贡区', '3', '0');
INSERT INTO `tp_region` VALUES ('1982', '235', '于都县', '3', '0');
INSERT INTO `tp_region` VALUES ('1983', '235', '瑞金市', '3', '0');
INSERT INTO `tp_region` VALUES ('1984', '235', '南康市', '3', '0');
INSERT INTO `tp_region` VALUES ('1985', '235', '赣县', '3', '0');
INSERT INTO `tp_region` VALUES ('1986', '235', '信丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('1987', '235', '大余县', '3', '0');
INSERT INTO `tp_region` VALUES ('1988', '235', '上犹县', '3', '0');
INSERT INTO `tp_region` VALUES ('1989', '235', '崇义县', '3', '0');
INSERT INTO `tp_region` VALUES ('1990', '235', '安远县', '3', '0');
INSERT INTO `tp_region` VALUES ('1991', '235', '龙南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1992', '235', '定南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1993', '235', '全南县', '3', '0');
INSERT INTO `tp_region` VALUES ('1994', '235', '宁都县', '3', '0');
INSERT INTO `tp_region` VALUES ('1995', '235', '兴国县', '3', '0');
INSERT INTO `tp_region` VALUES ('1996', '235', '会昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1997', '235', '寻乌县', '3', '0');
INSERT INTO `tp_region` VALUES ('1998', '235', '石城县', '3', '0');
INSERT INTO `tp_region` VALUES ('1999', '236', '安福县', '3', '0');
INSERT INTO `tp_region` VALUES ('2000', '236', '吉州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2001', '236', '青原区', '3', '0');
INSERT INTO `tp_region` VALUES ('2002', '236', '井冈山市', '3', '0');
INSERT INTO `tp_region` VALUES ('2003', '236', '吉安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2004', '236', '吉水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2005', '236', '峡江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2006', '236', '新干县', '3', '0');
INSERT INTO `tp_region` VALUES ('2007', '236', '永丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2008', '236', '泰和县', '3', '0');
INSERT INTO `tp_region` VALUES ('2009', '236', '遂川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2010', '236', '万安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2011', '236', '永新县', '3', '0');
INSERT INTO `tp_region` VALUES ('2012', '237', '珠山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2013', '237', '昌江区', '3', '0');
INSERT INTO `tp_region` VALUES ('2014', '237', '乐平市', '3', '0');
INSERT INTO `tp_region` VALUES ('2015', '237', '浮梁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2016', '238', '浔阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('2017', '238', '庐山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2018', '238', '瑞昌市', '3', '0');
INSERT INTO `tp_region` VALUES ('2019', '238', '九江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2020', '238', '武宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2021', '238', '修水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2022', '238', '永修县', '3', '0');
INSERT INTO `tp_region` VALUES ('2023', '238', '德安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2024', '238', '星子县', '3', '0');
INSERT INTO `tp_region` VALUES ('2025', '238', '都昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('2026', '238', '湖口县', '3', '0');
INSERT INTO `tp_region` VALUES ('2027', '238', '彭泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('2028', '239', '安源区', '3', '0');
INSERT INTO `tp_region` VALUES ('2029', '239', '湘东区', '3', '0');
INSERT INTO `tp_region` VALUES ('2030', '239', '莲花县', '3', '0');
INSERT INTO `tp_region` VALUES ('2031', '239', '芦溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2032', '239', '上栗县', '3', '0');
INSERT INTO `tp_region` VALUES ('2033', '240', '信州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2034', '240', '德兴市', '3', '0');
INSERT INTO `tp_region` VALUES ('2035', '240', '上饶县', '3', '0');
INSERT INTO `tp_region` VALUES ('2036', '240', '广丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2037', '240', '玉山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2038', '240', '铅山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2039', '240', '横峰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2040', '240', '弋阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2041', '240', '余干县', '3', '0');
INSERT INTO `tp_region` VALUES ('2042', '240', '波阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2043', '240', '万年县', '3', '0');
INSERT INTO `tp_region` VALUES ('2044', '240', '婺源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2045', '241', '渝水区', '3', '0');
INSERT INTO `tp_region` VALUES ('2046', '241', '分宜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2047', '242', '袁州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2048', '242', '丰城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2049', '242', '樟树市', '3', '0');
INSERT INTO `tp_region` VALUES ('2050', '242', '高安市', '3', '0');
INSERT INTO `tp_region` VALUES ('2051', '242', '奉新县', '3', '0');
INSERT INTO `tp_region` VALUES ('2052', '242', '万载县', '3', '0');
INSERT INTO `tp_region` VALUES ('2053', '242', '上高县', '3', '0');
INSERT INTO `tp_region` VALUES ('2054', '242', '宜丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2055', '242', '靖安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2056', '242', '铜鼓县', '3', '0');
INSERT INTO `tp_region` VALUES ('2057', '243', '月湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('2058', '243', '贵溪市', '3', '0');
INSERT INTO `tp_region` VALUES ('2059', '243', '余江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2060', '244', '沈河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2061', '244', '皇姑区', '3', '0');
INSERT INTO `tp_region` VALUES ('2062', '244', '和平区', '3', '0');
INSERT INTO `tp_region` VALUES ('2063', '244', '大东区', '3', '0');
INSERT INTO `tp_region` VALUES ('2064', '244', '铁西区', '3', '0');
INSERT INTO `tp_region` VALUES ('2065', '244', '苏家屯区', '3', '0');
INSERT INTO `tp_region` VALUES ('2066', '244', '东陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('2067', '244', '沈北新区', '3', '0');
INSERT INTO `tp_region` VALUES ('2068', '244', '于洪区', '3', '0');
INSERT INTO `tp_region` VALUES ('2069', '244', '浑南新区', '3', '0');
INSERT INTO `tp_region` VALUES ('2070', '244', '新民市', '3', '0');
INSERT INTO `tp_region` VALUES ('2071', '244', '辽中县', '3', '0');
INSERT INTO `tp_region` VALUES ('2072', '244', '康平县', '3', '0');
INSERT INTO `tp_region` VALUES ('2073', '244', '法库县', '3', '0');
INSERT INTO `tp_region` VALUES ('2074', '245', '西岗区', '3', '0');
INSERT INTO `tp_region` VALUES ('2075', '245', '中山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2076', '245', '沙河口区', '3', '0');
INSERT INTO `tp_region` VALUES ('2077', '245', '甘井子区', '3', '0');
INSERT INTO `tp_region` VALUES ('2078', '245', '旅顺口区', '3', '0');
INSERT INTO `tp_region` VALUES ('2079', '245', '金州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2080', '245', '开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('2081', '245', '瓦房店市', '3', '0');
INSERT INTO `tp_region` VALUES ('2082', '245', '普兰店市', '3', '0');
INSERT INTO `tp_region` VALUES ('2083', '245', '庄河市', '3', '0');
INSERT INTO `tp_region` VALUES ('2084', '245', '长海县', '3', '0');
INSERT INTO `tp_region` VALUES ('2085', '246', '铁东区', '3', '0');
INSERT INTO `tp_region` VALUES ('2086', '246', '铁西区', '3', '0');
INSERT INTO `tp_region` VALUES ('2087', '246', '立山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2088', '246', '千山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2089', '246', '岫岩', '3', '0');
INSERT INTO `tp_region` VALUES ('2090', '246', '海城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2091', '246', '台安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2092', '247', '本溪', '3', '0');
INSERT INTO `tp_region` VALUES ('2093', '247', '平山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2094', '247', '明山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2095', '247', '溪湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('2096', '247', '南芬区', '3', '0');
INSERT INTO `tp_region` VALUES ('2097', '247', '桓仁', '3', '0');
INSERT INTO `tp_region` VALUES ('2098', '248', '双塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('2099', '248', '龙城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `tp_region` VALUES ('2101', '248', '北票市', '3', '0');
INSERT INTO `tp_region` VALUES ('2102', '248', '凌源市', '3', '0');
INSERT INTO `tp_region` VALUES ('2103', '248', '朝阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2104', '248', '建平县', '3', '0');
INSERT INTO `tp_region` VALUES ('2105', '249', '振兴区', '3', '0');
INSERT INTO `tp_region` VALUES ('2106', '249', '元宝区', '3', '0');
INSERT INTO `tp_region` VALUES ('2107', '249', '振安区', '3', '0');
INSERT INTO `tp_region` VALUES ('2108', '249', '宽甸', '3', '0');
INSERT INTO `tp_region` VALUES ('2109', '249', '东港市', '3', '0');
INSERT INTO `tp_region` VALUES ('2110', '249', '凤城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2111', '250', '顺城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2112', '250', '新抚区', '3', '0');
INSERT INTO `tp_region` VALUES ('2113', '250', '东洲区', '3', '0');
INSERT INTO `tp_region` VALUES ('2114', '250', '望花区', '3', '0');
INSERT INTO `tp_region` VALUES ('2115', '250', '清原', '3', '0');
INSERT INTO `tp_region` VALUES ('2116', '250', '新宾', '3', '0');
INSERT INTO `tp_region` VALUES ('2117', '250', '抚顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('2118', '251', '阜新', '3', '0');
INSERT INTO `tp_region` VALUES ('2119', '251', '海州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2120', '251', '新邱区', '3', '0');
INSERT INTO `tp_region` VALUES ('2121', '251', '太平区', '3', '0');
INSERT INTO `tp_region` VALUES ('2122', '251', '清河门区', '3', '0');
INSERT INTO `tp_region` VALUES ('2123', '251', '细河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2124', '251', '彰武县', '3', '0');
INSERT INTO `tp_region` VALUES ('2125', '252', '龙港区', '3', '0');
INSERT INTO `tp_region` VALUES ('2126', '252', '南票区', '3', '0');
INSERT INTO `tp_region` VALUES ('2127', '252', '连山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2128', '252', '兴城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2129', '252', '绥中县', '3', '0');
INSERT INTO `tp_region` VALUES ('2130', '252', '建昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('2131', '253', '太和区', '3', '0');
INSERT INTO `tp_region` VALUES ('2132', '253', '古塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('2133', '253', '凌河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2134', '253', '凌海市', '3', '0');
INSERT INTO `tp_region` VALUES ('2135', '253', '北镇市', '3', '0');
INSERT INTO `tp_region` VALUES ('2136', '253', '黑山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2137', '253', '义县', '3', '0');
INSERT INTO `tp_region` VALUES ('2138', '254', '白塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('2139', '254', '文圣区', '3', '0');
INSERT INTO `tp_region` VALUES ('2140', '254', '宏伟区', '3', '0');
INSERT INTO `tp_region` VALUES ('2141', '254', '太子河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2142', '254', '弓长岭区', '3', '0');
INSERT INTO `tp_region` VALUES ('2143', '254', '灯塔市', '3', '0');
INSERT INTO `tp_region` VALUES ('2144', '254', '辽阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2145', '255', '双台子区', '3', '0');
INSERT INTO `tp_region` VALUES ('2146', '255', '兴隆台区', '3', '0');
INSERT INTO `tp_region` VALUES ('2147', '255', '大洼县', '3', '0');
INSERT INTO `tp_region` VALUES ('2148', '255', '盘山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2149', '256', '银州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2150', '256', '清河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2151', '256', '调兵山市', '3', '0');
INSERT INTO `tp_region` VALUES ('2152', '256', '开原市', '3', '0');
INSERT INTO `tp_region` VALUES ('2153', '256', '铁岭县', '3', '0');
INSERT INTO `tp_region` VALUES ('2154', '256', '西丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2155', '256', '昌图县', '3', '0');
INSERT INTO `tp_region` VALUES ('2156', '257', '站前区', '3', '0');
INSERT INTO `tp_region` VALUES ('2157', '257', '西市区', '3', '0');
INSERT INTO `tp_region` VALUES ('2158', '257', '鲅鱼圈区', '3', '0');
INSERT INTO `tp_region` VALUES ('2159', '257', '老边区', '3', '0');
INSERT INTO `tp_region` VALUES ('2160', '257', '盖州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2161', '257', '大石桥市', '3', '0');
INSERT INTO `tp_region` VALUES ('2162', '258', '回民区', '3', '0');
INSERT INTO `tp_region` VALUES ('2163', '258', '玉泉区', '3', '0');
INSERT INTO `tp_region` VALUES ('2164', '258', '新城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2165', '258', '赛罕区', '3', '0');
INSERT INTO `tp_region` VALUES ('2166', '258', '清水河县', '3', '0');
INSERT INTO `tp_region` VALUES ('2167', '258', '土默特左旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2168', '258', '托克托县', '3', '0');
INSERT INTO `tp_region` VALUES ('2169', '258', '和林格尔县', '3', '0');
INSERT INTO `tp_region` VALUES ('2170', '258', '武川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2171', '259', '阿拉善左旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2172', '259', '阿拉善右旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2173', '259', '额济纳旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2174', '260', '临河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2175', '260', '五原县', '3', '0');
INSERT INTO `tp_region` VALUES ('2176', '260', '磴口县', '3', '0');
INSERT INTO `tp_region` VALUES ('2177', '260', '乌拉特前旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2178', '260', '乌拉特中旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2179', '260', '乌拉特后旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2180', '260', '杭锦后旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2181', '261', '昆都仑区', '3', '0');
INSERT INTO `tp_region` VALUES ('2182', '261', '青山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2183', '261', '东河区', '3', '0');
INSERT INTO `tp_region` VALUES ('2184', '261', '九原区', '3', '0');
INSERT INTO `tp_region` VALUES ('2185', '261', '石拐区', '3', '0');
INSERT INTO `tp_region` VALUES ('2186', '261', '白云矿区', '3', '0');
INSERT INTO `tp_region` VALUES ('2187', '261', '土默特右旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2188', '261', '固阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2190', '262', '红山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2191', '262', '元宝山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2192', '262', '松山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2194', '262', '巴林左旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2195', '262', '巴林右旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2196', '262', '林西县', '3', '0');
INSERT INTO `tp_region` VALUES ('2197', '262', '克什克腾旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2198', '262', '翁牛特旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2199', '262', '喀喇沁旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2200', '262', '宁城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2201', '262', '敖汉旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2202', '263', '东胜区', '3', '0');
INSERT INTO `tp_region` VALUES ('2203', '263', '达拉特旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2204', '263', '准格尔旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2205', '263', '鄂托克前旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2206', '263', '鄂托克旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2207', '263', '杭锦旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2208', '263', '乌审旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2209', '263', '伊金霍洛旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2210', '264', '海拉尔区', '3', '0');
INSERT INTO `tp_region` VALUES ('2211', '264', '莫力达瓦', '3', '0');
INSERT INTO `tp_region` VALUES ('2212', '264', '满洲里市', '3', '0');
INSERT INTO `tp_region` VALUES ('2213', '264', '牙克石市', '3', '0');
INSERT INTO `tp_region` VALUES ('2214', '264', '扎兰屯市', '3', '0');
INSERT INTO `tp_region` VALUES ('2215', '264', '额尔古纳市', '3', '0');
INSERT INTO `tp_region` VALUES ('2216', '264', '根河市', '3', '0');
INSERT INTO `tp_region` VALUES ('2217', '264', '阿荣旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2223', '265', '科尔沁区', '3', '0');
INSERT INTO `tp_region` VALUES ('2224', '265', '霍林郭勒市', '3', '0');
INSERT INTO `tp_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2227', '265', '开鲁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2228', '265', '库伦旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2229', '265', '奈曼旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2230', '265', '扎鲁特旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2231', '266', '海勃湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('2232', '266', '乌达区', '3', '0');
INSERT INTO `tp_region` VALUES ('2233', '266', '海南区', '3', '0');
INSERT INTO `tp_region` VALUES ('2234', '267', '化德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2235', '267', '集宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('2236', '267', '丰镇市', '3', '0');
INSERT INTO `tp_region` VALUES ('2237', '267', '卓资县', '3', '0');
INSERT INTO `tp_region` VALUES ('2238', '267', '商都县', '3', '0');
INSERT INTO `tp_region` VALUES ('2239', '267', '兴和县', '3', '0');
INSERT INTO `tp_region` VALUES ('2240', '267', '凉城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2244', '267', '四子王旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2245', '268', '二连浩特市', '3', '0');
INSERT INTO `tp_region` VALUES ('2246', '268', '锡林浩特市', '3', '0');
INSERT INTO `tp_region` VALUES ('2247', '268', '阿巴嘎旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2248', '268', '苏尼特左旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2249', '268', '苏尼特右旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2252', '268', '太仆寺旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2253', '268', '镶黄旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2254', '268', '正镶白旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2255', '268', '正蓝旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2256', '268', '多伦县', '3', '0');
INSERT INTO `tp_region` VALUES ('2257', '269', '乌兰浩特市', '3', '0');
INSERT INTO `tp_region` VALUES ('2258', '269', '阿尔山市', '3', '0');
INSERT INTO `tp_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2261', '269', '扎赉特旗', '3', '0');
INSERT INTO `tp_region` VALUES ('2262', '269', '突泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2263', '270', '西夏区', '3', '0');
INSERT INTO `tp_region` VALUES ('2264', '270', '金凤区', '3', '0');
INSERT INTO `tp_region` VALUES ('2265', '270', '兴庆区', '3', '0');
INSERT INTO `tp_region` VALUES ('2266', '270', '灵武市', '3', '0');
INSERT INTO `tp_region` VALUES ('2267', '270', '永宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2268', '270', '贺兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2269', '271', '原州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2270', '271', '海原县', '3', '0');
INSERT INTO `tp_region` VALUES ('2271', '271', '西吉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2272', '271', '隆德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2273', '271', '泾源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2274', '271', '彭阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2275', '272', '惠农县', '3', '0');
INSERT INTO `tp_region` VALUES ('2276', '272', '大武口区', '3', '0');
INSERT INTO `tp_region` VALUES ('2277', '272', '惠农区', '3', '0');
INSERT INTO `tp_region` VALUES ('2278', '272', '陶乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2279', '272', '平罗县', '3', '0');
INSERT INTO `tp_region` VALUES ('2280', '273', '利通区', '3', '0');
INSERT INTO `tp_region` VALUES ('2281', '273', '中卫县', '3', '0');
INSERT INTO `tp_region` VALUES ('2282', '273', '青铜峡市', '3', '0');
INSERT INTO `tp_region` VALUES ('2283', '273', '中宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2284', '273', '盐池县', '3', '0');
INSERT INTO `tp_region` VALUES ('2285', '273', '同心县', '3', '0');
INSERT INTO `tp_region` VALUES ('2286', '274', '沙坡头区', '3', '0');
INSERT INTO `tp_region` VALUES ('2287', '274', '海原县', '3', '0');
INSERT INTO `tp_region` VALUES ('2288', '274', '中宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2289', '275', '城中区', '3', '0');
INSERT INTO `tp_region` VALUES ('2290', '275', '城东区', '3', '0');
INSERT INTO `tp_region` VALUES ('2291', '275', '城西区', '3', '0');
INSERT INTO `tp_region` VALUES ('2292', '275', '城北区', '3', '0');
INSERT INTO `tp_region` VALUES ('2293', '275', '湟中县', '3', '0');
INSERT INTO `tp_region` VALUES ('2294', '275', '湟源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2295', '275', '大通', '3', '0');
INSERT INTO `tp_region` VALUES ('2296', '276', '玛沁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2297', '276', '班玛县', '3', '0');
INSERT INTO `tp_region` VALUES ('2298', '276', '甘德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2299', '276', '达日县', '3', '0');
INSERT INTO `tp_region` VALUES ('2300', '276', '久治县', '3', '0');
INSERT INTO `tp_region` VALUES ('2301', '276', '玛多县', '3', '0');
INSERT INTO `tp_region` VALUES ('2302', '277', '海晏县', '3', '0');
INSERT INTO `tp_region` VALUES ('2303', '277', '祁连县', '3', '0');
INSERT INTO `tp_region` VALUES ('2304', '277', '刚察县', '3', '0');
INSERT INTO `tp_region` VALUES ('2305', '277', '门源', '3', '0');
INSERT INTO `tp_region` VALUES ('2306', '278', '平安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2307', '278', '乐都县', '3', '0');
INSERT INTO `tp_region` VALUES ('2308', '278', '民和', '3', '0');
INSERT INTO `tp_region` VALUES ('2309', '278', '互助', '3', '0');
INSERT INTO `tp_region` VALUES ('2310', '278', '化隆', '3', '0');
INSERT INTO `tp_region` VALUES ('2311', '278', '循化', '3', '0');
INSERT INTO `tp_region` VALUES ('2312', '279', '共和县', '3', '0');
INSERT INTO `tp_region` VALUES ('2313', '279', '同德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2314', '279', '贵德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2315', '279', '兴海县', '3', '0');
INSERT INTO `tp_region` VALUES ('2316', '279', '贵南县', '3', '0');
INSERT INTO `tp_region` VALUES ('2317', '280', '德令哈市', '3', '0');
INSERT INTO `tp_region` VALUES ('2318', '280', '格尔木市', '3', '0');
INSERT INTO `tp_region` VALUES ('2319', '280', '乌兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2320', '280', '都兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2321', '280', '天峻县', '3', '0');
INSERT INTO `tp_region` VALUES ('2322', '281', '同仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2323', '281', '尖扎县', '3', '0');
INSERT INTO `tp_region` VALUES ('2324', '281', '泽库县', '3', '0');
INSERT INTO `tp_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', '0');
INSERT INTO `tp_region` VALUES ('2326', '282', '玉树县', '3', '0');
INSERT INTO `tp_region` VALUES ('2327', '282', '杂多县', '3', '0');
INSERT INTO `tp_region` VALUES ('2328', '282', '称多县', '3', '0');
INSERT INTO `tp_region` VALUES ('2329', '282', '治多县', '3', '0');
INSERT INTO `tp_region` VALUES ('2330', '282', '囊谦县', '3', '0');
INSERT INTO `tp_region` VALUES ('2331', '282', '曲麻莱县', '3', '0');
INSERT INTO `tp_region` VALUES ('2332', '283', '市中区', '3', '0');
INSERT INTO `tp_region` VALUES ('2333', '283', '历下区', '3', '0');
INSERT INTO `tp_region` VALUES ('2334', '283', '天桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('2335', '283', '槐荫区', '3', '0');
INSERT INTO `tp_region` VALUES ('2336', '283', '历城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2337', '283', '长清区', '3', '0');
INSERT INTO `tp_region` VALUES ('2338', '283', '章丘市', '3', '0');
INSERT INTO `tp_region` VALUES ('2339', '283', '平阴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2340', '283', '济阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2341', '283', '商河县', '3', '0');
INSERT INTO `tp_region` VALUES ('2342', '284', '市南区', '3', '0');
INSERT INTO `tp_region` VALUES ('2343', '284', '市北区', '3', '0');
INSERT INTO `tp_region` VALUES ('2344', '284', '城阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('2345', '284', '四方区', '3', '0');
INSERT INTO `tp_region` VALUES ('2346', '284', '李沧区', '3', '0');
INSERT INTO `tp_region` VALUES ('2347', '284', '黄岛区', '3', '0');
INSERT INTO `tp_region` VALUES ('2348', '284', '崂山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2349', '284', '胶州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2350', '284', '即墨市', '3', '0');
INSERT INTO `tp_region` VALUES ('2351', '284', '平度市', '3', '0');
INSERT INTO `tp_region` VALUES ('2352', '284', '胶南市', '3', '0');
INSERT INTO `tp_region` VALUES ('2353', '284', '莱西市', '3', '0');
INSERT INTO `tp_region` VALUES ('2354', '285', '滨城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2355', '285', '惠民县', '3', '0');
INSERT INTO `tp_region` VALUES ('2356', '285', '阳信县', '3', '0');
INSERT INTO `tp_region` VALUES ('2357', '285', '无棣县', '3', '0');
INSERT INTO `tp_region` VALUES ('2358', '285', '沾化县', '3', '0');
INSERT INTO `tp_region` VALUES ('2359', '285', '博兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2360', '285', '邹平县', '3', '0');
INSERT INTO `tp_region` VALUES ('2361', '286', '德城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2362', '286', '陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('2363', '286', '乐陵市', '3', '0');
INSERT INTO `tp_region` VALUES ('2364', '286', '禹城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2365', '286', '宁津县', '3', '0');
INSERT INTO `tp_region` VALUES ('2366', '286', '庆云县', '3', '0');
INSERT INTO `tp_region` VALUES ('2367', '286', '临邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2368', '286', '齐河县', '3', '0');
INSERT INTO `tp_region` VALUES ('2369', '286', '平原县', '3', '0');
INSERT INTO `tp_region` VALUES ('2370', '286', '夏津县', '3', '0');
INSERT INTO `tp_region` VALUES ('2371', '286', '武城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2372', '287', '东营区', '3', '0');
INSERT INTO `tp_region` VALUES ('2373', '287', '河口区', '3', '0');
INSERT INTO `tp_region` VALUES ('2374', '287', '垦利县', '3', '0');
INSERT INTO `tp_region` VALUES ('2375', '287', '利津县', '3', '0');
INSERT INTO `tp_region` VALUES ('2376', '287', '广饶县', '3', '0');
INSERT INTO `tp_region` VALUES ('2377', '288', '牡丹区', '3', '0');
INSERT INTO `tp_region` VALUES ('2378', '288', '曹县', '3', '0');
INSERT INTO `tp_region` VALUES ('2379', '288', '单县', '3', '0');
INSERT INTO `tp_region` VALUES ('2380', '288', '成武县', '3', '0');
INSERT INTO `tp_region` VALUES ('2381', '288', '巨野县', '3', '0');
INSERT INTO `tp_region` VALUES ('2382', '288', '郓城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2383', '288', '鄄城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2384', '288', '定陶县', '3', '0');
INSERT INTO `tp_region` VALUES ('2385', '288', '东明县', '3', '0');
INSERT INTO `tp_region` VALUES ('2386', '289', '市中区', '3', '0');
INSERT INTO `tp_region` VALUES ('2387', '289', '任城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2388', '289', '曲阜市', '3', '0');
INSERT INTO `tp_region` VALUES ('2389', '289', '兖州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2390', '289', '邹城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2391', '289', '微山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2392', '289', '鱼台县', '3', '0');
INSERT INTO `tp_region` VALUES ('2393', '289', '金乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('2394', '289', '嘉祥县', '3', '0');
INSERT INTO `tp_region` VALUES ('2395', '289', '汶上县', '3', '0');
INSERT INTO `tp_region` VALUES ('2396', '289', '泗水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2397', '289', '梁山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2398', '290', '莱城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2399', '290', '钢城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2400', '291', '东昌府区', '3', '0');
INSERT INTO `tp_region` VALUES ('2401', '291', '临清市', '3', '0');
INSERT INTO `tp_region` VALUES ('2402', '291', '阳谷县', '3', '0');
INSERT INTO `tp_region` VALUES ('2403', '291', '莘县', '3', '0');
INSERT INTO `tp_region` VALUES ('2404', '291', '茌平县', '3', '0');
INSERT INTO `tp_region` VALUES ('2405', '291', '东阿县', '3', '0');
INSERT INTO `tp_region` VALUES ('2406', '291', '冠县', '3', '0');
INSERT INTO `tp_region` VALUES ('2407', '291', '高唐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2408', '292', '兰山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2409', '292', '罗庄区', '3', '0');
INSERT INTO `tp_region` VALUES ('2410', '292', '河东区', '3', '0');
INSERT INTO `tp_region` VALUES ('2411', '292', '沂南县', '3', '0');
INSERT INTO `tp_region` VALUES ('2412', '292', '郯城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2413', '292', '沂水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2414', '292', '苍山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2415', '292', '费县', '3', '0');
INSERT INTO `tp_region` VALUES ('2416', '292', '平邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2417', '292', '莒南县', '3', '0');
INSERT INTO `tp_region` VALUES ('2418', '292', '蒙阴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2419', '292', '临沭县', '3', '0');
INSERT INTO `tp_region` VALUES ('2420', '293', '东港区', '3', '0');
INSERT INTO `tp_region` VALUES ('2421', '293', '岚山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2422', '293', '五莲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2423', '293', '莒县', '3', '0');
INSERT INTO `tp_region` VALUES ('2424', '294', '泰山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2425', '294', '岱岳区', '3', '0');
INSERT INTO `tp_region` VALUES ('2426', '294', '新泰市', '3', '0');
INSERT INTO `tp_region` VALUES ('2427', '294', '肥城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2428', '294', '宁阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2429', '294', '东平县', '3', '0');
INSERT INTO `tp_region` VALUES ('2430', '295', '荣成市', '3', '0');
INSERT INTO `tp_region` VALUES ('2431', '295', '乳山市', '3', '0');
INSERT INTO `tp_region` VALUES ('2432', '295', '环翠区', '3', '0');
INSERT INTO `tp_region` VALUES ('2433', '295', '文登市', '3', '0');
INSERT INTO `tp_region` VALUES ('2434', '296', '潍城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2435', '296', '寒亭区', '3', '0');
INSERT INTO `tp_region` VALUES ('2436', '296', '坊子区', '3', '0');
INSERT INTO `tp_region` VALUES ('2437', '296', '奎文区', '3', '0');
INSERT INTO `tp_region` VALUES ('2438', '296', '青州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2439', '296', '诸城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2440', '296', '寿光市', '3', '0');
INSERT INTO `tp_region` VALUES ('2441', '296', '安丘市', '3', '0');
INSERT INTO `tp_region` VALUES ('2442', '296', '高密市', '3', '0');
INSERT INTO `tp_region` VALUES ('2443', '296', '昌邑市', '3', '0');
INSERT INTO `tp_region` VALUES ('2444', '296', '临朐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2445', '296', '昌乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2446', '297', '芝罘区', '3', '0');
INSERT INTO `tp_region` VALUES ('2447', '297', '福山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2448', '297', '牟平区', '3', '0');
INSERT INTO `tp_region` VALUES ('2449', '297', '莱山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2450', '297', '开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('2451', '297', '龙口市', '3', '0');
INSERT INTO `tp_region` VALUES ('2452', '297', '莱阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('2453', '297', '莱州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2454', '297', '蓬莱市', '3', '0');
INSERT INTO `tp_region` VALUES ('2455', '297', '招远市', '3', '0');
INSERT INTO `tp_region` VALUES ('2456', '297', '栖霞市', '3', '0');
INSERT INTO `tp_region` VALUES ('2457', '297', '海阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('2458', '297', '长岛县', '3', '0');
INSERT INTO `tp_region` VALUES ('2459', '298', '市中区', '3', '0');
INSERT INTO `tp_region` VALUES ('2460', '298', '山亭区', '3', '0');
INSERT INTO `tp_region` VALUES ('2461', '298', '峄城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2462', '298', '台儿庄区', '3', '0');
INSERT INTO `tp_region` VALUES ('2463', '298', '薛城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2464', '298', '滕州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2465', '299', '张店区', '3', '0');
INSERT INTO `tp_region` VALUES ('2466', '299', '临淄区', '3', '0');
INSERT INTO `tp_region` VALUES ('2467', '299', '淄川区', '3', '0');
INSERT INTO `tp_region` VALUES ('2468', '299', '博山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2469', '299', '周村区', '3', '0');
INSERT INTO `tp_region` VALUES ('2470', '299', '桓台县', '3', '0');
INSERT INTO `tp_region` VALUES ('2471', '299', '高青县', '3', '0');
INSERT INTO `tp_region` VALUES ('2472', '299', '沂源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2473', '300', '杏花岭区', '3', '0');
INSERT INTO `tp_region` VALUES ('2474', '300', '小店区', '3', '0');
INSERT INTO `tp_region` VALUES ('2475', '300', '迎泽区', '3', '0');
INSERT INTO `tp_region` VALUES ('2476', '300', '尖草坪区', '3', '0');
INSERT INTO `tp_region` VALUES ('2477', '300', '万柏林区', '3', '0');
INSERT INTO `tp_region` VALUES ('2478', '300', '晋源区', '3', '0');
INSERT INTO `tp_region` VALUES ('2479', '300', '高新开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('2480', '300', '民营经济开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('2481', '300', '经济技术开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('2482', '300', '清徐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2483', '300', '阳曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2484', '300', '娄烦县', '3', '0');
INSERT INTO `tp_region` VALUES ('2485', '300', '古交市', '3', '0');
INSERT INTO `tp_region` VALUES ('2486', '301', '城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2487', '301', '郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('2488', '301', '沁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2489', '301', '潞城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2490', '301', '长治县', '3', '0');
INSERT INTO `tp_region` VALUES ('2491', '301', '襄垣县', '3', '0');
INSERT INTO `tp_region` VALUES ('2492', '301', '屯留县', '3', '0');
INSERT INTO `tp_region` VALUES ('2493', '301', '平顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('2494', '301', '黎城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2495', '301', '壶关县', '3', '0');
INSERT INTO `tp_region` VALUES ('2496', '301', '长子县', '3', '0');
INSERT INTO `tp_region` VALUES ('2497', '301', '武乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('2498', '301', '沁源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2499', '302', '城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2500', '302', '矿区', '3', '0');
INSERT INTO `tp_region` VALUES ('2501', '302', '南郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('2502', '302', '新荣区', '3', '0');
INSERT INTO `tp_region` VALUES ('2503', '302', '阳高县', '3', '0');
INSERT INTO `tp_region` VALUES ('2504', '302', '天镇县', '3', '0');
INSERT INTO `tp_region` VALUES ('2505', '302', '广灵县', '3', '0');
INSERT INTO `tp_region` VALUES ('2506', '302', '灵丘县', '3', '0');
INSERT INTO `tp_region` VALUES ('2507', '302', '浑源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2508', '302', '左云县', '3', '0');
INSERT INTO `tp_region` VALUES ('2509', '302', '大同县', '3', '0');
INSERT INTO `tp_region` VALUES ('2510', '303', '城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2511', '303', '高平市', '3', '0');
INSERT INTO `tp_region` VALUES ('2512', '303', '沁水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2513', '303', '阳城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2514', '303', '陵川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2515', '303', '泽州县', '3', '0');
INSERT INTO `tp_region` VALUES ('2516', '304', '榆次区', '3', '0');
INSERT INTO `tp_region` VALUES ('2517', '304', '介休市', '3', '0');
INSERT INTO `tp_region` VALUES ('2518', '304', '榆社县', '3', '0');
INSERT INTO `tp_region` VALUES ('2519', '304', '左权县', '3', '0');
INSERT INTO `tp_region` VALUES ('2520', '304', '和顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('2521', '304', '昔阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2522', '304', '寿阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2523', '304', '太谷县', '3', '0');
INSERT INTO `tp_region` VALUES ('2524', '304', '祁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2525', '304', '平遥县', '3', '0');
INSERT INTO `tp_region` VALUES ('2526', '304', '灵石县', '3', '0');
INSERT INTO `tp_region` VALUES ('2527', '305', '尧都区', '3', '0');
INSERT INTO `tp_region` VALUES ('2528', '305', '侯马市', '3', '0');
INSERT INTO `tp_region` VALUES ('2529', '305', '霍州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2530', '305', '曲沃县', '3', '0');
INSERT INTO `tp_region` VALUES ('2531', '305', '翼城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2532', '305', '襄汾县', '3', '0');
INSERT INTO `tp_region` VALUES ('2533', '305', '洪洞县', '3', '0');
INSERT INTO `tp_region` VALUES ('2534', '305', '吉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2535', '305', '安泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('2536', '305', '浮山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2537', '305', '古县', '3', '0');
INSERT INTO `tp_region` VALUES ('2538', '305', '乡宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2539', '305', '大宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2540', '305', '隰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2541', '305', '永和县', '3', '0');
INSERT INTO `tp_region` VALUES ('2542', '305', '蒲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2543', '305', '汾西县', '3', '0');
INSERT INTO `tp_region` VALUES ('2544', '306', '离石市', '3', '0');
INSERT INTO `tp_region` VALUES ('2545', '306', '离石区', '3', '0');
INSERT INTO `tp_region` VALUES ('2546', '306', '孝义市', '3', '0');
INSERT INTO `tp_region` VALUES ('2547', '306', '汾阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('2548', '306', '文水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2549', '306', '交城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2550', '306', '兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2551', '306', '临县', '3', '0');
INSERT INTO `tp_region` VALUES ('2552', '306', '柳林县', '3', '0');
INSERT INTO `tp_region` VALUES ('2553', '306', '石楼县', '3', '0');
INSERT INTO `tp_region` VALUES ('2554', '306', '岚县', '3', '0');
INSERT INTO `tp_region` VALUES ('2555', '306', '方山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2556', '306', '中阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2557', '306', '交口县', '3', '0');
INSERT INTO `tp_region` VALUES ('2558', '307', '朔城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2559', '307', '平鲁区', '3', '0');
INSERT INTO `tp_region` VALUES ('2560', '307', '山阴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2561', '307', '应县', '3', '0');
INSERT INTO `tp_region` VALUES ('2562', '307', '右玉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2563', '307', '怀仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2564', '308', '忻府区', '3', '0');
INSERT INTO `tp_region` VALUES ('2565', '308', '原平市', '3', '0');
INSERT INTO `tp_region` VALUES ('2566', '308', '定襄县', '3', '0');
INSERT INTO `tp_region` VALUES ('2567', '308', '五台县', '3', '0');
INSERT INTO `tp_region` VALUES ('2568', '308', '代县', '3', '0');
INSERT INTO `tp_region` VALUES ('2569', '308', '繁峙县', '3', '0');
INSERT INTO `tp_region` VALUES ('2570', '308', '宁武县', '3', '0');
INSERT INTO `tp_region` VALUES ('2571', '308', '静乐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2572', '308', '神池县', '3', '0');
INSERT INTO `tp_region` VALUES ('2573', '308', '五寨县', '3', '0');
INSERT INTO `tp_region` VALUES ('2574', '308', '岢岚县', '3', '0');
INSERT INTO `tp_region` VALUES ('2575', '308', '河曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2576', '308', '保德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2577', '308', '偏关县', '3', '0');
INSERT INTO `tp_region` VALUES ('2578', '309', '城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2579', '309', '矿区', '3', '0');
INSERT INTO `tp_region` VALUES ('2580', '309', '郊区', '3', '0');
INSERT INTO `tp_region` VALUES ('2581', '309', '平定县', '3', '0');
INSERT INTO `tp_region` VALUES ('2582', '309', '盂县', '3', '0');
INSERT INTO `tp_region` VALUES ('2583', '310', '盐湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('2584', '310', '永济市', '3', '0');
INSERT INTO `tp_region` VALUES ('2585', '310', '河津市', '3', '0');
INSERT INTO `tp_region` VALUES ('2586', '310', '临猗县', '3', '0');
INSERT INTO `tp_region` VALUES ('2587', '310', '万荣县', '3', '0');
INSERT INTO `tp_region` VALUES ('2588', '310', '闻喜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2589', '310', '稷山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2590', '310', '新绛县', '3', '0');
INSERT INTO `tp_region` VALUES ('2591', '310', '绛县', '3', '0');
INSERT INTO `tp_region` VALUES ('2592', '310', '垣曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2593', '310', '夏县', '3', '0');
INSERT INTO `tp_region` VALUES ('2594', '310', '平陆县', '3', '0');
INSERT INTO `tp_region` VALUES ('2595', '310', '芮城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2596', '311', '莲湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('2597', '311', '新城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2598', '311', '碑林区', '3', '0');
INSERT INTO `tp_region` VALUES ('2599', '311', '雁塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('2600', '311', '灞桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('2601', '311', '未央区', '3', '0');
INSERT INTO `tp_region` VALUES ('2602', '311', '阎良区', '3', '0');
INSERT INTO `tp_region` VALUES ('2603', '311', '临潼区', '3', '0');
INSERT INTO `tp_region` VALUES ('2604', '311', '长安区', '3', '0');
INSERT INTO `tp_region` VALUES ('2605', '311', '蓝田县', '3', '0');
INSERT INTO `tp_region` VALUES ('2606', '311', '周至县', '3', '0');
INSERT INTO `tp_region` VALUES ('2607', '311', '户县', '3', '0');
INSERT INTO `tp_region` VALUES ('2608', '311', '高陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('2609', '312', '汉滨区', '3', '0');
INSERT INTO `tp_region` VALUES ('2610', '312', '汉阴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2611', '312', '石泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2612', '312', '宁陕县', '3', '0');
INSERT INTO `tp_region` VALUES ('2613', '312', '紫阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2614', '312', '岚皋县', '3', '0');
INSERT INTO `tp_region` VALUES ('2615', '312', '平利县', '3', '0');
INSERT INTO `tp_region` VALUES ('2616', '312', '镇坪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2617', '312', '旬阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2618', '312', '白河县', '3', '0');
INSERT INTO `tp_region` VALUES ('2619', '313', '陈仓区', '3', '0');
INSERT INTO `tp_region` VALUES ('2620', '313', '渭滨区', '3', '0');
INSERT INTO `tp_region` VALUES ('2621', '313', '金台区', '3', '0');
INSERT INTO `tp_region` VALUES ('2622', '313', '凤翔县', '3', '0');
INSERT INTO `tp_region` VALUES ('2623', '313', '岐山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2624', '313', '扶风县', '3', '0');
INSERT INTO `tp_region` VALUES ('2625', '313', '眉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2626', '313', '陇县', '3', '0');
INSERT INTO `tp_region` VALUES ('2627', '313', '千阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2628', '313', '麟游县', '3', '0');
INSERT INTO `tp_region` VALUES ('2629', '313', '凤县', '3', '0');
INSERT INTO `tp_region` VALUES ('2630', '313', '太白县', '3', '0');
INSERT INTO `tp_region` VALUES ('2631', '314', '汉台区', '3', '0');
INSERT INTO `tp_region` VALUES ('2632', '314', '南郑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2633', '314', '城固县', '3', '0');
INSERT INTO `tp_region` VALUES ('2634', '314', '洋县', '3', '0');
INSERT INTO `tp_region` VALUES ('2635', '314', '西乡县', '3', '0');
INSERT INTO `tp_region` VALUES ('2636', '314', '勉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2637', '314', '宁强县', '3', '0');
INSERT INTO `tp_region` VALUES ('2638', '314', '略阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2639', '314', '镇巴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2640', '314', '留坝县', '3', '0');
INSERT INTO `tp_region` VALUES ('2641', '314', '佛坪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2642', '315', '商州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2643', '315', '洛南县', '3', '0');
INSERT INTO `tp_region` VALUES ('2644', '315', '丹凤县', '3', '0');
INSERT INTO `tp_region` VALUES ('2645', '315', '商南县', '3', '0');
INSERT INTO `tp_region` VALUES ('2646', '315', '山阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2647', '315', '镇安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2648', '315', '柞水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2649', '316', '耀州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2650', '316', '王益区', '3', '0');
INSERT INTO `tp_region` VALUES ('2651', '316', '印台区', '3', '0');
INSERT INTO `tp_region` VALUES ('2652', '316', '宜君县', '3', '0');
INSERT INTO `tp_region` VALUES ('2653', '317', '临渭区', '3', '0');
INSERT INTO `tp_region` VALUES ('2654', '317', '韩城市', '3', '0');
INSERT INTO `tp_region` VALUES ('2655', '317', '华阴市', '3', '0');
INSERT INTO `tp_region` VALUES ('2656', '317', '华县', '3', '0');
INSERT INTO `tp_region` VALUES ('2657', '317', '潼关县', '3', '0');
INSERT INTO `tp_region` VALUES ('2658', '317', '大荔县', '3', '0');
INSERT INTO `tp_region` VALUES ('2659', '317', '合阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2660', '317', '澄城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2661', '317', '蒲城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2662', '317', '白水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2663', '317', '富平县', '3', '0');
INSERT INTO `tp_region` VALUES ('2664', '318', '秦都区', '3', '0');
INSERT INTO `tp_region` VALUES ('2665', '318', '渭城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2666', '318', '杨陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('2667', '318', '兴平市', '3', '0');
INSERT INTO `tp_region` VALUES ('2668', '318', '三原县', '3', '0');
INSERT INTO `tp_region` VALUES ('2669', '318', '泾阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2670', '318', '乾县', '3', '0');
INSERT INTO `tp_region` VALUES ('2671', '318', '礼泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2672', '318', '永寿县', '3', '0');
INSERT INTO `tp_region` VALUES ('2673', '318', '彬县', '3', '0');
INSERT INTO `tp_region` VALUES ('2674', '318', '长武县', '3', '0');
INSERT INTO `tp_region` VALUES ('2675', '318', '旬邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2676', '318', '淳化县', '3', '0');
INSERT INTO `tp_region` VALUES ('2677', '318', '武功县', '3', '0');
INSERT INTO `tp_region` VALUES ('2678', '319', '吴起县', '3', '0');
INSERT INTO `tp_region` VALUES ('2679', '319', '宝塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('2680', '319', '延长县', '3', '0');
INSERT INTO `tp_region` VALUES ('2681', '319', '延川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2682', '319', '子长县', '3', '0');
INSERT INTO `tp_region` VALUES ('2683', '319', '安塞县', '3', '0');
INSERT INTO `tp_region` VALUES ('2684', '319', '志丹县', '3', '0');
INSERT INTO `tp_region` VALUES ('2685', '319', '甘泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2686', '319', '富县', '3', '0');
INSERT INTO `tp_region` VALUES ('2687', '319', '洛川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2688', '319', '宜川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2689', '319', '黄龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('2690', '319', '黄陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('2691', '320', '榆阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('2692', '320', '神木县', '3', '0');
INSERT INTO `tp_region` VALUES ('2693', '320', '府谷县', '3', '0');
INSERT INTO `tp_region` VALUES ('2694', '320', '横山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2695', '320', '靖边县', '3', '0');
INSERT INTO `tp_region` VALUES ('2696', '320', '定边县', '3', '0');
INSERT INTO `tp_region` VALUES ('2697', '320', '绥德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2698', '320', '米脂县', '3', '0');
INSERT INTO `tp_region` VALUES ('2699', '320', '佳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2700', '320', '吴堡县', '3', '0');
INSERT INTO `tp_region` VALUES ('2701', '320', '清涧县', '3', '0');
INSERT INTO `tp_region` VALUES ('2702', '320', '子洲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2703', '321', '长宁区', '3', '0');
INSERT INTO `tp_region` VALUES ('2704', '321', '闸北区', '3', '0');
INSERT INTO `tp_region` VALUES ('2705', '321', '闵行区', '3', '0');
INSERT INTO `tp_region` VALUES ('2706', '321', '徐汇区', '3', '0');
INSERT INTO `tp_region` VALUES ('2707', '321', '浦东新区', '3', '0');
INSERT INTO `tp_region` VALUES ('2708', '321', '杨浦区', '3', '0');
INSERT INTO `tp_region` VALUES ('2709', '321', '普陀区', '3', '0');
INSERT INTO `tp_region` VALUES ('2710', '321', '静安区', '3', '0');
INSERT INTO `tp_region` VALUES ('2711', '321', '卢湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('2712', '321', '虹口区', '3', '0');
INSERT INTO `tp_region` VALUES ('2713', '321', '黄浦区', '3', '0');
INSERT INTO `tp_region` VALUES ('2714', '321', '南汇区', '3', '0');
INSERT INTO `tp_region` VALUES ('2715', '321', '松江区', '3', '0');
INSERT INTO `tp_region` VALUES ('2716', '321', '嘉定区', '3', '0');
INSERT INTO `tp_region` VALUES ('2717', '321', '宝山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2718', '321', '青浦区', '3', '0');
INSERT INTO `tp_region` VALUES ('2719', '321', '金山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2720', '321', '奉贤区', '3', '0');
INSERT INTO `tp_region` VALUES ('2721', '321', '崇明县', '3', '0');
INSERT INTO `tp_region` VALUES ('2722', '322', '青羊区', '3', '0');
INSERT INTO `tp_region` VALUES ('2723', '322', '锦江区', '3', '0');
INSERT INTO `tp_region` VALUES ('2724', '322', '金牛区', '3', '0');
INSERT INTO `tp_region` VALUES ('2725', '322', '武侯区', '3', '0');
INSERT INTO `tp_region` VALUES ('2726', '322', '成华区', '3', '0');
INSERT INTO `tp_region` VALUES ('2727', '322', '龙泉驿区', '3', '0');
INSERT INTO `tp_region` VALUES ('2728', '322', '青白江区', '3', '0');
INSERT INTO `tp_region` VALUES ('2729', '322', '新都区', '3', '0');
INSERT INTO `tp_region` VALUES ('2730', '322', '温江区', '3', '0');
INSERT INTO `tp_region` VALUES ('2731', '322', '高新区', '3', '0');
INSERT INTO `tp_region` VALUES ('2732', '322', '高新西区', '3', '0');
INSERT INTO `tp_region` VALUES ('2733', '322', '都江堰市', '3', '0');
INSERT INTO `tp_region` VALUES ('2734', '322', '彭州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2735', '322', '邛崃市', '3', '0');
INSERT INTO `tp_region` VALUES ('2736', '322', '崇州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2737', '322', '金堂县', '3', '0');
INSERT INTO `tp_region` VALUES ('2738', '322', '双流县', '3', '0');
INSERT INTO `tp_region` VALUES ('2739', '322', '郫县', '3', '0');
INSERT INTO `tp_region` VALUES ('2740', '322', '大邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2741', '322', '蒲江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2742', '322', '新津县', '3', '0');
INSERT INTO `tp_region` VALUES ('2743', '322', '都江堰市', '3', '0');
INSERT INTO `tp_region` VALUES ('2744', '322', '彭州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2745', '322', '邛崃市', '3', '0');
INSERT INTO `tp_region` VALUES ('2746', '322', '崇州市', '3', '0');
INSERT INTO `tp_region` VALUES ('2747', '322', '金堂县', '3', '0');
INSERT INTO `tp_region` VALUES ('2748', '322', '双流县', '3', '0');
INSERT INTO `tp_region` VALUES ('2749', '322', '郫县', '3', '0');
INSERT INTO `tp_region` VALUES ('2750', '322', '大邑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2751', '322', '蒲江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2752', '322', '新津县', '3', '0');
INSERT INTO `tp_region` VALUES ('2753', '323', '涪城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2754', '323', '游仙区', '3', '0');
INSERT INTO `tp_region` VALUES ('2755', '323', '江油市', '3', '0');
INSERT INTO `tp_region` VALUES ('2756', '323', '盐亭县', '3', '0');
INSERT INTO `tp_region` VALUES ('2757', '323', '三台县', '3', '0');
INSERT INTO `tp_region` VALUES ('2758', '323', '平武县', '3', '0');
INSERT INTO `tp_region` VALUES ('2759', '323', '安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2760', '323', '梓潼县', '3', '0');
INSERT INTO `tp_region` VALUES ('2761', '323', '北川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2762', '324', '马尔康县', '3', '0');
INSERT INTO `tp_region` VALUES ('2763', '324', '汶川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2764', '324', '理县', '3', '0');
INSERT INTO `tp_region` VALUES ('2765', '324', '茂县', '3', '0');
INSERT INTO `tp_region` VALUES ('2766', '324', '松潘县', '3', '0');
INSERT INTO `tp_region` VALUES ('2767', '324', '九寨沟县', '3', '0');
INSERT INTO `tp_region` VALUES ('2768', '324', '金川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2769', '324', '小金县', '3', '0');
INSERT INTO `tp_region` VALUES ('2770', '324', '黑水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2771', '324', '壤塘县', '3', '0');
INSERT INTO `tp_region` VALUES ('2772', '324', '阿坝县', '3', '0');
INSERT INTO `tp_region` VALUES ('2773', '324', '若尔盖县', '3', '0');
INSERT INTO `tp_region` VALUES ('2774', '324', '红原县', '3', '0');
INSERT INTO `tp_region` VALUES ('2775', '325', '巴州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2776', '325', '通江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2777', '325', '南江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2778', '325', '平昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('2779', '326', '通川区', '3', '0');
INSERT INTO `tp_region` VALUES ('2780', '326', '万源市', '3', '0');
INSERT INTO `tp_region` VALUES ('2781', '326', '达县', '3', '0');
INSERT INTO `tp_region` VALUES ('2782', '326', '宣汉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2783', '326', '开江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2784', '326', '大竹县', '3', '0');
INSERT INTO `tp_region` VALUES ('2785', '326', '渠县', '3', '0');
INSERT INTO `tp_region` VALUES ('2786', '327', '旌阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('2787', '327', '广汉市', '3', '0');
INSERT INTO `tp_region` VALUES ('2788', '327', '什邡市', '3', '0');
INSERT INTO `tp_region` VALUES ('2789', '327', '绵竹市', '3', '0');
INSERT INTO `tp_region` VALUES ('2790', '327', '罗江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2791', '327', '中江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2792', '328', '康定县', '3', '0');
INSERT INTO `tp_region` VALUES ('2793', '328', '丹巴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2794', '328', '泸定县', '3', '0');
INSERT INTO `tp_region` VALUES ('2795', '328', '炉霍县', '3', '0');
INSERT INTO `tp_region` VALUES ('2796', '328', '九龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('2797', '328', '甘孜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2798', '328', '雅江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2799', '328', '新龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('2800', '328', '道孚县', '3', '0');
INSERT INTO `tp_region` VALUES ('2801', '328', '白玉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2802', '328', '理塘县', '3', '0');
INSERT INTO `tp_region` VALUES ('2803', '328', '德格县', '3', '0');
INSERT INTO `tp_region` VALUES ('2804', '328', '乡城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2805', '328', '石渠县', '3', '0');
INSERT INTO `tp_region` VALUES ('2806', '328', '稻城县', '3', '0');
INSERT INTO `tp_region` VALUES ('2807', '328', '色达县', '3', '0');
INSERT INTO `tp_region` VALUES ('2808', '328', '巴塘县', '3', '0');
INSERT INTO `tp_region` VALUES ('2809', '328', '得荣县', '3', '0');
INSERT INTO `tp_region` VALUES ('2810', '329', '广安区', '3', '0');
INSERT INTO `tp_region` VALUES ('2811', '329', '华蓥市', '3', '0');
INSERT INTO `tp_region` VALUES ('2812', '329', '岳池县', '3', '0');
INSERT INTO `tp_region` VALUES ('2813', '329', '武胜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2814', '329', '邻水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2815', '330', '利州区', '3', '0');
INSERT INTO `tp_region` VALUES ('2816', '330', '元坝区', '3', '0');
INSERT INTO `tp_region` VALUES ('2817', '330', '朝天区', '3', '0');
INSERT INTO `tp_region` VALUES ('2818', '330', '旺苍县', '3', '0');
INSERT INTO `tp_region` VALUES ('2819', '330', '青川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2820', '330', '剑阁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2821', '330', '苍溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2822', '331', '峨眉山市', '3', '0');
INSERT INTO `tp_region` VALUES ('2823', '331', '乐山市', '3', '0');
INSERT INTO `tp_region` VALUES ('2824', '331', '犍为县', '3', '0');
INSERT INTO `tp_region` VALUES ('2825', '331', '井研县', '3', '0');
INSERT INTO `tp_region` VALUES ('2826', '331', '夹江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2827', '331', '沐川县', '3', '0');
INSERT INTO `tp_region` VALUES ('2828', '331', '峨边', '3', '0');
INSERT INTO `tp_region` VALUES ('2829', '331', '马边', '3', '0');
INSERT INTO `tp_region` VALUES ('2830', '332', '西昌市', '3', '0');
INSERT INTO `tp_region` VALUES ('2831', '332', '盐源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2832', '332', '德昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('2833', '332', '会理县', '3', '0');
INSERT INTO `tp_region` VALUES ('2834', '332', '会东县', '3', '0');
INSERT INTO `tp_region` VALUES ('2835', '332', '宁南县', '3', '0');
INSERT INTO `tp_region` VALUES ('2836', '332', '普格县', '3', '0');
INSERT INTO `tp_region` VALUES ('2837', '332', '布拖县', '3', '0');
INSERT INTO `tp_region` VALUES ('2838', '332', '金阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2839', '332', '昭觉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2840', '332', '喜德县', '3', '0');
INSERT INTO `tp_region` VALUES ('2841', '332', '冕宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2842', '332', '越西县', '3', '0');
INSERT INTO `tp_region` VALUES ('2843', '332', '甘洛县', '3', '0');
INSERT INTO `tp_region` VALUES ('2844', '332', '美姑县', '3', '0');
INSERT INTO `tp_region` VALUES ('2845', '332', '雷波县', '3', '0');
INSERT INTO `tp_region` VALUES ('2846', '332', '木里', '3', '0');
INSERT INTO `tp_region` VALUES ('2847', '333', '东坡区', '3', '0');
INSERT INTO `tp_region` VALUES ('2848', '333', '仁寿县', '3', '0');
INSERT INTO `tp_region` VALUES ('2849', '333', '彭山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2850', '333', '洪雅县', '3', '0');
INSERT INTO `tp_region` VALUES ('2851', '333', '丹棱县', '3', '0');
INSERT INTO `tp_region` VALUES ('2852', '333', '青神县', '3', '0');
INSERT INTO `tp_region` VALUES ('2853', '334', '阆中市', '3', '0');
INSERT INTO `tp_region` VALUES ('2854', '334', '南部县', '3', '0');
INSERT INTO `tp_region` VALUES ('2855', '334', '营山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2856', '334', '蓬安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2857', '334', '仪陇县', '3', '0');
INSERT INTO `tp_region` VALUES ('2858', '334', '顺庆区', '3', '0');
INSERT INTO `tp_region` VALUES ('2859', '334', '高坪区', '3', '0');
INSERT INTO `tp_region` VALUES ('2860', '334', '嘉陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('2861', '334', '西充县', '3', '0');
INSERT INTO `tp_region` VALUES ('2862', '335', '市中区', '3', '0');
INSERT INTO `tp_region` VALUES ('2863', '335', '东兴区', '3', '0');
INSERT INTO `tp_region` VALUES ('2864', '335', '威远县', '3', '0');
INSERT INTO `tp_region` VALUES ('2865', '335', '资中县', '3', '0');
INSERT INTO `tp_region` VALUES ('2866', '335', '隆昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('2867', '336', '东  区', '3', '0');
INSERT INTO `tp_region` VALUES ('2868', '336', '西  区', '3', '0');
INSERT INTO `tp_region` VALUES ('2869', '336', '仁和区', '3', '0');
INSERT INTO `tp_region` VALUES ('2870', '336', '米易县', '3', '0');
INSERT INTO `tp_region` VALUES ('2871', '336', '盐边县', '3', '0');
INSERT INTO `tp_region` VALUES ('2872', '337', '船山区', '3', '0');
INSERT INTO `tp_region` VALUES ('2873', '337', '安居区', '3', '0');
INSERT INTO `tp_region` VALUES ('2874', '337', '蓬溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2875', '337', '射洪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2876', '337', '大英县', '3', '0');
INSERT INTO `tp_region` VALUES ('2877', '338', '雨城区', '3', '0');
INSERT INTO `tp_region` VALUES ('2878', '338', '名山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2879', '338', '荥经县', '3', '0');
INSERT INTO `tp_region` VALUES ('2880', '338', '汉源县', '3', '0');
INSERT INTO `tp_region` VALUES ('2881', '338', '石棉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2882', '338', '天全县', '3', '0');
INSERT INTO `tp_region` VALUES ('2883', '338', '芦山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2884', '338', '宝兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2885', '339', '翠屏区', '3', '0');
INSERT INTO `tp_region` VALUES ('2886', '339', '宜宾县', '3', '0');
INSERT INTO `tp_region` VALUES ('2887', '339', '南溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('2888', '339', '江安县', '3', '0');
INSERT INTO `tp_region` VALUES ('2889', '339', '长宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2890', '339', '高县', '3', '0');
INSERT INTO `tp_region` VALUES ('2891', '339', '珙县', '3', '0');
INSERT INTO `tp_region` VALUES ('2892', '339', '筠连县', '3', '0');
INSERT INTO `tp_region` VALUES ('2893', '339', '兴文县', '3', '0');
INSERT INTO `tp_region` VALUES ('2894', '339', '屏山县', '3', '0');
INSERT INTO `tp_region` VALUES ('2895', '340', '雁江区', '3', '0');
INSERT INTO `tp_region` VALUES ('2896', '340', '简阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('2897', '340', '安岳县', '3', '0');
INSERT INTO `tp_region` VALUES ('2898', '340', '乐至县', '3', '0');
INSERT INTO `tp_region` VALUES ('2899', '341', '大安区', '3', '0');
INSERT INTO `tp_region` VALUES ('2900', '341', '自流井区', '3', '0');
INSERT INTO `tp_region` VALUES ('2901', '341', '贡井区', '3', '0');
INSERT INTO `tp_region` VALUES ('2902', '341', '沿滩区', '3', '0');
INSERT INTO `tp_region` VALUES ('2903', '341', '荣县', '3', '0');
INSERT INTO `tp_region` VALUES ('2904', '341', '富顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('2905', '342', '江阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('2906', '342', '纳溪区', '3', '0');
INSERT INTO `tp_region` VALUES ('2907', '342', '龙马潭区', '3', '0');
INSERT INTO `tp_region` VALUES ('2908', '342', '泸县', '3', '0');
INSERT INTO `tp_region` VALUES ('2909', '342', '合江县', '3', '0');
INSERT INTO `tp_region` VALUES ('2910', '342', '叙永县', '3', '0');
INSERT INTO `tp_region` VALUES ('2911', '342', '古蔺县', '3', '0');
INSERT INTO `tp_region` VALUES ('2912', '343', '和平区', '3', '0');
INSERT INTO `tp_region` VALUES ('2913', '343', '河西区', '3', '0');
INSERT INTO `tp_region` VALUES ('2914', '343', '南开区', '3', '0');
INSERT INTO `tp_region` VALUES ('2915', '343', '河北区', '3', '0');
INSERT INTO `tp_region` VALUES ('2916', '343', '河东区', '3', '0');
INSERT INTO `tp_region` VALUES ('2917', '343', '红桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('2918', '343', '东丽区', '3', '0');
INSERT INTO `tp_region` VALUES ('2919', '343', '津南区', '3', '0');
INSERT INTO `tp_region` VALUES ('2920', '343', '西青区', '3', '0');
INSERT INTO `tp_region` VALUES ('2921', '343', '北辰区', '3', '0');
INSERT INTO `tp_region` VALUES ('2922', '343', '塘沽区', '3', '0');
INSERT INTO `tp_region` VALUES ('2923', '343', '汉沽区', '3', '0');
INSERT INTO `tp_region` VALUES ('2924', '343', '大港区', '3', '0');
INSERT INTO `tp_region` VALUES ('2925', '343', '武清区', '3', '0');
INSERT INTO `tp_region` VALUES ('2926', '343', '宝坻区', '3', '0');
INSERT INTO `tp_region` VALUES ('2927', '343', '经济开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('2928', '343', '宁河县', '3', '0');
INSERT INTO `tp_region` VALUES ('2929', '343', '静海县', '3', '0');
INSERT INTO `tp_region` VALUES ('2930', '343', '蓟县', '3', '0');
INSERT INTO `tp_region` VALUES ('2931', '344', '城关区', '3', '0');
INSERT INTO `tp_region` VALUES ('2932', '344', '林周县', '3', '0');
INSERT INTO `tp_region` VALUES ('2933', '344', '当雄县', '3', '0');
INSERT INTO `tp_region` VALUES ('2934', '344', '尼木县', '3', '0');
INSERT INTO `tp_region` VALUES ('2935', '344', '曲水县', '3', '0');
INSERT INTO `tp_region` VALUES ('2936', '344', '堆龙德庆县', '3', '0');
INSERT INTO `tp_region` VALUES ('2937', '344', '达孜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2938', '344', '墨竹工卡县', '3', '0');
INSERT INTO `tp_region` VALUES ('2939', '345', '噶尔县', '3', '0');
INSERT INTO `tp_region` VALUES ('2940', '345', '普兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('2941', '345', '札达县', '3', '0');
INSERT INTO `tp_region` VALUES ('2942', '345', '日土县', '3', '0');
INSERT INTO `tp_region` VALUES ('2943', '345', '革吉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2944', '345', '改则县', '3', '0');
INSERT INTO `tp_region` VALUES ('2945', '345', '措勤县', '3', '0');
INSERT INTO `tp_region` VALUES ('2946', '346', '昌都县', '3', '0');
INSERT INTO `tp_region` VALUES ('2947', '346', '江达县', '3', '0');
INSERT INTO `tp_region` VALUES ('2948', '346', '贡觉县', '3', '0');
INSERT INTO `tp_region` VALUES ('2949', '346', '类乌齐县', '3', '0');
INSERT INTO `tp_region` VALUES ('2950', '346', '丁青县', '3', '0');
INSERT INTO `tp_region` VALUES ('2951', '346', '察雅县', '3', '0');
INSERT INTO `tp_region` VALUES ('2952', '346', '八宿县', '3', '0');
INSERT INTO `tp_region` VALUES ('2953', '346', '左贡县', '3', '0');
INSERT INTO `tp_region` VALUES ('2954', '346', '芒康县', '3', '0');
INSERT INTO `tp_region` VALUES ('2955', '346', '洛隆县', '3', '0');
INSERT INTO `tp_region` VALUES ('2956', '346', '边坝县', '3', '0');
INSERT INTO `tp_region` VALUES ('2957', '347', '林芝县', '3', '0');
INSERT INTO `tp_region` VALUES ('2958', '347', '工布江达县', '3', '0');
INSERT INTO `tp_region` VALUES ('2959', '347', '米林县', '3', '0');
INSERT INTO `tp_region` VALUES ('2960', '347', '墨脱县', '3', '0');
INSERT INTO `tp_region` VALUES ('2961', '347', '波密县', '3', '0');
INSERT INTO `tp_region` VALUES ('2962', '347', '察隅县', '3', '0');
INSERT INTO `tp_region` VALUES ('2963', '347', '朗县', '3', '0');
INSERT INTO `tp_region` VALUES ('2964', '348', '那曲县', '3', '0');
INSERT INTO `tp_region` VALUES ('2965', '348', '嘉黎县', '3', '0');
INSERT INTO `tp_region` VALUES ('2966', '348', '比如县', '3', '0');
INSERT INTO `tp_region` VALUES ('2967', '348', '聂荣县', '3', '0');
INSERT INTO `tp_region` VALUES ('2968', '348', '安多县', '3', '0');
INSERT INTO `tp_region` VALUES ('2969', '348', '申扎县', '3', '0');
INSERT INTO `tp_region` VALUES ('2970', '348', '索县', '3', '0');
INSERT INTO `tp_region` VALUES ('2971', '348', '班戈县', '3', '0');
INSERT INTO `tp_region` VALUES ('2972', '348', '巴青县', '3', '0');
INSERT INTO `tp_region` VALUES ('2973', '348', '尼玛县', '3', '0');
INSERT INTO `tp_region` VALUES ('2974', '349', '日喀则市', '3', '0');
INSERT INTO `tp_region` VALUES ('2975', '349', '南木林县', '3', '0');
INSERT INTO `tp_region` VALUES ('2976', '349', '江孜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2977', '349', '定日县', '3', '0');
INSERT INTO `tp_region` VALUES ('2978', '349', '萨迦县', '3', '0');
INSERT INTO `tp_region` VALUES ('2979', '349', '拉孜县', '3', '0');
INSERT INTO `tp_region` VALUES ('2980', '349', '昂仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('2981', '349', '谢通门县', '3', '0');
INSERT INTO `tp_region` VALUES ('2982', '349', '白朗县', '3', '0');
INSERT INTO `tp_region` VALUES ('2983', '349', '仁布县', '3', '0');
INSERT INTO `tp_region` VALUES ('2984', '349', '康马县', '3', '0');
INSERT INTO `tp_region` VALUES ('2985', '349', '定结县', '3', '0');
INSERT INTO `tp_region` VALUES ('2986', '349', '仲巴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2987', '349', '亚东县', '3', '0');
INSERT INTO `tp_region` VALUES ('2988', '349', '吉隆县', '3', '0');
INSERT INTO `tp_region` VALUES ('2989', '349', '聂拉木县', '3', '0');
INSERT INTO `tp_region` VALUES ('2990', '349', '萨嘎县', '3', '0');
INSERT INTO `tp_region` VALUES ('2991', '349', '岗巴县', '3', '0');
INSERT INTO `tp_region` VALUES ('2992', '350', '乃东县', '3', '0');
INSERT INTO `tp_region` VALUES ('2993', '350', '扎囊县', '3', '0');
INSERT INTO `tp_region` VALUES ('2994', '350', '贡嘎县', '3', '0');
INSERT INTO `tp_region` VALUES ('2995', '350', '桑日县', '3', '0');
INSERT INTO `tp_region` VALUES ('2996', '350', '琼结县', '3', '0');
INSERT INTO `tp_region` VALUES ('2997', '350', '曲松县', '3', '0');
INSERT INTO `tp_region` VALUES ('2998', '350', '措美县', '3', '0');
INSERT INTO `tp_region` VALUES ('2999', '350', '洛扎县', '3', '0');
INSERT INTO `tp_region` VALUES ('3000', '350', '加查县', '3', '0');
INSERT INTO `tp_region` VALUES ('3001', '350', '隆子县', '3', '0');
INSERT INTO `tp_region` VALUES ('3002', '350', '错那县', '3', '0');
INSERT INTO `tp_region` VALUES ('3003', '350', '浪卡子县', '3', '0');
INSERT INTO `tp_region` VALUES ('3004', '351', '天山区', '3', '0');
INSERT INTO `tp_region` VALUES ('3005', '351', '沙依巴克区', '3', '0');
INSERT INTO `tp_region` VALUES ('3006', '351', '新市区', '3', '0');
INSERT INTO `tp_region` VALUES ('3007', '351', '水磨沟区', '3', '0');
INSERT INTO `tp_region` VALUES ('3008', '351', '头屯河区', '3', '0');
INSERT INTO `tp_region` VALUES ('3009', '351', '达坂城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3010', '351', '米东区', '3', '0');
INSERT INTO `tp_region` VALUES ('3011', '351', '乌鲁木齐县', '3', '0');
INSERT INTO `tp_region` VALUES ('3012', '352', '阿克苏市', '3', '0');
INSERT INTO `tp_region` VALUES ('3013', '352', '温宿县', '3', '0');
INSERT INTO `tp_region` VALUES ('3014', '352', '库车县', '3', '0');
INSERT INTO `tp_region` VALUES ('3015', '352', '沙雅县', '3', '0');
INSERT INTO `tp_region` VALUES ('3016', '352', '新和县', '3', '0');
INSERT INTO `tp_region` VALUES ('3017', '352', '拜城县', '3', '0');
INSERT INTO `tp_region` VALUES ('3018', '352', '乌什县', '3', '0');
INSERT INTO `tp_region` VALUES ('3019', '352', '阿瓦提县', '3', '0');
INSERT INTO `tp_region` VALUES ('3020', '352', '柯坪县', '3', '0');
INSERT INTO `tp_region` VALUES ('3021', '353', '阿拉尔市', '3', '0');
INSERT INTO `tp_region` VALUES ('3022', '354', '库尔勒市', '3', '0');
INSERT INTO `tp_region` VALUES ('3023', '354', '轮台县', '3', '0');
INSERT INTO `tp_region` VALUES ('3024', '354', '尉犁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3025', '354', '若羌县', '3', '0');
INSERT INTO `tp_region` VALUES ('3026', '354', '且末县', '3', '0');
INSERT INTO `tp_region` VALUES ('3027', '354', '焉耆', '3', '0');
INSERT INTO `tp_region` VALUES ('3028', '354', '和静县', '3', '0');
INSERT INTO `tp_region` VALUES ('3029', '354', '和硕县', '3', '0');
INSERT INTO `tp_region` VALUES ('3030', '354', '博湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('3031', '355', '博乐市', '3', '0');
INSERT INTO `tp_region` VALUES ('3032', '355', '精河县', '3', '0');
INSERT INTO `tp_region` VALUES ('3033', '355', '温泉县', '3', '0');
INSERT INTO `tp_region` VALUES ('3034', '356', '呼图壁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3035', '356', '米泉市', '3', '0');
INSERT INTO `tp_region` VALUES ('3036', '356', '昌吉市', '3', '0');
INSERT INTO `tp_region` VALUES ('3037', '356', '阜康市', '3', '0');
INSERT INTO `tp_region` VALUES ('3038', '356', '玛纳斯县', '3', '0');
INSERT INTO `tp_region` VALUES ('3039', '356', '奇台县', '3', '0');
INSERT INTO `tp_region` VALUES ('3040', '356', '吉木萨尔县', '3', '0');
INSERT INTO `tp_region` VALUES ('3041', '356', '木垒', '3', '0');
INSERT INTO `tp_region` VALUES ('3042', '357', '哈密市', '3', '0');
INSERT INTO `tp_region` VALUES ('3043', '357', '伊吾县', '3', '0');
INSERT INTO `tp_region` VALUES ('3044', '357', '巴里坤', '3', '0');
INSERT INTO `tp_region` VALUES ('3045', '358', '和田市', '3', '0');
INSERT INTO `tp_region` VALUES ('3046', '358', '和田县', '3', '0');
INSERT INTO `tp_region` VALUES ('3047', '358', '墨玉县', '3', '0');
INSERT INTO `tp_region` VALUES ('3048', '358', '皮山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3049', '358', '洛浦县', '3', '0');
INSERT INTO `tp_region` VALUES ('3050', '358', '策勒县', '3', '0');
INSERT INTO `tp_region` VALUES ('3051', '358', '于田县', '3', '0');
INSERT INTO `tp_region` VALUES ('3052', '358', '民丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('3053', '359', '喀什市', '3', '0');
INSERT INTO `tp_region` VALUES ('3054', '359', '疏附县', '3', '0');
INSERT INTO `tp_region` VALUES ('3055', '359', '疏勒县', '3', '0');
INSERT INTO `tp_region` VALUES ('3056', '359', '英吉沙县', '3', '0');
INSERT INTO `tp_region` VALUES ('3057', '359', '泽普县', '3', '0');
INSERT INTO `tp_region` VALUES ('3058', '359', '莎车县', '3', '0');
INSERT INTO `tp_region` VALUES ('3059', '359', '叶城县', '3', '0');
INSERT INTO `tp_region` VALUES ('3060', '359', '麦盖提县', '3', '0');
INSERT INTO `tp_region` VALUES ('3061', '359', '岳普湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('3062', '359', '伽师县', '3', '0');
INSERT INTO `tp_region` VALUES ('3063', '359', '巴楚县', '3', '0');
INSERT INTO `tp_region` VALUES ('3064', '359', '塔什库尔干', '3', '0');
INSERT INTO `tp_region` VALUES ('3065', '360', '克拉玛依市', '3', '0');
INSERT INTO `tp_region` VALUES ('3066', '361', '阿图什市', '3', '0');
INSERT INTO `tp_region` VALUES ('3067', '361', '阿克陶县', '3', '0');
INSERT INTO `tp_region` VALUES ('3068', '361', '阿合奇县', '3', '0');
INSERT INTO `tp_region` VALUES ('3069', '361', '乌恰县', '3', '0');
INSERT INTO `tp_region` VALUES ('3070', '362', '石河子市', '3', '0');
INSERT INTO `tp_region` VALUES ('3071', '363', '图木舒克市', '3', '0');
INSERT INTO `tp_region` VALUES ('3072', '364', '吐鲁番市', '3', '0');
INSERT INTO `tp_region` VALUES ('3073', '364', '鄯善县', '3', '0');
INSERT INTO `tp_region` VALUES ('3074', '364', '托克逊县', '3', '0');
INSERT INTO `tp_region` VALUES ('3075', '365', '五家渠市', '3', '0');
INSERT INTO `tp_region` VALUES ('3076', '366', '阿勒泰市', '3', '0');
INSERT INTO `tp_region` VALUES ('3077', '366', '布克赛尔', '3', '0');
INSERT INTO `tp_region` VALUES ('3078', '366', '伊宁市', '3', '0');
INSERT INTO `tp_region` VALUES ('3079', '366', '布尔津县', '3', '0');
INSERT INTO `tp_region` VALUES ('3080', '366', '奎屯市', '3', '0');
INSERT INTO `tp_region` VALUES ('3081', '366', '乌苏市', '3', '0');
INSERT INTO `tp_region` VALUES ('3082', '366', '额敏县', '3', '0');
INSERT INTO `tp_region` VALUES ('3083', '366', '富蕴县', '3', '0');
INSERT INTO `tp_region` VALUES ('3084', '366', '伊宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3085', '366', '福海县', '3', '0');
INSERT INTO `tp_region` VALUES ('3086', '366', '霍城县', '3', '0');
INSERT INTO `tp_region` VALUES ('3087', '366', '沙湾县', '3', '0');
INSERT INTO `tp_region` VALUES ('3088', '366', '巩留县', '3', '0');
INSERT INTO `tp_region` VALUES ('3089', '366', '哈巴河县', '3', '0');
INSERT INTO `tp_region` VALUES ('3090', '366', '托里县', '3', '0');
INSERT INTO `tp_region` VALUES ('3091', '366', '青河县', '3', '0');
INSERT INTO `tp_region` VALUES ('3092', '366', '新源县', '3', '0');
INSERT INTO `tp_region` VALUES ('3093', '366', '裕民县', '3', '0');
INSERT INTO `tp_region` VALUES ('3094', '366', '和布克赛尔', '3', '0');
INSERT INTO `tp_region` VALUES ('3095', '366', '吉木乃县', '3', '0');
INSERT INTO `tp_region` VALUES ('3096', '366', '昭苏县', '3', '0');
INSERT INTO `tp_region` VALUES ('3097', '366', '特克斯县', '3', '0');
INSERT INTO `tp_region` VALUES ('3098', '366', '尼勒克县', '3', '0');
INSERT INTO `tp_region` VALUES ('3099', '366', '察布查尔', '3', '0');
INSERT INTO `tp_region` VALUES ('3100', '367', '盘龙区', '3', '0');
INSERT INTO `tp_region` VALUES ('3101', '367', '五华区', '3', '0');
INSERT INTO `tp_region` VALUES ('3102', '367', '官渡区', '3', '0');
INSERT INTO `tp_region` VALUES ('3103', '367', '西山区', '3', '0');
INSERT INTO `tp_region` VALUES ('3104', '367', '东川区', '3', '0');
INSERT INTO `tp_region` VALUES ('3105', '367', '安宁市', '3', '0');
INSERT INTO `tp_region` VALUES ('3106', '367', '呈贡县', '3', '0');
INSERT INTO `tp_region` VALUES ('3107', '367', '晋宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3108', '367', '富民县', '3', '0');
INSERT INTO `tp_region` VALUES ('3109', '367', '宜良县', '3', '0');
INSERT INTO `tp_region` VALUES ('3110', '367', '嵩明县', '3', '0');
INSERT INTO `tp_region` VALUES ('3111', '367', '石林县', '3', '0');
INSERT INTO `tp_region` VALUES ('3112', '367', '禄劝', '3', '0');
INSERT INTO `tp_region` VALUES ('3113', '367', '寻甸', '3', '0');
INSERT INTO `tp_region` VALUES ('3114', '368', '兰坪', '3', '0');
INSERT INTO `tp_region` VALUES ('3115', '368', '泸水县', '3', '0');
INSERT INTO `tp_region` VALUES ('3116', '368', '福贡县', '3', '0');
INSERT INTO `tp_region` VALUES ('3117', '368', '贡山', '3', '0');
INSERT INTO `tp_region` VALUES ('3118', '369', '宁洱', '3', '0');
INSERT INTO `tp_region` VALUES ('3119', '369', '思茅区', '3', '0');
INSERT INTO `tp_region` VALUES ('3120', '369', '墨江', '3', '0');
INSERT INTO `tp_region` VALUES ('3121', '369', '景东', '3', '0');
INSERT INTO `tp_region` VALUES ('3122', '369', '景谷', '3', '0');
INSERT INTO `tp_region` VALUES ('3123', '369', '镇沅', '3', '0');
INSERT INTO `tp_region` VALUES ('3124', '369', '江城', '3', '0');
INSERT INTO `tp_region` VALUES ('3125', '369', '孟连', '3', '0');
INSERT INTO `tp_region` VALUES ('3126', '369', '澜沧', '3', '0');
INSERT INTO `tp_region` VALUES ('3127', '369', '西盟', '3', '0');
INSERT INTO `tp_region` VALUES ('3128', '370', '古城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3129', '370', '宁蒗', '3', '0');
INSERT INTO `tp_region` VALUES ('3130', '370', '玉龙', '3', '0');
INSERT INTO `tp_region` VALUES ('3131', '370', '永胜县', '3', '0');
INSERT INTO `tp_region` VALUES ('3132', '370', '华坪县', '3', '0');
INSERT INTO `tp_region` VALUES ('3133', '371', '隆阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('3134', '371', '施甸县', '3', '0');
INSERT INTO `tp_region` VALUES ('3135', '371', '腾冲县', '3', '0');
INSERT INTO `tp_region` VALUES ('3136', '371', '龙陵县', '3', '0');
INSERT INTO `tp_region` VALUES ('3137', '371', '昌宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3138', '372', '楚雄市', '3', '0');
INSERT INTO `tp_region` VALUES ('3139', '372', '双柏县', '3', '0');
INSERT INTO `tp_region` VALUES ('3140', '372', '牟定县', '3', '0');
INSERT INTO `tp_region` VALUES ('3141', '372', '南华县', '3', '0');
INSERT INTO `tp_region` VALUES ('3142', '372', '姚安县', '3', '0');
INSERT INTO `tp_region` VALUES ('3143', '372', '大姚县', '3', '0');
INSERT INTO `tp_region` VALUES ('3144', '372', '永仁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3145', '372', '元谋县', '3', '0');
INSERT INTO `tp_region` VALUES ('3146', '372', '武定县', '3', '0');
INSERT INTO `tp_region` VALUES ('3147', '372', '禄丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('3148', '373', '大理市', '3', '0');
INSERT INTO `tp_region` VALUES ('3149', '373', '祥云县', '3', '0');
INSERT INTO `tp_region` VALUES ('3150', '373', '宾川县', '3', '0');
INSERT INTO `tp_region` VALUES ('3151', '373', '弥渡县', '3', '0');
INSERT INTO `tp_region` VALUES ('3152', '373', '永平县', '3', '0');
INSERT INTO `tp_region` VALUES ('3153', '373', '云龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('3154', '373', '洱源县', '3', '0');
INSERT INTO `tp_region` VALUES ('3155', '373', '剑川县', '3', '0');
INSERT INTO `tp_region` VALUES ('3156', '373', '鹤庆县', '3', '0');
INSERT INTO `tp_region` VALUES ('3157', '373', '漾濞', '3', '0');
INSERT INTO `tp_region` VALUES ('3158', '373', '南涧', '3', '0');
INSERT INTO `tp_region` VALUES ('3159', '373', '巍山', '3', '0');
INSERT INTO `tp_region` VALUES ('3160', '374', '潞西市', '3', '0');
INSERT INTO `tp_region` VALUES ('3161', '374', '瑞丽市', '3', '0');
INSERT INTO `tp_region` VALUES ('3162', '374', '梁河县', '3', '0');
INSERT INTO `tp_region` VALUES ('3163', '374', '盈江县', '3', '0');
INSERT INTO `tp_region` VALUES ('3164', '374', '陇川县', '3', '0');
INSERT INTO `tp_region` VALUES ('3165', '375', '香格里拉县', '3', '0');
INSERT INTO `tp_region` VALUES ('3166', '375', '德钦县', '3', '0');
INSERT INTO `tp_region` VALUES ('3167', '375', '维西', '3', '0');
INSERT INTO `tp_region` VALUES ('3168', '376', '泸西县', '3', '0');
INSERT INTO `tp_region` VALUES ('3169', '376', '蒙自县', '3', '0');
INSERT INTO `tp_region` VALUES ('3170', '376', '个旧市', '3', '0');
INSERT INTO `tp_region` VALUES ('3171', '376', '开远市', '3', '0');
INSERT INTO `tp_region` VALUES ('3172', '376', '绿春县', '3', '0');
INSERT INTO `tp_region` VALUES ('3173', '376', '建水县', '3', '0');
INSERT INTO `tp_region` VALUES ('3174', '376', '石屏县', '3', '0');
INSERT INTO `tp_region` VALUES ('3175', '376', '弥勒县', '3', '0');
INSERT INTO `tp_region` VALUES ('3176', '376', '元阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('3177', '376', '红河县', '3', '0');
INSERT INTO `tp_region` VALUES ('3178', '376', '金平', '3', '0');
INSERT INTO `tp_region` VALUES ('3179', '376', '河口', '3', '0');
INSERT INTO `tp_region` VALUES ('3180', '376', '屏边', '3', '0');
INSERT INTO `tp_region` VALUES ('3181', '377', '临翔区', '3', '0');
INSERT INTO `tp_region` VALUES ('3182', '377', '凤庆县', '3', '0');
INSERT INTO `tp_region` VALUES ('3183', '377', '云县', '3', '0');
INSERT INTO `tp_region` VALUES ('3184', '377', '永德县', '3', '0');
INSERT INTO `tp_region` VALUES ('3185', '377', '镇康县', '3', '0');
INSERT INTO `tp_region` VALUES ('3186', '377', '双江', '3', '0');
INSERT INTO `tp_region` VALUES ('3187', '377', '耿马', '3', '0');
INSERT INTO `tp_region` VALUES ('3188', '377', '沧源', '3', '0');
INSERT INTO `tp_region` VALUES ('3189', '378', '麒麟区', '3', '0');
INSERT INTO `tp_region` VALUES ('3190', '378', '宣威市', '3', '0');
INSERT INTO `tp_region` VALUES ('3191', '378', '马龙县', '3', '0');
INSERT INTO `tp_region` VALUES ('3192', '378', '陆良县', '3', '0');
INSERT INTO `tp_region` VALUES ('3193', '378', '师宗县', '3', '0');
INSERT INTO `tp_region` VALUES ('3194', '378', '罗平县', '3', '0');
INSERT INTO `tp_region` VALUES ('3195', '378', '富源县', '3', '0');
INSERT INTO `tp_region` VALUES ('3196', '378', '会泽县', '3', '0');
INSERT INTO `tp_region` VALUES ('3197', '378', '沾益县', '3', '0');
INSERT INTO `tp_region` VALUES ('3198', '379', '文山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3199', '379', '砚山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3200', '379', '西畴县', '3', '0');
INSERT INTO `tp_region` VALUES ('3201', '379', '麻栗坡县', '3', '0');
INSERT INTO `tp_region` VALUES ('3202', '379', '马关县', '3', '0');
INSERT INTO `tp_region` VALUES ('3203', '379', '丘北县', '3', '0');
INSERT INTO `tp_region` VALUES ('3204', '379', '广南县', '3', '0');
INSERT INTO `tp_region` VALUES ('3205', '379', '富宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3206', '380', '景洪市', '3', '0');
INSERT INTO `tp_region` VALUES ('3207', '380', '勐海县', '3', '0');
INSERT INTO `tp_region` VALUES ('3208', '380', '勐腊县', '3', '0');
INSERT INTO `tp_region` VALUES ('3209', '381', '红塔区', '3', '0');
INSERT INTO `tp_region` VALUES ('3210', '381', '江川县', '3', '0');
INSERT INTO `tp_region` VALUES ('3211', '381', '澄江县', '3', '0');
INSERT INTO `tp_region` VALUES ('3212', '381', '通海县', '3', '0');
INSERT INTO `tp_region` VALUES ('3213', '381', '华宁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3214', '381', '易门县', '3', '0');
INSERT INTO `tp_region` VALUES ('3215', '381', '峨山', '3', '0');
INSERT INTO `tp_region` VALUES ('3216', '381', '新平', '3', '0');
INSERT INTO `tp_region` VALUES ('3217', '381', '元江', '3', '0');
INSERT INTO `tp_region` VALUES ('3218', '382', '昭阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('3219', '382', '鲁甸县', '3', '0');
INSERT INTO `tp_region` VALUES ('3220', '382', '巧家县', '3', '0');
INSERT INTO `tp_region` VALUES ('3221', '382', '盐津县', '3', '0');
INSERT INTO `tp_region` VALUES ('3222', '382', '大关县', '3', '0');
INSERT INTO `tp_region` VALUES ('3223', '382', '永善县', '3', '0');
INSERT INTO `tp_region` VALUES ('3224', '382', '绥江县', '3', '0');
INSERT INTO `tp_region` VALUES ('3225', '382', '镇雄县', '3', '0');
INSERT INTO `tp_region` VALUES ('3226', '382', '彝良县', '3', '0');
INSERT INTO `tp_region` VALUES ('3227', '382', '威信县', '3', '0');
INSERT INTO `tp_region` VALUES ('3228', '382', '水富县', '3', '0');
INSERT INTO `tp_region` VALUES ('3229', '383', '西湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('3230', '383', '上城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3231', '383', '下城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3232', '383', '拱墅区', '3', '0');
INSERT INTO `tp_region` VALUES ('3233', '383', '滨江区', '3', '0');
INSERT INTO `tp_region` VALUES ('3234', '383', '江干区', '3', '0');
INSERT INTO `tp_region` VALUES ('3235', '383', '萧山区', '3', '0');
INSERT INTO `tp_region` VALUES ('3236', '383', '余杭区', '3', '0');
INSERT INTO `tp_region` VALUES ('3237', '383', '市郊', '3', '0');
INSERT INTO `tp_region` VALUES ('3238', '383', '建德市', '3', '0');
INSERT INTO `tp_region` VALUES ('3239', '383', '富阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('3240', '383', '临安市', '3', '0');
INSERT INTO `tp_region` VALUES ('3241', '383', '桐庐县', '3', '0');
INSERT INTO `tp_region` VALUES ('3242', '383', '淳安县', '3', '0');
INSERT INTO `tp_region` VALUES ('3243', '384', '吴兴区', '3', '0');
INSERT INTO `tp_region` VALUES ('3244', '384', '南浔区', '3', '0');
INSERT INTO `tp_region` VALUES ('3245', '384', '德清县', '3', '0');
INSERT INTO `tp_region` VALUES ('3246', '384', '长兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('3247', '384', '安吉县', '3', '0');
INSERT INTO `tp_region` VALUES ('3248', '385', '南湖区', '3', '0');
INSERT INTO `tp_region` VALUES ('3249', '385', '秀洲区', '3', '0');
INSERT INTO `tp_region` VALUES ('3250', '385', '海宁市', '3', '0');
INSERT INTO `tp_region` VALUES ('3251', '385', '嘉善县', '3', '0');
INSERT INTO `tp_region` VALUES ('3252', '385', '平湖市', '3', '0');
INSERT INTO `tp_region` VALUES ('3253', '385', '桐乡市', '3', '0');
INSERT INTO `tp_region` VALUES ('3254', '385', '海盐县', '3', '0');
INSERT INTO `tp_region` VALUES ('3255', '386', '婺城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3256', '386', '金东区', '3', '0');
INSERT INTO `tp_region` VALUES ('3257', '386', '兰溪市', '3', '0');
INSERT INTO `tp_region` VALUES ('3258', '386', '市区', '3', '0');
INSERT INTO `tp_region` VALUES ('3259', '386', '佛堂镇', '3', '0');
INSERT INTO `tp_region` VALUES ('3260', '386', '上溪镇', '3', '0');
INSERT INTO `tp_region` VALUES ('3261', '386', '义亭镇', '3', '0');
INSERT INTO `tp_region` VALUES ('3262', '386', '大陈镇', '3', '0');
INSERT INTO `tp_region` VALUES ('3263', '386', '苏溪镇', '3', '0');
INSERT INTO `tp_region` VALUES ('3264', '386', '赤岸镇', '3', '0');
INSERT INTO `tp_region` VALUES ('3265', '386', '东阳市', '3', '0');
INSERT INTO `tp_region` VALUES ('3266', '386', '永康市', '3', '0');
INSERT INTO `tp_region` VALUES ('3267', '386', '武义县', '3', '0');
INSERT INTO `tp_region` VALUES ('3268', '386', '浦江县', '3', '0');
INSERT INTO `tp_region` VALUES ('3269', '386', '磐安县', '3', '0');
INSERT INTO `tp_region` VALUES ('3270', '387', '莲都区', '3', '0');
INSERT INTO `tp_region` VALUES ('3271', '387', '龙泉市', '3', '0');
INSERT INTO `tp_region` VALUES ('3272', '387', '青田县', '3', '0');
INSERT INTO `tp_region` VALUES ('3273', '387', '缙云县', '3', '0');
INSERT INTO `tp_region` VALUES ('3274', '387', '遂昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('3275', '387', '松阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('3276', '387', '云和县', '3', '0');
INSERT INTO `tp_region` VALUES ('3277', '387', '庆元县', '3', '0');
INSERT INTO `tp_region` VALUES ('3278', '387', '景宁', '3', '0');
INSERT INTO `tp_region` VALUES ('3279', '388', '海曙区', '3', '0');
INSERT INTO `tp_region` VALUES ('3280', '388', '江东区', '3', '0');
INSERT INTO `tp_region` VALUES ('3281', '388', '江北区', '3', '0');
INSERT INTO `tp_region` VALUES ('3282', '388', '镇海区', '3', '0');
INSERT INTO `tp_region` VALUES ('3283', '388', '北仑区', '3', '0');
INSERT INTO `tp_region` VALUES ('3284', '388', '鄞州区', '3', '0');
INSERT INTO `tp_region` VALUES ('3285', '388', '余姚市', '3', '0');
INSERT INTO `tp_region` VALUES ('3286', '388', '慈溪市', '3', '0');
INSERT INTO `tp_region` VALUES ('3287', '388', '奉化市', '3', '0');
INSERT INTO `tp_region` VALUES ('3288', '388', '象山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3289', '388', '宁海县', '3', '0');
INSERT INTO `tp_region` VALUES ('3290', '389', '越城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3291', '389', '上虞市', '3', '0');
INSERT INTO `tp_region` VALUES ('3292', '389', '嵊州市', '3', '0');
INSERT INTO `tp_region` VALUES ('3293', '389', '绍兴县', '3', '0');
INSERT INTO `tp_region` VALUES ('3294', '389', '新昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('3295', '389', '诸暨市', '3', '0');
INSERT INTO `tp_region` VALUES ('3296', '390', '椒江区', '3', '0');
INSERT INTO `tp_region` VALUES ('3297', '390', '黄岩区', '3', '0');
INSERT INTO `tp_region` VALUES ('3298', '390', '路桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('3299', '390', '温岭市', '3', '0');
INSERT INTO `tp_region` VALUES ('3300', '390', '临海市', '3', '0');
INSERT INTO `tp_region` VALUES ('3301', '390', '玉环县', '3', '0');
INSERT INTO `tp_region` VALUES ('3302', '390', '三门县', '3', '0');
INSERT INTO `tp_region` VALUES ('3303', '390', '天台县', '3', '0');
INSERT INTO `tp_region` VALUES ('3304', '390', '仙居县', '3', '0');
INSERT INTO `tp_region` VALUES ('3305', '391', '鹿城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3306', '391', '龙湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('3307', '391', '瓯海区', '3', '0');
INSERT INTO `tp_region` VALUES ('3308', '391', '瑞安市', '3', '0');
INSERT INTO `tp_region` VALUES ('3309', '391', '乐清市', '3', '0');
INSERT INTO `tp_region` VALUES ('3310', '391', '洞头县', '3', '0');
INSERT INTO `tp_region` VALUES ('3311', '391', '永嘉县', '3', '0');
INSERT INTO `tp_region` VALUES ('3312', '391', '平阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('3313', '391', '苍南县', '3', '0');
INSERT INTO `tp_region` VALUES ('3314', '391', '文成县', '3', '0');
INSERT INTO `tp_region` VALUES ('3315', '391', '泰顺县', '3', '0');
INSERT INTO `tp_region` VALUES ('3316', '392', '定海区', '3', '0');
INSERT INTO `tp_region` VALUES ('3317', '392', '普陀区', '3', '0');
INSERT INTO `tp_region` VALUES ('3318', '392', '岱山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3319', '392', '嵊泗县', '3', '0');
INSERT INTO `tp_region` VALUES ('3320', '393', '衢州市', '3', '0');
INSERT INTO `tp_region` VALUES ('3321', '393', '江山市', '3', '0');
INSERT INTO `tp_region` VALUES ('3322', '393', '常山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3323', '393', '开化县', '3', '0');
INSERT INTO `tp_region` VALUES ('3324', '393', '龙游县', '3', '0');
INSERT INTO `tp_region` VALUES ('3325', '394', '合川区', '3', '0');
INSERT INTO `tp_region` VALUES ('3326', '394', '江津区', '3', '0');
INSERT INTO `tp_region` VALUES ('3327', '394', '南川区', '3', '0');
INSERT INTO `tp_region` VALUES ('3328', '394', '永川区', '3', '0');
INSERT INTO `tp_region` VALUES ('3329', '394', '南岸区', '3', '0');
INSERT INTO `tp_region` VALUES ('3330', '394', '渝北区', '3', '0');
INSERT INTO `tp_region` VALUES ('3331', '394', '万盛区', '3', '0');
INSERT INTO `tp_region` VALUES ('3332', '394', '大渡口区', '3', '0');
INSERT INTO `tp_region` VALUES ('3333', '394', '万州区', '3', '0');
INSERT INTO `tp_region` VALUES ('3334', '394', '北碚区', '3', '0');
INSERT INTO `tp_region` VALUES ('3335', '394', '沙坪坝区', '3', '0');
INSERT INTO `tp_region` VALUES ('3336', '394', '巴南区', '3', '0');
INSERT INTO `tp_region` VALUES ('3337', '394', '涪陵区', '3', '0');
INSERT INTO `tp_region` VALUES ('3338', '394', '江北区', '3', '0');
INSERT INTO `tp_region` VALUES ('3339', '394', '九龙坡区', '3', '0');
INSERT INTO `tp_region` VALUES ('3340', '394', '渝中区', '3', '0');
INSERT INTO `tp_region` VALUES ('3341', '394', '黔江开发区', '3', '0');
INSERT INTO `tp_region` VALUES ('3342', '394', '长寿区', '3', '0');
INSERT INTO `tp_region` VALUES ('3343', '394', '双桥区', '3', '0');
INSERT INTO `tp_region` VALUES ('3344', '394', '綦江县', '3', '0');
INSERT INTO `tp_region` VALUES ('3345', '394', '潼南县', '3', '0');
INSERT INTO `tp_region` VALUES ('3346', '394', '铜梁县', '3', '0');
INSERT INTO `tp_region` VALUES ('3347', '394', '大足县', '3', '0');
INSERT INTO `tp_region` VALUES ('3348', '394', '荣昌县', '3', '0');
INSERT INTO `tp_region` VALUES ('3349', '394', '璧山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3350', '394', '垫江县', '3', '0');
INSERT INTO `tp_region` VALUES ('3351', '394', '武隆县', '3', '0');
INSERT INTO `tp_region` VALUES ('3352', '394', '丰都县', '3', '0');
INSERT INTO `tp_region` VALUES ('3353', '394', '城口县', '3', '0');
INSERT INTO `tp_region` VALUES ('3354', '394', '梁平县', '3', '0');
INSERT INTO `tp_region` VALUES ('3355', '394', '开县', '3', '0');
INSERT INTO `tp_region` VALUES ('3356', '394', '巫溪县', '3', '0');
INSERT INTO `tp_region` VALUES ('3357', '394', '巫山县', '3', '0');
INSERT INTO `tp_region` VALUES ('3358', '394', '奉节县', '3', '0');
INSERT INTO `tp_region` VALUES ('3359', '394', '云阳县', '3', '0');
INSERT INTO `tp_region` VALUES ('3360', '394', '忠县', '3', '0');
INSERT INTO `tp_region` VALUES ('3361', '394', '石柱', '3', '0');
INSERT INTO `tp_region` VALUES ('3362', '394', '彭水', '3', '0');
INSERT INTO `tp_region` VALUES ('3363', '394', '酉阳', '3', '0');
INSERT INTO `tp_region` VALUES ('3364', '394', '秀山', '3', '0');
INSERT INTO `tp_region` VALUES ('3365', '395', '沙田区', '3', '0');
INSERT INTO `tp_region` VALUES ('3366', '395', '东区', '3', '0');
INSERT INTO `tp_region` VALUES ('3367', '395', '观塘区', '3', '0');
INSERT INTO `tp_region` VALUES ('3368', '395', '黄大仙区', '3', '0');
INSERT INTO `tp_region` VALUES ('3369', '395', '九龙城区', '3', '0');
INSERT INTO `tp_region` VALUES ('3370', '395', '屯门区', '3', '0');
INSERT INTO `tp_region` VALUES ('3371', '395', '葵青区', '3', '0');
INSERT INTO `tp_region` VALUES ('3372', '395', '元朗区', '3', '0');
INSERT INTO `tp_region` VALUES ('3373', '395', '深水埗区', '3', '0');
INSERT INTO `tp_region` VALUES ('3374', '395', '西贡区', '3', '0');
INSERT INTO `tp_region` VALUES ('3375', '395', '大埔区', '3', '0');
INSERT INTO `tp_region` VALUES ('3376', '395', '湾仔区', '3', '0');
INSERT INTO `tp_region` VALUES ('3377', '395', '油尖旺区', '3', '0');
INSERT INTO `tp_region` VALUES ('3378', '395', '北区', '3', '0');
INSERT INTO `tp_region` VALUES ('3379', '395', '南区', '3', '0');
INSERT INTO `tp_region` VALUES ('3380', '395', '荃湾区', '3', '0');
INSERT INTO `tp_region` VALUES ('3381', '395', '中西区', '3', '0');
INSERT INTO `tp_region` VALUES ('3382', '395', '离岛区', '3', '0');
INSERT INTO `tp_region` VALUES ('3383', '396', '澳门', '3', '0');
INSERT INTO `tp_region` VALUES ('3384', '397', '台北', '3', '0');
INSERT INTO `tp_region` VALUES ('3385', '397', '高雄', '3', '0');
INSERT INTO `tp_region` VALUES ('3386', '397', '基隆', '3', '0');
INSERT INTO `tp_region` VALUES ('3387', '397', '台中', '3', '0');
INSERT INTO `tp_region` VALUES ('3388', '397', '台南', '3', '0');
INSERT INTO `tp_region` VALUES ('3389', '397', '新竹', '3', '0');
INSERT INTO `tp_region` VALUES ('3390', '397', '嘉义', '3', '0');
INSERT INTO `tp_region` VALUES ('3391', '397', '宜兰县', '3', '0');
INSERT INTO `tp_region` VALUES ('3392', '397', '桃园县', '3', '0');
INSERT INTO `tp_region` VALUES ('3393', '397', '苗栗县', '3', '0');
INSERT INTO `tp_region` VALUES ('3394', '397', '彰化县', '3', '0');
INSERT INTO `tp_region` VALUES ('3395', '397', '南投县', '3', '0');
INSERT INTO `tp_region` VALUES ('3396', '397', '云林县', '3', '0');
INSERT INTO `tp_region` VALUES ('3397', '397', '屏东县', '3', '0');
INSERT INTO `tp_region` VALUES ('3398', '397', '台东县', '3', '0');
INSERT INTO `tp_region` VALUES ('3399', '397', '花莲县', '3', '0');
INSERT INTO `tp_region` VALUES ('3400', '397', '澎湖县', '3', '0');
INSERT INTO `tp_region` VALUES ('3401', '3', '合肥', '2', '0');
INSERT INTO `tp_region` VALUES ('3402', '3401', '庐阳区', '3', '0');
INSERT INTO `tp_region` VALUES ('3403', '3401', '瑶海区', '3', '0');
INSERT INTO `tp_region` VALUES ('3404', '3401', '蜀山区', '3', '0');
INSERT INTO `tp_region` VALUES ('3405', '3401', '包河区', '3', '0');
INSERT INTO `tp_region` VALUES ('3406', '3401', '长丰县', '3', '0');
INSERT INTO `tp_region` VALUES ('3407', '3401', '肥东县', '3', '0');
INSERT INTO `tp_region` VALUES ('3408', '3401', '肥西县', '3', '0');

-- -----------------------------
-- Table structure for `tp_seckill`
-- -----------------------------
DROP TABLE IF EXISTS `tp_seckill`;
CREATE TABLE `tp_seckill` (
  `sec_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀活动自增ID',
  `ru_id` int(10) unsigned NOT NULL COMMENT '商家ID',
  `acti_title` varchar(50) NOT NULL COMMENT '秒杀活动标题',
  `begin_time` int(11) NOT NULL,
  `is_putaway` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架',
  `acti_time` int(11) NOT NULL COMMENT '秒杀活动日期',
  `add_time` int(11) NOT NULL COMMENT '秒杀活动添加时间',
  `review_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态',
  PRIMARY KEY (`sec_id`),
  KEY `ru_id` (`ru_id`),
  KEY `review_status` (`review_status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_seckill`
-- -----------------------------
INSERT INTO `tp_seckill` VALUES ('3', '0', '测试2', '1554652801', '1', '1555343998', '1554608266', '3');

-- -----------------------------
-- Table structure for `tp_seckill_goods`
-- -----------------------------
DROP TABLE IF EXISTS `tp_seckill_goods`;
CREATE TABLE `tp_seckill_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sec_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tb_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀时段ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sec_price` decimal(10,2) NOT NULL,
  `sec_num` smallint(5) NOT NULL,
  `sec_limit` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sec_id` (`sec_id`),
  KEY `tb_id` (`tb_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_seckill_goods`
-- -----------------------------
INSERT INTO `tp_seckill_goods` VALUES ('1', '3', '1', '38', '40.00', '100', '2');
INSERT INTO `tp_seckill_goods` VALUES ('2', '3', '1', '37', '30.00', '100', '2');
INSERT INTO `tp_seckill_goods` VALUES ('3', '3', '1', '36', '10.00', '100', '2');
INSERT INTO `tp_seckill_goods` VALUES ('4', '3', '1', '35', '20.00', '20', '1');

-- -----------------------------
-- Table structure for `tp_seckill_goods_remind`
-- -----------------------------
DROP TABLE IF EXISTS `tp_seckill_goods_remind`;
CREATE TABLE `tp_seckill_goods_remind` (
  `r_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增秒杀提醒ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sec_goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀商品ID',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`r_id`),
  KEY `user_id` (`user_id`),
  KEY `sec_goods_id` (`sec_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='秒杀商品提醒关联表';


-- -----------------------------
-- Table structure for `tp_seckill_time_bucket`
-- -----------------------------
DROP TABLE IF EXISTS `tp_seckill_time_bucket`;
CREATE TABLE `tp_seckill_time_bucket` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `begin_time` time NOT NULL COMMENT '开始时间段',
  `end_time` time NOT NULL COMMENT '结束时间段',
  `title` varchar(50) NOT NULL COMMENT '秒杀时段标题',
  PRIMARY KEY (`id`),
  UNIQUE KEY `begin_time` (`begin_time`,`end_time`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_seckill_time_bucket`
-- -----------------------------
INSERT INTO `tp_seckill_time_bucket` VALUES ('4', '10:00:00', '11:11:12', '111');
INSERT INTO `tp_seckill_time_bucket` VALUES ('7', '11:11:13', '18:00:00', '2222');

-- -----------------------------
-- Table structure for `tp_settime`
-- -----------------------------
DROP TABLE IF EXISTS `tp_settime`;
CREATE TABLE `tp_settime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀活动自增ID',
  `title` varchar(50) NOT NULL COMMENT '秒杀活动标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_settime`
-- -----------------------------
INSERT INTO `tp_settime` VALUES ('1', '限时抢答');

-- -----------------------------
-- Table structure for `tp_shop`
-- -----------------------------
DROP TABLE IF EXISTS `tp_shop`;
CREATE TABLE `tp_shop` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '会员id',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `mobile` varchar(20) NOT NULL COMMENT '电话',
  `desctiption` varchar(255) NOT NULL COMMENT '主营商品',
  `level` int(2) NOT NULL COMMENT '店铺等级',
  `hide` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `district_id` int(2) NOT NULL COMMENT '商圈',
  `province` int(10) NOT NULL COMMENT '省',
  `city` int(10) NOT NULL COMMENT '城市',
  `district` int(10) NOT NULL COMMENT '区',
  `banner` varchar(255) NOT NULL COMMENT '展示图',
  `seller_money` decimal(10,2) NOT NULL COMMENT '可用余额',
  `frozen_money` decimal(10,2) NOT NULL COMMENT '冻结金额',
  `logo` varchar(255) NOT NULL COMMENT 'logo',
  `address_1` varchar(255) NOT NULL COMMENT '地址1',
  `address_2` varchar(255) NOT NULL COMMENT '地址2',
  `xzb` varchar(100) NOT NULL,
  `yzb` varchar(100) NOT NULL,
  `content` text NOT NULL COMMENT '客户详情',
  `show_content` text NOT NULL COMMENT '客户展示',
  `is_recommend` int(2) NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_recommendxq` int(2) NOT NULL COMMENT '商圈详情页推荐',
  `see` int(10) NOT NULL COMMENT '浏览量',
  `sales` int(10) NOT NULL COMMENT '销量',
  `popularity` int(10) NOT NULL COMMENT '人气',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_shop`
-- -----------------------------
INSERT INTO `tp_shop` VALUES ('1', '1', '店铺1', '3333', '测试', '1', '1', '9', '3', '36', '398', '', '20.00', '0.00', '', '测试', '测试', '', '', '', '', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `tp_shop` VALUES ('2', '6', '头疼难受', '15098712383', '保健品、医疗用品', '2', '1', '2', '4', '53', '520', '/upload/system/20190501/579fcc9c1de611c5da4696a2a820c4e8.jpg', '0.00', '0.00', '', '发送到发大水', '西车站202米', '118.7119500000', '36.8917500000', '', '', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `tp_shop` VALUES ('4', '1', '店铺42', '3333', '测试', '1', '1', '9', '3', '36', '398', '', '0.00', '0.00', '', '测试', '测试', '', '', '', '', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `tp_shop` VALUES ('5', '1', '店铺42', '3333', '测试', '1', '1', '9', '3', '36', '398', '', '0.00', '0.00', '', '测试', '测试', '', '', '', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tp_shop` VALUES ('6', '1', '店铺42', '3333', '测试', '1', '1', '9', '2', '52', '500', '', '0.00', '0.00', '', '测试', '测试', '118.7266700000', '36.8910500000', '', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tp_shop` VALUES ('7', '1', '测试5', '3333', '测试', '1', '1', '0', '2', '52', '502', '', '0.00', '0.00', '', '测试', '', '118.7062871000', '36.846379759704', '', '', '0', '0', '0', '0', '0', '1557045093', '0');
INSERT INTO `tp_shop` VALUES ('8', '3', '创客机器人', '18841265588', '专注培养学生的创新力和逻辑思维力', '1', '1', '12', '18', '246', '2088', '/upload/system/20190506/fcca6a182041d4c2fee65d0c9e378fdb.jpg', '0.00', '0.00', '/upload/system/20190506/7f37b3386425d26e9b149b9d6e8d28c1.jpg', '高新区越岭路69-S11号', '新世界朗悦居南门', '180.067726', '50.118948', '<p style=\"text-align:center\"><img src=\"/upload/temp/20190506/336b9549323787c5d59b52df4281f1bb.jpg\" title=\"336b9549323787c5d59b52df4281f1bb.jpg\" alt=\"336b9549323787c5d59b52df4281f1bb.jpg\" width=\"800\" height=\"257\"/></p><p>创客机器人教育成立XX年，</p><p>拥有什么师资力量，</p><p>在校学员多少，</p><p>学校介绍，</p><p>课程介绍，</p><p>店内环境，</p><p>LOGO，</p>', '', '0', '0', '0', '0', '0', '1557107867', '0');

-- -----------------------------
-- Table structure for `tp_shop_application`
-- -----------------------------
DROP TABLE IF EXISTS `tp_shop_application`;
CREATE TABLE `tp_shop_application` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `mechanism` varchar(50) NOT NULL COMMENT '机构',
  `city` varchar(40) NOT NULL,
  `add_time` int(11) NOT NULL,
  `progress` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_shop_application`
-- -----------------------------
INSERT INTO `tp_shop_application` VALUES ('1', '测试', '18053640781', '测试公司', '辽宁-大连', '1554641686', '0');
INSERT INTO `tp_shop_application` VALUES ('2', '111', '15098712383', '济南怡鲁', '', '1556433978', '0');
INSERT INTO `tp_shop_application` VALUES ('3', '111', '15098712383', '济南怡鲁', '', '1556434029', '0');
INSERT INTO `tp_shop_application` VALUES ('4', '111', '15098712383', '济南怡鲁', '山东-济南', '1556434051', '0');
INSERT INTO `tp_shop_application` VALUES ('5', '111', '15098712383', 'jinanyilui', 'shandong-jinan', '1556434105', '0');
INSERT INTO `tp_shop_application` VALUES ('6', '111', '15098712383', 'jinanyilui', 'shandong-jinan', '1556435602', '0');
INSERT INTO `tp_shop_application` VALUES ('7', '', 'undefined', 'undefined', 'shandong-jinan', '1556442314', '0');
INSERT INTO `tp_shop_application` VALUES ('8', '', 'undefined', 'undefined', 'shandong-jinan', '1556442352', '0');
INSERT INTO `tp_shop_application` VALUES ('9', '', 'undefined', 'undefined', 'shandong-jinan', '1556442501', '0');
INSERT INTO `tp_shop_application` VALUES ('10', '', 'undefined', 'undefined', 'shandong-jinan', '1556442539', '0');
INSERT INTO `tp_shop_application` VALUES ('11', '', 'undefined', 'undefined', 'shandong-jinan', '1556442545', '0');
INSERT INTO `tp_shop_application` VALUES ('12', '', 'undefined', 'undefined', 'shandong-jinan', '1556442574', '0');
INSERT INTO `tp_shop_application` VALUES ('13', '', 'undefined', 'undefined', '2,52,500', '1556442594', '0');
INSERT INTO `tp_shop_application` VALUES ('14', '', 'undefined', 'undefined', '2,52,500', '1556442664', '0');
INSERT INTO `tp_shop_application` VALUES ('15', '', 'undefined', 'undefined', '2,52,500', '1556442686', '0');
INSERT INTO `tp_shop_application` VALUES ('16', '', 'undefined', 'undefined', '2,52,500', '1556442779', '0');
INSERT INTO `tp_shop_application` VALUES ('17', '', 'undefined', 'undefined', '6,77,709', '1556444078', '0');
INSERT INTO `tp_shop_application` VALUES ('18', '', 'undefined', 'undefined', '10,143,1173', '1556444227', '0');
INSERT INTO `tp_shop_application` VALUES ('19', '111', '15098712383', 'jinanyilui', 'shandong-jinan', '1556496229', '0');
INSERT INTO `tp_shop_application` VALUES ('20', '111', '15098712383', 'jinanyilui', 'shandong-jinan', '1556509628', '0');
INSERT INTO `tp_shop_application` VALUES ('21', '理解', '15255848', '好哦垃圾', '', '1556521339', '0');
INSERT INTO `tp_shop_application` VALUES ('22', '立体角', '是15263639865', '很快', '', '1556524768', '0');
INSERT INTO `tp_shop_application` VALUES ('23', '', 'undefined', 'undefined', '5,65,625', '1556587604', '0');
INSERT INTO `tp_shop_application` VALUES ('24', '111', '15098712383', 'jinanyilui', 'shandong-jinan', '1556588540', '0');
INSERT INTO `tp_shop_application` VALUES ('25', '', 'undefined', 'undefined', 'undefined', '1556611798', '0');
INSERT INTO `tp_shop_application` VALUES ('26', '', 'undefined', 'undefined', 'undefined', '1556611820', '0');
INSERT INTO `tp_shop_application` VALUES ('27', '', 'undefined', 'undefined', '10,138,1078', '1556615684', '0');
INSERT INTO `tp_shop_application` VALUES ('28', '', 'undefined', 'undefined', '2,52,500', '1556615735', '0');
INSERT INTO `tp_shop_application` VALUES ('29', 'dsf', '18266365712', 'sdf', '2,52,500', '1556616260', '0');
INSERT INTO `tp_shop_application` VALUES ('30', 'sdf', '18266365712', 'fdsf', '2,52,500', '1556616533', '0');

-- -----------------------------
-- Table structure for `tp_shop_level`
-- -----------------------------
DROP TABLE IF EXISTS `tp_shop_level`;
CREATE TABLE `tp_shop_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `describe` varchar(200) DEFAULT NULL COMMENT '描述',
  `hide` int(2) NOT NULL DEFAULT '1',
  `is_default` int(11) NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_shop_level`
-- -----------------------------
INSERT INTO `tp_shop_level` VALUES ('1', '普通', '若如初相见，若如初相恋1', '0', '1');
INSERT INTO `tp_shop_level` VALUES ('2', 'VIP商家', '', '1', '0');

-- -----------------------------
-- Table structure for `tp_single_content`
-- -----------------------------
DROP TABLE IF EXISTS `tp_single_content`;
CREATE TABLE `tp_single_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typeid` int(10) DEFAULT '0' COMMENT '栏目ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='单页附加表';

-- -----------------------------
-- Records of `tp_single_content`
-- -----------------------------
INSERT INTO `tp_single_content` VALUES ('4', '5', '', '1550127628', '1550127628');
INSERT INTO `tp_single_content` VALUES ('5', '2', '', '1550127685', '1550127685');

-- -----------------------------
-- Table structure for `tp_sms_log`
-- -----------------------------
DROP TABLE IF EXISTS `tp_sms_log`;
CREATE TABLE `tp_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `session_id` varchar(128) DEFAULT '' COMMENT 'session_id',
  `add_time` int(11) DEFAULT '0' COMMENT '发送时间',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '发送状态,1:成功,0:失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信内容',
  `scene` int(1) DEFAULT '0' COMMENT '发送场景,1:用户注册,2:找回密码,3:客户下单,4:客户支付,5:商家发货,6:身份验证',
  `error_msg` text COMMENT '发送短信异常内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_sms_log`
-- -----------------------------
INSERT INTO `tp_sms_log` VALUES ('1', '15053626851', '', '1554520532', '205306', '1', '测试', '1', '');
INSERT INTO `tp_sms_log` VALUES ('2', '15053626851', '', '1554521030', '205306', '1', '测试', '2', '');

-- -----------------------------
-- Table structure for `tp_sms_template`
-- -----------------------------
DROP TABLE IF EXISTS `tp_sms_template`;
CREATE TABLE `tp_sms_template` (
  `tpl_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_sign` varchar(50) NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(512) NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_sms_template`
-- -----------------------------
INSERT INTO `tp_sms_template` VALUES ('9', '【教团网商城】', '3954', '验证码${code}，用户注册新账号, 请勿告诉他人，感谢您的支持!', '2', '1556180056');
INSERT INTO `tp_sms_template` VALUES ('10', '【教团网】', '4489', '尊敬的用户，您的验证码为${code}, 请勿告诉他人.', '6', '1556180045');
INSERT INTO `tp_sms_template` VALUES ('11', '【教团网】', '4162', '验证码${code}，用于密码找回，如非本人操作，请及时检查账户安全', '2', '1556180034');

-- -----------------------------
-- Table structure for `tp_supplyer`
-- -----------------------------
DROP TABLE IF EXISTS `tp_supplyer`;
CREATE TABLE `tp_supplyer` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL,
  `money` float(10,2) NOT NULL,
  `add_time` int(11) NOT NULL,
  `lastlogin_time` int(11) NOT NULL,
  `company` varchar(80) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(120) NOT NULL,
  `province` int(6) NOT NULL DEFAULT '0',
  `city` int(6) NOT NULL DEFAULT '0',
  `district` int(6) NOT NULL DEFAULT '0',
  `hide` int(2) NOT NULL DEFAULT '1',
  `level` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_supplyer`
-- -----------------------------
INSERT INTO `tp_supplyer` VALUES ('1', 'xiaoquan', '519475228fe35ad067744465c42a19b2', '0', '1556755798', '1556755798', '测试', '测试', '18053640781', '测试', '2', '52', '500', '1', '1');
INSERT INTO `tp_supplyer` VALUES ('2', '趣味空间服务中心', '519475228fe35ad067744465c42a19b2', '0', '1557106973', '1557106973', '鞍山高新技术产业开发区趣创智慧青少年创意空间服务中心', '张萱璐', '18841265588', '高新区越岭路69-S11号', '18', '246', '2088', '0', '1');
INSERT INTO `tp_supplyer` VALUES ('3', '趣味空间服务中心', '519475228fe35ad067744465c42a19b2', '0', '1557106975', '1557106975', '鞍山高新技术产业开发区趣创智慧青少年创意空间服务中心', '张萱璐', '18841265588', '高新区越岭路69-S11号', '18', '246', '2088', '1', '1');

-- -----------------------------
-- Table structure for `tp_user_address`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_address`;
CREATE TABLE `tp_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `country` int(11) NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '地区',
  `twon` int(11) DEFAULT '0' COMMENT '乡镇',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '默认收货地址',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址纬度',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_user_address`
-- -----------------------------
INSERT INTO `tp_user_address` VALUES ('1', '6', '橙橙', '1509872@qq.com', '1', '1', '1', '1', '1', '孙家镇', '520000', '15098712366', '0', '0.0000000', '0.0000000');

-- -----------------------------
-- Table structure for `tp_user_collection`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_collection`;
CREATE TABLE `tp_user_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户下载收集表',
  `mobile` varchar(11) DEFAULT '' COMMENT '用户手机号',
  `contact` varchar(32) DEFAULT '' COMMENT '联系人',
  `why_down` varchar(32) DEFAULT '' COMMENT '下载原因',
  `add_time` int(11) DEFAULT '0' COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_user_company`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_company`;
CREATE TABLE `tp_user_company` (
  `company_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `companyname` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `mainpro` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `logo` varchar(255) NOT NULL,
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `information` text NOT NULL COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `license` varchar(255) DEFAULT NULL COMMENT '默认收货地址',
  `name` varchar(20) NOT NULL COMMENT '地址经度',
  `position` varchar(50) NOT NULL COMMENT '地址纬度',
  `identification` varchar(100) NOT NULL,
  `photo1` varchar(255) NOT NULL,
  `photo2` varchar(255) NOT NULL,
  `isrz` int(2) NOT NULL DEFAULT '0' COMMENT '是否认证',
  `rzsj` int(10) NOT NULL,
  `sbsl` int(50) NOT NULL DEFAULT '0',
  `rygr` int(10) NOT NULL DEFAULT '0' COMMENT '0：企业认证1：个人认证',
  `province` int(5) DEFAULT NULL,
  `city` int(5) DEFAULT NULL,
  `county` int(5) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_user_company`
-- -----------------------------
INSERT INTO `tp_user_company` VALUES ('1', '8', 'onasdva', '主营项目', '/upload/user/8/logo/1078bc7894c710d5e97c0b70bfbff5d5.jpg', 'sdcas', '阿擦', '18053640781', '/upload/user/8/license//cb07a62883abc0e513e410af65303683.jpg', '测试', '岗位', '37989729372937', '/upload/user/8/photo1//3bff7a85330bea690e2c5c6c269120c5.jpg', '/upload/user/8/photo2//fb6cc7084cdbd436a8bb3ea6c7302c5a.jpg', '1', '1544427203', '13', '0', '', '', '');
INSERT INTO `tp_user_company` VALUES ('2', '44', '', '', '/upload/user/44/logo/d9651b397fcdbbb5ef74747a1c171ee2.jpg', '', '', '18053640781', '', '测试', '岗位', '37989729372937', '/upload/user/44/photo1//11312905a76d798be839465242ac2ec6.jpg', '/upload/user/44/photo2//9c7dc68ccc7e7087c2b5832b37eecfa9.jpg', '1', '1544427932', '4', '1', '', '', '');
INSERT INTO `tp_user_company` VALUES ('3', '45', '测试我是个公司', '12213213', '/upload/user/45/logo/efb107ac1317acbe5501769af7fe1963.jpg', '24123132132', 'd1f32d1f32d1f地方地方', '1365456', '/upload/user/45/license//baf959997bdcd9d8d903a3a28445e2e0.jpg', '132132', '6523', '21132132132132131', '/upload/user/45/photo1//f9fe90b64e91e9270cbd93c3d1add804.jpg', '/upload/user/45/photo2//78cff5f2f61733379049e6ec8ad49e36.jpg', '1', '1548899791', '1', '1', '', '', '');
INSERT INTO `tp_user_company` VALUES ('4', '48', '企业名称', '主营项目', '/upload/user/48/logo/531241b1b406ff6aaaf9e39070499df2.jpg', '天安门广场', '安达市多', '18376787823', '/upload/user/48/license//de5ba4ccaf284438fa942a65afe6575f.jpg', '测试', '岗位', '37989729372937', '/upload/user/48/photo1//9ad30836905bb1752febaf7c0d79ac1d.jpg', '/upload/user/48/photo2//ff3a368543c83c8a0afa739d518a514c.jpg', '1', '1548388830', '2', '0', '19280', '19421', '');

-- -----------------------------
-- Table structure for `tp_user_distribution`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_distribution`;
CREATE TABLE `tp_user_distribution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '分销会员id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(150) DEFAULT NULL COMMENT '商品名称',
  `cat_id` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `brand_id` mediumint(8) DEFAULT '0' COMMENT '商品品牌',
  `share_num` int(10) DEFAULT '0' COMMENT '分享次数',
  `sales_num` int(11) DEFAULT '0' COMMENT '分销销量',
  `addtime` int(11) DEFAULT NULL COMMENT '加入个人分销库时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='用户选择分销商品表';

-- -----------------------------
-- Records of `tp_user_distribution`
-- -----------------------------
INSERT INTO `tp_user_distribution` VALUES ('2', '2', '15915407513', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1523976440');
INSERT INTO `tp_user_distribution` VALUES ('3', '2', '15915407513', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1523976452');
INSERT INTO `tp_user_distribution` VALUES ('4', '2', '15915407513', '27', 'Sony/索尼 MDR-EX155AP 入耳式耳机通用重低音手机线控带麦通话', '80', '0', '0', '0', '1523979043');
INSERT INTO `tp_user_distribution` VALUES ('5', '2', '15915407513', '42', '探险者（TAN XIAN ZHE） 睡袋户外成人 春夏秋冬四季加厚保暖午休成人露营睡袋 1.6KG藏青+可拆洗内胆送助眠三宝', '61', '0', '0', '0', '1523979048');
INSERT INTO `tp_user_distribution` VALUES ('6', '2', '15915407513', '42', '探险者（TAN XIAN ZHE） 睡袋户外成人 春夏秋冬四季加厚保暖午休成人露营睡袋 1.6KG藏青+可拆洗内胆送助眠三宝', '61', '0', '0', '0', '1523979049');
INSERT INTO `tp_user_distribution` VALUES ('7', '2', '15915407513', '25', '直降200元◆vivo Y85全面屏手机 vivoy85手机 y75 y97官方旗舰店', '62', '0', '0', '0', '1524020077');
INSERT INTO `tp_user_distribution` VALUES ('8', '2', '15915407513', '92', '简约现代相框餐厅客厅创意装饰品摆件卧室艺术纪念相片收纳小摆件 创意 相框', '60', '0', '0', '0', '1524095697');
INSERT INTO `tp_user_distribution` VALUES ('9', '2', '15915407513', '115', '包材商城 TRULY信利SC 991ES PLUS微积分学生高考计算器 科学函数计算器', '43', '0', '0', '0', '1524095697');
INSERT INTO `tp_user_distribution` VALUES ('10', '2', '15915407513', '22', '北斗童书·中国地图：跟爸爸一起去旅行（百科知识版）大开本、精装绘本 [3-12岁]', '108', '0', '0', '0', '1524453207');
INSERT INTO `tp_user_distribution` VALUES ('11', '2', '15915407513', '33', '欧莱雅(LOREAL)男士8重醒肤护肤套装（洁面膏100ml+醒肤露50ml+洁面50mlx2+面膜单片x5）新老包装随机发货', '12', '0', '0', '0', '1524453207');
INSERT INTO `tp_user_distribution` VALUES ('12', '2', '15915407513', '36', '雀巢（Nestle）脆脆鲨 休闲零食 威化饼干巧克力味24*20g+8*20g', '55', '0', '0', '0', '1524453207');
INSERT INTO `tp_user_distribution` VALUES ('13', '2', '15915407513', '37', '罗技（Logitech）G502 炫光自适应游戏鼠标 RGB鼠标 FPS鼠标 吃鸡鼠标 绝地求生', '99', '0', '0', '0', '1524454774');
INSERT INTO `tp_user_distribution` VALUES ('14', '2', '15915407513', '51', 'Asus/华硕 商务本 _A580ur笔记本电脑轻薄便携学生游戏15.6英寸i5 八代酷睿i5 四色炫彩机身', '91', '0', '0', '0', '1524454774');
INSERT INTO `tp_user_distribution` VALUES ('15', '2', '15915407513', '53', '73Hours 天鹅小径 2018春季新品羊皮踝靴蝴蝶结细跟深口高跟鞋女 新品', '56', '0', '0', '0', '1524454774');
INSERT INTO `tp_user_distribution` VALUES ('16', '10', '等待', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524456844');
INSERT INTO `tp_user_distribution` VALUES ('17', '10', '等待', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524456844');
INSERT INTO `tp_user_distribution` VALUES ('18', '10', '等待', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524456844');
INSERT INTO `tp_user_distribution` VALUES ('19', '10', '等待', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524456845');
INSERT INTO `tp_user_distribution` VALUES ('20', '10', '等待', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524456845');
INSERT INTO `tp_user_distribution` VALUES ('21', '10', '等待', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524456845');
INSERT INTO `tp_user_distribution` VALUES ('22', '10', '等待', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524456847');
INSERT INTO `tp_user_distribution` VALUES ('23', '10', '等待', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524456847');
INSERT INTO `tp_user_distribution` VALUES ('24', '10', '等待', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524456847');
INSERT INTO `tp_user_distribution` VALUES ('25', '10', '等待', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524456849');
INSERT INTO `tp_user_distribution` VALUES ('26', '10', '等待', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524456849');
INSERT INTO `tp_user_distribution` VALUES ('27', '10', '等待', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524456849');
INSERT INTO `tp_user_distribution` VALUES ('28', '10', '等待', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524456849');
INSERT INTO `tp_user_distribution` VALUES ('29', '10', '等待', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524456849');
INSERT INTO `tp_user_distribution` VALUES ('30', '10', '等待', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524456849');
INSERT INTO `tp_user_distribution` VALUES ('31', '10', '等待', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524456850');
INSERT INTO `tp_user_distribution` VALUES ('32', '10', '等待', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524456850');
INSERT INTO `tp_user_distribution` VALUES ('33', '10', '等待', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524456850');
INSERT INTO `tp_user_distribution` VALUES ('34', '10', '等待', '22', '北斗童书·中国地图：跟爸爸一起去旅行（百科知识版）大开本、精装绘本 [3-12岁]', '108', '0', '0', '0', '1524728426');
INSERT INTO `tp_user_distribution` VALUES ('35', '10', '等待', '25', '直降200元◆vivo Y85全面屏手机 vivoy85手机 y75 y97官方旗舰店', '62', '0', '0', '0', '1524728426');
INSERT INTO `tp_user_distribution` VALUES ('36', '22', '13243434343', '10', '歌诺瑞丝衬衫女2018春季新品休闲宽松长袖格子打底上衣潮-NV10302 黄色 L', '190', '0', '0', '0', '1524735890');
INSERT INTO `tp_user_distribution` VALUES ('37', '22', '13243434343', '13', '【套餐赠耳机】HUAWEI/华为 畅享8 Plus 全面屏手机', '62', '0', '0', '0', '1524735890');
INSERT INTO `tp_user_distribution` VALUES ('38', '22', '13243434343', '14', '戴尔(DELL)灵越AIO 23.8英寸IPS窄边框一体机台式电脑(A6-9225 4G 1T 三年上门 无线键鼠 白)', '95', '0', '0', '0', '1524735890');
INSERT INTO `tp_user_distribution` VALUES ('39', '22', '13243434343', '22', '北斗童书·中国地图：跟爸爸一起去旅行（百科知识版）大开本、精装绘本 [3-12岁]', '108', '0', '0', '0', '1524735890');
INSERT INTO `tp_user_distribution` VALUES ('40', '22', '13243434343', '25', '直降200元◆vivo Y85全面屏手机 vivoy85手机 y75 y97官方旗舰店', '62', '0', '0', '0', '1524735890');
INSERT INTO `tp_user_distribution` VALUES ('41', '10', '等待', '27', 'Sony/索尼 MDR-EX155AP 入耳式耳机通用重低音手机线控带麦通话', '80', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('42', '10', '等待', '33', '欧莱雅(LOREAL)男士8重醒肤护肤套装（洁面膏100ml+醒肤露50ml+洁面50mlx2+面膜单片x5）新老包装随机发货', '12', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('43', '10', '等待', '36', '雀巢（Nestle）脆脆鲨 休闲零食 威化饼干巧克力味24*20g+8*20g', '55', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('44', '10', '等待', '37', '罗技（Logitech）G502 炫光自适应游戏鼠标 RGB鼠标 FPS鼠标 吃鸡鼠标 绝地求生', '99', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('45', '10', '等待', '42', '探险者（TAN XIAN ZHE） 睡袋户外成人 春夏秋冬四季加厚保暖午休成人露营睡袋 1.6KG藏青+可拆洗内胆送助眠三宝', '61', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('46', '10', '等待', '51', 'Asus/华硕 商务本 _A580ur笔记本电脑轻薄便携学生游戏15.6英寸i5 八代酷睿i5 四色炫彩机身', '91', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('47', '10', '等待', '53', '73Hours 天鹅小径 2018春季新品羊皮踝靴蝴蝶结细跟深口高跟鞋女 新品', '56', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('48', '10', '等待', '56', 'CHARLES＆KEITH波士顿包CK2-50780528春季通勤手提单肩包中号 纯色通勤 双根手拎带设计', '58', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('49', '10', '等待', '58', 'GPD win10掌上游戏机PSP掌机PS2迷你电脑LOL DNF网游', '104', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('50', '10', '等待', '67', '【赠明信片8张】现货包邮 幸得诸君慰平生 故园风雨前美文范本王开岭作序汪曾祺林清玄大冰推荐畅销书籍经典文学散文作家小说随笔', '110', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('51', '10', '等待', '72', '宁美国度 AOC I2479VXHD 23.8英寸高清屏幕护眼液晶电脑显示器 送发光键鼠套装', '96', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('52', '10', '等待', '81', '2018新款Apple/苹果 iPad 9.7英寸32/128Gwifi平板电脑air A182 2 12期分期 正规发票 正品国行', '93', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('53', '10', '等待', '92', '简约现代相框餐厅客厅创意装饰品摆件卧室艺术纪念相片收纳小摆件 创意 相框', '60', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('54', '10', '等待', '93', '【积分兑换】百斯锐羽毛球包 男女单肩黄金战包二代3支装运动背包 新款上市 黄金战包二代 PU材质', '58', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('55', '10', '等待', '115', '包材商城 TRULY信利SC 991ES PLUS微积分学生高考计算器 科学函数计算器', '43', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('56', '10', '等待', '122', '阿帕琦IK 手表镂空全自动夜光机械表 男表防水商务韩版时尚休闲腕表学生运动男士手表新款钟表 金边白面金机心/过万评价', '495', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('57', '10', '等待', '125', '面料菱形肌理感针织连衣裙', '15', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('58', '10', '等待', '128', '男士速干抗皱抽象字母印花短袖T恤', '25', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('59', '10', '等待', '130', '潮牌【多色情侣装】舒适抗皱百搭连帽套头运动男士卫衣', '24', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('60', '10', '等待', '139', 'Rimowa/日默瓦DELUXE电子标签30寸ELECTRONIC TAG智能拉杆箱 开启智能旅行时代', '477', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('61', '10', '等待', '217', '多版本多规格苹果电脑', '95', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('62', '10', '等待', '221', 'COACH/蔻驰 女士单肩斜挎手提包57521 客邻尚品', '58', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('63', '10', '等待', '222', 'Vero Moda2018春季新款吊带蕾丝中长款连衣裙|31816Z503 吊带，蕾丝，双层底摆，高腰', '15', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('64', '10', '等待', '227', '地区限制', '200', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('65', '10', '等待', '228', '多规格衣服的的快递', '15', '3', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('66', '10', '等待', '230', '稻草人(MEXICAN)男包男士单肩包头层牛皮竖款商务休闲单肩斜挎包小', '468', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('67', '10', '等待', '232', 'CASIO卡西欧 BA-120SC-1A 7A 9A 防水防震时尚炫彩运动女表', '500', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('68', '10', '等待', '233', '比多乐来一口PK脆休闲点心面 泰国酱鸡味336g 膨化', '435', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('69', '10', '等待', '234', '仙人球多肉植物组合', '541', '0', '0', '0', '1524753733');
INSERT INTO `tp_user_distribution` VALUES ('70', '10', '等待', '27', 'Sony/索尼 MDR-EX155AP 入耳式耳机通用重低音手机线控带麦通话', '80', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('71', '10', '等待', '33', '欧莱雅(LOREAL)男士8重醒肤护肤套装（洁面膏100ml+醒肤露50ml+洁面50mlx2+面膜单片x5）新老包装随机发货', '12', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('72', '10', '等待', '36', '雀巢（Nestle）脆脆鲨 休闲零食 威化饼干巧克力味24*20g+8*20g', '55', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('73', '10', '等待', '37', '罗技（Logitech）G502 炫光自适应游戏鼠标 RGB鼠标 FPS鼠标 吃鸡鼠标 绝地求生', '99', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('74', '10', '等待', '42', '探险者（TAN XIAN ZHE） 睡袋户外成人 春夏秋冬四季加厚保暖午休成人露营睡袋 1.6KG藏青+可拆洗内胆送助眠三宝', '61', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('75', '10', '等待', '51', 'Asus/华硕 商务本 _A580ur笔记本电脑轻薄便携学生游戏15.6英寸i5 八代酷睿i5 四色炫彩机身', '91', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('76', '10', '等待', '53', '73Hours 天鹅小径 2018春季新品羊皮踝靴蝴蝶结细跟深口高跟鞋女 新品', '56', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('77', '10', '等待', '56', 'CHARLES＆KEITH波士顿包CK2-50780528春季通勤手提单肩包中号 纯色通勤 双根手拎带设计', '58', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('78', '10', '等待', '58', 'GPD win10掌上游戏机PSP掌机PS2迷你电脑LOL DNF网游', '104', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('79', '10', '等待', '67', '【赠明信片8张】现货包邮 幸得诸君慰平生 故园风雨前美文范本王开岭作序汪曾祺林清玄大冰推荐畅销书籍经典文学散文作家小说随笔', '110', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('80', '10', '等待', '72', '宁美国度 AOC I2479VXHD 23.8英寸高清屏幕护眼液晶电脑显示器 送发光键鼠套装', '96', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('81', '10', '等待', '81', '2018新款Apple/苹果 iPad 9.7英寸32/128Gwifi平板电脑air A182 2 12期分期 正规发票 正品国行', '93', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('82', '10', '等待', '92', '简约现代相框餐厅客厅创意装饰品摆件卧室艺术纪念相片收纳小摆件 创意 相框', '60', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('83', '10', '等待', '93', '【积分兑换】百斯锐羽毛球包 男女单肩黄金战包二代3支装运动背包 新款上市 黄金战包二代 PU材质', '58', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('84', '10', '等待', '115', '包材商城 TRULY信利SC 991ES PLUS微积分学生高考计算器 科学函数计算器', '43', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('85', '10', '等待', '122', '阿帕琦IK 手表镂空全自动夜光机械表 男表防水商务韩版时尚休闲腕表学生运动男士手表新款钟表 金边白面金机心/过万评价', '495', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('86', '10', '等待', '125', '面料菱形肌理感针织连衣裙', '15', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('87', '10', '等待', '128', '男士速干抗皱抽象字母印花短袖T恤', '25', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('88', '10', '等待', '130', '潮牌【多色情侣装】舒适抗皱百搭连帽套头运动男士卫衣', '24', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('89', '10', '等待', '139', 'Rimowa/日默瓦DELUXE电子标签30寸ELECTRONIC TAG智能拉杆箱 开启智能旅行时代', '477', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('90', '10', '等待', '217', '多版本多规格苹果电脑', '95', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('91', '10', '等待', '221', 'COACH/蔻驰 女士单肩斜挎手提包57521 客邻尚品', '58', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('92', '10', '等待', '222', 'Vero Moda2018春季新款吊带蕾丝中长款连衣裙|31816Z503 吊带，蕾丝，双层底摆，高腰', '15', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('93', '10', '等待', '227', '地区限制', '200', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('94', '10', '等待', '228', '多规格衣服的的快递', '15', '3', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('95', '10', '等待', '230', '稻草人(MEXICAN)男包男士单肩包头层牛皮竖款商务休闲单肩斜挎包小', '468', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('96', '10', '等待', '232', 'CASIO卡西欧 BA-120SC-1A 7A 9A 防水防震时尚炫彩运动女表', '500', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('97', '10', '等待', '233', '比多乐来一口PK脆休闲点心面 泰国酱鸡味336g 膨化', '435', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('98', '10', '等待', '234', '仙人球多肉植物组合', '541', '0', '0', '0', '1524753737');
INSERT INTO `tp_user_distribution` VALUES ('99', '24', '18516589423', '139', 'Rimowa/日默瓦DELUXE电子标签30寸ELECTRONIC TAG智能拉杆箱 开启智能旅行时代', '477', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('100', '24', '18516589423', '217', '多版本多规格苹果电脑', '95', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('101', '24', '18516589423', '221', 'COACH/蔻驰 女士单肩斜挎手提包57521 客邻尚品', '58', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('102', '24', '18516589423', '222', 'Vero Moda2018春季新款吊带蕾丝中长款连衣裙|31816Z503 吊带，蕾丝，双层底摆，高腰', '15', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('103', '24', '18516589423', '227', '地区限制', '200', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('104', '24', '18516589423', '228', '多规格衣服的的快递', '15', '3', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('105', '24', '18516589423', '230', '稻草人(MEXICAN)男包男士单肩包头层牛皮竖款商务休闲单肩斜挎包小', '468', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('106', '24', '18516589423', '231', '多规格电脑', '91', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('107', '24', '18516589423', '232', 'CASIO卡西欧 BA-120SC-1A 7A 9A 防水防震时尚炫彩运动女表', '500', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('108', '24', '18516589423', '234', '仙人球多肉植物组合', '541', '0', '0', '0', '1524797291');
INSERT INTO `tp_user_distribution` VALUES ('109', '30', '独一无二', '232', 'CASIO卡西欧 BA-120SC-1A 7A 9A 防水防震时尚炫彩运动女表', '500', '0', '0', '0', '1524823917');
INSERT INTO `tp_user_distribution` VALUES ('110', '30', '独一无二', '234', '仙人球多肉植物组合', '541', '0', '0', '0', '1524823917');
INSERT INTO `tp_user_distribution` VALUES ('111', '2', '15915407513', '125', '面料菱形肌理感针织连衣裙', '15', '0', '0', '0', '1524824639');
INSERT INTO `tp_user_distribution` VALUES ('112', '2', '15915407513', '128', '男士速干抗皱抽象字母印花短袖T恤', '25', '0', '0', '0', '1524824639');
INSERT INTO `tp_user_distribution` VALUES ('113', '2', '15915407513', '130', '潮牌【多色情侣装】舒适抗皱百搭连帽套头运动男士卫衣', '24', '0', '0', '0', '1524824639');
INSERT INTO `tp_user_distribution` VALUES ('114', '2', '15915407513', '234', '仙人球多肉植物组合', '541', '0', '0', '0', '1524824662');
INSERT INTO `tp_user_distribution` VALUES ('115', '40', '王', '230', '稻草人(MEXICAN)男包男士单肩包头层牛皮竖款商务休闲单肩斜挎包小', '468', '0', '0', '0', '1524877401');
INSERT INTO `tp_user_distribution` VALUES ('116', '40', '王', '231', '多规格电脑', '91', '0', '0', '0', '1524877401');
INSERT INTO `tp_user_distribution` VALUES ('117', '40', '王', '232', 'CASIO卡西欧 BA-120SC-1A 7A 9A 防水防震时尚炫彩运动女表', '500', '0', '0', '0', '1524877401');
INSERT INTO `tp_user_distribution` VALUES ('118', '40', '王', '234', '仙人球多肉植物组合', '541', '0', '0', '0', '1524877401');
INSERT INTO `tp_user_distribution` VALUES ('119', '24', '18516589423', '81', '2018新款Apple/苹果 iPad 9.7英寸32/128Gwifi平板电脑air A182 2 12期分期 正规发票 正品国行', '93', '0', '0', '0', '1524877420');
INSERT INTO `tp_user_distribution` VALUES ('120', '24', '18516589423', '92', '简约现代相框餐厅客厅创意装饰品摆件卧室艺术纪念相片收纳小摆件 创意 相框', '60', '0', '0', '0', '1524877420');
INSERT INTO `tp_user_distribution` VALUES ('121', '24', '18516589423', '130', '潮牌【多色情侣装】舒适抗皱百搭连帽套头运动男士卫衣', '24', '0', '0', '0', '1524877420');

-- -----------------------------
-- Table structure for `tp_user_extend`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_extend`;
CREATE TABLE `tp_user_extend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `invoice_title` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票抬头',
  `taxpayer` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_desc` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '不开发票/明细',
  `realname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号',
  `cash_alipay` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '提现支付宝号',
  `cash_unionpay` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '提现银行卡号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- -----------------------------
-- Records of `tp_user_extend`
-- -----------------------------
INSERT INTO `tp_user_extend` VALUES ('1', '2', '新世界有限公司', '132252525252525', '明细', '', '', '', '');
INSERT INTO `tp_user_extend` VALUES ('2', '3', '网络科技', '123456789123455', '明细', '', '', '', '');
INSERT INTO `tp_user_extend` VALUES ('3', '1', '个人', '', '明细', '', '', '', '');
INSERT INTO `tp_user_extend` VALUES ('4', '10', '个人', '', '不开发票', '', '', '', '');
INSERT INTO `tp_user_extend` VALUES ('5', '9', '个人', '', '明细', '', '', '', '');

-- -----------------------------
-- Table structure for `tp_user_label`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_label`;
CREATE TABLE `tp_user_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签名称',
  `label_name` char(30) NOT NULL COMMENT '标签名称',
  `label_order` tinyint(2) NOT NULL COMMENT '标签排序',
  `label_code` varchar(80) NOT NULL COMMENT '标签图片',
  `label_describe` varchar(255) DEFAULT NULL COMMENT '标签描述',
  `is_recommend` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否推荐:0=否,1=是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_user_level`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_level`;
CREATE TABLE `tp_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint(4) DEFAULT '0' COMMENT '折扣',
  `describe` varchar(200) DEFAULT NULL COMMENT '头街 描述',
  `orderid` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_user_level`
-- -----------------------------
INSERT INTO `tp_user_level` VALUES ('1', '一星学霸', '0.00', '100', '若如初相见，若如初相恋', '0');
INSERT INTO `tp_user_level` VALUES ('2', '二星学霸', '1000.00', '99', '', '0');
INSERT INTO `tp_user_level` VALUES ('3', '三星学霸', '3000.00', '94', '', '0');
INSERT INTO `tp_user_level` VALUES ('4', '四星学霸', '10000.00', '95', '', '0');
INSERT INTO `tp_user_level` VALUES ('5', '五星学霸', '50000.00', '93', '', '0');
INSERT INTO `tp_user_level` VALUES ('6', '六星学霸', '100000.00', '91', '', '0');
INSERT INTO `tp_user_level` VALUES ('7', '七星学霸', '3000000.00', '90', '', '0');

-- -----------------------------
-- Table structure for `tp_user_message`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_message`;
CREATE TABLE `tp_user_message` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `message_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息id',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '通知消息：0, 活动消息：1, 物流:2, 私信:3',
  `is_see` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否查看：0未查看, 1已查看',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='用户的消息表';

-- -----------------------------
-- Records of `tp_user_message`
-- -----------------------------
INSERT INTO `tp_user_message` VALUES ('1', '2', '1', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('2', '2', '2', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('3', '2', '3', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('4', '2', '4', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('5', '1', '5', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('6', '1', '6', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('7', '2', '6', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('8', '10', '6', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('9', '1', '7', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('10', '2', '7', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('11', '10', '7', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('12', '1', '8', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('13', '2', '8', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('14', '2', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('15', '2', '10', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('16', '3', '10', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('17', '1', '3', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('18', '1', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('19', '3', '3', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('20', '3', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('21', '10', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('22', '6', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('23', '7', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('24', '8', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('25', '9', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('26', '10', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('27', '11', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('28', '12', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('29', '13', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('30', '14', '12', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('31', '6', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('32', '7', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('33', '8', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('34', '9', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('35', '10', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('36', '11', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('37', '12', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('38', '13', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('39', '14', '13', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('40', '10', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('41', '6', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('42', '7', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('43', '8', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('44', '9', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('45', '10', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('46', '11', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('47', '12', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('48', '13', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('49', '14', '14', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('50', '6', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('51', '7', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('52', '8', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('53', '9', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('54', '10', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('55', '11', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('56', '12', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('57', '13', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('58', '14', '15', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('59', '6', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('60', '7', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('61', '8', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('62', '9', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('63', '10', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('64', '11', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('65', '12', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('66', '13', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('67', '14', '16', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('68', '6', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('69', '7', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('70', '8', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('71', '9', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('72', '10', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('73', '11', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('74', '12', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('75', '13', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('76', '14', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('77', '15', '18', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('78', '6', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('79', '7', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('80', '8', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('81', '9', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('82', '10', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('83', '11', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('84', '12', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('85', '13', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('86', '14', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('87', '15', '19', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('88', '10', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('89', '6', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('90', '7', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('91', '8', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('92', '9', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('93', '10', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('94', '11', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('95', '12', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('96', '13', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('97', '14', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('98', '15', '20', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('99', '2', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('100', '2', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('101', '10', '21', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('102', '10', '22', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('103', '10', '23', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('104', '10', '24', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('105', '9', '3', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('106', '9', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('107', '9', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('108', '9', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('109', '13', '25', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('110', '14', '25', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('111', '15', '25', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('112', '10', '26', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('113', '3', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('114', '3', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('115', '3', '26', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('116', '2', '26', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('117', '6', '3', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('118', '6', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('119', '6', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('120', '6', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('121', '6', '26', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('122', '1', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('123', '1', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('124', '1', '26', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('125', '2', '27', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('126', '2', '28', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('127', '3', '27', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('128', '3', '28', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('129', '3', '29', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('130', '3', '30', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('131', '3', '31', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('132', '3', '32', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('133', '3', '33', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('134', '2', '29', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('135', '2', '30', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('136', '2', '31', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('137', '2', '32', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('138', '2', '34', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('139', '2', '35', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('140', '2', '36', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('141', '22', '37', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('142', '2', '37', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('143', '10', '27', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('144', '10', '28', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('145', '10', '29', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('146', '10', '30', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('147', '10', '31', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('148', '10', '32', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('149', '10', '34', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('150', '10', '35', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('151', '10', '37', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('152', '17', '27', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('153', '17', '28', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('154', '17', '29', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('155', '17', '30', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('156', '17', '31', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('157', '17', '32', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('158', '17', '34', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('159', '17', '35', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('160', '17', '37', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('161', '2', '38', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('162', '2', '39', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('163', '2', '40', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('164', '2', '41', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('165', '25', '38', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('166', '25', '39', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('167', '25', '40', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('168', '25', '41', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('169', '25', '42', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('170', '25', '43', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('171', '2', '42', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('172', '2', '43', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('173', '25', '44', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('174', '25', '45', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('175', '2', '44', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('176', '2', '45', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('177', '8', '3', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('178', '8', '9', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('179', '8', '11', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('180', '8', '17', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('181', '8', '26', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('182', '8', '27', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('183', '8', '28', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('184', '8', '29', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('185', '8', '30', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('186', '8', '31', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('187', '8', '32', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('188', '8', '34', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('189', '8', '35', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('190', '8', '37', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('191', '8', '38', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('192', '8', '39', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('193', '8', '40', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('194', '8', '41', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('195', '8', '42', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('196', '8', '43', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('197', '8', '44', '0', '0', '0');
INSERT INTO `tp_user_message` VALUES ('198', '8', '45', '0', '0', '0');

-- -----------------------------
-- Table structure for `tp_user_msg_tpl`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_msg_tpl`;
CREATE TABLE `tp_user_msg_tpl` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `mmt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) DEFAULT NULL COMMENT '短信接收内容',
  `mmt_short_sign` varchar(50) DEFAULT NULL COMMENT '短信签名',
  `mmt_short_code` varchar(50) DEFAULT NULL COMMENT '短信模板ID',
  `mmt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) DEFAULT NULL COMMENT '邮件标题',
  `mmt_mail_content` text COMMENT '邮件内容',
  PRIMARY KEY (`mmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息模板';


-- -----------------------------
-- Table structure for `tp_user_yzm`
-- -----------------------------
DROP TABLE IF EXISTS `tp_user_yzm`;
CREATE TABLE `tp_user_yzm` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `add_time` varchar(20) NOT NULL COMMENT '时间',
  `code` varchar(10) NOT NULL COMMENT '验证码',
  `types` int(2) NOT NULL COMMENT '0:注册1：找回密码2：更改密码3：验证手机号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_user_yzm`
-- -----------------------------
INSERT INTO `tp_user_yzm` VALUES ('43', '15098712383', '1556415017', '680796', '0');
INSERT INTO `tp_user_yzm` VALUES ('44', '18266365712', '1556415235', '246742', '0');
INSERT INTO `tp_user_yzm` VALUES ('46', '', '1556439603', '757347', '0');
INSERT INTO `tp_user_yzm` VALUES ('47', '18264696264', '1556440016', '594734', '0');

-- -----------------------------
-- Table structure for `tp_users`
-- -----------------------------
DROP TABLE IF EXISTS `tp_users`;
CREATE TABLE `tp_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 保密 1 男 2 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `distribut_money` decimal(10,2) DEFAULT '0.00' COMMENT '累积分佣金额',
  `underling_number` int(5) DEFAULT '0' COMMENT '用户下线总数',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消费积分',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `head_pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `nickname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费累计额度',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否为分销商 0 否 1 是',
  `first_leader` int(11) DEFAULT '0' COMMENT '第一个上级',
  `second_leader` int(11) DEFAULT '0' COMMENT '第二个上级',
  `third_leader` int(11) DEFAULT '0' COMMENT '第三个上级',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `message_mask` tinyint(1) NOT NULL DEFAULT '63' COMMENT '消息掩码',
  `push_id` varchar(30) NOT NULL DEFAULT '' COMMENT '推送id',
  `distribut_level` tinyint(2) DEFAULT '0' COMMENT '分销商等级',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP ：0不是，1是',
  `xcx_qrcode` varchar(255) DEFAULT NULL COMMENT '小程序专属二维码',
  `poster` varchar(255) DEFAULT NULL COMMENT '专属推广海报',
  `zccsname` varchar(100) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `year1` varchar(10) NOT NULL,
  `month1` varchar(10) NOT NULL,
  `day1` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `email` (`email`),
  KEY `underling_number` (`underling_number`),
  KEY `mobile` (`mobile_validated`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_users`
-- -----------------------------
INSERT INTO `tp_users` VALUES ('1', '102424317@qq.com', '90600d68b0f56d90c4c34284d8dfd138', '', '0', '0', '0.00', '0.00', '0.00', '0', '4350', '0', '1554348941', '1554599861', '', '', '18265694569', '1', '', '', '', '', '16068', '16069', '0', '0', '18265694569', '1', '1.00', '0.00', '0', '0', '0', '0', '0', '05034d6509bbf7ef15c34b06c8115c92', '63', '', '0', '0', '', '', '', 'ceshi', '2008', '5', '14');
INSERT INTO `tp_users` VALUES ('2', '137351076@qq.com', '21d7e94419d64104cc507159e963607f', '', '1', '0', '0.00', '0.00', '0.00', '0', '750', '0', '1556345463', '1556348238', '123.168.221.72', '137351076', '15098712384', '0', '', '', '', '', '0', '0', '0', '0', 'zhangcheng', '1', '1.00', '0.00', '0', '0', '0', '0', '0', '', '63', '', '0', '0', '', '', '', '', '', '', '');
INSERT INTO `tp_users` VALUES ('5', '', '519475228fe35ad067744465c42a19b2', '', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '1556415216', '1557103567', '', '', '15098712383', '1', '', '', '', '2019-09-15.jpg', '0', '0', '0', '0', '', '1', '1.00', '0.00', '0', '0', '0', '0', '0', 'f423a8e4c1ed0cf88488cd02fd86c8df', '63', '', '0', '0', '', '', '', '15098712383', '', '', '');
INSERT INTO `tp_users` VALUES ('6', '', '519475228fe35ad067744465c42a19b2', '', '0', '1619539200', '0.00', '0.00', '0.00', '0', '3900', '0', '1556415248', '1557132400', '', '', '18266365712', '1', '', '', '', '/public/images/icon_goods_thumb_empty_300.png', '0', '0', '0', '0', '年后', '1', '1.00', '0.00', '0', '0', '0', '0', '0', '2fa9787724edbc2da1be376d36311fa3', '63', '', '0', '0', '', '', '', '18266365712', '', '', '');
INSERT INTO `tp_users` VALUES ('8', '', '519475228fe35ad067744465c42a19b2', '', '0', '0', '0.00', '0.00', '0.00', '0', '0', '0', '1556440034', '1556440046', '', '', '18264696264', '1', '', '', '', '/public/images/icon_goods_thumb_empty_300.png', '0', '0', '0', '0', '18264696264', '1', '1.00', '0.00', '0', '0', '0', '0', '0', '8a53182ca5d291bb8be547a31ecc988f', '63', '', '0', '0', '', '', '', '18264696264', '', '', '');

-- -----------------------------
-- Table structure for `tp_video`
-- -----------------------------
DROP TABLE IF EXISTS `tp_video`;
CREATE TABLE `tp_video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `litpic` varchar(120) DEFAULT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `video_brief` varchar(300) DEFAULT NULL,
  `video_content` text NOT NULL,
  `video_illustration` text NOT NULL,
  `hit` int(10) NOT NULL DEFAULT '0',
  `hide` int(2) NOT NULL DEFAULT '1',
  `is_delete` int(2) NOT NULL DEFAULT '0',
  `price` float(10,2) NOT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `shop_id` int(10) NOT NULL DEFAULT '0',
  `package` text COMMENT '套餐',
  `suppliers_id` int(10) NOT NULL DEFAULT '0',
  `coupon` int(2) NOT NULL DEFAULT '1',
  `cat_id` int(10) NOT NULL DEFAULT '0',
  `orderid` int(10) NOT NULL DEFAULT '0',
  `goods_desc` text,
  `illustration` text,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_video`
-- -----------------------------
INSERT INTO `tp_video` VALUES ('1', '测试', '', '1557240725', '', '', '', '1', '1', '0', '0', '', '8', 'a:3:{s:9:\"price_min\";s:1:\"1\";s:9:\"price_max\";s:1:\"1\";s:6:\"prices\";a:3:{i:0;a:3:{s:5:\"tname\";s:7:\"视频1\";s:9:\"video_src\";s:11:\"b0029zjr96z\";s:5:\"price\";d:1;}i:1;a:3:{s:5:\"tname\";s:7:\"视频2\";s:9:\"video_src\";s:11:\"p0867bt4o9j\";s:5:\"price\";d:1;}i:2;a:3:{s:5:\"tname\";s:7:\"视频3\";s:9:\"video_src\";s:11:\"f08673dtbjw\";s:5:\"price\";d:1;}}}', '3', '1', '3', '0', '', '', '0');

-- -----------------------------
-- Table structure for `tp_video_list`
-- -----------------------------
DROP TABLE IF EXISTS `tp_video_list`;
CREATE TABLE `tp_video_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `v_id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `price` float(10,2) NOT NULL,
  `length_time` varchar(40) NOT NULL,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_vote`
-- -----------------------------
DROP TABLE IF EXISTS `tp_vote`;
CREATE TABLE `tp_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(250) NOT NULL DEFAULT '',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_vote`
-- -----------------------------
INSERT INTO `tp_vote` VALUES ('2', '测试', '1554307200', '1555516800', '0', '0');
INSERT INTO `tp_vote` VALUES ('4', '益达 232', '1555430400', '1556640000', '1', '0');

-- -----------------------------
-- Table structure for `tp_vote_log`
-- -----------------------------
DROP TABLE IF EXISTS `tp_vote_log`;
CREATE TABLE `tp_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `vote_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `tp_vote_option`
-- -----------------------------
DROP TABLE IF EXISTS `tp_vote_option`;
CREATE TABLE `tp_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(250) NOT NULL DEFAULT '',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_vote_option`
-- -----------------------------
INSERT INTO `tp_vote_option` VALUES ('4', '2', '测试22', '0', '100');
INSERT INTO `tp_vote_option` VALUES ('3', '2', '测试', '0', '100');
INSERT INTO `tp_vote_option` VALUES ('5', '0', '3123123', '0', '100');
INSERT INTO `tp_vote_option` VALUES ('7', '4', '3123123', '0', '2');

-- -----------------------------
-- Table structure for `tp_withdrawals`
-- -----------------------------
DROP TABLE IF EXISTS `tp_withdrawals`;
CREATE TABLE `tp_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请表',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `create_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `refuse_time` int(11) DEFAULT '0' COMMENT '拒绝时间',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号或支付宝账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提款账号真实姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提现备注',
  `taxfee` decimal(10,2) DEFAULT '0.00' COMMENT '税收手续费',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败',
  `pay_code` varchar(100) DEFAULT NULL COMMENT '付款对账流水号',
  `error_code` varchar(255) DEFAULT NULL COMMENT '付款失败错误代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `tp_withdrawals`
-- -----------------------------
INSERT INTO `tp_withdrawals` VALUES ('2', '2', '90.00', '1523841382', '0', '0', '1523841459', '农业银行', '1546515984', 'summer', '拒绝提现', '0.00', '-1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('4', '10', '5.00', '1524209675', '0', '0', '0', '邮政银行', '', '', '', '0.00', '0', '', '');
INSERT INTO `tp_withdrawals` VALUES ('5', '10', '5.00', '1524209834', '0', '0', '0', '邮政银行', '', '', '', '0.00', '0', '', '');
INSERT INTO `tp_withdrawals` VALUES ('6', '10', '50.00', '1524210188', '0', '0', '0', '邮政', '1589282822', '傅傅', '', '0.00', '0', '', '');
INSERT INTO `tp_withdrawals` VALUES ('7', '10', '52.00', '1524212180', '1524451365', '0', '0', '工商银行', '25828', '都', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('8', '10', '52.00', '1524212219', '1524451365', '0', '0', '工商银行', '25828', '都', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('9', '9', '1000.00', '1524215498', '1524450423', '1524451245', '0', '工商银行', '', '', '审核通过', '0.00', '2', '', '');
INSERT INTO `tp_withdrawals` VALUES ('10', '9', '60.00', '1524215853', '1524450423', '1524451199', '0', '支付宝', '123456', '夏夏', '审核通过', '0.00', '2', '', '');
INSERT INTO `tp_withdrawals` VALUES ('12', '2', '50.00', '1524471876', '1524471923', '0', '0', '微信', '123456', '15915407513', 'OK', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('13', '21', '1000.00', '1524724990', '1524725014', '0', '0', '支付宝', '1546515984', '夏夏', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('14', '21', '200.00', '1524725080', '0', '0', '0', '微信', '1528585858', 'summer', '', '0.00', '0', '', '');
INSERT INTO `tp_withdrawals` VALUES ('16', '2', '5.00', '1524730890', '1524730926', '0', '0', '工商银行', '', '', 'dd', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('17', '22', '10.00', '1524735958', '0', '0', '0', '工商银行', '', '', '', '0.00', '0', '', '');
INSERT INTO `tp_withdrawals` VALUES ('18', '17', '700.00', '1524790781', '0', '0', '1524790973', '支付宝', '', '', '8555', '0.00', '-2', '', '');
INSERT INTO `tp_withdrawals` VALUES ('19', '17', '104.00', '1524791221', '1524791802', '0', '0', '工商银行', '', '', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('20', '17', '100.00', '1524791997', '0', '0', '1524792014', '支付宝', '123456789966332', '夏夏', '43434343', '0.00', '-1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('21', '17', '100.00', '1524822453', '1524822512', '0', '0', '支付宝', '', '', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('22', '17', '600.00', '1524822485', '1524822512', '0', '0', '支付宝', '', '', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('23', '24', '2000.00', '1524822640', '1524822657', '0', '0', '支付宝', '1527485554', '夏天', '审核通过', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('24', '24', '2000.00', '1524822706', '1524822722', '0', '0', '支付宝', '1527485554', '夏天', '232323', '0.00', '1', '', '');
INSERT INTO `tp_withdrawals` VALUES ('25', '2', '50.00', '1524824178', '1524824214', '0', '0', '支付宝', '15915407513', '傅傅', 'CHENG', '0.00', '1', '', '');
