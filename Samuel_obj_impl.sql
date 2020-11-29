
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
