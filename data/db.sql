# `sch` is the name of the schema to be dealt with

SET FOREIGN_KEY_CHECKS = 0;
DROP SCHEMA IF EXISTS `sch`;
CREATE SCHEMA `sch` DEFAULT CHARACTER SET UTF8;
USE `sch`;

CREATE TABLE `chr` (`chr` INT(2) UNSIGNED NOT NULL, `chrname` VARCHAR(255) NOT NULL) ENGINE = INNODB;
CREATE TABLE `chrsupp` (`chr` INT(2) UNSIGNED NOT NULL, `chroff` INT(4) UNSIGNED  NOT NULL, `chrlen` INT(4) UNSIGNED NOT NULL) ENGINE = INNODB;
CREATE TABLE `col` (`col` INT(4) UNSIGNED NOT NULL, `test` TEXT NOT NULL) ENGINE = INNODB;

CREATE TABLE `ind` (`chr` INT(2) UNSIGNED NOT NULL, `nrow` INT(4) UNSIGNED NOT NULL, `ind` INT(4) UNSIGNED NOT NULL) ENGINE = INNODB;
CREATE TABLE `pos` (`ind` INT(4) UNSIGNED NOT NULL, `pos` INT(4) UNSIGNED NOT NULL) ENGINE = INNODB;
CREATE TABLE `alias` (`ind` INT(4) UNSIGNED NOT NULL, `alias` VARCHAR(31) NOT NULL) ENGINE = INNODB;
        
CREATE TABLE `v_ind` (`ind` INT(8) UNSIGNED NOT NULL, `col` INT(4) UNSIGNED NOT NULL, `v_ind` INT(8) UNSIGNED NOT NULL) ENGINE = INNODB;
CREATE TABLE `pval` (`v_ind` INT(8) UNSIGNED NOT NULL, `pval` DOUBLE NOT NULL) ENGINE = INNODB;
CREATE TABLE `qas` (`v_ind` INT(8) UNSIGNED NOT NULL, `qas` DOUBLE NOT NULL) ENGINE = INNODB;
CREATE TABLE `maf` (`v_ind` INT(8) UNSIGNED NOT NULL, `maf` DOUBLE NOT NULL) ENGINE = INNODB;
CREATE TABLE `r_pval` (`v_ind` INT(8) UNSIGNED NOT NULL, `r_pval` INT(8) UNSIGNED NOT NULL) ENGINE = INNODB;
CREATE TABLE `r_qas` (`v_ind` INT(8) UNSIGNED NOT NULL, `r_qas` INT(8) UNSIGNED NOT NULL) ENGINE = INNODB;

# Differences between the following three queries are only of: 
# a) table name;
# b) primary key and key statements.
# create table `report_top_hits_density` (`radius_nrow` int(4) unsigned, `radius_pos` int(4) unsigned, `chr` int(2) unsigned not null, `nrow` int(4) unsigned not null, `alias` varchar(31) not null, `fold` varchar(31) not null, `fold_type` varchar(7) not null, `pos` int(4) unsigned not null, `maf` double not null, `gene` varchar(31) not null, `r_density` int(4) unsigned not null, `density` double not null, `left_nrow` int(4) unsigned not null, `right_nrow` int(4) unsigned not null, `left_pos` int(4) unsigned not null, `right_pos` int(4) unsigned not null, `left_count` int(4) unsigned not null, `right_count` int(4) unsigned not null, `test` varchar(31) not null, `r_pval` int(4) unsigned not null, `pval` double not null, `r_ratio` int(4) unsigned not null, `ratio` double not null, primary key(`fold_type`,`fold_type`));
# create table `report_top_hits_pval` (`radius_nrow` int(4) unsigned, `radius_pos` int(4) unsigned, `chr` int(2) unsigned not null, `nrow` int(4) unsigned not null, `alias` varchar(31) not null, `fold` varchar(31) not null, `fold_type` varchar(7) not null, `pos` int(4) unsigned not null, `maf` double not null, `gene` varchar(31) not null, `r_density` int(4) unsigned not null, `density` double not null, `left_nrow` int(4) unsigned not null, `right_nrow` int(4) unsigned not null, `left_pos` int(4) unsigned not null, `right_pos` int(4) unsigned not null, `left_count` int(4) unsigned not null, `right_count` int(4) unsigned not null, `test` varchar(31) not null, `r_pval` int(4) unsigned not null, `pval` double not null, `r_ratio` int(4) unsigned not null, `ratio` double not null, primary key(`fold_type`,`fold_type`));
# create table `report_top_hits_ratio` (`radius_nrow` int(4) unsigned, `radius_pos` int(4) unsigned, `chr` int(2) unsigned not null, `nrow` int(4) unsigned not null, `alias` varchar(31) not null, `fold` varchar(31) not null, `fold_type` varchar(7) not null, `pos` int(4) unsigned not null, `maf` double not null, `gene` varchar(31) not null, `r_density` int(4) unsigned not null, `density` double not null, `left_nrow` int(4) unsigned not null, `right_nrow` int(4) unsigned not null, `left_pos` int(4) unsigned not null, `right_pos` int(4) unsigned not null, `left_count` int(4) unsigned not null, `right_count` int(4) unsigned not null, `test` varchar(31) not null, `r_pval` int(4) unsigned not null, `pval` double not null, `r_ratio` int(4) unsigned not null, `ratio` double not null, primary key(`fold_type`,`fold_type`));

create table `radius_ind` (`radius_ind` int(2) unsigned not null, `radius_type` varchar(31) not null, `radius_val` int(4) unsigned not null, primary key(`radius_ind`), key(`radius_type`, `radius_val`));
create table `fold_ind` (`fold_ind` int(2) unsigned not null, `fold_type` varchar(31) not null, `fold_list` text, primary key(`fold_ind`), key(`fold_type`));

create table `report_top_hits_density` (`radius_ind` int(2) unsigned not null, `fold_ind` int(2) unsigned not null, `v_ind` int(8) unsigned not null, `r_density` int(4) unsigned not null, `density` double not null, `left_ind` int(8) unsigned not null, `right_ind` int(8) unsigned not null, `left_count` int(4) unsigned not null, `right_count` int(4) unsigned not null, primary key(`radius_ind`,`fold_ind`), key(`r_density`));
create table `report_top_hits_pval` (`radius_ind` int(2) unsigned not null, `fold_ind` int(2) unsigned not null, `v_ind` int(8) unsigned not null, `r_density` int(4) unsigned not null, `density` double not null, `left_ind` int(8) unsigned not null, `right_ind` int(8) unsigned not null, `left_count` int(4) unsigned not null, `right_count` int(4) unsigned not null, primary key(`radius_ind`, `fold_ind`), key(`r_density`));
create table `report_top_hits_qas` (`radius_ind` int(2) unsigned not null, `fold_ind` int(2) unsigned not null, `v_ind` int(8) unsigned not null, `r_density` int(4) unsigned not null, `density` double not null, `left_ind` int(8) unsigned not null, `right_ind` int(8) unsigned not null, `left_count` int(4) unsigned not null, `right_count` int(4) unsigned not null, primary key(`radius_ind`, `fold_ind`), key(`r_density`));



# Data load takes place here
# Index creation takes place only after the proper data loading

ALTER TABLE `chr` ADD PRIMARY KEY(`chr`);
ALTER TABLE `chr` ADD KEY(`chrname`);

ALTER TABLE `chrsupp` ADD PRIMARY KEY(`chr`);

ALTER TABLE `col` ADD PRIMARY KEY(`col`);

ALTER TABLE `ind` ADD PRIMARY KEY(`chr`,`nrow`);
ALTER TABLE `ind` ADD KEY(`ind`);

ALTER TABLE `pos` ADD PRIMARY KEY(`ind`);
ALTER TABLE `pos` ADD KEY(`pos`);

ALTER TABLE `alias` ADD PRIMARY KEY(`ind`);
ALTER TABLE `alias` ADD KEY(`alias`);

ALTER TABLE `v_ind` ADD PRIMARY KEY(`ind`,`col`);
ALTER TABLE `v_ind` ADD KEY(`v_ind`);

ALTER TABLE `pval` ADD PRIMARY KEY(`v_ind`);
ALTER TABLE `pval` ADD KEY(`pval`);

ALTER TABLE `ratio` ADD PRIMARY KEY(`v_ind`);
ALTER TABLE `ratio` ADD KEY(`ratio`);

ALTER TABLE `maf` ADD PRIMARY KEY(`v_ind`);
ALTER TABLE `maf` ADD KEY(`maf`);

ALTER TABLE `r_pval` ADD PRIMARY KEY(`v_ind`);
ALTER TABLE `r_pval` ADD KEY(`r_pval`);

ALTER TABLE `r_ratio` ADD PRIMARY KEY(`v_ind`);
ALTER TABLE `r_ratio` ADD KEY(`r_ratio`);
