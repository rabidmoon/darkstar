
DROP TABLE IF EXISTS `audit_chat`;
CREATE TABLE `audit_chat` (
	`lineID` INT(10) NOT NULL AUTO_INCREMENT,
	`speaker` TINYTEXT NOT NULL,
	`type` TINYTEXT NOT NULL,
	`recipient` TINYTEXT NULL,
	`message` TINYTEXT NOT NULL,
	`datetime` DATETIME NOT NULL,
	PRIMARY KEY (`lineID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;
