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
-- Table `user_profile_db`.`homeStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`homeStatus` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`homeStatus` (
  `idhomeStatus` INT NOT NULL AUTO_INCREMENT,
  `home_type` VARCHAR(45) NULL,
  `mortgage` TINYINT NULL,
  PRIMARY KEY (`idhomeStatus`))
ENGINE = InnoDB;

SHOW WARNINGS;

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
-- Table `user_profile_db`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`user` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  `DOB` VARCHAR(45) NULL,
  `homeStatus_idhomeStatus` INT NOT NULL,
  `genderLookup_idgenderLookup` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_homeStatus1_idx` (`homeStatus_idhomeStatus` ASC) VISIBLE,
  INDEX `fk_user_genderLookup1_idx` (`genderLookup_idgenderLookup` ASC) VISIBLE,
  CONSTRAINT `fk_user_homeStatus1`
    FOREIGN KEY (`homeStatus_idhomeStatus`)
    REFERENCES `user_profile_db`.`homeStatus` (`idhomeStatus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
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
    REFERENCES `user_profile_db`.`user` (`iduser`)
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
    REFERENCES `user_profile_db`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`location` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`location` (
  `idlocation` INT NOT NULL AUTO_INCREMENT,
  `loc_type` VARCHAR(45) NULL,
  `loc_coord` POINT NULL,
  `loc_capture` DATETIME NULL,
  `loc_street` VARCHAR(100) NULL,
  `loc_city` VARCHAR(45) NULL,
  `loc_state` VARCHAR(45) NULL,
  `loc_zip` VARCHAR(45) NULL,
  `loc_country` VARCHAR(45) NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idlocation`),
  INDEX `fk_location_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_location_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`user` (`iduser`)
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
  PRIMARY KEY (`idaddress`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`userAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`userAddress` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`userAddress` (
  `iduserAddress` INT NOT NULL AUTO_INCREMENT,
  `address_type` VARCHAR(45) NULL,
  `address_idaddress` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  INDEX `fk_userAddress_address1_idx` (`address_idaddress` ASC) VISIBLE,
  INDEX `fk_userAddress_user1_idx` (`user_iduser` ASC) VISIBLE,
  PRIMARY KEY (`iduserAddress`),
  CONSTRAINT `fk_userAddress_address1`
    FOREIGN KEY (`address_idaddress`)
    REFERENCES `user_profile_db`.`address` (`idaddress`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_userAddress_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`user` (`iduser`)
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
    REFERENCES `user_profile_db`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`product` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`product` (
  `idproduct` INT NOT NULL AUTO_INCREMENT,
  `p_name` VARCHAR(45) NULL,
  `p_type` VARCHAR(45) NULL,
  `p_price` DECIMAL(65,2) NULL,
  PRIMARY KEY (`idproduct`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`purchasePlatform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`purchasePlatform` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`purchasePlatform` (
  `idpurchasePlatform` INT NOT NULL,
  `platform_name` VARCHAR(100) NULL,
  `platform_site` VARCHAR(100) NULL,
  PRIMARY KEY (`idpurchasePlatform`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_profile_db`.`purchaseHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`purchaseHistory` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`purchaseHistory` (
  `idpurchaseHistory` INT NOT NULL,
  `purchase_date` DATETIME NULL,
  `amount` DECIMAL(65,2) NULL,
  `product_idproduct` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  `purchasePlatform_idpurchasePlatform` INT NOT NULL,
  PRIMARY KEY (`idpurchaseHistory`),
  INDEX `fk_purchaseHistory_product1_idx` (`product_idproduct` ASC) VISIBLE,
  INDEX `fk_purchaseHistory_user1_idx` (`user_iduser` ASC) VISIBLE,
  INDEX `fk_purchaseHistory_purchasePlatform1_idx` (`purchasePlatform_idpurchasePlatform` ASC) VISIBLE,
  CONSTRAINT `fk_purchaseHistory_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `user_profile_db`.`product` (`idproduct`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchaseHistory_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchaseHistory_purchasePlatform1`
    FOREIGN KEY (`purchasePlatform_idpurchasePlatform`)
    REFERENCES `user_profile_db`.`purchasePlatform` (`idpurchasePlatform`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = ascii;

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
-- Table `user_profile_db`.`productHashtags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`productHashtags` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`productHashtags` (
  `idproductHashtag` INT NOT NULL AUTO_INCREMENT,
  `product_idproduct` INT NOT NULL,
  `hashtag_idhashtag` INT NOT NULL,
  PRIMARY KEY (`idproductHashtag`),
  INDEX `fk_productHashtag_product1_idx` (`product_idproduct` ASC) VISIBLE,
  INDEX `fk_productHashtag_hashtag1_idx` (`hashtag_idhashtag` ASC) VISIBLE,
  CONSTRAINT `fk_productHashtag_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `user_profile_db`.`product` (`idproduct`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_productHashtag_hashtag1`
    FOREIGN KEY (`hashtag_idhashtag`)
    REFERENCES `user_profile_db`.`hashtags` (`idhashtag`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
    REFERENCES `user_profile_db`.`user` (`iduser`)
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
    REFERENCES `user_profile_db`.`user` (`iduser`)
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
-- Table `user_profile_db`.`categoryHashtags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`categoryHashtags` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`categoryHashtags` (
  `idcategoryHashtags` INT NOT NULL AUTO_INCREMENT,
  `hashtags_idhashtag` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  PRIMARY KEY (`idcategoryHashtags`),
  INDEX `fk_categoryHashtags_hashtags1_idx` (`hashtags_idhashtag` ASC) VISIBLE,
  INDEX `fk_categoryHashtags_category1_idx` (`category_idcategory` ASC) VISIBLE,
  CONSTRAINT `fk_categoryHashtags_hashtags1`
    FOREIGN KEY (`hashtags_idhashtag`)
    REFERENCES `user_profile_db`.`hashtags` (`idhashtag`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_categoryHashtags_category1`
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
  `postCategory_idpostCategory` INT NOT NULL,
  PRIMARY KEY (`idposts`),
  INDEX `fk_posts_socialMedia1_idx` (`socialMedia_idsocialMedia` ASC) VISIBLE,
  CONSTRAINT `fk_posts_socialMedia1`
    FOREIGN KEY (`socialMedia_idsocialMedia`)
    REFERENCES `user_profile_db`.`socialMedia` (`idsocialMedia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idengagement`),
  INDEX `fk_engagement_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_engagement_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user_profile_db`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
-- Table `user_profile_db`.`industryOccupation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile_db`.`industryOccupation` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_profile_db`.`industryOccupation` (
  `idindustryOccupation` INT NOT NULL AUTO_INCREMENT,
  `industry_idindustry` INT NOT NULL,
  `occupation_idoccupation` INT NOT NULL,
  PRIMARY KEY (`idindustryOccupation`),
  INDEX `fk_industryOccupation_industry1_idx` (`industry_idindustry` ASC) VISIBLE,
  INDEX `fk_industryOccupation_occupation1_idx` (`occupation_idoccupation` ASC) VISIBLE,
  CONSTRAINT `fk_industryOccupation_industry1`
    FOREIGN KEY (`industry_idindustry`)
    REFERENCES `user_profile_db`.`industry` (`idindustry`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_industryOccupation_occupation1`
    FOREIGN KEY (`occupation_idoccupation`)
    REFERENCES `user_profile_db`.`occupation` (`idoccupation`)
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
    REFERENCES `user_profile_db`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
