CREATE TABLE `conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fan_page_id` int(30) NOT NULL,
  `fan_page_name` varchar(255) NOT NULL,
  `cus_id` int(30) NOT NULL,
  `cus_name` varchar(50) NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `message_ID` int(11) NOT NULL,
  `sender` int(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100131 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci


CREATE TABLE `conversation_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  --`conversation_id` int(11) NOT NULL, -- removed
  `customer_count` int(11) NOT NULL,
  `sales_count` int(11) NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_conversation_id` (`conversation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(50) NOT NULL,
  `cus_id` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_cus_name` (`cus_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2982 DEFAULT CHARSET=utf8

CREATE TABLE `fan_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fan_page_name` varchar(255) NOT NULL,
  `fan_page_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_fan_page_name` (`fan_page_name`) USING BTREE,
  UNIQUE KEY `IDX_fan_page_id` (`fan_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `conversation_intention` (
  `conversation_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` bigint(20) NOT NULL,
  `intention` varchar(20) CHARACTER SET utf8 NOT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_reference_id` (`reference_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci

CREATE TABLE `converstion_entities` (
  `conversation_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` bigint(20) NOT NULL,
  `conversation_entity` varchar(20) CHARACTER SET utf8 NOT NULL,
  `conversation_entity_score` float NOT NULL,
  `conversation_entity_string` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_reference_id` (`reference_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci