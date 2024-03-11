-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema user_profile_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `user_profile_db` ;

-- -----------------------------------------------------
-- Schema user_profile_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `user_profile_db` ;
SHOW WARNINGS;
USE `user_profile_db` ;

-- -----------------------------------------------------
-- Table `user_profile_db`.`genderLookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`genderLookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`genderLookup` (
  `idgenderLookup` INT NOT NULL AUTO_INCREMENT,
  `gender_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenderLookup`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`voter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`voter` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`voter` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  `DOB` VARCHAR(45) NULL,
  `social_security_number` INT(9) NOT NULL,
  `genderLookup_idgenderLookup` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_genderLookup1_idx` (`genderLookup_idgenderLookup` ASC) VISIBLE,
  CONSTRAINT `fk_user_genderLookup1`
    FOREIGN KEY (`genderLookup_idgenderLookup`)
    REFERENCES `user_profile_db`.`genderLookup` (`idgenderLookup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`income`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`income` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`income` (
  `idincome` INT NOT NULL AUTO_INCREMENT,
  `income_level` VARCHAR(45) NULL,
  `income_desc` VARCHAR(45) NULL,
  `capture_date` DATETIME NULL,
  PRIMARY KEY (`idincome`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`education` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`education` (
  `ideducation` INT NOT NULL AUTO_INCREMENT,
  `edu_level` VARCHAR(45) NULL,
  `edu_desc` VARCHAR(255) NULL,
  `alma_mater` VARCHAR(45) NULL,
  `capture_date` VARCHAR(45) NULL,
  PRIMARY KEY (`ideducation`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`occupation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`occupation` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`occupation` (
  `idoccupation` INT NOT NULL AUTO_INCREMENT,
  `occ_name` VARCHAR(45) NULL,
  `occ_desc` VARCHAR(255) NULL,
  `occ_capture` DATETIME NULL,
  PRIMARY KEY (`idoccupation`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`affiliationLookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`affiliationLookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`affiliationLookup` (
  `idaffiliationLookup` INT NOT NULL AUTO_INCREMENT,
  `affiliation_name` VARCHAR(45) NULL,
  `affiliation_desc` TEXT NULL,
  PRIMARY KEY (`idaffiliationLookup`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`intensityLookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`intensityLookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`intensityLookup` (
  `idintensityLookup` INT NOT NULL,
  `intesity_name` VARCHAR(45) NULL,
  `intensity_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`idintensityLookup`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`affiliation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`affiliation` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`affiliation` (
  `idaffiliation` INT NOT NULL,
  `affiliation_capture` DATETIME NULL,
  `affiliationLookup_idaffiliationLookup` INT NOT NULL,
  `intensityLookup_idintensityLookup` INT NOT NULL,
  PRIMARY KEY (`idaffiliation`),
  INDEX `fk_affiliation_affiliationLookup1_idx` (`affiliationLookup_idaffiliationLookup` ASC) VISIBLE,
  INDEX `fk_affiliation_intensityLookup1_idx` (`intensityLookup_idintensityLookup` ASC) VISIBLE,
  CONSTRAINT `fk_affiliation_affiliationLookup1`
    FOREIGN KEY (`affiliationLookup_idaffiliationLookup`)
    REFERENCES `user_profile_db`.`affiliationLookup` (`idaffiliationLookup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_affiliation_intensityLookup1`
    FOREIGN KEY (`intensityLookup_idintensityLookup`)
    REFERENCES `user_profile_db`.`intensityLookup` (`idintensityLookup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`viewLookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`viewLookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`viewLookup` (
  `idviewLookup` INT NOT NULL AUTO_INCREMENT,
  `view_name` VARCHAR(45) NULL,
  `view_desc` TEXT NULL,
  PRIMARY KEY (`idviewLookup`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`socialView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`socialView` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`socialView` (
  `idsocialView` INT NOT NULL AUTO_INCREMENT,
  `view_capture` DATETIME NULL,
  `viewLookup_idviewLookup` INT NOT NULL,
  `intensityLookup_idintensityLookup` INT NOT NULL,
  PRIMARY KEY (`idsocialView`),
  INDEX `fk_socialView_viewLookup1_idx` (`viewLookup_idviewLookup` ASC) VISIBLE,
  INDEX `fk_socialView_intensityLookup1_idx` (`intensityLookup_idintensityLookup` ASC) VISIBLE,
  CONSTRAINT `fk_socialView_viewLookup1`
    FOREIGN KEY (`viewLookup_idviewLookup`)
    REFERENCES `user_profile_db`.`viewLookup` (`idviewLookup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_socialView_intensityLookup1`
    FOREIGN KEY (`intensityLookup_idintensityLookup`)
    REFERENCES `user_profile_db`.`intensityLookup` (`idintensityLookup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`personalData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`personalData` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`personalData` (
  `idpersonalData` INT NOT NULL AUTO_INCREMENT,
  `user_iduser` INT NOT NULL,
  `education_ideducation` INT NOT NULL,
  `occupation_idoccupation` INT NOT NULL,
  `income_idincome` INT NOT NULL,
  `affiliation_idaffiliation` INT NOT NULL,
  `socialView_idsocialView` INT NOT NULL,
  `social_mate_preference` VARCHAR(3) NULL,
  PRIMARY KEY (`idpersonalData`),
  INDEX `fk_personalData_user_idx` (`user_iduser` ASC) VISIBLE,
  INDEX `fk_personalData_education1_idx` (`education_ideducation` ASC) VISIBLE,
  INDEX `fk_personalData_occupation1_idx` (`occupation_idoccupation` ASC) VISIBLE,
  INDEX `fk_personalData_income1_idx` (`income_idincome` ASC) VISIBLE,
  INDEX `fk_personalData_affiliation1_idx` (`affiliation_idaffiliation` ASC) VISIBLE,
  INDEX `fk_personalData_socialView1_idx` (`socialView_idsocialView` ASC) VISIBLE,
  CONSTRAINT `fk_personalData_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_personalData_education1`
    FOREIGN KEY (`education_ideducation`)
    REFERENCES `user_profile_db`.`education` (`ideducation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_personalData_occupation1`
    FOREIGN KEY (`occupation_idoccupation`)
    REFERENCES `user_profile_db`.`occupation` (`idoccupation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_personalData_income1`
    FOREIGN KEY (`income_idincome`)
    REFERENCES `user_profile_db`.`income` (`idincome`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_personalData_affiliation1`
    FOREIGN KEY (`affiliation_idaffiliation`)
    REFERENCES `user_profile_db`.`affiliation` (`idaffiliation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_personalData_socialView1`
    FOREIGN KEY (`socialView_idsocialView`)
    REFERENCES `user_profile_db`.`socialView` (`idsocialView`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`contact` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`contact` (
  `idcontact` INT NOT NULL AUTO_INCREMENT,
  `contact_type` VARCHAR(45) NULL,
  `contact_value` VARCHAR(45) NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idcontact`),
  INDEX `fk_contact_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_contact_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`address` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`address` (
  `idaddress` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` VARCHAR(5) NULL,
  `country` VARCHAR(45) NULL,
  `voter_iduser` INT NOT NULL,
  `caputure_date` DATETIME NOT NULL,
  PRIMARY KEY (`idaddress`),
  INDEX `fk_address_voter1_idx` (`voter_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_address_voter1`
    FOREIGN KEY (`voter_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`socialMedia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`socialMedia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`socialMedia` (
  `idsocialMedia` INT NOT NULL,
  `platform` VARCHAR(45) NULL,
  `handle` VARCHAR(100) NULL,
  `SMID` VARCHAR(255) NOT NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idsocialMedia`),
  INDEX `fk_socialMedia_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_socialMedia_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`hashtags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`hashtags` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`hashtags` (
  `idhashtag` INT NOT NULL AUTO_INCREMENT,
  `hash_text` VARCHAR(100) NULL,
  `hash_type` VARCHAR(45) NULL,
  `hash_desc` VARCHAR(255) NULL,
  PRIMARY KEY (`idhashtag`),
  UNIQUE INDEX `hash_text_UNIQUE` (`hash_text` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`persona` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `personality_type` VARCHAR(45) NULL,
  `personacol` VARCHAR(45) NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idpersona`),
  INDEX `fk_persona_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_persona_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`category` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`category` (
  `idcategory` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NULL,
  `cat_desc` VARCHAR(45) NULL,
  `cat_type` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE INDEX `cat_name_UNIQUE` (`cat_name` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`userCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`userCategory` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`userCategory` (
  `iduserCategory` INT NOT NULL AUTO_INCREMENT,
  `user_iduser` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  PRIMARY KEY (`iduserCategory`),
  INDEX `fk_userCategory_user1_idx` (`user_iduser` ASC) VISIBLE,
  INDEX `fk_userCategory_category1_idx` (`category_idcategory` ASC) VISIBLE,
  CONSTRAINT `fk_userCategory_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_userCategory_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `user_profile_db`.`category` (`idcategory`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`posts` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`posts` (
  `idposts` INT NOT NULL AUTO_INCREMENT,
  `post_title` VARCHAR(255) NULL,
  `post_content` LONGTEXT NULL,
  `post_capture` DATETIME NULL,
  `post_client` VARCHAR(100) NULL,
  `socialMedia_idsocialMedia` INT NOT NULL,
  `hashtags_idhashtag` INT NOT NULL,
  PRIMARY KEY (`idposts`),
  INDEX `fk_posts_socialMedia1_idx` (`socialMedia_idsocialMedia` ASC) VISIBLE,
  INDEX `fk_posts_hashtags1_idx` (`hashtags_idhashtag` ASC) VISIBLE,
  CONSTRAINT `fk_posts_socialMedia1`
    FOREIGN KEY (`socialMedia_idsocialMedia`)
    REFERENCES `user_profile_db`.`socialMedia` (`idsocialMedia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_posts_hashtags1`
    FOREIGN KEY (`hashtags_idhashtag`)
    REFERENCES `user_profile_db`.`hashtags` (`idhashtag`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`suspiciousLookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`suspiciousLookup` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`suspiciousLookup` (
  `idsuspiciousLookup` INT NOT NULL,
  `suspicious_name` VARCHAR(45) NULL,
  `suspicious_desc` TEXT NULL,
  PRIMARY KEY (`idsuspiciousLookup`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`engagement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`engagement` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`engagement` (
  `idengagement` INT NOT NULL AUTO_INCREMENT,
  `device` VARCHAR(45) NULL,
  `client_delivery` VARCHAR(45) NULL,
  `engagement_metadata` JSON NULL,
  `capture_time` DATETIME NULL,
  `type` VARCHAR(45) NULL,
  `user_iduser` INT NOT NULL,
  `suspiciousLookup_idsuspiciousLookup` INT NOT NULL,
  PRIMARY KEY (`idengagement`),
  INDEX `fk_engagement_user1_idx` (`user_iduser` ASC) VISIBLE,
  INDEX `fk_engagement_suspiciousLookup1_idx` (`suspiciousLookup_idsuspiciousLookup` ASC) VISIBLE,
  CONSTRAINT `fk_engagement_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_engagement_suspiciousLookup1`
    FOREIGN KEY (`suspiciousLookup_idsuspiciousLookup`)
    REFERENCES `user_profile_db`.`suspiciousLookup` (`idsuspiciousLookup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`industry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`industry` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`industry` (
  `idindustry` INT NOT NULL AUTO_INCREMENT,
  `industry_name` VARCHAR(45) NULL,
  `industry_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`idindustry`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`marketingAgency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`marketingAgency` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`marketingAgency` (
  `idagency` INT NOT NULL AUTO_INCREMENT,
  `agency_name` VARCHAR(100) NULL,
  `marketingAgencycol1` VARCHAR(45) NULL,
  `industry_idindustry` INT NOT NULL,
  PRIMARY KEY (`idagency`),
  UNIQUE INDEX `marketingAgencycol_UNIQUE` (`agency_name` ASC) VISIBLE,
  INDEX `fk_marketingAgency_industry1_idx` (`industry_idindustry` ASC) VISIBLE,
  CONSTRAINT `fk_marketingAgency_industry1`
    FOREIGN KEY (`industry_idindustry`)
    REFERENCES `user_profile_db`.`industry` (`idindustry`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`agencyContact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`agencyContact` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`agencyContact` (
  `idagencyContact` INT NOT NULL AUTO_INCREMENT,
  `marketingAgency_idagency` INT NOT NULL,
  `contact_idcontact` INT NOT NULL,
  PRIMARY KEY (`idagencyContact`),
  INDEX `fk_agencyContact_marketingAgency1_idx` (`marketingAgency_idagency` ASC) VISIBLE,
  INDEX `fk_agencyContact_contact1_idx` (`contact_idcontact` ASC) VISIBLE,
  CONSTRAINT `fk_agencyContact_marketingAgency1`
    FOREIGN KEY (`marketingAgency_idagency`)
    REFERENCES `user_profile_db`.`marketingAgency` (`idagency`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_agencyContact_contact1`
    FOREIGN KEY (`contact_idcontact`)
    REFERENCES `user_profile_db`.`contact` (`idcontact`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`contract` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`contract` (
  `idcontract` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `contract_details` LONGTEXT NULL,
  `sale_date` DATE NULL,
  `terms` LONGTEXT NULL,
  `marketingAgency_idagency` INT NOT NULL,
  PRIMARY KEY (`idcontract`),
  INDEX `fk_contract_marketingAgency1_idx` (`marketingAgency_idagency` ASC) VISIBLE,
  CONSTRAINT `fk_contract_marketingAgency1`
    FOREIGN KEY (`marketingAgency_idagency`)
    REFERENCES `user_profile_db`.`marketingAgency` (`idagency`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`dataSale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`dataSale` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`dataSale` (
  `iddataSale` INT NOT NULL AUTO_INCREMENT,
  `data_set_name` VARCHAR(45) NULL,
  `data_set_desc` VARCHAR(255) NULL,
  `sale_amount` DECIMAL(65,2) NULL,
  `contract_idcontract` INT NOT NULL,
  PRIMARY KEY (`iddataSale`),
  INDEX `fk_dataSale_contract1_idx` (`contract_idcontract` ASC) VISIBLE,
  CONSTRAINT `fk_dataSale_contract1`
    FOREIGN KEY (`contract_idcontract`)
    REFERENCES `user_profile_db`.`contract` (`idcontract`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`transactionLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`transactionLog` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`transactionLog` (
  `idtransactionLog` INT NOT NULL AUTO_INCREMENT,
  `transaction_type` VARCHAR(255) NOT NULL,
  `transaction_status` VARCHAR(45) NULL,
  `transaction_date` DATETIME NOT NULL,
  `transaction_desc` TEXT NULL,
  PRIMARY KEY (`idtransactionLog`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`transactionDetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`transactionDetail` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`transactionDetail` (
  `idtransactionDetail` INT NOT NULL AUTO_INCREMENT,
  `transactionLog_idtransactionLog` INT NOT NULL,
  `entity_type` VARCHAR(45) NOT NULL,
  `entity_id` INT NOT NULL,
  `before_value` TEXT NULL,
  `after_value` TEXT NULL,
  `detail_date` DATETIME NOT NULL,
  PRIMARY KEY (`idtransactionDetail`),
  INDEX `fk_transactionDetail_transactionLog1_idx` (`transactionLog_idtransactionLog` ASC) VISIBLE,
  CONSTRAINT `fk_transactionDetail_transactionLog1`
    FOREIGN KEY (`transactionLog_idtransactionLog`)
    REFERENCES `user_profile_db`.`transactionLog` (`idtransactionLog`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`userOpinions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`userOpinions` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`userOpinions` (
  `iduserOpinions` INT NOT NULL AUTO_INCREMENT,
  `opinion_subject` VARCHAR(255) NULL,
  `opinion_value` VARCHAR(255) NULL,
  `opinion_capture` DATETIME NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`iduserOpinions`),
  INDEX `fk_userOpinions_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_userOpinions_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`account` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`account` (
  `idaccount` INT NOT NULL AUTO_INCREMENT,
  `account_email` VARCHAR(100) NOT NULL,
  `password` CHAR(60) NOT NULL,
  `voter_iduser` INT NOT NULL,
  `capture_date` DATETIME NOT NULL,
  PRIMARY KEY (`idaccount`),
  INDEX `fk_account_voter1_idx` (`voter_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_account_voter1`
    FOREIGN KEY (`voter_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`userTracker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`userTracker` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`userTracker` (
  `idtracker` INT NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NOT NULL,
  `mac_address` VARCHAR(17) NULL,
  `browser_cookie` VARCHAR(255) NOT NULL,
  `voter_iduser` INT NOT NULL,
  `capture_access` DATETIME NOT NULL,
  PRIMARY KEY (`idtracker`),
  INDEX `fk_userTracker_voter1_idx` (`voter_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_userTracker_voter1`
    FOREIGN KEY (`voter_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`election`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`election` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`election` (
  `idelection` INT NOT NULL AUTO_INCREMENT,
  `elect_name` VARCHAR(45) NULL,
  `election_start` VARCHAR(45) NULL,
  `election_end` VARCHAR(45) NULL,
  `election_desc` TEXT NULL,
  PRIMARY KEY (`idelection`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`ballot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`ballot` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`ballot` (
  `idballot` INT NOT NULL,
  `ballot_session_id` VARCHAR(45) NULL,
  `ballot_data` JSON NULL,
  `submission_log` DATETIME NOT NULL,
  `voter_iduser` INT NOT NULL,
  `election_idelection` INT NOT NULL,
  PRIMARY KEY (`idballot`),
  INDEX `fk_ballot_voter1_idx` (`voter_iduser` ASC) VISIBLE,
  INDEX `fk_ballot_election1_idx` (`election_idelection` ASC) VISIBLE,
  CONSTRAINT `fk_ballot_voter1`
    FOREIGN KEY (`voter_iduser`)
    REFERENCES `user_profile_db`.`voter` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ballot_election1`
    FOREIGN KEY (`election_idelection`)
    REFERENCES `user_profile_db`.`election` (`idelection`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`session` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`session` (
  `idsession` INT NOT NULL AUTO_INCREMENT,
  `start_time` DATETIME NULL,
  `end_time` VARCHAR(45) NULL,
  `ballot_idballot` INT NOT NULL,
  PRIMARY KEY (`idsession`),
  INDEX `fk_session_ballot1_idx` (`ballot_idballot` ASC) VISIBLE,
  CONSTRAINT `fk_session_ballot1`
    FOREIGN KEY (`ballot_idballot`)
    REFERENCES `user_profile_db`.`ballot` (`idballot`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`metaData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`metaData` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`metaData` (
  `idmetaData` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `data` JSON NULL,
  `personalData_idpersonalData` INT NOT NULL,
  PRIMARY KEY (`idmetaData`),
  INDEX `fk_metaData_personalData1_idx` (`personalData_idpersonalData` ASC) VISIBLE,
  CONSTRAINT `fk_metaData_personalData1`
    FOREIGN KEY (`personalData_idpersonalData`)
    REFERENCES `user_profile_db`.`personalData` (`idpersonalData`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
