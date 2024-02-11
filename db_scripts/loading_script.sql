#SELECT USER();
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
#GRANT ALL PRIVILEGES ON user_ad_db.* TO 'root'@'localhost';
#SHOW GRANTS FOR 'root'@'localhost';
show databases;
USE user_profile_db;
SHOW TABLES;
#SELECT COUNT(*) AS total_entries_before FROM homeStatus;

-- Load data from files see video for setup: https://youtu.be/SPWxNc5Plvk?si=be3znoZADCx0A1mp
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/1_home_status.csv'INTO TABLE homeStatus FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/2_occupation.csv'INTO TABLE occupation FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/3_income.csv'INTO TABLE income FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/4_education.csv'INTO TABLE education FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/5_affiliations.csv'INTO TABLE affiliation FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/6_social_view.csv'INTO TABLE socialView FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/7_user.csv'INTO TABLE user FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/isaacj/Desktop/social_profile_proj/dummy_data/8_personal_data.csv'INTO TABLE personalData FIELDS TERMINATED BY ',' IGNORE 1 LINES;
SELECT COUNT(*) AS total_entries_after_hs FROM homeStatus;
SELECT COUNT(*) AS total_entries_after_occ FROM occupation;
SELECT COUNT(*) AS total_entries_after_inc FROM income;
SELECT COUNT(*) AS total_entries_after_edu FROM education;
SELECT COUNT(*) AS total_entries_after_aff FROM affiliation;
SELECT COUNT(*) AS total_entries_after_sv FROM socialView;
SELECT COUNT(*) AS total_entries_after_usr FROM user;
SELECT COUNT(*) AS total_entries_after_pd FROM personalData;



