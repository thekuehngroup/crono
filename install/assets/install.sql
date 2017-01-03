
--
-- Struttura della tabella `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `gitlab_project_id` int(11) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Projects table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `key` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Settings table';

-- --------------------------------------------------------

--
-- Struttura della tabella `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(200) NOT NULL,
  `token_expire` int(11) NOT NULL,
  `client_secret_uuid` varchar(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`,`client_secret_uuid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tokens table (Auth for API)' AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `timer_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task` varchar(255) NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `stop_time` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Struttura della tabella `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `gitlab_private_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Users Table' AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `is_admin`, `gitlab_private_key`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'System', 'Administrator', 1, '');

INSERT INTO `settings` (`key`, `value`) VALUES
('frontend_language', 'english'),
('frontend_navbar_theme', 'default'),
('system_cost_per_hour', '60.00'),
('system_currency', 'EUR');
