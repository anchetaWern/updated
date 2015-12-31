-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 31, 2015 at 10:59 AM
-- Server version: 5.6.27-0ubuntu1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devnews`
--

-- --------------------------------------------------------

--
-- Table structure for table `news_sources`
--

CREATE TABLE IF NOT EXISTS `news_sources` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `curator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `day_to_update` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latest_url_element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latest_url_index` int(11) NOT NULL,
  `latest_url_base` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_short_url` tinyint(1) NOT NULL,
  `is_on_break` tinyint(1) NOT NULL,
  `is_xml` tinyint(1) NOT NULL,
  `h2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `search_str` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `replace_str` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_api` tinyint(1) NOT NULL,
  `is_twitter` tinyint(1) NOT NULL,
  `is_unsorted` tinyint(1) NOT NULL,
  `excluded_text` text COLLATE utf8_unicode_ci NOT NULL,
  `excluded_url` text COLLATE utf8_unicode_ci NOT NULL,
  `twitter_screen_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_index` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_query` tinyint(1) NOT NULL,
  `api_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_visit_item_link` tinyint(1) NOT NULL,
  `item_base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news_sources`
--

INSERT INTO `news_sources` (`id`, `title`, `route`, `category`, `curator`, `base_url`, `day_to_update`, `latest_url_element`, `latest_url_index`, `latest_url_base`, `item_element`, `is_short_url`, `is_on_break`, `is_xml`, `h2`, `h3`, `search_str`, `replace_str`, `is_api`, `is_twitter`, `is_unsorted`, `excluded_text`, `excluded_url`, `twitter_screen_name`, `parent_element`, `parent_index`, `text_source`, `has_query`, `api_field`, `is_visit_item_link`, `item_base_url`) VALUES
(1, 'Hacker News', 'hn', 'hn', 'hackernews', 'https://hacker-news.firebaseio.com/v0/topstories.json', '', '', 0, '', '', 0, 0, 0, '', '', '', '', 1, 0, 0, '', 'https://twitter.com/intent/tweet', '', '', '', '', 1, '', 0, ''),
(2, 'Next Draft', 'nextdraft', 'curators', 'nextdraft', 'http://us2.campaign-archive1.com/home/?u=ed102783e87fee61c1a534a9d&id=dd6d48f649', '', 'a', 2, '', '.newsletter_section a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'https://twitter.com/intent/tweet\r\nhttp://www.facebook.com/sharer/sharer.php', '', '', '', '', 0, '', 0, ''),
(3, 'Versioning', 'versioning', 'webdev', 'versioning', 'https://www.sitepoint.com/versioning/api/v1/archives', '', '', 0, '', 'a', 1, 0, 0, '', '', '', '', 0, 0, 0, 'Twitter\r\nFacebook\r\nGoogle+\r\nthe archive\r\nTweet\r\nForward\r\nthis page\r\nthis tweet\r\nPreferences\r\nUnsubscribe\r\nShare\r\nVersioning community', 'sitepoint-versioning.createsend1.com/t/y-l-idyhkjy-l-jl/\r\nsitepoint-versioning.createsend1.com/t/y-l-idyhkjy-l-jr/\r\nsitepoint-versioning.createsend1.com/t/y-l-idyhkjy-l-jj/\r\nsitepoint-versioning.createsend1.com/t/y-l-idyhkjy-l-jj/\r\nsitepointdotcom.createsend.com/functionalityDisabled.html\r\nsitepoint-versioning.createsend1.com/t/y-tw-idyhkjy-l-jd/\r\nsitepoint-versioning.forwardtomyfriend.com/y-l-2AD73FFF-idyhkjy-l-jh\r\nsitepoint-versioning.createsend1.com/t/y-l-idyhkjy-l-jy/\r\nsitepoint-versioning.createsend1.com/t/y-l-ikirdtl-l-r/\r\nsitepoint-versioning.createsend1.com/t/y-l-ikirdtl-l-y/', '', '', '', '', 0, 'WebVersionURL', 0, ''),
(4, 'HTML5Weekly', 'html5weekly', 'webdev', 'html5weekly', 'http://html5weekly.com/latest', 'Thursday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nWeb Operations Weekly: Our New Weekly for Web Engineers', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttp://html5weekly.com/issues/*%7CUNSUB%7C*\r\nhttp://html5weekly.com/issues/*%7CUPDATE_PROFILE%7C*\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html\r\nhttp://red-gate.com/products/sql-development/sql-prompt/', '', '', '', '', 0, '', 0, ''),
(5, 'JavaScript Weekly', 'jsweekly', 'webdev', 'jsweekly', 'http://javascriptweekly.com/latest', 'Saturday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nStop getting JavaScript Weekly\r\nWeb Operations Weekly: Our New Weekly for Web Engineers', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html', '', '', '', '', 0, '', 0, ''),
(6, 'Ruby Weekly', 'rubyweekly', 'programming', 'rubyweekly', 'http://rubyweekly.com/latest', 'Friday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nclick here\r\nWeb Operations Weekly: Our New Weekly for Web Engineers', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html\r\nhttps://twitter.com/peterc	', '', '', '', '', 0, '', 0, ''),
(7, 'Database Weekly', 'dbweekly', 'db', 'dbweekly', 'http://dbweekly.com/latest', 'Saturday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Read this on the Web\r\nUnsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nUpdate your email address\r\nunsubscribe here\r\nWeb Operations Weekly: Our New Weekly for Web Engineers', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/mediakit2014q2.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html\r\ndbweekly.com\r\nhttp://dbweekly.com\r\nhttp://dbweekly.com/issues', '', '', '', '', 0, '', 0, ''),
(8, 'Postgres Weekly', 'postgresweekly', 'db', 'postgresweekly', 'http://postgresweekly.com/latest', 'Thursday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nUpdate your email address\r\nunsubscribe here\r\nWeb Operations Weekly: Our New Weekly for Web Engineers', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/mediakit2014q2.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html\r\nhttp://postgresweekly.com/issues', '', '', '', '', 0, '', 0, ''),
(9, 'Status Code', 'statuscode', 'programming', 'statuscode', 'http://statuscode.org/latest', 'Saturday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nunsubscribe here\r\nmedia kit.\r\nUpdate your email address', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html', '', '', '', '', 0, '', 0, ''),
(10, 'Node Weekly', 'nodeweekly', 'webdev', 'nodeweekly', 'http://nodeweekly.com/latest', 'Friday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nunsubscribe here\r\nmedia kit.\r\nUpdate your email address', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html', '', '', '', '', 0, '', 0, ''),
(11, 'PHP Weekly', 'phpweekly', 'webdev', 'phpweekly', 'http://www.phpweekly.com/archive.html', 'Friday', 'a', 1, 'http://www.phpweekly.com', '.contentBlock a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'unsubscribe from this list\r\nupdate subscription preferences\r\nSourceGuardian\r\nSponsor this newsletter\r\nMonitoring without alerts\r\nkatie@phpweekly.com\r\nadrian.teasdale@gmail.com\r\nTry JIRA for Free Today >', 'https://www.facebook.com/pages/PHPWeekly/388110517964770\r\nhttps://twitter.com/PHPWeeklyNews\r\nsourceguardian.com\r\nlaunchbit.com', '', '', '', '', 0, '', 0, ''),
(12, 'Responsive Design Weekly', 'rdweekly', 'webdev', 'rdweekly', 'http://us4.campaign-archive2.com/home/?u=559bc631fe5294fc66f5f7f89&id=df65b6d7c8', 'Thursday', 'a', 2, '', '.templateContainer a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'update subscription preferences\r\nunsubscribe from this list\r\nView in browser.', 'http://responsivedesignweekly.com/advertise\r\nhttp://responsivedesign.is/ask-me', '', '', '', '', 0, '', 0, ''),
(13, 'NoSQL Weekly', 'nosqlweekly', 'db', 'nosqlweekly', 'http://us2.campaign-archive1.com/home/?u=72f68dcee17c92724bc7822fb&id=2f0470315b', 'Friday', 'a', 1, '', '#contentTable a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nForward to a friend\r\nUpdate your profile\r\nAdd us to your address book', '', '', '', '', '', 0, '', 0, ''),
(14, 'Python Weekly', 'pythonweekly', 'programming', 'pythonweekly', 'http://us2.campaign-archive2.com/home/?u=e2e180baf855ac797ef407fc7&id=9e26887fc5', 'Friday', 'a', 1, '', '#contentTable a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nForward to a friend\r\nUpdate your profile\r\nAdd us to your address book', '', '', '', '', '', 0, '', 0, ''),
(15, 'WebTools Weekly', 'webtoolsweekly', 'tools', 'webtoolsweekly', 'http://us5.campaign-archive1.com/home/?u=ea228d7061e8bbfa8639666ad&id=104d6bcc2d', 'Saturday', 'a', 3, '', '#templateContainer a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Skip to the tools section below\r\nupdate subscription preferences\r\nunsubscribe from this list\r\n@WebToolsWeekly\r\nwebtoolsweekly.com\r\ndetails here\r\nView this email in your browser\r\nMonitoring without alerts\r\nSponsor this newsletter', 'launchbit.com\r\n#', '', '', '', '', 0, '', 0, ''),
(16, 'Web Development Reading List', 'wdrl', 'webdev', 'wdrl', 'https://wdrl.info/archive/', 'Saturday', '.archive-list a', 0, '', 'ul a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Flattr\r\nChristian Gloddy\r\nRead the Letter online\r\ngratipay\r\nabout the costs of the project here\r\nDonate via GratiPay', 'https://wdrl.info/archive\r\nhttps://wdrl.info/about\r\nhttps://wdrl.info/submit\r\nhttps://wdrl.info/donate', '', '', '', '', 0, '', 0, ''),
(17, 'Web Design Weekly', 'wdweekly', 'webdev', 'wdweekly', 'http://web-design-weekly.com/category/newsletter/', 'Wednesday', '#main a', 0, '', '.entry-content a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'https://twitter.com/share\r\nhttp://plus.google.com/url\r\nhttps://www.facebook.com/sharer', '', '', '', '', 0, '', 0, ''),
(18, 'Mobile Web Weekly', 'mobilewebweekly', 'mobile', 'mobilewebweekly', 'http://mobilewebweekly.co/latest', 'Thursday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nunsubscribe here\r\nmedia kit.\r\nUpdate your email address\r\nstop receiving MWW here\r\nHolly Schinsky\r\nBrian Rinaldi\r\nRead this on the Web\r\nMobile Web Weekly', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html\r\nhttp://mobilewebweekly.co\r\nindeed.com', '', '', '', '', 0, '', 0, ''),
(19, 'Hey Designer', 'heydesigner', 'webdev', 'heydesigner', 'http://heydesigner.com/', 'Monday', '', 0, '', '.articles article a[rel=nofollow]', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(20, 'Gamedev.js Weekly', 'gamedevjsweekly', 'gamedev', 'gamedevjsweekly', 'http://us3.campaign-archive1.com/home/?u=4ad274b490aa6da8c2d29b775&id=bacab0c8ca', 'Saturday', '.display_archive a', 0, '', '.bodyContent a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'contact@gamedevjsweekly.com\r\nandrzej.mazur@end3r.com', 'https://www.paypal.me', '', '', '', '', 0, '', 0, ''),
(21, 'Ember Weekly', 'emberweekly', 'webdev', 'emberweekly', 'http://us4.campaign-archive1.com/home/?u=ac25c8565ec37f9299ac75ca0&id=e96229d21d', 'Monday', '#archive-list a', 0, '', '.templateContainer a.headline-link', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(22, 'WPMail.me', 'wpmailme', 'wordpress', 'wpmailme', 'http://us2.campaign-archive1.com/home/?u=51dd0bd2831ba102ab61a6401&id=76fc580ee3', 'Friday', '#archive-list a', 0, '', '.bodyContent a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(23, 'Beyond Desktop', 'beyonddesktop', 'webdev', 'beyonddesktop', 'http://us1.campaign-archive2.com/home/?u=304ef1419c812109265422add&id=e5791e58de', 'Tuesday', '#archive-list a', 0, '', '#templateBody a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'https://twitter.com/bdconf\r\nhttp://bdconf.com\r\nmailto:info@unmatchedstyle.com\r\nhttp://lanyrd.com/series/bdconf/\r\nhttps://plus.google.com/+Bdconf/posts\r\nhttps://www.facebook.com/breakingdc\r\nhttp://bdconf.com/videos/\r\nhttp://bdconf.com/articles/\r\nhttps://bdconf.com', '', '', '', '', 0, '', 0, ''),
(24, 'Pycoder''s Weekly', 'pycodersweekly', 'programming', 'pycodersweekly', 'http://us4.campaign-archive2.com/home/?u=9735795484d2e4c204da82a29&id=64134e0a27', 'Saturday', '#archive-list a', 0, '', '.templateContainer a[target=_blank]', 0, 0, 0, '', '', '', '', 0, 0, 0, 'View this email in your browser\r\narticle\r\nGratipay\r\ntwitter\r\nLevel Up Your Dev Skills\r\nSponsor this newsletter\r\n@mgrouchy\r\nJoin today!\r\nHired', 'http://teamtreehouse.com/join', '', '', '', '', 0, '', 0, ''),
(25, 'Perl Weekly', 'perlweekly', 'programming', 'perlweekly', 'http://perlweekly.com/archive/', 'Tuesday', 'table a', -1, 'http://perlweekly.com', 'table tbody tr td table td div p > a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'SZABGAB\r\nGabor Szabo', '', '', '', '', '', 0, '', 0, ''),
(26, 'Go-Lang Weekly', 'golangweekly', 'programming', 'golangweekly', 'http://www.golangweekly.com/archive/', 'Friday', 'li a', 0, 'http://www.golangweekly.com/', '.container a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'mattcottingham\r\nMatt Cottingham\r\nKelsey Hightower\r\nShare on Twitter\r\nfollow @golangweekly on twitter\r\nChange your email address\r\nStop getting Go Newsletter\r\nCooper Press\r\nSee our archives\r\nRead this issue on the Web\r\nPeter Cooper', '', '', '', '', '', 0, '', 0, ''),
(27, 'iOS Dev Weekly', 'iosdevweekly', 'mobile', 'iosdevweekly', 'http://iosdevweekly.com/', 'Saturday', '', 0, '', 'h3.item__title a', 1, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(28, 'Sidebar.io', 'sidebario', 'webdev', 'sidebario', 'http://feeds.sidebar.io/SidebarFeed', 'Sunday', '', 0, '', '', 0, 0, 1, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 1, '', 0, ''),
(29, 'Android Weekly', 'androidweekly', 'mobile', 'androidweekly', 'http://androidweekly.net/', 'Monday', '', 0, '', '.latest-issue a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Tweet\r\nFollow Us On Google+', '', '', '', '', '', 0, '', 0, ''),
(30, 'Medium', 'medium', 'curators', 'medium', 'https://medium.com/top-stories', '', '', 0, '', '.postArticle--short a', 0, 0, 0, '.graf--h2', '.graf--h3', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(31, 'Readability', 'readability', 'curators', 'readability', 'https://readability.com/topreads/?within=week', 'Sunday', '', 0, '', 'h1.entry-title a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(32, 'Slashdot', 'slashdot', 'curators', 'slashdot', 'http://slashdot.org/popular', '', '', 0, '', 'span[id^=title] a', 0, 0, 0, '', '', '//slashdot.org', 'http://slashdot.org', 0, 0, 0, '-&gt;\r\nJournal:', '', '', '', '', '', 0, '', 0, ''),
(33, 'Designer News', 'designernews', 'curators', 'designernews', 'https://www.designernews.co/', '', '', 0, '', '.story-link', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(34, 'Web Operations Weekly', 'webopsweekly', 'devops', 'webopsweekly', 'http://webopsweekly.com/latest', 'Thursday', '', 0, '', '.issue-html a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Unsubscribe\r\nChange email address\r\nRead this e-mail on the Web\r\nRead this issue on the Web\r\nunsubscribe here\r\nmedia kit.\r\nUpdate your email address\r\nStop getting WebOps Weekly\r\nChange your email address\r\nSee our archives\r\nRead this on the Web', 'http://twitter.com/peterc\r\nhttps://cooperpress.com/\r\nhttps://cooperpress.com/mediakit2014q4.pdf\r\nhttps://cooperpress.com/jobs\r\nhttps://cooperpress.com/spam.html\r\nhttps://cooperpress.com/privacy.html\r\nwebopsweekly.com', '', '', '', '', 0, '', 0, ''),
(35, 'Longreads Tech', 'longreadstech', 'curators', 'longreadstech', 'http://longreads.com/articles/search/?sort=newest&length=&q=tech', 'Monday', '', 0, '', '.article-title', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(36, 'JavaScript Live', 'jslive', 'webdev', 'jslive', 'https://api.twitter.com/1.1/statuses/user_timeline.json', '', '', 0, '', '', 0, 0, 0, '', '', '', '', 0, 1, 0, '', '', 'JavaScriptDaily', '', '', '', 0, '', 0, ''),
(37, 'Cancel Bubble', 'cancelbubble', 'webdev', 'cancelbubble', 'https://api.twitter.com/1.1/statuses/user_timeline.json', '', '', 0, '', '', 0, 0, 0, '', '', '', '', 0, 1, 0, '', '', 'cancelBubble', '', '', '', 0, '', 0, ''),
(38, 'Reddit Programming', 'redditprogramming', 'programming', 'redditprogramming', 'https://www.reddit.com/r/programming/top/?sort=top&t=week', '', '', 0, '', '#siteTable a.title', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(39, 'Reddit Web Design', 'redditwebdesign', 'webdev', 'redditwebdesign', 'https://www.reddit.com/r/web_design/top/?sort=top&t=week', '', '', 0, '', '#siteTable a.title', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(40, 'Reddit Webdev', 'redditwebdev', 'webdev', 'redditwebdev', 'https://www.reddit.com/r/webdev/top/?sort=top&t=week', '', '', 0, '', '#siteTable a.title', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(41, 'Pocket Hits', 'pocket', 'curators', 'pockethits', 'https://api.twitter.com/1.1/statuses/user_timeline.json', '', '', 0, '', '', 0, 0, 0, '', '', '', '', 0, 1, 0, '', '', 'PocketHits', '', '', '', 0, '', 0, ''),
(42, 'UX Design Weekly', 'uxdesignweekly', 'design', 'uxdesignweekly', 'http://uxdesignweekly.com/archived-issues/', 'Saturday', '.post-entry a', 0, '', '.post-entry a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'https://twitter.com/intent/tweet', '', '', '', '', 0, '', 0, ''),
(43, 'UX Weekly', 'uxweekly', 'design', 'uxweekly', 'https://pinboard.in/u:simonv3/t:uxweekly-sent/#', 'Friday', '', 0, '', 'a.bookmark_title', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(44, 'WebRTC Weekly', 'webrtcweekly', 'webdev', 'webrtcweekly', 'https://webrtcweekly.com/archives/', 'Thursday', '.archive-post-title a', 0, '', '.post-page-content a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(45, 'Upvoted Science and Technology', 'upvotedscitech', 'curators', 'upvotedscitech', 'http://upvoted.com/topic/science-tech/', '', '', 0, '', '.entry-title a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(46, 'Upvoted News', 'upvotednews', 'curators', 'upvotednews', 'http://upvoted.com/topic/news/', '', '', 0, '', '.entry-title a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(47, 'Docker Weekly', 'dockerweekly', 'devops', 'dockerweekly', 'https://blog.docker.com/docker-weekly-archives/', 'Thursday', '.main p a', 1, '', 'hr + p a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Docker Meetup\r\nDocker Talk\r\nDocker Workshop\r\nDocker Meetup\r\nDocker Administration and Operations\r\nthis link', 'twitter.com\r\nlinkedin.com\r\ngithub.com\r\n', '', '', '', '', 0, '', 0, ''),
(48, 'Real-time Weekly', 'realtimeweekly', 'webdev', 'realtimeweekly', 'http://realtimeweekly.co/issues/', 'Tuesday', '.post_text_inner a', 0, '', '.post_text_inner h3 a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(49, 'MySQL News', 'mysqlnews', 'db', 'mysqlnews', 'http://us6.campaign-archive1.com/home/?u=009fd87839a759e30570956a2&id=9bd9fc13c5', 'Saturday', 'a', 1, '', '#templateBody a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Baron\r\nCartoon Cred\r\nbsylvia@draftkings.com', 'boards.greenhouse.io\r\nworkingatbooking.com', '', '', '', '', 0, '', 0, ''),
(50, '.Net Weekly', 'dotnetweekly', 'programming', 'dotnetweekly', 'http://www.dotnetweekly.com/', 'Wednesday', '.newsletter_link_prev', 0, '', 'table table table td > span > a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(51, 'Full Web Weekly', 'fullwebweekly', 'webdev', 'fullwebweekly', 'http://us11.campaign-archive2.com/home/?u=8e9d09ec89c0c4ededef3beab&id=b98e776907', 'Wednesday', 'a', 1, '', '.content h3 > a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(52, 'Scala Times', 'scalatimes', 'programming', 'scalatimes', 'http://us2.campaign-archive1.com/home/?u=ba834c562d82d9aba5eaf90ba&id=32cef9ab4e', '', '.display_archive a', 0, '', '#bodyTable td > div > a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'tweet @scalatimes\r\nTHE INTERNET\r\nLet us know', '', '', '', '', '', 0, '', 0, ''),
(53, 'SASS News', 'sassnews', 'webdev', 'sassnews', 'http://sassnews.com/', 'Tuesday', '', 0, '', '.latest__item ul li a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(54, 'Makers Weekly', 'makersweekly', 'product', 'makersweekly', 'http://us2.campaign-archive2.com/home/?u=7c8dfc9b9c88fe1e1d5360f9e&id=4e523a566c', 'Monday', '.display_archive a', 0, '', '#templateContainer tr > td > a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'View this email in your browser\r\nunsubscribe from this list\r\nupdate subscription preferences\r\nvimeo.com', 'twitter.com', '', '', '', '', 0, '', 0, ''),
(55, 'User Onboard', 'useronboard', 'product', 'useronboard', 'http://us7.campaign-archive2.com/home/?u=d61edaa273ba973d957b3dac1&id=0c3c1eba14', 'Friday', '.display_archive a', 0, '', '.bodyContainer a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(56, 'Stackshare', 'stackshare', 'tools', 'stackshare', 'http://us2.campaign-archive2.com/home/?u=5298275b7ee689be412444f45&id=2911f8fd09', 'Saturday', '.display_archive a', 0, '', '#templateBody li a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(57, 'Hacking UI', 'hackingui', 'design', 'hackingui', 'http://us3.campaign-archive2.com/home/?u=d160a2c823e9efe5940e1fdcc&id=72b6427305', 'Friday', '.display_archive a', 0, '', '.linkscontent a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'Tweet this', '', '', '', '', '', 0, '', 0, ''),
(58, 'Product Design Weekly', 'productdesignweekly', 'design', 'productdesignweekly', 'http://designweekly.atomic.io/archive/', 'Friday', '.archive-item', 0, 'http://designweekly.atomic.io', '.pdw-article-title a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '#', '', '', '', '', 0, '', 0, ''),
(59, 'This Week in Rust', 'thisweekinrust', 'programming', 'thisweekinrust', 'http://this-week-in-rust.org/blog/archives/index.html', 'Tuesday', '.past-issues .post-title a', 0, '', 'ul li a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'https://twitter.com/ThisWeekInRust\r\nhttps://github.com/cmr/this-week-in-rust', '', '', '', '', 0, '', 0, ''),
(60, 'Clojure Gazette', 'clojuregazette', 'programming', 'clojuregazette', 'http://us4.campaign-archive1.com/home/?u=a33b5228d1b5bf2e0c68a83f4&id=4c2b86e9f4', 'Tuesday', '.display_archive a', 0, '', '.container h2 a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(61, 'Green Ruby News', 'greenrubynews', 'programming', 'greenrubynews', 'http://greenruby.org/', 'Monday', '', 0, '', '#templateBody tr td a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(62, 'Big Data Weekly', 'bigdataweekly', 'db', 'bigdataweekly', 'http://us2.campaign-archive1.com/home/?u=878bcd0ec6493f52f57278516&id=8556a84b93', 'Saturday', '.display_archive a', 0, '', '.bodyContainer h3 a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(63, 'Hadoop Weekly', 'hadoopweekly', 'db', 'hadoopweekly', 'http://www.hadoopweekly.com/archive.html', 'Monday', '.container-narrow .small-margin a', 0, 'http://www.hadoopweekly.com', '.container-narrow a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'twitter.com\r\nhadoop.apache.org\r\ndevopsweekly.com\r\nwww.apache.org', '', '', '', '', 0, '', 1, ''),
(64, 'Machine Learning Newsletter', 'machinelearningnewsletter', 'machine-learning', 'machinelearningnewsletter', 'http://us9.campaign-archive2.com/home/?u=6d6ec445effff06f92dee5076&id=bf55334973', 'Sunday', '.display_archive a', 0, '', '#templateFooter .null a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(65, 'AI Weekly', 'aiweekly', 'machine-learning', 'aiweekly', 'http://aiweekly.co/issues', 'Friday', '.issues li', 0, 'http://aiweekly.co', '.item__title a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(66, 'Software Lead Weekly', 'softwareleadweekly', 'product', 'softwareleadweekly', 'http://softwareleadweekly.com/issues', 'Saturday', '.container-narrow .archive a', -1, 'http://softwareleadweekly.com', '.container-narrow div.span12 a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '#\r\ntwitter.com', '', '', '', '', 0, '', 0, ''),
(67, 'Redis Watch', 'rediswatch', 'db', 'rediswatch', 'https://redislabs.com/redis-watch-archive', 'Saturday', '#main-content-holder a', 1, '', 'h3 a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(68, 'Data Science Weekly', 'datascienceweekly', 'data-science', 'datascienceweekly', 'http://www.datascienceweekly.org/newsletters', 'Friday', '#newsletter-content-index-page-inner li a', 0, 'http://www.datascienceweekly.org', '#newsletter-content-index-page li a', 0, 0, 0, '', '', '', '', 0, 0, 0, 'our resources page', '', '', '', '', '', 0, '', 0, ''),
(69, 'The Changelog', 'thechangelog', 'webdev', 'thechangelog', 'https://changelog.com/weekly/archive/', 'Sunday', '.post__content li a', 0, '', 'h2 a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(70, 'Echo JS', 'echojs', 'webdev', 'echojs', 'http://www.echojs.com/rss', '', '', 0, '', '', 0, 0, 1, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, ''),
(71, 'CSS Weekly', 'cssweekly', 'webdev', 'cssweekly', 'http://css-weekly.com/archives/', 'TUESDAY', '', 0, '', 'ul a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', 'article', '0', '', 0, '', 0, ''),
(72, 'Swift Weekly', 'swiftweekly', 'programming', 'swiftweekly', 'http://swiftweekly.com/issues', 'THURSDAY', 'a.currentIssue__category__item__link', 0, 'http://swiftweekly.com', '.currentIssue__categoryItem a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 1, ''),
(73, 'Web Audio Weekly', 'waw', 'webdev', 'waw', 'http://blog.chrislowis.co.uk/waw.html', 'SUNDAY', '.listing a', 0, 'http://blog.chrislowis.co.uk', '.content ul li a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', 'https://twitter.com/', '', '', '', '', 0, '', 1, ''),
(74, 'Redis Weekly', 'redisweekly', 'db', 'redisweekly', 'http://redisweekly.com/archive/', 'SUNDAY', '', 0, '', '.body_container h3 a', 0, 0, 0, '', '', '', '', 0, 0, 1, '', '', '', '', '', '', 0, '', 0, ''),
(75, 'Github', 'github', 'github', 'github', 'https://github.com/trending', '', '', 0, '', '.repo-list-name a', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, 'https://github.com'),
(76, 'Product Hunt', 'producthunt', 'product', 'producthunt', 'https://www.producthunt.com/tech', '', '', 0, '', '.day .posts--group a.name_1ORcF', 0, 0, 0, '', '', '', '', 0, 0, 0, '', '', '', '', '', '', 0, '', 0, 'https://www.producthunt.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news_sources`
--
ALTER TABLE `news_sources`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news_sources`
--
ALTER TABLE `news_sources`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;