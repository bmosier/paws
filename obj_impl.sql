
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

-- function: current_month_adoption_count - Denis Roman
DROP FUNCTION IF EXISTS current_month_adoption_count;

DELIMITER $$
CREATE FUNCTION current_month_adoption_count(p_date DATETIME)
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
SELECT current_month_adoption_count(STR_TO_DATE('10-23-2020', '%m-%d-%Y'));

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
VALUES(177, 90, 100, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));
SELECT * FROM fosterhome_animal;

-- WILL GET ERROR HERE (AS EXPECTED):
INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(188, 91, 100, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));

SELECT * FROM fosterhome_animal;
-- DON'T FORGET TO RUN THIS AFTER THE PREVIOUS ERROR:
ROLLBACK;
SELECT * FROM fosterhome_animal;

-- 
-- End of object implementations assigned to: Denis Roman
-- 


