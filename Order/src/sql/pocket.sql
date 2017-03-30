-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.1.49-community - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 pocket 的数据库结构
CREATE DATABASE IF NOT EXISTS `pocket` /*!40100 DEFAULT CHARACTER SET gbk */;
USE `pocket`;


-- 导出  表 pocket.administrator 结构
CREATE TABLE IF NOT EXISTS `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL DEFAULT '0',
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `realname` varchar(8) NOT NULL,
  `telephone` int(11) NOT NULL,
  `lasttime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.administrator 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`id`, `level`, `username`, `password`, `realname`, `telephone`, `lasttime`) VALUES
	(1, 0, 'admin', '123', '德玛', 1000, '2014-06-17 00:11:11'),
	(2, 1, 'hsiaosan', '123', '德玛西亚', 10000, '2014/06/17 06:42:44'),
	(3, 1, '凹凸曼', '123', '迪加', 125800, '2014/06/17 06:45:38'),
	(4, 1, '艾希', '123', '啦啦啦', 110, '2014/06/17 06:47:39');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;


-- 导出  表 pocket.announcement 结构
CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `Time` varchar(50) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.announcement 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`id`, `content`, `Time`, `username`) VALUES
	(11, '<p>\r\n	aaaaaaaaaaaaaaaaaaaaaaaaaaaassd<strong>dsdsdsdsd</strong>\r\n</p>', '2014/06/30 01:48:27', '凹凸曼'),
	(12, '<p>\r\n	<strong>asdasdsdasdasd<em>sadasdsad<u>sadsadsadsdsadasdasdsadsasdsadsadasd<span style="background-color:#60D978;">dasdasdasdasdasddasdsadddddd</span></u></em></strong>\r\n</p>\r\n<p>\r\n	<strong><em><u><span style="background-color:#60D978;"><strong>asdasdsdasdasd<em>sadasdsad<u>sadsadsadsdsadasdasdsadsasdsadsadasd<span style="background-color:#60D978;">dasdasdasdasdasddasdsadddddd</span></u></em></strong></span></u></em></strong>\r\n</p>\r\n<p>\r\n	<strong><em><u><span style="background-color:#60D978;"><strong>asdasdsdasdasd<em>sadasdsad<u>sadsadsadsdsadasdasdsadsasdsadsadasd<span style="background-color:#60D978;">dasdasdasdasdasddasdsadddddd</span></u></em></strong></span></u></em></strong>\r\n</p>\r\n<p>\r\n	<strong><em><u><span style="background-color:#60D978;"><strong>asdasdsdasdasd<em>sadasdsad<u>sadsadsadsdsadasdasdsadsasdsadsadasd<span style="background-color:#60D978;">dasdasdasdasdasddasdsadddddd</span></u></em></strong><strong>asdasdsdasdasd<em>sadasdsad<u>sadsadsadsdsadasdasdsadsasdsadsadasd<span style="background-color:#60D978;">dasdasdasdasdasddasdsadddddd</span></u></em></strong></span></u></em></strong>\r\n</p>\r\n<p>\r\n	<strong><em><u><span style="background-color:#60D978;"><strong>asdasdsdasdasd<em>sadasdsad<u>sadsadsadsdsadasdasdsadsasdsadsadasd<span style="background-color:#60D978;">dasdasdasdasdasddasdsadddddd</span></u></em></strong><br />\r\n</span></u></em></strong>\r\n</p>', '2014/07/02 08:11:35', '凹凸曼'),
	(13, '<p style="text-align:center;">\r\n	<img src="http://localhost:8080/pocket/admin/kindeditor-4.1.7/plugins/emoticons/images/0.gif" border="0" alt="" /><img src="http://localhost:8080/pocket/admin/kindeditor-4.1.7/plugins/emoticons/images/9.gif" border="0" alt="" /><img src="http://localhost:8080/pocket/admin/kindeditor-4.1.7/plugins/emoticons/images/0.gif" border="0" alt="" /><span style="line-height:1.5;">sadsad</span><strong>dddddddddddddddd<span style="font-size:24px;">dddddddddddddddddd</span></strong>\r\n</p>\r\n<h3 style="text-align:left;">\r\n	<strong><span style="font-size:24px;">dasssssssssssdssssssssssss</span></strong>\r\n</h3>\r\n<h3 style="text-align:left;">\r\n	<strong><span style="font-size:24px;">dsssssssssss</span></strong>\r\n</h3>', '2014/07/02 08:46:47', '凹凸曼');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;


-- 导出  表 pocket.basket 结构
CREATE TABLE IF NOT EXISTS `basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_basket_menu` (`m_id`),
  CONSTRAINT `FK_basket_menu` FOREIGN KEY (`m_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.basket 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` (`id`, `m_id`, `c_id`) VALUES
	(1, 2, 2),
	(2, 2, 2);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;


-- 导出  表 pocket.client 结构
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` int(11) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.client 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`id`, `username`, `password`, `telephone`, `address`, `email`, `money`, `level`) VALUES
	(1, 'hsiaosan', 123, 123456, '中国', 'hsiaosan@126.cn', 0, 1),
	(2, '奥特曼', 123, 10000, '中国', 'aoteman@126.cn', 100, 0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


-- 导出  表 pocket.menu 结构
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dishes` varchar(16) NOT NULL,
  `price` varchar(50) NOT NULL,
  `synopsis` varchar(100) NOT NULL,
  `launchtime` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `sum` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.menu 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `dishes`, `price`, `synopsis`, `launchtime`, `path`, `status`, `sum`) VALUES
	(1, '蒜香辣味小排骨', '35', '小排骨、糖、盐、叉烧酱、鸡精', '2014-06-07 10:20:13', 'images/x1.jpg', '0', '100'),
	(2, '啤酒洋葱鸭', '28', '洋葱、鸭、盐、冰糖、啤酒、八角', '2014-06-07 10:20:59', 'images/x2.jpg', '0', '22'),
	(3, '南乳烧肉', '32', '五花肉、葱、姜、蒜切碎，南乳', '2014-06-07 10:21:32', 'images/x3.jpg', '0', '5'),
	(4, '杨桃炖老母鸡', '25', '鸡肉、姜、黄芪、党参、玉竹、枸杞、红枣', '2014-06-07 10:22:07', 'images/x4.jpg', '0', '0'),
	(5, '酥炸土豆肉饼', '10', '土豆、肉末、盐、黑胡椒、鸡蛋、面包屑', '2014-06-07 10:22:39', 'images/x5.jpg', '0', '6'),
	(6, '花开见佛', '20', '莲藕、西红柿、红醋、糖、酸梅', '2014-06-07 10:23:07', 'images/x6.jpg', '0', '0');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- 导出  表 pocket.orders 结构
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sum` varchar(50) NOT NULL,
  `downtime` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `address` varchar(32) NOT NULL,
  `price` varchar(50) NOT NULL,
  `ischeckout` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_client` (`c_id`),
  KEY `FK_orders_menu` (`m_id`),
  CONSTRAINT `FK_orders_client` FOREIGN KEY (`c_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_orders_menu` FOREIGN KEY (`m_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.orders 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `c_id`, `m_id`, `name`, `sum`, `downtime`, `telephone`, `address`, `price`, `ischeckout`) VALUES
	(2, 1, 1, '痘痘', '1', '2014-06-09 21:35:36', '10000', '中国', '10', 0),
	(6, 1, 5, '奥特曼', '1', '2014/06/12 09:17:07', '10000 ', '中国', '10', 0),
	(7, 2, 2, '奥特曼他弟弟', '1', '2014/06/23 19:39:27', '10000 ', '中国', '28', 0),
	(8, 2, 2, '奥特曼啊', '1', '2014/06/23 19:51:50', '10000 ', '中国', '28', 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- 导出  表 pocket.review 结构
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_review_client` (`c_id`),
  KEY `FK_review_menu` (`m_id`),
  CONSTRAINT `FK_review_client` FOREIGN KEY (`c_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_review_menu` FOREIGN KEY (`m_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=gbk;

-- 正在导出表  pocket.review 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`id`, `c_id`, `m_id`, `content`, `time`) VALUES
	(1, 2, 5, 'abcde', '2014-06-08 14:25:01'),
	(2, 1, 1, '1111', '2014-06-08 17:03:51'),
	(3, 1, 5, '好好吃啊', '2014-06-09 10:41:52'),
	(4, 2, 1, '哈哈哈哈哈哈哈啊哈', '2014-06-12 08:28:24'),
	(9, 2, 5, '成功', '2014/06/23 13:56:31'),
	(10, 2, 5, '成功啦', '2014/06/23 13:57:55'),
	(11, 2, 2, '好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃', '2014/06/23 19:18:29'),
	(15, 2, 2, '城管嘎嘎嘎灌灌灌灌灌', '2014/06/23 19:33:24'),
	(21, 2, 2, '好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃', '2014/06/23 19:18:29'),
	(22, 2, 2, '好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃', '2014/06/23 19:18:29'),
	(23, 2, 2, '好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃', '2014/06/23 19:18:29');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
