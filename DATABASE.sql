-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `azv4_active_users`;
CREATE TABLE `azv4_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(11) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('9bbd54d9b01a323901bae673618c5524',	1,	'admin',	1631894462,	'27',	1);

DROP TABLE IF EXISTS `azv4_active_user_locks`;
CREATE TABLE `azv4_active_user_locks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(11) NOT NULL DEFAULT '0',
  `elementType` int(11) NOT NULL DEFAULT '0',
  `elementId` int(11) NOT NULL DEFAULT '0',
  `lasthit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
(1,	'9bbd54d9b01a323901bae673618c5524',	1,	7,	1,	1631894462);

DROP TABLE IF EXISTS `azv4_active_user_sessions`;
CREATE TABLE `azv4_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(11) NOT NULL DEFAULT '0',
  `lasthit` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('9bbd54d9b01a323901bae673618c5524',	1,	1631894462,	'188.163.83.187');

DROP TABLE IF EXISTS `azv4_categories`;
CREATE TABLE `azv4_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_categories` (`id`, `category`, `rank`) VALUES
(1,	'Manager and Admin',	0),
(2,	'Content',	0);

DROP TABLE IF EXISTS `azv4_documentgroup_names`;
CREATE TABLE `azv4_documentgroup_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` int(11) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` int(11) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_document_groups`;
CREATE TABLE `azv4_document_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_group` int(11) NOT NULL DEFAULT '0',
  `document` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  KEY `document_group` (`document_group`),
  KEY `document` (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_event_log`;
CREATE TABLE `azv4_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` int(11) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `event_log_user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1,	0,	1631889827,	3,	1,	0,	'Parser - $container = include $config;\n / PHP Pars',	'<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : include(/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/../../plugins/pagebuilder/config//container.PageBuilder.php): failed to open stream: No such file or directory</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/pagebuilder.customtv.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>18</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>$container = include $config;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://developertest.directpr.beget.tech/manager/?a=27&amp;r=1&amp;id=1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Manager action</td>\n		<td>27 - Editing resource</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://developertest.directpr.beget.tech/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>188.163.83.187</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2021-09-17 14:43:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0666 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0666 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>5.6175003051758 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Support\\Facades\\Facade::__callStatic</strong>(\'handleRoute\', array $var2)<br />manager/index.php on line 162</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handleRoute</strong>()<br />core/vendor/illuminate/support/Facades/Facade.php on line 261</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/ManagerTheme.php on line 407</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 625</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 636</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 672</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 697</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\VerifyCsrfToken->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/VerifyCsrfToken.php on line 13</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\Manager->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/Manager.php on line 25</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 695</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->runController</strong>()<br />core/vendor/illuminate/routing/Route.php on line 197</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\ControllerDispatcher->dispatch</strong>(Illuminate\\Routing\\Route $var1, EvolutionCMS\\Controllers\\Actions $var2, \'handleAction\')<br />core/vendor/illuminate/routing/Route.php on line 254</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Controllers\\Actions->handleAction</strong>()<br />core/vendor/illuminate/routing/ControllerDispatcher.php on line 48</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handle</strong>(27)<br />core/src/Controllers/Actions.php on line 27</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/ManagerTheme.php on line 420</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 38</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>require</strong>(string $var1)<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include_once</strong>(string $var1)<br />manager/views/page/27.php on line 5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>renderFormElement</strong>(string $var1, 1, \'\', \'\', \'\', \'\', array $var7, array $var8, array $var9)<br />manager/actions/mutate_content.dynamic.php on line 1056</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/functions/actions/mutate_content.php on line 953</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>include</strong>()<br />assets/tvs/pagebuilder/pagebuilder.customtv.php on line 18</td>\n	</tr>\n</table>\n'),
(2,	0,	1631889828,	3,	1,	0,	'Parser - $container = include $config;\n / PHP Pars',	'<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : include(/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/../../plugins/pagebuilder/config//container.PageBuilder.php): failed to open stream: No such file or directory</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/pagebuilder.customtv.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>18</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>$container = include $config;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://developertest.directpr.beget.tech/manager/?a=27&amp;r=1&amp;id=1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Manager action</td>\n		<td>27 - Editing resource</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://developertest.directpr.beget.tech/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>188.163.83.187</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2021-09-17 14:43:48</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>1.1158 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>1.1158 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6175079345703 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Support\\Facades\\Facade::__callStatic</strong>(\'handleRoute\', array $var2)<br />manager/index.php on line 162</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handleRoute</strong>()<br />core/vendor/illuminate/support/Facades/Facade.php on line 261</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/ManagerTheme.php on line 407</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 625</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 636</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 672</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 697</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\VerifyCsrfToken->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/VerifyCsrfToken.php on line 13</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\Manager->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/Manager.php on line 25</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 695</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->runController</strong>()<br />core/vendor/illuminate/routing/Route.php on line 197</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\ControllerDispatcher->dispatch</strong>(Illuminate\\Routing\\Route $var1, EvolutionCMS\\Controllers\\Actions $var2, \'handleAction\')<br />core/vendor/illuminate/routing/Route.php on line 254</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Controllers\\Actions->handleAction</strong>()<br />core/vendor/illuminate/routing/ControllerDispatcher.php on line 48</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handle</strong>(27)<br />core/src/Controllers/Actions.php on line 27</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/ManagerTheme.php on line 420</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 38</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>require</strong>(string $var1)<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include_once</strong>(string $var1)<br />manager/views/page/27.php on line 5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>renderFormElement</strong>(string $var1, 1, \'\', \'\', \'\', \'\', array $var7, array $var8, array $var9)<br />manager/actions/mutate_content.dynamic.php on line 1056</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/functions/actions/mutate_content.php on line 953</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>include</strong>()<br />assets/tvs/pagebuilder/pagebuilder.customtv.php on line 18</td>\n	</tr>\n</table>\n'),
(3,	0,	1631889968,	3,	1,	0,	'Parser - $container = include $config;\n / PHP Pars',	'<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : include(/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/../../plugins/pagebuilder/config//container.PageBuilder.php): failed to open stream: No such file or directory</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/pagebuilder.customtv.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>18</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>$container = include $config;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://developertest.directpr.beget.tech/manager/?a=27&amp;r=1&amp;id=1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Manager action</td>\n		<td>27 - Editing resource</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://developertest.directpr.beget.tech/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>188.163.83.187</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2021-09-17 14:46:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0631 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0631 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>5.6172866821289 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Support\\Facades\\Facade::__callStatic</strong>(\'handleRoute\', array $var2)<br />manager/index.php on line 162</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handleRoute</strong>()<br />core/vendor/illuminate/support/Facades/Facade.php on line 261</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/ManagerTheme.php on line 407</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 625</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 636</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 672</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 697</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\VerifyCsrfToken->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/VerifyCsrfToken.php on line 13</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\Manager->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/Manager.php on line 25</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 695</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->runController</strong>()<br />core/vendor/illuminate/routing/Route.php on line 197</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\ControllerDispatcher->dispatch</strong>(Illuminate\\Routing\\Route $var1, EvolutionCMS\\Controllers\\Actions $var2, \'handleAction\')<br />core/vendor/illuminate/routing/Route.php on line 254</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Controllers\\Actions->handleAction</strong>()<br />core/vendor/illuminate/routing/ControllerDispatcher.php on line 48</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handle</strong>(27)<br />core/src/Controllers/Actions.php on line 27</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/ManagerTheme.php on line 420</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 38</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>require</strong>(string $var1)<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include_once</strong>(string $var1)<br />manager/views/page/27.php on line 5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>renderFormElement</strong>(string $var1, 1, \'\', \'\', \'\', \'\', array $var7, array $var8, array $var9)<br />manager/actions/mutate_content.dynamic.php on line 1056</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/functions/actions/mutate_content.php on line 953</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>include</strong>()<br />assets/tvs/pagebuilder/pagebuilder.customtv.php on line 18</td>\n	</tr>\n</table>\n'),
(4,	0,	1631889991,	3,	1,	0,	'Parser - $container = include $config;\n / PHP Pars',	'<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><pre style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : include(/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/../../plugins/pagebuilder/config//container.PageBuilder.php): failed to open stream: No such file or directory</pre>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/tvs/pagebuilder/pagebuilder.customtv.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>18</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>$container = include $config;\n</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://developertest.directpr.beget.tech/manager/?a=27&amp;r=1&amp;id=1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Manager action</td>\n		<td>27 - Editing resource</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://developertest.directpr.beget.tech/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>188.163.83.187</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2021-09-17 14:46:31</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0809 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0809 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6172943115234 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Support\\Facades\\Facade::__callStatic</strong>(\'handleRoute\', array $var2)<br />manager/index.php on line 162</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handleRoute</strong>()<br />core/vendor/illuminate/support/Facades/Facade.php on line 261</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/ManagerTheme.php on line 407</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 625</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 636</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 672</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 697</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\VerifyCsrfToken->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/VerifyCsrfToken.php on line 13</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\Manager->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/Manager.php on line 25</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 695</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->runController</strong>()<br />core/vendor/illuminate/routing/Route.php on line 197</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\ControllerDispatcher->dispatch</strong>(Illuminate\\Routing\\Route $var1, EvolutionCMS\\Controllers\\Actions $var2, \'handleAction\')<br />core/vendor/illuminate/routing/Route.php on line 254</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Controllers\\Actions->handleAction</strong>()<br />core/vendor/illuminate/routing/ControllerDispatcher.php on line 48</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handle</strong>(27)<br />core/src/Controllers/Actions.php on line 27</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/ManagerTheme.php on line 420</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 38</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>require</strong>(string $var1)<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include_once</strong>(string $var1)<br />manager/views/page/27.php on line 5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>renderFormElement</strong>(string $var1, 1, \'\', \'\', \'\', \'\', array $var7, array $var8, array $var9)<br />manager/actions/mutate_content.dynamic.php on line 1056</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include</strong>(string $var1)<br />core/functions/actions/mutate_content.php on line 953</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>include</strong>()<br />assets/tvs/pagebuilder/pagebuilder.customtv.php on line 18</td>\n	</tr>\n</table>\n');

DROP TABLE IF EXISTS `azv4_manager_log`;
CREATE TABLE `azv4_manager_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `internalKey` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(11) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1,	1631695573,	1,	'admin',	58,	'-',	'EVO',	'Logged in',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(2,	1631695576,	1,	'admin',	17,	'-',	'-',	'Editing settings',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(3,	1631695578,	1,	'admin',	30,	'-',	'-',	'Saving settings',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(4,	1631695584,	1,	'admin',	26,	'-',	'-',	'Refreshing site',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(5,	1631695713,	1,	'admin',	76,	'-',	'-',	'Element management',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(6,	1631695716,	1,	'admin',	16,	'1',	'Minimal Template',	'Editing template',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(7,	1631695721,	1,	'admin',	76,	'-',	'-',	'Element management',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(8,	1631695723,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(9,	1631695732,	1,	'admin',	76,	'-',	'-',	'Element management',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(10,	1631695733,	1,	'admin',	76,	'-',	'-',	'Element management',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(11,	1631695736,	1,	'admin',	76,	'-',	'-',	'Element management',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(12,	1631695738,	1,	'admin',	76,	'-',	'-',	'Element management',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(13,	1631695740,	1,	'admin',	112,	'1',	'Extras',	'Execute module',	'37.112.8.108',	'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0'),
(14,	1631695852,	1,	'admin',	58,	'-',	'EVO',	'Logged in',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36'),
(15,	1631889316,	1,	'admin',	58,	'-',	'EVO',	'Logged in',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(16,	1631889326,	1,	'admin',	112,	'1',	'Extras',	'Execute module',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(17,	1631889576,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(18,	1631889618,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(19,	1631889618,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(20,	1631889629,	1,	'admin',	76,	'-',	'Extras',	'Element management',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(21,	1631889631,	1,	'admin',	102,	'5',	'PageBuilder',	'Edit plugin',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(22,	1631889700,	1,	'admin',	76,	'-',	'-',	'Element management',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(23,	1631889701,	1,	'admin',	300,	'-',	'Новый шаблон',	'Create Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(24,	1631889724,	1,	'admin',	302,	'-',	'PageBuilder',	'Save Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(25,	1631889725,	1,	'admin',	301,	'1',	'PageBuilder',	'Edit Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(26,	1631889801,	1,	'admin',	302,	'1',	'PageBuilder',	'Save Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(27,	1631889801,	1,	'admin',	301,	'1',	'PageBuilder',	'Edit Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(28,	1631889807,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(29,	1631889807,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(30,	1631889814,	1,	'admin',	102,	'5',	'PageBuilder',	'Edit plugin',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(31,	1631889819,	1,	'admin',	76,	'-',	'-',	'Element management',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(32,	1631889820,	1,	'admin',	301,	'1',	'PageBuilder',	'Edit Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(33,	1631889825,	1,	'admin',	302,	'1',	'PageBuilder',	'Save Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(34,	1631889825,	1,	'admin',	301,	'1',	'PageBuilder',	'Edit Template Variable',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(35,	1631889957,	1,	'admin',	17,	'-',	'Evolution CMS Install Success',	'Editing settings',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(36,	1631889965,	1,	'admin',	30,	'-',	'-',	'Saving settings',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(37,	1631890023,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(38,	1631890033,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(39,	1631890067,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(40,	1631890067,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(41,	1631890079,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(42,	1631890079,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(43,	1631890123,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(44,	1631890123,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(45,	1631890154,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(46,	1631890154,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(47,	1631890241,	1,	'admin',	76,	'-',	'-',	'Element management',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(48,	1631890242,	1,	'admin',	16,	'1',	'Minimal Template',	'Editing template',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(49,	1631890328,	1,	'admin',	20,	'1',	'Minimal Template',	'Saving template',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(50,	1631890328,	1,	'admin',	16,	'1',	'Minimal Template',	'Editing template',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(51,	1631890379,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(52,	1631890379,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(53,	1631891406,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(54,	1631891406,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(55,	1631891416,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(56,	1631891416,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(57,	1631891461,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(58,	1631891461,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(59,	1631891488,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(60,	1631891488,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(61,	1631891515,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(62,	1631891516,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(63,	1631891562,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(64,	1631891562,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(65,	1631891583,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(66,	1631891583,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(67,	1631891583,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(68,	1631891585,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(69,	1631891586,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(70,	1631891646,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(71,	1631891646,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(72,	1631891683,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(73,	1631891684,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(74,	1631891728,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(75,	1631891728,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(76,	1631891782,	1,	'admin',	20,	'1',	'Minimal Template',	'Saving template',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(77,	1631891782,	1,	'admin',	16,	'1',	'Minimal Template',	'Editing template',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(78,	1631891820,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(79,	1631891820,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(80,	1631891851,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(81,	1631891851,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(82,	1631891897,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(83,	1631891897,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(84,	1631891924,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(85,	1631891924,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(86,	1631892541,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(87,	1631892541,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(88,	1631892900,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(89,	1631892900,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(90,	1631892916,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(91,	1631892917,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(92,	1631892943,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(93,	1631892943,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(94,	1631892981,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(95,	1631892981,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(96,	1631893044,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(97,	1631893044,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(98,	1631893270,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(99,	1631893270,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(100,	1631893347,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(101,	1631893347,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(102,	1631893430,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(103,	1631893430,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(104,	1631893555,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(105,	1631893556,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(106,	1631893840,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(107,	1631893840,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(108,	1631894075,	1,	'admin',	88,	'1',	'admin',	'Editing web user',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(109,	1631894099,	1,	'admin',	88,	'1',	'admin',	'Editing web user',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(110,	1631894107,	1,	'admin',	88,	'1',	'admin',	'Editing web user',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(111,	1631894120,	1,	'admin',	89,	'1',	'-',	'Saving web user',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(112,	1631894131,	1,	'admin',	58,	'-',	'EVO',	'Logged in',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(113,	1631894140,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(114,	1631894239,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(115,	1631894239,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(116,	1631894251,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(117,	1631894251,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(118,	1631894254,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(119,	1631894254,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(120,	1631894284,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(121,	1631894284,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(122,	1631894437,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(123,	1631894437,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(124,	1631894462,	1,	'admin',	5,	'1',	'Evolution CMS Install Success',	'Saving resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'),
(125,	1631894462,	1,	'admin',	27,	'1',	'Evolution CMS Install Success',	'Editing resource',	'188.163.83.187',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36');

DROP TABLE IF EXISTS `azv4_membergroup_access`;
CREATE TABLE `azv4_membergroup_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membergroup` int(11) NOT NULL DEFAULT '0',
  `documentgroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_membergroup_names`;
CREATE TABLE `azv4_membergroup_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `membergroup_names_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_member_groups`;
CREATE TABLE `azv4_member_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group` int(11) NOT NULL DEFAULT '0',
  `member` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_migrations_install`;
CREATE TABLE `azv4_migrations_install` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_migrations_install` (`id`, `migration`, `batch`) VALUES
(1,	'2018_06_29_182342_create_active_user_locks_table',	1),
(2,	'2018_06_29_182342_create_active_user_sessions_table',	1),
(3,	'2018_06_29_182342_create_active_users_table',	1),
(4,	'2018_06_29_182342_create_categories_table',	1),
(5,	'2018_06_29_182342_create_document_groups_table',	1),
(6,	'2018_06_29_182342_create_documentgroup_names_table',	1),
(7,	'2018_06_29_182342_create_event_log_table',	1),
(8,	'2018_06_29_182342_create_manager_log_table',	1),
(9,	'2018_06_29_182342_create_manager_users_table',	1),
(10,	'2018_06_29_182342_create_member_groups_table',	1),
(11,	'2018_06_29_182342_create_membergroup_access_table',	1),
(12,	'2018_06_29_182342_create_membergroup_names_table',	1),
(13,	'2018_06_29_182342_create_permissions_groups_table',	1),
(14,	'2018_06_29_182342_create_permissions_table',	1),
(15,	'2018_06_29_182342_create_role_permissions_table',	1),
(16,	'2018_06_29_182342_create_site_content_table',	1),
(17,	'2018_06_29_182342_create_site_htmlsnippets_table',	1),
(18,	'2018_06_29_182342_create_site_module_access_table',	1),
(19,	'2018_06_29_182342_create_site_module_depobj_table',	1),
(20,	'2018_06_29_182342_create_site_modules_table',	1),
(21,	'2018_06_29_182342_create_site_plugin_events_table',	1),
(22,	'2018_06_29_182342_create_site_plugins_table',	1),
(23,	'2018_06_29_182342_create_site_snippets_table',	1),
(24,	'2018_06_29_182342_create_site_templates_table',	1),
(25,	'2018_06_29_182342_create_site_tmplvar_access_table',	1),
(26,	'2018_06_29_182342_create_site_tmplvar_contentvalues_table',	1),
(27,	'2018_06_29_182342_create_site_tmplvar_templates_table',	1),
(28,	'2018_06_29_182342_create_site_tmplvars_table',	1),
(29,	'2018_06_29_182342_create_system_eventnames_table',	1),
(30,	'2018_06_29_182342_create_system_settings_table',	1),
(31,	'2018_06_29_182342_create_user_attributes_table',	1),
(32,	'2018_06_29_182342_create_user_roles_table',	1),
(33,	'2018_06_29_182342_create_user_settings_table',	1),
(34,	'2018_06_29_182342_create_web_groups_table',	1),
(35,	'2018_06_29_182342_create_web_user_attributes_table',	1),
(36,	'2018_06_29_182342_create_web_user_settings_table',	1),
(37,	'2018_06_29_182342_create_web_users_table',	1),
(38,	'2018_06_29_182342_create_webgroup_access_table',	1),
(39,	'2018_06_29_182342_create_webgroup_names_table',	1),
(40,	'2020_09_12_110820_create_site_content_closure',	1),
(41,	'2020_09_16_110820_update_web_user_attributes_table',	1),
(42,	'2020_10_05_124820_second_update_web_user_attributes_table',	1),
(43,	'2020_10_05_154230_drop_manager_user_tables',	1),
(44,	'2020_10_05_162325_rename_web_user_tables',	1),
(45,	'2020_10_08_112342_remove_column_from_role_table',	1),
(46,	'2020_10_12_065655_make_guid_nullable_in_modules',	1),
(47,	'2020_10_12_065655_make_moduleguid_nullable_in_plugins',	1),
(48,	'2020_10_28_154230_drop_webuser_group_tables',	1),
(49,	'2020_10_30_065655_make_dob_nullable_in_userattributes',	1),
(50,	'2020_11_02_100555_add_token_columns_to_user_table',	1),
(51,	'2020_11_10_110555_add_verified_columns_to_user_table',	1),
(52,	'2020_11_22_114803_create_user_role_vars',	1),
(53,	'2020_11_22_114809_create_user_values',	1),
(54,	'2020_12_23_065655_make_display_nullable_in_tmplvars',	1),
(55,	'2021_02_05_121655_add_index_to_pubdate_column_content_table',	1),
(56,	'2021_02_10_060454_add_properties_column_to_site_tmplvars',	1),
(57,	'2021_02_17_102610_rename_donthit_column_in_site_content_table',	1),
(58,	'2018_06_29_182342_create_permissions_table',	1);

DROP TABLE IF EXISTS `azv4_pagebuilder`;
CREATE TABLE `azv4_pagebuilder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(10) unsigned NOT NULL,
  `container` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `config` varchar(255) NOT NULL,
  `values` mediumtext NOT NULL,
  `visible` tinyint(1) unsigned DEFAULT '1',
  `index` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`,`container`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_pagebuilder` (`id`, `document_id`, `container`, `title`, `config`, `values`, `visible`, `index`) VALUES
(1,	1,	'default',	'',	'text',	'{\"header\":\"Block A\",\"richtext\":\"Sample text A\"}',	1,	0),
(2,	1,	'default',	'',	'text',	'{\"header\":\"Block B\",\"richtext\":\"Sample text B\"}',	1,	1);

DROP TABLE IF EXISTS `azv4_permissions`;
CREATE TABLE `azv4_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `lang_key` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_permissions` (`id`, `name`, `key`, `lang_key`, `group_id`, `disabled`, `created_at`, `updated_at`) VALUES
(1,	'Request manager frames',	'frames',	'role_frames',	1,	1,	NULL,	NULL),
(2,	'Request manager intro page',	'home',	'role_home',	1,	1,	NULL,	NULL),
(3,	'Log out of the manager',	'logout',	'role_logout',	1,	1,	NULL,	NULL),
(4,	'View help pages',	'help',	'role_help',	1,	0,	NULL,	NULL),
(5,	'View action completed screen',	'action_ok',	'role_actionok',	1,	1,	NULL,	NULL),
(6,	'View error dialog',	'error_dialog',	'role_errors',	1,	1,	NULL,	NULL),
(7,	'View the about page',	'about',	'role_about',	1,	1,	NULL,	NULL),
(8,	'View credits',	'credits',	'role_credits',	1,	1,	NULL,	NULL),
(9,	'Change password',	'change_password',	'role_change_password',	1,	0,	NULL,	NULL),
(10,	'Save password',	'save_password',	'role_save_password',	1,	0,	NULL,	NULL),
(11,	'View a Resource\'s data',	'view_document',	'role_view_docdata',	2,	1,	NULL,	NULL),
(12,	'Create new Resources',	'new_document',	'role_create_doc',	2,	0,	NULL,	NULL),
(13,	'Edit a Resource',	'edit_document',	'role_edit_doc',	2,	0,	NULL,	NULL),
(14,	'Change Resource-Type',	'change_resourcetype',	'role_change_resourcetype',	2,	0,	NULL,	NULL),
(15,	'Save Resources',	'save_document',	'role_save_doc',	2,	0,	NULL,	NULL),
(16,	'Publish Resources',	'publish_document',	'role_publish_doc',	2,	0,	NULL,	NULL),
(17,	'Delete Resources',	'delete_document',	'role_delete_doc',	2,	0,	NULL,	NULL),
(18,	'Permanently purge deleted Resources',	'empty_trash',	'role_empty_trash',	2,	0,	NULL,	NULL),
(19,	'Empty the site\'s cache',	'empty_cache',	'role_cache_refresh',	2,	0,	NULL,	NULL),
(20,	'View Unpublished Resources',	'view_unpublished',	'role_view_unpublished',	2,	0,	NULL,	NULL),
(21,	'Use the file manager (full root access)',	'file_manager',	'role_file_manager',	3,	0,	NULL,	NULL),
(22,	'Manage assets/files',	'assets_files',	'role_assets_files',	3,	0,	NULL,	NULL),
(23,	'Manage assets/images',	'assets_images',	'role_assets_images',	3,	0,	NULL,	NULL),
(24,	'Use the Category Manager',	'category_manager',	'role_category_manager',	4,	0,	NULL,	NULL),
(25,	'Create new Module',	'new_module',	'role_new_module',	5,	0,	NULL,	NULL),
(26,	'Edit Module',	'edit_module',	'role_edit_module',	5,	0,	NULL,	NULL),
(27,	'Save Module',	'save_module',	'role_save_module',	5,	0,	NULL,	NULL),
(28,	'Delete Module',	'delete_module',	'role_delete_module',	5,	0,	NULL,	NULL),
(29,	'Run Module',	'exec_module',	'role_run_module',	5,	0,	NULL,	NULL),
(30,	'List Module',	'list_module',	'role_list_module',	5,	0,	NULL,	NULL),
(31,	'Create new site Templates',	'new_template',	'role_create_template',	6,	0,	NULL,	NULL),
(32,	'Edit site Templates',	'edit_template',	'role_edit_template',	6,	0,	NULL,	NULL),
(33,	'Save Templates',	'save_template',	'role_save_template',	6,	0,	NULL,	NULL),
(34,	'Delete Templates',	'delete_template',	'role_delete_template',	6,	0,	NULL,	NULL),
(35,	'Create new Snippets',	'new_snippet',	'role_create_snippet',	7,	0,	NULL,	NULL),
(36,	'Edit Snippets',	'edit_snippet',	'role_edit_snippet',	7,	0,	NULL,	NULL),
(37,	'Save Snippets',	'save_snippet',	'role_save_snippet',	7,	0,	NULL,	NULL),
(38,	'Delete Snippets',	'delete_snippet',	'role_delete_snippet',	7,	0,	NULL,	NULL),
(39,	'Create new Chunks',	'new_chunk',	'role_create_chunk',	8,	0,	NULL,	NULL),
(40,	'Edit Chunks',	'edit_chunk',	'role_edit_chunk',	8,	0,	NULL,	NULL),
(41,	'Save Chunks',	'save_chunk',	'role_save_chunk',	8,	0,	NULL,	NULL),
(42,	'Delete Chunks',	'delete_chunk',	'role_delete_chunk',	8,	0,	NULL,	NULL),
(43,	'Create new Plugins',	'new_plugin',	'role_create_plugin',	9,	0,	NULL,	NULL),
(44,	'Edit Plugins',	'edit_plugin',	'role_edit_plugin',	9,	0,	NULL,	NULL),
(45,	'Save Plugins',	'save_plugin',	'role_save_plugin',	9,	0,	NULL,	NULL),
(46,	'Delete Plugins',	'delete_plugin',	'role_delete_plugin',	9,	0,	NULL,	NULL),
(47,	'Create new users',	'new_user',	'role_new_user',	10,	0,	NULL,	NULL),
(48,	'Edit users',	'edit_user',	'role_edit_user',	10,	0,	NULL,	NULL),
(49,	'Save users',	'save_user',	'role_save_user',	10,	0,	NULL,	NULL),
(50,	'Delete users',	'delete_user',	'role_delete_user',	10,	0,	NULL,	NULL),
(51,	'Access permissions',	'access_permissions',	'role_access_persmissions',	11,	0,	NULL,	NULL),
(52,	'Web access permissions',	'web_access_permissions',	'role_web_access_persmissions',	11,	0,	NULL,	NULL),
(53,	'Create new roles',	'new_role',	'role_new_role',	12,	0,	NULL,	NULL),
(54,	'Edit roles',	'edit_role',	'role_edit_role',	12,	0,	NULL,	NULL),
(55,	'Save roles',	'save_role',	'role_save_role',	12,	0,	NULL,	NULL),
(56,	'Delete roles',	'delete_role',	'role_delete_role',	12,	0,	NULL,	NULL),
(57,	'View event log',	'view_eventlog',	'role_view_eventlog',	13,	0,	NULL,	NULL),
(58,	'Delete event log',	'delete_eventlog',	'role_delete_eventlog',	13,	0,	NULL,	NULL),
(59,	'View system logs',	'logs',	'role_view_logs',	14,	0,	NULL,	NULL),
(60,	'Change site settings',	'settings',	'role_edit_settings',	14,	0,	NULL,	NULL),
(61,	'Use the Backup Manager',	'bk_manager',	'role_bk_manager',	14,	0,	NULL,	NULL),
(62,	'Remove Locks',	'remove_locks',	'role_remove_locks',	14,	0,	NULL,	NULL),
(63,	'Display Locks',	'display_locks',	'role_display_locks',	14,	0,	NULL,	NULL);

DROP TABLE IF EXISTS `azv4_permissions_groups`;
CREATE TABLE `azv4_permissions_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lang_key` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_permissions_groups` (`id`, `name`, `lang_key`, `created_at`, `updated_at`) VALUES
(1,	'General',	'page_data_general',	NULL,	NULL),
(2,	'Content Management',	'role_content_management',	NULL,	NULL),
(3,	'File Management',	'role_file_management',	NULL,	NULL),
(4,	'Category Management',	'category_management',	NULL,	NULL),
(5,	'Module Management',	'role_module_management',	NULL,	NULL),
(6,	'Template Management',	'role_template_management',	NULL,	NULL),
(7,	'Snippet Management',	'role_snippet_management',	NULL,	NULL),
(8,	'Chunk Management',	'role_chunk_management',	NULL,	NULL),
(9,	'Plugin Management',	'role_plugin_management',	NULL,	NULL),
(10,	'User Management',	'role_user_management',	NULL,	NULL),
(11,	'Permissions',	'role_udperms',	NULL,	NULL),
(12,	'Role Management',	'role_role_management',	NULL,	NULL),
(13,	'Events Log Management',	'role_eventlog_management',	NULL,	NULL),
(14,	'Config Management',	'role_config_management',	NULL,	NULL);

DROP TABLE IF EXISTS `azv4_role_permissions`;
CREATE TABLE `azv4_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_role_permissions` (`id`, `permission`, `role_id`, `created_at`, `updated_at`) VALUES
(1,	'frames',	1,	NULL,	NULL),
(2,	'home',	1,	NULL,	NULL),
(3,	'logout',	1,	NULL,	NULL),
(4,	'help',	1,	NULL,	NULL),
(5,	'role_actionok',	1,	NULL,	NULL),
(6,	'error_dialog',	1,	NULL,	NULL),
(7,	'about',	1,	NULL,	NULL),
(8,	'credits',	1,	NULL,	NULL),
(9,	'change_password',	1,	NULL,	NULL),
(10,	'save_password',	1,	NULL,	NULL),
(11,	'view_document',	1,	NULL,	NULL),
(12,	'new_document',	1,	NULL,	NULL),
(13,	'edit_document',	1,	NULL,	NULL),
(14,	'change_resourcetype',	1,	NULL,	NULL),
(15,	'save_document',	1,	NULL,	NULL),
(16,	'publish_document',	1,	NULL,	NULL),
(17,	'delete_document',	1,	NULL,	NULL),
(18,	'empty_trash',	1,	NULL,	NULL),
(19,	'empty_cache',	1,	NULL,	NULL),
(20,	'view_unpublished',	1,	NULL,	NULL),
(21,	'file_manager',	1,	NULL,	NULL),
(22,	'assets_files',	1,	NULL,	NULL),
(23,	'assets_images',	1,	NULL,	NULL),
(24,	'category_manager',	1,	NULL,	NULL),
(25,	'new_module',	1,	NULL,	NULL),
(26,	'edit_module',	1,	NULL,	NULL),
(27,	'save_module',	1,	NULL,	NULL),
(28,	'delete_module',	1,	NULL,	NULL),
(29,	'exec_module',	1,	NULL,	NULL),
(30,	'list_module',	1,	NULL,	NULL),
(31,	'new_template',	1,	NULL,	NULL),
(32,	'edit_template',	1,	NULL,	NULL),
(33,	'save_template',	1,	NULL,	NULL),
(34,	'delete_template',	1,	NULL,	NULL),
(35,	'new_snippet',	1,	NULL,	NULL),
(36,	'edit_snippet',	1,	NULL,	NULL),
(37,	'save_snippet',	1,	NULL,	NULL),
(38,	'delete_snippet',	1,	NULL,	NULL),
(39,	'new_chunk',	1,	NULL,	NULL),
(40,	'edit_chunk',	1,	NULL,	NULL),
(41,	'save_chunk',	1,	NULL,	NULL),
(42,	'delete_chunk',	1,	NULL,	NULL),
(43,	'new_plugin',	1,	NULL,	NULL),
(44,	'edit_plugin',	1,	NULL,	NULL),
(45,	'save_plugin',	1,	NULL,	NULL),
(46,	'delete_plugin',	1,	NULL,	NULL),
(47,	'new_user',	1,	NULL,	NULL),
(48,	'edit_user',	1,	NULL,	NULL),
(49,	'save_user',	1,	NULL,	NULL),
(50,	'delete_user',	1,	NULL,	NULL),
(51,	'access_permissions',	1,	NULL,	NULL),
(52,	'web_access_permissions',	1,	NULL,	NULL),
(53,	'new_role',	1,	NULL,	NULL),
(54,	'edit_role',	1,	NULL,	NULL),
(55,	'save_role',	1,	NULL,	NULL),
(56,	'delete_role',	1,	NULL,	NULL),
(57,	'view_eventlog',	1,	NULL,	NULL),
(58,	'delete_eventlog',	1,	NULL,	NULL),
(59,	'logs',	1,	NULL,	NULL),
(60,	'settings',	1,	NULL,	NULL),
(61,	'bk_manager',	1,	NULL,	NULL),
(62,	'remove_locks',	1,	NULL,	NULL),
(63,	'display_locks',	1,	NULL,	NULL),
(64,	'frames',	2,	NULL,	NULL),
(65,	'home',	2,	NULL,	NULL),
(66,	'logout',	2,	NULL,	NULL),
(67,	'help',	2,	NULL,	NULL),
(68,	'role_actionok',	2,	NULL,	NULL),
(69,	'error_dialog',	2,	NULL,	NULL),
(70,	'about',	2,	NULL,	NULL),
(71,	'credits',	2,	NULL,	NULL),
(72,	'change_password',	2,	NULL,	NULL),
(73,	'save_password',	2,	NULL,	NULL),
(74,	'view_document',	2,	NULL,	NULL),
(75,	'new_document',	2,	NULL,	NULL),
(76,	'edit_document',	2,	NULL,	NULL),
(77,	'change_resourcetype',	2,	NULL,	NULL),
(78,	'save_document',	2,	NULL,	NULL),
(79,	'publish_document',	2,	NULL,	NULL),
(80,	'delete_document',	2,	NULL,	NULL),
(81,	'empty_cache',	2,	NULL,	NULL),
(82,	'view_unpublished',	2,	NULL,	NULL),
(83,	'file_manager',	2,	NULL,	NULL),
(84,	'assets_files',	2,	NULL,	NULL),
(85,	'assets_images',	2,	NULL,	NULL),
(86,	'exec_module',	2,	NULL,	NULL),
(87,	'list_module',	2,	NULL,	NULL),
(88,	'edit_chunk',	2,	NULL,	NULL),
(89,	'save_chunk',	2,	NULL,	NULL),
(90,	'remove_locks',	2,	NULL,	NULL),
(91,	'display_locks',	2,	NULL,	NULL),
(92,	'access_permissions',	2,	NULL,	NULL),
(93,	'frames',	3,	NULL,	NULL),
(94,	'home',	3,	NULL,	NULL),
(95,	'logout',	3,	NULL,	NULL),
(96,	'help',	3,	NULL,	NULL),
(97,	'role_actionok',	3,	NULL,	NULL),
(98,	'error_dialog',	3,	NULL,	NULL),
(99,	'about',	3,	NULL,	NULL),
(100,	'credits',	3,	NULL,	NULL),
(101,	'change_password',	3,	NULL,	NULL),
(102,	'save_password',	3,	NULL,	NULL),
(103,	'view_document',	3,	NULL,	NULL),
(104,	'new_document',	3,	NULL,	NULL),
(105,	'edit_document',	3,	NULL,	NULL),
(106,	'change_resourcetype',	3,	NULL,	NULL),
(107,	'save_document',	3,	NULL,	NULL),
(108,	'publish_document',	3,	NULL,	NULL),
(109,	'delete_document',	3,	NULL,	NULL),
(110,	'empty_trash',	3,	NULL,	NULL),
(111,	'empty_cache',	3,	NULL,	NULL),
(112,	'view_unpublished',	3,	NULL,	NULL),
(113,	'file_manager',	3,	NULL,	NULL),
(114,	'assets_files',	3,	NULL,	NULL),
(115,	'assets_images',	3,	NULL,	NULL),
(116,	'exec_module',	3,	NULL,	NULL),
(117,	'list_module',	3,	NULL,	NULL),
(118,	'new_template',	3,	NULL,	NULL),
(119,	'edit_template',	3,	NULL,	NULL),
(120,	'save_template',	3,	NULL,	NULL),
(121,	'delete_template',	3,	NULL,	NULL),
(122,	'new_chunk',	3,	NULL,	NULL),
(123,	'edit_chunk',	3,	NULL,	NULL),
(124,	'save_chunk',	3,	NULL,	NULL),
(125,	'delete_chunk',	3,	NULL,	NULL),
(126,	'new_user',	3,	NULL,	NULL),
(127,	'edit_user',	3,	NULL,	NULL),
(128,	'save_user',	3,	NULL,	NULL),
(129,	'delete_user',	3,	NULL,	NULL),
(130,	'logs',	3,	NULL,	NULL),
(131,	'settings',	3,	NULL,	NULL),
(132,	'bk_manager',	3,	NULL,	NULL),
(133,	'remove_locks',	3,	NULL,	NULL),
(134,	'display_locks',	3,	NULL,	NULL),
(135,	'access_permissions',	3,	NULL,	NULL);

DROP TABLE IF EXISTS `azv4_site_content`;
CREATE TABLE `azv4_site_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(11) NOT NULL DEFAULT '0',
  `pub_date` int(11) NOT NULL DEFAULT '0',
  `unpub_date` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `isfolder` int(11) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` longtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(11) NOT NULL DEFAULT '0',
  `menuindex` int(11) NOT NULL DEFAULT '0',
  `searchable` int(11) NOT NULL DEFAULT '1',
  `cacheable` int(11) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedby` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `deletedon` int(11) NOT NULL DEFAULT '0',
  `deletedby` int(11) NOT NULL DEFAULT '0',
  `publishedon` int(11) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(11) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `hide_from_tree` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `typeidx` (`type`),
  KEY `aliasidx` (`alias`),
  KEY `parent` (`parent`),
  KEY `pub_unpub_published` (`pub_date`,`unpub_date`,`published`),
  KEY `pub_unpub` (`pub_date`,`unpub_date`),
  KEY `unpub` (`unpub_date`),
  KEY `pub` (`pub_date`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `hide_from_tree`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1,	'document',	'text/html',	'Evolution CMS Install Success',	'Welcome to the Evolution CMS Content Management System',	'',	'minimal-base',	'',	1,	0,	0,	0,	0,	'',	'<div class=\"container\">\r\n	<h1>Тестовое задание разработчику</h1>\r\n	<div>\r\n		<p>Найти и исправить конфиг БД. Сама БД лежит в архиве, в корне.</p>\r\n		<p>Для входа в панель <a href=\"/manager\">/manager</a> использовать Логин: admin Пароль: password</p>\r\n		<a href=\'/archive.zip\' class=\"btn btn-primary\">СКАЧАТЬ</a>\r\n	</div>\r\n	<h2>Результат:</h2>\r\n	<div class=\"my-4\">\r\n		[!PageBuilder!]	\r\n	</div>\r\n\r\n	<h2>Задача 1.</h2>\r\n	<div class=\'p-3 mb-2 bg-info text-white\'>\r\n		Создать кастомное поле PageBuilder icon для вставки иконки Font Awesome <i class=\"fas fa-envelope\"></i>. Вывести иконку рядом с заголовком блока на фронте\r\n	</div>\r\n\r\n	<div class=\"my-1\"><b>Путь решения</b></div>\r\n	<div class=\"my-2\">\r\n		<p>\r\n			Конфиг блока для модификации находится здесь:\r\n			<code>/assets/plugins/pagebuilder/config/text.php</code>\r\n		</p>\r\n\r\n		<p>Разобраться какие типы полей вообще доступны для отображения. Как происходит их типизирование/отрисовка.</p>\r\n		<p>Созданное поле должно содержать: \r\n		<ul>\r\n			<li>текстовое поле для ввода любого html значения иконки font awesome</li>\r\n			<li>справа небольшая область, где отображается текущая введенная в текстовое поле иконка (валидация правильности заполнения не нужна)</li>\r\n			<li>внизу набор из нескольких заготовленных иконок, по клику на которые текстовое поле заполняется соответствующим значением</li>\r\n		</ul>\r\n		</p>\r\n</div>\r\n\r\n\r\n\r\n<div><b>Ожидаемый результат</b></div>\r\n<div>\r\n	См. полe Icon\r\n</div>\r\n<div>\r\n	<img src=\"/assets/images/task/1.png\" alt=\"\">\r\n</div>\r\n\r\n<h2>Задача 2.</h2>\r\n<div class=\'p-3 mb-2 bg-info text-white\'>\r\n	Сделать любой блок PageBuilder с возможностью быть свернутым/развернутым. По умолчанию свернутым. Вывести содержимое поля Header над блоком.\r\n</div>\r\n\r\n<div class=\"my-1\"><b>Путь решения</b></div>\r\n<div class=\"my-2\">\r\n	<p>Найти как в PageBuilder отображается блок. Прямо в код плагина вставить кнопку, запрограммировать на JS нужное поведение. На возможность изменения быть затертым при обновлении не обращаем внимания в данном случае.</p>\r\n	<p>Разобраться как внутри блока PageBuilder выводятся поля. Найти среди всех полей по ключу поле header и отобразить его над блоком с помощью PHP. Рассчитываем на отрисовку только при инициализации страницы, онлайн обновлять заголовок не нужно.</p>\r\n</div>\r\n<div><b>Ожидаемый результат</b></div>\r\n<div class=\"my-2\">\r\n	<div>Блок изначально свернут:</div>\r\n	<div>\r\n		<img src=\"/assets/images/task/2a.png\" alt=\"\">\r\n	</div>	\r\n</div>\r\n<div class=\"my-3\">\r\n	<div>Блок в развернутом виде:</div>\r\n	<div>\r\n		<img src=\"/assets/images/task/2b.png\" alt=\"\">\r\n	</div>	\r\n</div>\r\n\r\n<div>\r\n	<i>\r\n		<small>При проблемах отображения PageBuilder отключить блокировщик рекламы</small>\r\n	</i>\r\n</div>\r\n</div>\r\n<style>\r\n	img {max-width: 100%;}\r\n</style>',	1,	1,	0,	1,	1,	1,	1631695556,	1,	1631894462,	0,	0,	0,	1130304721,	1,	'Base Install',	0,	0,	0,	0,	0,	1);

DROP TABLE IF EXISTS `azv4_site_content_closure`;
CREATE TABLE `azv4_site_content_closure` (
  `closure_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ancestor` int(10) unsigned NOT NULL,
  `descendant` int(10) unsigned NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  PRIMARY KEY (`closure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_content_closure` (`closure_id`, `ancestor`, `descendant`, `depth`) VALUES
(1,	1,	1,	0);

DROP TABLE IF EXISTS `azv4_site_htmlsnippets`;
CREATE TABLE `azv4_site_htmlsnippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_site_modules`;
CREATE TABLE `azv4_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1,	'Extras',	'<strong>0.1.3</strong> first repository for Evolution CMS',	0,	0,	1,	0,	0,	'',	0,	'',	1631695556,	1631695556,	'store435243542tf542t5t',	1,	'',	' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.1.3\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');');

DROP TABLE IF EXISTS `azv4_site_module_access`;
CREATE TABLE `azv4_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_site_module_depobj`;
CREATE TABLE `azv4_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_site_plugins`;
CREATE TABLE `azv4_site_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1,	'CodeMirror',	'<strong>1.5</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)',	0,	1,	0,	'\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\r\n *\r\n * @category    plugin\r\n * @version     1.5\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution/issues/\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  08-01-2018\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = MODX_SITE_URL . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\r\n',	0,	'{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}',	0,	'',	1631695556,	1631695556),
(2,	'TransAlias',	'<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides',	0,	1,	0,	'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';',	0,	'{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}',	0,	'',	1631695556,	1631695556),
(3,	'Updater',	'<strong>0.8.5</strong> show message about outdated CMS version',	0,	1,	0,	'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';',	0,	'{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"develop\",\"default\":\"develop\",\"desc\":\"\"}],\"stableOnly\":[{\"label\":\"Offer upgrade to stable version only:\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}]}',	0,	'',	1631695556,	1631695556),
(4,	'OutdatedExtrasCheck',	'<strong>1.4.6</strong> Check for Outdated critical extras not compatible with EVO 1.4.6',	0,	1,	0,	'/**\r\n * OutdatedExtrasCheck\r\n *\r\n * Check for Outdated critical extras not compatible with EVO 1.4.6\r\n *\r\n * @category	plugin\r\n * @version     1.4.6\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Author: Nicola Lambathakis\r\n * @internal    @events OnManagerWelcomeHome\r\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\r\n',	0,	'{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}',	0,	'',	1631695556,	1631695556),
(5,	'PageBuilder',	'<strong>1.3.14</strong> Creates form for manage content sections',	0,	1,	0,	'include_once MODX_BASE_PATH . \'assets/plugins/pagebuilder/pagebuilder.php\';\n\n$e = &$modx->event;\n\nswitch ($e->name) {\n    case \'OnWebPageInit\':\n    case \'OnManagerPageInit\': {\n        $modx->db->query(\"DELETE FROM \" . $modx->getFullTableName(\'site_plugin_events\') . \"\n            WHERE pluginid IN (\n               SELECT id\n               FROM \" . $modx->getFullTableName(\'site_plugins\') . \"\n               WHERE name = \'\" . $e->activePlugin . \"\'\n               AND disabled = 0\n            )\n            AND evtid IN (\n               SELECT id\n               FROM \" . $modx->getFullTableName(\'system_eventnames\') . \"\n               WHERE name IN (\'OnWebPageInit\', \'OnManagerPageInit\')\n            )\");\n\n        $modx->clearCache(\'full\');\n\n        (new PageBuilder($modx))->install();\n\n        return;\n    }\n\n    case \'OnDocFormRender\': {\n        $e->output((new PageBuilder($modx))->renderForm());\n        return;\n    }\n\n    case \'OnDocFormSave\': {\n        (new PageBuilder($modx))->save();\n        return;\n    }\n\n    case \'OnBeforeEmptyTrash\': {\n        (new PageBuilder($modx))->delete();\n        return;\n    }\n\n    case \'OnDocDuplicate\': {\n        (new PageBuilder($modx))->duplicate();\n        return;\n    }\n}\n\n\n',	0,	'{\"tabName\":[{\"label\":\"Tab name\",\"type\":\"text\",\"value\":\"Page Builder\",\"default\":\"Page Builder\",\"desc\":\"\"}],\"addType\":[{\"label\":\"Add type\",\"type\":\"menu\",\"value\":\"dropdown\",\"options\":\"dropdown,icons,images\",\"default\":\"dropdown\",\"desc\":\"\"}],\"placement\":[{\"label\":\"Placement\",\"type\":\"menu\",\"value\":\"tab\",\"options\":\"content,tab\",\"default\":\"tab\",\"desc\":\"\"}],\"order\":[{\"label\":\"Default container ordering\",\"type\":\"text\",\"value\":\"0\",\"default\":\"0\",\"desc\":\"\"}]}',	0,	'',	1631889333,	1631889625);

DROP TABLE IF EXISTS `azv4_site_plugin_events`;
CREATE TABLE `azv4_site_plugin_events` (
  `pluginid` int(11) NOT NULL,
  `evtid` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1,	24,	0),
(1,	30,	0),
(1,	39,	0),
(1,	45,	0),
(1,	51,	0),
(1,	71,	0),
(1,	88,	0),
(2,	105,	0),
(3,	68,	0),
(3,	110,	0),
(3,	127,	0),
(4,	110,	1),
(5,	30,	1),
(5,	32,	0),
(5,	102,	0),
(5,	113,	0);

DROP TABLE IF EXISTS `azv4_site_snippets`;
CREATE TABLE `azv4_site_snippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` int(11) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1,	'PageBuilder',	'<strong>1.3.14</strong> output content sections for current page',	0,	2,	0,	'include_once MODX_BASE_PATH . \'assets/plugins/pagebuilder/pagebuilder.php\';\nreturn (new PageBuilder($modx))->render($params);\n\n',	0,	'',	'',	0,	1631889625,	0);

DROP TABLE IF EXISTS `azv4_site_templates`;
CREATE TABLE `azv4_site_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `templatealias` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `selectable` tinyint(1) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_templates` (`id`, `templatename`, `templatealias`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(1,	'Minimal Template',	'minimal-template',	'Default minimal empty template (content returned only)',	0,	0,	'',	0,	'[*content*]\r\n<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\r\n<link rel=\"stylesheet\" href=\"https://pro.fontawesome.com/releases/v5.10.0/css/all.css\" integrity=\"sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p\" crossorigin=\"anonymous\"/>',	0,	1,	0,	1631891781);

DROP TABLE IF EXISTS `azv4_site_tmplvars`;
CREATE TABLE `azv4_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(32) DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`, `properties`) VALUES
(1,	'custom_tv:pagebuilder',	'PageBuilder',	'PageBuilder',	'',	0,	0,	0,	'',	0,	'',	'',	'',	1631889724,	1631889724,	'[]');

DROP TABLE IF EXISTS `azv4_site_tmplvar_access`;
CREATE TABLE `azv4_site_tmplvar_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(11) NOT NULL DEFAULT '0',
  `documentgroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_site_tmplvar_contentvalues`;
CREATE TABLE `azv4_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(11) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(11) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `content_ft_idx` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_site_tmplvar_templates`;
CREATE TABLE `azv4_site_tmplvar_templates` (
  `tmplvarid` int(11) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1,	1,	0);

DROP TABLE IF EXISTS `azv4_system_eventnames`;
CREATE TABLE `azv4_system_eventnames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` int(11) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1,	'OnDocPublished',	5,	''),
(2,	'OnDocUnPublished',	5,	''),
(3,	'OnWebPagePrerender',	5,	''),
(4,	'OnWebLogin',	3,	''),
(5,	'OnBeforeWebLogout',	3,	''),
(6,	'OnWebLogout',	3,	''),
(7,	'OnWebSaveUser',	3,	''),
(8,	'OnWebDeleteUser',	3,	''),
(9,	'OnWebChangePassword',	3,	''),
(10,	'OnWebCreateGroup',	3,	''),
(11,	'OnManagerLogin',	2,	''),
(12,	'OnBeforeManagerLogout',	2,	''),
(13,	'OnManagerLogout',	2,	''),
(14,	'OnManagerSaveUser',	2,	''),
(15,	'OnManagerDeleteUser',	2,	''),
(16,	'OnManagerChangePassword',	2,	''),
(17,	'OnManagerCreateGroup',	2,	''),
(18,	'OnBeforeCacheUpdate',	4,	''),
(19,	'OnCacheUpdate',	4,	''),
(20,	'OnMakePageCacheKey',	4,	''),
(21,	'OnLoadWebPageCache',	4,	''),
(22,	'OnBeforeSaveWebPageCache',	4,	''),
(23,	'OnChunkFormPrerender',	1,	'Chunks'),
(24,	'OnChunkFormRender',	1,	'Chunks'),
(25,	'OnBeforeChunkFormSave',	1,	'Chunks'),
(26,	'OnChunkFormSave',	1,	'Chunks'),
(27,	'OnBeforeChunkFormDelete',	1,	'Chunks'),
(28,	'OnChunkFormDelete',	1,	'Chunks'),
(29,	'OnDocFormPrerender',	1,	'Documents'),
(30,	'OnDocFormRender',	1,	'Documents'),
(31,	'OnBeforeDocFormSave',	1,	'Documents'),
(32,	'OnDocFormSave',	1,	'Documents'),
(33,	'OnBeforeDocFormDelete',	1,	'Documents'),
(34,	'OnDocFormDelete',	1,	'Documents'),
(35,	'OnDocFormUnDelete',	1,	'Documents'),
(36,	'onBeforeMoveDocument',	1,	'Documents'),
(37,	'onAfterMoveDocument',	1,	'Documents'),
(38,	'OnPluginFormPrerender',	1,	'Plugins'),
(39,	'OnPluginFormRender',	1,	'Plugins'),
(40,	'OnBeforePluginFormSave',	1,	'Plugins'),
(41,	'OnPluginFormSave',	1,	'Plugins'),
(42,	'OnBeforePluginFormDelete',	1,	'Plugins'),
(43,	'OnPluginFormDelete',	1,	'Plugins'),
(44,	'OnSnipFormPrerender',	1,	'Snippets'),
(45,	'OnSnipFormRender',	1,	'Snippets'),
(46,	'OnBeforeSnipFormSave',	1,	'Snippets'),
(47,	'OnSnipFormSave',	1,	'Snippets'),
(48,	'OnBeforeSnipFormDelete',	1,	'Snippets'),
(49,	'OnSnipFormDelete',	1,	'Snippets'),
(50,	'OnTempFormPrerender',	1,	'Templates'),
(51,	'OnTempFormRender',	1,	'Templates'),
(52,	'OnBeforeTempFormSave',	1,	'Templates'),
(53,	'OnTempFormSave',	1,	'Templates'),
(54,	'OnBeforeTempFormDelete',	1,	'Templates'),
(55,	'OnTempFormDelete',	1,	'Templates'),
(56,	'OnTVFormPrerender',	1,	'Template Variables'),
(57,	'OnTVFormRender',	1,	'Template Variables'),
(58,	'OnBeforeTVFormSave',	1,	'Template Variables'),
(59,	'OnTVFormSave',	1,	'Template Variables'),
(60,	'OnBeforeTVFormDelete',	1,	'Template Variables'),
(61,	'OnTVFormDelete',	1,	'Template Variables'),
(62,	'OnUserFormPrerender',	1,	'Users'),
(63,	'OnUserFormRender',	1,	'Users'),
(64,	'OnBeforeUserSave',	1,	'Users'),
(65,	'OnUserSave',	1,	'Users'),
(66,	'OnBeforeUserDelete',	1,	'Users'),
(67,	'OnUserDelete',	1,	'Users'),
(68,	'OnSiteRefresh',	1,	''),
(69,	'OnFileManagerUpload',	1,	''),
(70,	'OnModFormPrerender',	1,	'Modules'),
(71,	'OnModFormRender',	1,	'Modules'),
(72,	'OnBeforeModFormDelete',	1,	'Modules'),
(73,	'OnModFormDelete',	1,	'Modules'),
(74,	'OnBeforeModFormSave',	1,	'Modules'),
(75,	'OnModFormSave',	1,	'Modules'),
(76,	'OnBeforeWebLogin',	3,	''),
(77,	'OnWebAuthentication',	3,	''),
(78,	'OnBeforeManagerLogin',	2,	''),
(79,	'OnManagerAuthentication',	2,	''),
(80,	'OnSiteSettingsRender',	1,	'System Settings'),
(81,	'OnFriendlyURLSettingsRender',	1,	'System Settings'),
(82,	'OnUserSettingsRender',	1,	'System Settings'),
(83,	'OnInterfaceSettingsRender',	1,	'System Settings'),
(84,	'OnSecuritySettingsRender',	1,	'System Settings'),
(85,	'OnFileManagerSettingsRender',	1,	'System Settings'),
(86,	'OnMiscSettingsRender',	1,	'System Settings'),
(87,	'OnRichTextEditorRegister',	1,	'RichText Editor'),
(88,	'OnRichTextEditorInit',	1,	'RichText Editor'),
(89,	'OnManagerPageInit',	2,	''),
(90,	'OnWebPageInit',	5,	''),
(91,	'OnLoadDocumentObject',	5,	''),
(92,	'OnBeforeLoadDocumentObject',	5,	''),
(93,	'OnAfterLoadDocumentObject',	5,	''),
(94,	'OnLoadWebDocument',	5,	''),
(95,	'OnParseDocument',	5,	''),
(96,	'OnParseProperties',	5,	''),
(97,	'OnBeforeParseParams',	5,	''),
(98,	'OnManagerLoginFormRender',	2,	''),
(99,	'OnWebPageComplete',	5,	''),
(100,	'OnLogPageHit',	5,	''),
(101,	'OnBeforeManagerPageInit',	2,	''),
(102,	'OnBeforeEmptyTrash',	1,	'Documents'),
(103,	'OnEmptyTrash',	1,	'Documents'),
(104,	'OnManagerLoginFormPrerender',	2,	''),
(105,	'OnStripAlias',	1,	'Documents'),
(106,	'OnMakeDocUrl',	5,	''),
(107,	'OnBeforeLoadExtension',	5,	''),
(108,	'OnCreateDocGroup',	1,	'Documents'),
(109,	'OnManagerWelcomePrerender',	2,	''),
(110,	'OnManagerWelcomeHome',	2,	''),
(111,	'OnManagerWelcomeRender',	2,	''),
(112,	'OnBeforeDocDuplicate',	1,	'Documents'),
(113,	'OnDocDuplicate',	1,	'Documents'),
(114,	'OnManagerMainFrameHeaderHTMLBlock',	2,	''),
(115,	'OnManagerPreFrameLoader',	2,	''),
(116,	'OnManagerFrameLoader',	2,	''),
(117,	'OnManagerTreeInit',	2,	''),
(118,	'OnManagerTreePrerender',	2,	''),
(119,	'OnManagerTreeRender',	2,	''),
(120,	'OnManagerNodePrerender',	2,	''),
(121,	'OnManagerNodeRender',	2,	''),
(122,	'OnManagerMenuPrerender',	2,	''),
(123,	'OnManagerTopPrerender',	2,	''),
(124,	'OnDocFormTemplateRender',	1,	'Documents'),
(125,	'OnBeforeMinifyCss',	1,	''),
(126,	'OnPageUnauthorized',	1,	''),
(127,	'OnPageNotFound',	1,	''),
(128,	'OnFileBrowserUpload',	1,	'File Browser Events'),
(129,	'OnBeforeFileBrowserUpload',	1,	'File Browser Events'),
(130,	'OnFileBrowserDelete',	1,	'File Browser Events'),
(131,	'OnBeforeFileBrowserDelete',	1,	'File Browser Events'),
(132,	'OnFileBrowserInit',	1,	'File Browser Events'),
(133,	'OnFileBrowserMove',	1,	'File Browser Events'),
(134,	'OnBeforeFileBrowserMove',	1,	'File Browser Events'),
(135,	'OnFileBrowserCopy',	1,	'File Browser Events'),
(136,	'OnBeforeFileBrowserCopy',	1,	'File Browser Events'),
(137,	'OnBeforeFileBrowserRename',	1,	'File Browser Events'),
(138,	'OnFileBrowserRename',	1,	'File Browser Events'),
(139,	'OnLogEvent',	1,	'Log Event'),
(140,	'OnPBContainerRender',	6,	'PageBuilder'),
(141,	'OnPBFieldRender',	6,	'PageBuilder');

DROP TABLE IF EXISTS `azv4_system_settings`;
CREATE TABLE `azv4_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_system_settings` (`setting_name`, `setting_value`) VALUES
('a',	'30'),
('aliaslistingfolder',	'0'),
('allow_duplicate_alias',	'0'),
('allow_eval',	'with_scan'),
('allow_multiple_emails',	'0'),
('automatic_alias',	'1'),
('auto_menuindex',	'1'),
('auto_template_logic',	'sibling'),
('blocked_minutes',	'60'),
('cache_default',	'1'),
('cache_type',	'2'),
('captcha_words',	'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default',	'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('check_files_onlogin',	'index.php\r\n.htaccess\r\nmanager/index.php\r\n/core/config/database/connections/default.php'),
('chunk_processor',	'DLTemplate'),
('clean_uploaded_filename',	'1'),
('clientResize',	'0'),
('ControllerNamespace',	''),
('custom_contenttype',	'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('datepicker_offset',	'-10'),
('datetime_format',	'dd-mm-YYYY'),
('default_template',	'1'),
('denyExtensionRename',	'0'),
('denyZipDownload',	'0'),
('disable_chunk_cache',	'0'),
('disable_plugins_cache',	'0'),
('disable_snippet_cache',	'0'),
('docid_incrmnt_method',	'0'),
('editor_css_path',	''),
('editor_css_selectors',	''),
('emailsender',	'1@1.ru'),
('emailsubject',	'Данные для авторизации'),
('emailsubject_default',	'Данные для авторизации'),
('email_method',	'mail'),
('email_sender_method',	'1'),
('enable_bindings',	'1'),
('enable_cache',	'1'),
('error_page',	'1'),
('error_reporting',	'1'),
('failed_login_attempts',	'3'),
('fck_editor_autolang',	'0'),
('fck_editor_toolbar',	'standard'),
('fe_editor_lang',	'ru'),
('filemanager_path',	'/home/d/directpr/developertest.directpr.beget.tech/public_html/'),
('friendly_alias_urls',	'1'),
('friendly_urls',	'1'),
('friendly_url_prefix',	''),
('friendly_url_suffix',	'.html'),
('full_aliaslisting',	'0'),
('global_tabs',	'1'),
('group_tvs',	'0'),
('jpegQuality',	'90'),
('lang_code',	'en'),
('login_bg',	''),
('login_form_position',	'left'),
('login_form_style',	'dark'),
('login_logo',	''),
('mail_check_timeperiod',	'600'),
('make_folders',	'0'),
('manager_direction',	'ltr'),
('manager_language',	'en'),
('manager_layout',	'4'),
('manager_menu_position',	'top'),
('manager_theme',	'default'),
('manager_theme_mode',	'3'),
('maxImageHeight',	'2200'),
('maxImageWidth',	'2600'),
('minifyphp_incache',	'0'),
('modx_charset',	'UTF-8'),
('new_file_permissions',	'0644'),
('new_folder_permissions',	'0755'),
('noThumbnailsRecreation',	'0'),
('number_of_logs',	'100'),
('number_of_messages',	'40'),
('number_of_results',	'30'),
('old_template',	'1'),
('publish_default',	'1'),
('pwd_hash_algo',	'UNCRYPT'),
('rb_base_dir',	'/home/d/directpr/developertest.directpr.beget.tech/public_html/assets/'),
('rb_base_url',	'assets/'),
('rb_webuser',	'0'),
('reload_captcha_words',	''),
('reload_emailsubject',	''),
('reload_site_unavailable',	''),
('reload_system_email_webreminder_message',	''),
('reload_websignupemail_message',	''),
('remember_last_tab',	'1'),
('resource_tree_node_name',	'pagetitle'),
('rss_url_news',	'http://feeds.feedburner.com/evocms-release-news'),
('rss_url_security',	'http://feeds.feedburner.com/evocms-security-news'),
('safe_functions_at_eval',	'time,date,strtotime,strftime'),
('search_default',	'1'),
('send_errormail',	'0'),
('seostrict',	'1'),
('server_offset_time',	'0'),
('server_protocol',	'http'),
('session.cookie.lifetime',	'604800'),
('session_timeout',	'15'),
('settings_version',	'3.1.6'),
('showHiddenFiles',	'0'),
('show_fullscreen_btn',	'0'),
('show_newresource_btn',	'0'),
('show_picker',	'0'),
('siteunavailable_message_default',	'В настоящее время сайт недоступен.'),
('site_id',	'6141b2c433018'),
('site_name',	'My Evolution Site'),
('site_start',	'1'),
('site_status',	'1'),
('site_unavailable_message',	'В настоящее время сайт недоступен.'),
('site_unavailable_page',	''),
('smtp_auth',	'0'),
('smtp_autotls',	'0'),
('smtp_host',	'smtp.example.com'),
('smtp_port',	'25'),
('smtp_secure',	'none'),
('smtp_username',	'emailsender'),
('strip_image_paths',	'1'),
('system_email_webreminder_default',	'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default',	'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('sys_files_checksum',	'a:4:{s:72:\"/home/d/directpr/developertest.directpr.beget.tech/public_html/index.php\";s:32:\"599511a98673763d066ea76b9e50fbb0\";s:72:\"/home/d/directpr/developertest.directpr.beget.tech/public_html/.htaccess\";s:32:\"4d525766cb6232034562a1732ec06a9c\";s:80:\"/home/d/directpr/developertest.directpr.beget.tech/public_html/manager/index.php\";s:32:\"19c60de055d5efeb3fdd9debde124cb7\";s:108:\"/home/d/directpr/developertest.directpr.beget.tech/public_html//core/config/database/connections/default.php\";s:32:\"4684eb7ee2a7522d19de36e05a3c2a96\";}'),
('theme_refresher',	''),
('thumbHeight',	'150'),
('thumbsDir',	'.thumbs'),
('thumbWidth',	'150'),
('track_visitors',	'0'),
('tree_page_click',	'27'),
('tree_show_protected',	'0'),
('udperms_allowroot',	'0'),
('unauthorized_page',	'1'),
('UpgradeRepository',	''),
('upload_files',	'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
('upload_images',	'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
('upload_maxsize',	'10485760'),
('upload_media',	'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('use_alias_path',	'1'),
('use_breadcrumbs',	'0'),
('use_browser',	'1'),
('use_captcha',	'0'),
('use_editor',	'1'),
('use_udperms',	'1'),
('validate_referer',	'1'),
('warning_visibility',	'0'),
('webpwdreminder_message',	'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('websignupemail_message',	'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('which_browser',	'mcpuk'),
('which_editor',	'none'),
('xhtml_urls',	'0');

DROP TABLE IF EXISTS `azv4_users`;
CREATE TABLE `azv4_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  `refresh_token` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `verified_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_users` (`id`, `username`, `password`, `cachepwd`, `refresh_token`, `access_token`, `valid_to`, `verified_key`) VALUES
(1,	'admin',	'$P$BKYaikkZbsor0jpH2JSEkOuXdNd.Uk0',	'',	'4772d9fbee83189f55187adc913d3f7b6decc3050ae6c5bfd330861aed6979da',	'2028a83fb07e6eb29007eb17092cd62d5734e0e103bc167b0a14e6d8aae354f5',	'2021-09-17 23:55:31',	NULL);

DROP TABLE IF EXISTS `azv4_user_attributes`;
CREATE TABLE `azv4_user_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internalKey` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '1',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(11) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(11) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(11) DEFAULT '0',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `web_user_attributes_internalkey_index` (`internalKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_user_attributes` (`id`, `internalKey`, `fullname`, `first_name`, `last_name`, `middle_name`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`, `verified`) VALUES
(1,	1,	'1',	'',	'',	'',	1,	'1@1.ru',	'',	'',	0,	0,	0,	4,	1631894131,	1631894131,	0,	'1',	0,	0,	'',	'',	'',	'',	'',	'',	'',	'',	1631695556,	1631894131,	1);

DROP TABLE IF EXISTS `azv4_user_roles`;
CREATE TABLE `azv4_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_user_roles` (`id`, `name`, `description`) VALUES
(1,	'Administrator',	'Site administrators have full access to all functions'),
(2,	'Editor',	'Limited to managing content'),
(3,	'Publisher',	'Editor with expanded permissions including manage users, update Elements and site settings');

DROP TABLE IF EXISTS `azv4_user_role_vars`;
CREATE TABLE `azv4_user_role_vars` (
  `tmplvarid` int(11) NOT NULL DEFAULT '0',
  `roleid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `azv4_user_settings`;
CREATE TABLE `azv4_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `user_settings_user_index` (`user`),
  KEY `setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `azv4_user_settings` (`user`, `setting_name`, `setting_value`) VALUES
(1,	'manager_theme_mode',	'3'),
(1,	'which_browser',	'default');

DROP TABLE IF EXISTS `azv4_user_values`;
CREATE TABLE `azv4_user_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_values_tmplvarid_userid_unique` (`tmplvarid`,`userid`),
  KEY `user_values_tmplvarid_index` (`tmplvarid`),
  KEY `user_values_userid_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2021-09-17 16:01:04
