CREATE TABLE `answer_items` (
  `id` int(11) NOT NULL auto_increment,
  `answer_profile_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_detail` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `answer_profiles` (
  `id` int(11) NOT NULL auto_increment,
  `questionnarie_id` int(11) NOT NULL,
  `publication` tinyint(1) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `questionnaries` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  `limit` date NOT NULL,
  `publication` varchar(255) NOT NULL,
  `note` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL auto_increment,
  `questionnarie_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `sentences` varchar(255) NOT NULL,
  `need` tinyint(1) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `schema_info` (version) VALUES (4)