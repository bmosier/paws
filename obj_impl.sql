
-- 
-- Implementation of the following objects assigned to: Denis Roman
-- 

-- view: v_volunteer_contact - Denis Roman
DROP VIEW IF EXISTS v_volunteer_contact;
CREATE VIEW v_volunteer_contact AS
SELECT volunteer_id, volunteer_last_name, volunteer_first_name, volunteer_phone, volunteer_email
FROM volunteer;

SELECT * FROM volunteer;
SELECT * FROM v_volunteer_contact;

-- procedure: customer_contact_report - Denis Roman
DROP PROCEDURE IF EXISTS customer_contact_report;
DELIMITER $$
CREATE PROCEDURE customer_contact_report (IN start_date DATETIME, IN end_date DATETIME)
BEGIN
	SELECT customer_last_name, customer_first_name, customer_phone, adoption_date, animal.name AS animal_name,
	CASE WHEN wellness_check THEN 'yes' ELSE 'no' END AS had_wellness_check FROM (
		SELECT customer_last_name, customer_first_name, customer_phone, adoption_date, animal_ID
			FROM adoption INNER JOIN customer ON adoption.customer_ID = customer.customer_ID
			WHERE adoption_date >= start_date AND adoption_date <= end_date) as temp
		INNER JOIN animal ON temp.animal_ID = animal.animal_ID;
END$$
DELIMITER ;

SELECT * FROM adoption;
SELECT * FROM customer;
SELECT * FROM animal;
CALL customer_contact_report(STR_TO_DATE('10-23-2020', '%m-%d-%Y'), STR_TO_DATE('10-26-2020', '%m-%d-%Y'));

-- function: month_adoption_count - Denis Roman
DROP FUNCTION IF EXISTS month_adoption_count;

DELIMITER $$
CREATE FUNCTION month_adoption_count(p_date DATETIME)
	RETURNS INT
	READS SQL DATA
BEGIN
	DECLARE v_count INT DEFAULT 0;
    SELECT COUNT(*) FROM adoption
    WHERE YEAR(adoption_date) = YEAR(p_date) AND MONTH(adoption_date) = MONTH(p_date)
    INTO v_count;
	RETURN v_count;
END$$
DELIMITER ;

SELECT * FROM adoption;
SELECT count(*) FROM adoption WHERE YEAR(adoption_date) = YEAR(STR_TO_DATE('10-23-2020', '%m-%d-%Y')) AND MONTH(adoption_date) = MONTH(STR_TO_DATE('10-23-2020', '%m-%d-%Y'));
SELECT month_adoption_count(STR_TO_DATE('10-23-2020', '%m-%d-%Y'));

-- trigger: fosterhome_animal_BEFORE_INSERT - Denis Roman
DROP TRIGGER IF EXISTS fosterhome_animal_BEFORE_INSERT;

DELIMITER $$
CREATE TRIGGER fosterhome_animal_BEFORE_INSERT BEFORE INSERT ON fosterhome_animal FOR EACH ROW
BEGIN
	DECLARE v_current_count INT DEFAULT 0;
    DECLARE v_max_animals INT DEFAULT 0;
    SELECT COUNT(*) FROM fosterhome_animal WHERE foster_ID = NEW.foster_ID INTO v_current_count;
    SELECT max_animals FROM fosterhome WHERE foster_ID = NEW.foster_ID INTO v_max_animals;
    IF v_current_count + 1 > v_max_animals THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unable to exceed foster home max animals';
    END IF;
END$$
DELIMITER ;

-- trigger test
START TRANSACTION;
SELECT * FROM fosterhome;
SELECT * FROM fosterhome_animal;
INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(301, 90, 100, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));
SELECT * FROM fosterhome_animal;

-- WILL GET ERROR HERE (AS EXPECTED):
INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(302, 91, 100, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));

SELECT * FROM fosterhome_animal;
-- DON'T FORGET TO RUN THIS AFTER THE PREVIOUS ERROR:
ROLLBACK;
SELECT * FROM fosterhome_animal;

-- 
-- End of object implementations assigned to: Denis Roman
-- 
-- ______________________________________________________________________________________________________
-- 
-- Implementation of the following objects assigned to: Samuel James
--

-- VIEW: v_animal_info - Samuel James
DROP VIEW IF EXISTS v_animal_info;
CREATE VIEW v_volunteer_contact AS
SELECT a.animal_ID, a.name, a.animal_DOB, a.animal_species, a.animal_breed, 
    	a.animal_sex, a.animal_is_sterilized, a.animal_description, 
    	s.shelter_name as 'Shelter or Foster name', s.shelter_city as 'city', s.shelter_street as 'street', 
    	s.shelter_state as 'state', s.shelter_phone as 'phone', s.shelter_zip_code as 'zipcode'
FROM animal a, shelter s 
WHERE a.shelter_ID = s.shelter_ID 
AND a.animal_ID NOT IN 
(select adoption.animal_ID from adoption) 
UNION
SELECT animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, 
    	animal_is_sterilized, animal_description, volunteer_last_name, foster_city, 
    	foster_street, foster_state, foster_city, foster_zip_code
FROM fosterhome JOIN fosterhome_animal using(foster_ID) JOIN animal using (animal_ID) JOIN volunteer using(volunteer_ID)
WHERE is_fostered = TRUE
AND animal_ID NOT IN
(select adoption.animal_ID from adoption);
  
  -- procedure: staff_stats - Samuel James
DROP PROCEDURE IF EXISTS staff_stats;  
DELIMITER $$
CREATE PROCEDURE staff_stats(IN sheltername VARCHAR(50))
BEGIN
	select staff_first_name as "Firstname", staff_last_name as "LastName", staff_phone as 'phone', 
	staff_phone_ext as 'email or phone extension',
	shelter_name
	from staffmember s
	join staffmember_shelter sm using(staff_ID) 
	join shelter using(SHELTER_id) where shelter_name = sheltername
	UNION
	select volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_email,
	shelter_name
	from volunteer 
	join volunteer_shelter using(volunteer_ID) 
	join shelter using(SHELTER_id) where shelter_name = sheltername;
END$$
DELIMITER;

-- function: is_animal_available_today - Samuel James
DROP FUNCTION IF EXISTS current_month_adoption_count;
DELIMITER $$
FUNCTION `is_animal_available_today`(shelter_name VARCHAR(50)) 
	RETURNS tinyint(1)
  	READS SQL DATA
BEGIN
	DECLARE amount INT;
	SELECT count(*) into amount
	FROM v_animal_info
	WHERE animal_is_sterilized = 1
	AND Shelter_or_Foster_name = shelter_name
RETURN amount;
END$$
DELIMITER;

-- trigger: intake_BEFORE_INSERT - Samuel James
DROP TRIGGER IF EXISTS intake_BEFORE_INSERT;

DELIMITER $$
CREATE TRIGGER intake_BEFORE_INSERT BEFORE INSERT ON intake FOR EACH ROW
BEGIN
    DECLARE shelter_current_count INT DEFAULT 0;
    DECLARE shelter_max_animals INT DEFAULT 0;
    SELECT COUNT(*) FROM intake WHERE shelter_ID = NEW.shelter_ID 
    INTO shelter_current_count;
    SELECT max_animals FROM shelter 
    WHERE shelter_ID = NEW.shelter_ID INTO shelter_max_animals;
    IF shelter_current_count + 1 > shelter_max_animals THEN
 	SIGNAL SQLSTATE '75000' SET MESSAGE_TEXT = 'Unable to exceed shelter maximum capacity';
    END IF;
END$$
DELIMITER ;

-- trigger test
START TRANSACTION;
SELECT * FROM shelter;
SELECT * FROM intake;

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(103, 90, 9050016, 10, 6001, STR_TO_DATE('09-05-2018', '%m-%d-%Y'), 'Animal Control');

SELECT * FROM intake;							  
							  
-- WILL GET ERROR HERE (AS EXPECTED):						  
INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(555, 90, 9050016, 10, 6001, STR_TO_DATE('09-05-2018', '%m-%d-%Y'), 'Animal Control');
							 
SELECT * FROM intake;

-- RUN FOLLOWING THE ERROR:
ROLLBACK;
SELECT * FROM intake;

-- 
-- End of object implementations assigned to: Samuel James
-- 
-- ______________________________________________________________________________________________________
