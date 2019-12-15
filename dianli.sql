-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-12-10 08:05:28
-- 服务器版本： 5.7.26
-- PHP 版本： 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `dianli`
--

-- --------------------------------------------------------

--
-- 表的结构 `fuwu`
--

DROP TABLE IF EXISTS `fuwu`;
CREATE TABLE IF NOT EXISTS `fuwu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `address` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `jingli_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jingli_id` (`jingli_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `fuwu`
--

INSERT INTO `fuwu` (`id`, `startTime`, `address`, `jingli_id`) VALUES
(1, '2019-01-04 00:00:00', '123', 1),
(2, '2019-02-04 00:00:00', '123', 1),
(3, '2019-03-04 00:00:00', '123', 2),
(4, '2019-03-04 00:00:00', '123', 2),
(5, '2019-04-04 00:00:00', '123', 1),
(6, '2019-05-04 00:00:00', '123', 1),
(7, '2019-05-04 00:00:00', '123', 1),
(8, '2019-06-04 00:00:00', '123', 1),
(9, '2019-06-04 00:00:00', '123', 1),
(10, '2019-07-04 00:00:00', '123', 1),
(11, '2019-08-04 00:00:00', '123', 1),
(12, '2019-08-04 00:00:00', '123', 1),
(13, '2019-08-04 00:00:00', '123', 1),
(14, '2019-09-04 00:00:00', '123', 1),
(15, '2019-09-04 00:00:00', '123', 1),
(16, '2019-09-04 00:00:00', '123', 1),
(17, '2019-10-04 00:00:00', '123', 1),
(18, '2019-11-04 00:00:00', '123', 1),
(19, '2019-12-04 00:00:00', '123', 1);

-- --------------------------------------------------------

--
-- 表的结构 `guzhang`
--

DROP TABLE IF EXISTS `guzhang`;
CREATE TABLE IF NOT EXISTS `guzhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `address` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `fenlei` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `sanji` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `jingli_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jingli_id` (`jingli_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `guzhang`
--

INSERT INTO `guzhang` (`id`, `startTime`, `endTime`, `address`, `fenlei`, `sanji`, `jingli_id`) VALUES
(1, '2019-01-04 00:00:00', '2019-12-25 00:00:00', '123', '客户内部故障', '居民客户内部故障', 1),
(2, '2019-02-20 00:00:00', '2019-12-27 00:00:00', '123213', '客户内部故障', '居民客户内部故障', 1),
(3, '2019-08-05 00:00:00', '2019-12-27 00:00:00', NULL, '计量故障', '计量表计', 1),
(4, '2019-09-05 00:00:00', '2019-12-27 00:00:00', '123', '客户内部故障', '居民客户内部故障', 1),
(5, '2019-12-05 00:00:00', '2019-12-27 00:00:00', '13', '客户内部故障', '非居民客户内部故障', 1),
(6, '2019-12-05 00:00:00', '2019-12-27 00:00:00', '13', '客户内部故障', '非居民客户内部故障', 1),
(7, '2019-12-05 00:00:00', '2019-12-27 00:00:00', '13', '非电力故障', '无故障', 1),
(8, '2019-01-04 00:00:00', '2019-12-25 00:00:00', '123', '客户内部故障', '居民客户内部故障', 1),
(9, '2019-08-20 00:00:00', '2019-12-27 00:00:00', '123213', '客户内部故障', '居民客户内部故障', 1),
(10, '2019-08-05 00:00:00', '2019-12-27 00:00:00', NULL, '计量故障', '计量表计', 1),
(11, '2019-03-05 00:00:00', '2019-12-27 00:00:00', NULL, '计量故障', '计量表计', 1),
(12, '2019-04-05 00:00:00', '2019-12-27 00:00:00', NULL, '低压故障', '熔断器', 1),
(13, '2019-05-05 00:00:00', '2019-12-27 00:00:00', NULL, '低压故障', '熔断器', 1),
(14, '2019-06-05 00:00:00', '2019-12-27 00:00:00', NULL, '低压故障', '熔断器', 1),
(15, '2019-07-05 00:00:00', '2019-12-27 00:00:00', NULL, '低压故障', '熔断器', 1),
(16, '2019-10-05 00:00:00', '2019-12-27 00:00:00', NULL, '低压故障', '熔断器', 1),
(17, '2019-11-05 00:00:00', '2019-12-27 00:00:00', NULL, '低压故障', '熔断器', 1),
(18, '2019-07-05 00:00:00', '2019-12-27 00:00:00', NULL, '高压故障', '柱上断路器', 1),
(19, '2019-07-05 00:00:00', '2019-12-27 00:00:00', NULL, '高压故障', '电杆（塔）', 1),
(20, '2019-08-05 00:00:00', '2019-12-27 00:00:00', NULL, '高压故障', '柱上断路器', 1),
(21, '2019-04-05 00:00:00', '2019-12-27 00:00:00', NULL, '电能质量故障', '电压高', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jingli`
--

DROP TABLE IF EXISTS `jingli`;
CREATE TABLE IF NOT EXISTS `jingli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `serviceArea` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `jingli`
--

INSERT INTO `jingli` (`id`, `name`, `serviceArea`) VALUES
(1, '1', '1212'),
(2, '高改革', '上海市电力大学'),
(4, '高开放', '按怠速');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) COLLATE utf8_bin NOT NULL,
  `pwd` varchar(100) COLLATE utf8_bin NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `pwd`, `add_time`) VALUES
(1, 'asdf', 'asdf', '2019-12-17 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
