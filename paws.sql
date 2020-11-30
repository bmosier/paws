-- ------------------------------------------------------------- --
-- ---------------------CREATE TABLES--------------------------- --
-- ------------------------------------------------------------- --
-- table drops
DROP TABLE IF EXISTS fosterhome_animal;
DROP TABLE IF EXISTS volunteer_shelter;
DROP TABLE IF EXISTS adoption;
DROP TABLE IF EXISTS intake;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS fosterhome;
DROP TABLE IF EXISTS volunteer;
DROP TABLE IF EXISTS staffmember_shelter;
DROP TABLE IF EXISTS shelter;
DROP TABLE IF EXISTS staffmember;

-- table definitions
-- animal
CREATE TABLE animal (
    animal_ID INT(7) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    animal_DOB DATE NOT NULL,
    animal_species VARCHAR(50) NOT NULL,
    animal_breed VARCHAR(50) NOT NULL,
    animal_sex ENUM("M", "F") NOT NULL,
    animal_is_sterilized BOOL NOT NULL,
    animal_description MEDIUMTEXT NOT NULL,
    shelter_ID INT,
    wellness_check BOOL,
    is_fostered BOOL,
    is_sheltered BOOL,
    PRIMARY KEY (animal_ID)
);

-- adoption
CREATE TABLE adoption (
    adoption_ID INT(7) NOT NULL AUTO_INCREMENT,
    animal_ID INT(7) NOT NULL,
    customer_ID INT(7) NOT NULL,
    staff_ID INT(7) NOT NULL,
    adoption_date DATE NOT NULL,
    PRIMARY KEY (adoption_ID)
);

-- fosterhome_animal
CREATE TABLE fosterhome_animal (
    foster_animal_ID INT(7) NOT NULL AUTO_INCREMENT,
    animal_ID INT(7) NOT NULL,
    foster_ID INT(7) NOT NULL,
    foster_date DATE NOT NULL,
    PRIMARY KEY (foster_animal_ID)
);

-- customer
CREATE TABLE customer (
    customer_ID INT NOT NULL AUTO_INCREMENT,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_phone BIGINT(10) NOT NULL,
    customer_street VARCHAR(50) NOT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state CHAR(2) NOT NULL,
    customer_zip_code INT(5) NOT NULL,
    Last_contacted DATE NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    register_date DATE NOT NULL,
    PRIMARY KEY (customer_ID)
);

-- fosterhome
CREATE TABLE fosterhome (
    foster_ID INT NOT NULL AUTO_INCREMENT,
    volunteer_ID INT NOT NULL,
    foster_phone BIGINT(10) NOT NULL,
    foster_street VARCHAR(50) NOT NULL,
    foster_city VARCHAR(50) NOT NULL,
    foster_state CHAR(2) NOT NULL,
    foster_zip_code INT(5) NOT NULL,
    max_animals INT(10) NOT NULL,
    PRIMARY KEY (foster_ID)
);

-- volunteer
CREATE TABLE volunteer (
    volunteer_ID INT(7) NOT NULL AUTO_INCREMENT,
    volunteer_first_name VARCHAR(50) NOT NULL,
    volunteer_last_name VARCHAR(50) NOT NULL,
    volunteer_phone BIGINT(10) NOT NULL,
    volunteer_street VARCHAR(50) NOT NULL,
    volunteer_city VARCHAR(50) NOT NULL,
    volunteer_state CHAR(2) NOT NULL,
    volunteer_zip_code INT(5),
    volunteer_email VARCHAR(255),
    PRIMARY KEY (volunteer_ID)
);

-- volunteer_shelter
CREATE TABLE volunteer_shelter (
    volunteer_ID INT(7) NOT NULL,
    shelter_ID INT(7) NOT NULL,
    PRIMARY KEY (volunteer_ID, shelter_ID)
);

-- staffmember_shelter
CREATE TABLE staffmember_shelter (
    staff_ID INT NOT NULL,
    shelter_ID INT NOT NULL,
    PRIMARY KEY (staff_ID, shelter_ID)
);

-- staffmember
CREATE TABLE staffmember (
    staff_ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (staff_ID),
    staff_first_name VARCHAR(50) NOT NULL, 
    staff_last_name VARCHAR(50) NOT NULL,
    staff_phone_ext INT, -- added phone ext only for staff 
    staff_phone BIGINT(10) NOT NULL, 
    staff_street VARCHAR(50) NOT NULL, 
    staff_city VARCHAR(50) NOT NULL, 
    staff_state CHAR(2) NOT NULL,
    staff_zipcode INT NOT NULL, 
    is_admin BOOL NOT NULL
);

-- shelter
CREATE TABLE shelter (
    shelter_ID INT NOT NULL AUTO_INCREMENT,
    shelter_name VARCHAR(50) NOT NULL,
    shelter_phone BIGINT(10) NOT NULL,
    shelter_street VARCHAR(50) NOT NULL,
    shelter_city VARCHAR(50) NOT NULL,
    shelter_state CHAR(2) NOT NULL,
    shelter_zip_code INT NOT NULL,
    max_animals INT NOT NULL,
    PRIMARY KEY (shelter_ID)
);

-- intake
CREATE TABLE intake (
    intake_ID INT NOT NULL AUTO_INCREMENT,
    animal_ID INT NOT NULL,
    customer_ID INT NOT NULL, 
    staff_ID INT NOT NULL,
    shelter_ID INT NOT NULL, -- should we add fosterhome_ID as a FK as well?
    intake_date DATE NOT NULL,
    intake_type VARCHAR(255) NOT NULL, -- added type of intake 
    PRIMARY KEY (intake_ID)
);

-- ------------------------------------------------------------- --
-- --------------------CONSTRAINTS------------------------------ --
-- ------------------------------------------------------------- --
-- animal
ALTER TABLE animal ADD CONSTRAINT FK_animal_shelter_ID
FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID);

-- adoption
ALTER TABLE adoption ADD CONSTRAINT FK_adoption_animal_ID
FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID);
ALTER TABLE adoption ADD CONSTRAINT FK_adoption_customer_ID
FOREIGN KEY (customer_ID) REFERENCES customer (customer_ID);
ALTER TABLE adoption ADD CONSTRAINT FK_adoption_staff_ID
FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID);

-- fosterhome_animal
ALTER TABLE fosterhome_animal ADD CONSTRAINT FK_fosterhome_animal_animal_ID
FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID);
ALTER TABLE fosterhome_animal ADD CONSTRAINT FK_fosterhome_animal_foster_ID
FOREIGN KEY (foster_ID) REFERENCES fosterhome (foster_ID);

-- customer
-- N/A

-- fosterhome
ALTER TABLE fosterhome ADD CONSTRAINT FK_fosterhome_volunteer_ID
FOREIGN KEY (volunteer_ID) REFERENCES volunteer (volunteer_ID);

-- volunteer
-- N/A

-- volunteer_shelter
ALTER TABLE volunteer_shelter ADD CONSTRAINT FK_volunteer_shelter_volunteer_ID
FOREIGN KEY (volunteer_ID) REFERENCES volunteer (volunteer_ID);
ALTER TABLE volunteer_shelter ADD CONSTRAINT FK_volunteer_shelter_shelter_ID
FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID);

-- staffmember_shelter
ALTER TABLE staffmember_shelter ADD CONSTRAINT FK_staffmember_shelter_staff_ID
FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID);
ALTER TABLE staffmember_shelter ADD CONSTRAINT FK_staffmember_shelter_shelter_ID
FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID);

-- staffmember
-- N/A

-- shelter
-- N/A

-- intake
ALTER TABLE intake ADD CONSTRAINT FK_intake_animal_ID
FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID);
ALTER TABLE intake ADD CONSTRAINT FK_intake_customer_ID
FOREIGN KEY (customer_ID) REFERENCES customer (customer_ID);
ALTER TABLE intake ADD CONSTRAINT FK_intake_staff_ID
FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID);
ALTER TABLE intake ADD CONSTRAINT FK_intake_shelter_ID -- added shelter ID constraint
FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID);

-- ------------------------------------------------------------- --
-- --------------------INSERTS------------------------------ --
-- ------------------------------------------------------------- --

-- ---------------------INSERT staffmember--------------------------- --
INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050001,'Elizabeth', 'Wright', 1, 5415550115,'218 Lincoln Dr.','Medford','OR',97504,TRUE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050002,'Paul', 'Westbrook', 2, 5415550124,'50 Linden St.','Medford','OR',97501,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050003,'Larry', 'Smith', 3, 5415550146,'29338 Main St.','Phoenix','OR',97535,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050004,'Alison', 'Baker', 4, 5415550108,'34 Circle St.','Ashland','OR',97520,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050012,'Carl', 'Turner', 5, 5415550111,'789 Round Rd.','Medford','OR',97504,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050014,'Sally', 'Miller', 6, 5415550132,'7462 Marlborough Ave.','Ashland','OR',97520,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050016,'James', 'Brown', 7, 5305550124,'545 Armstrong Court','Grants Pass','OR',97527,TRUE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050017,'Jason', 'Sanchez', 8, 6075550146,'8590 Williams St.','Roseburg','OR',97470,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050018,'Ash', 'Flores', 9, 5015550108,'18 Henry Smith Rd.','Jacksonville','OR',97530,FALSE);

INSERT INTO staffmember (staff_ID, staff_first_name, staff_last_name, staff_phone_ext, staff_phone, staff_street, staff_city, staff_state, staff_zipcode, is_admin) 
VALUES (9050019,'Stewart', 'Reed', 10, 9075550111,'103 Bridge Lane','Talent','OR',97540,FALSE);


-- ---------------------INSERT shelter--------------------------- --
INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (1,'Happy Cats Animal Shelter', 5049999999,' 1234 Apple St.','Medford','OR',97504,60);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (2,'Medford Animal Shelter', 6552426709,' 2334 Ribbon St.','Medford','OR',97504,60);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (3,'Southern Oregon Animal Rescue', 5551234567,' 3334 New Ave','Medford','OR',97501,120);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (4,'Oregon Animal Sanctuary', 2099998888,' 7654 Main St.','Grants Pass','OR',97527,40);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (5,'Pets R Us', 9095555555,' 3943 Jefferson St.','Jacksonville','OR',97530,15);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (6,'Animal Savers', 6761448131,' 1235 Ant St.','Jacksonville','OR',97530,10);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (7,'Petcompany', 7125316460,' 2335 Dog St.','Jacksonville','OR',97530,10);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (8,'Animals INC', 7489184789,' 3335 Cat Ave','Jacksonville','OR',97530,25);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (9,'We Help Shelter', 7853053118,' 7777 lucky Dr.','Grants Pass','OR',97527,30);

INSERT INTO shelter (shelter_ID, shelter_name, shelter_phone, shelter_street, shelter_city, shelter_state, shelter_zip_code, max_animals) 
VALUES (10,'Cats the shelter', 8216921447,' 1234 John St.','Grants Pass','OR',97527,5);


-- ---------------------INSERT staffmember_shelter--------------------------- --
INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050001, 1);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050002, 2);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050003, 3);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050004, 4);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050012, 5);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050014, 6);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050016, 7);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050017, 8);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050018, 9);

INSERT INTO staffmember_shelter (staff_ID, shelter_ID)
VALUES(9050019, 10);


-- ---------------------INSERT volunteer--------------------------- --
INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (34,'Barry','White',5411111234,'123 Circle St.','Medford','OR',97504, 'whiteb@workemail.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (35,'Roy','Barber',5411111235,'124 Circle St.','Medford','OR',97504,'catdog22@netservice.net');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (36, 'Deborah','Randolph',5411111236	,'321 Square St.','Medford'	,'OR',97504,'birdluvr@birds.org');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (37, 'Clifford', 'Hubbard'	,5411111237	,'859 5th St.','Medford','OR',97504,'sasquatch88@outlook.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (38, 'Daniel', 'Smith', 5411111238, '3458 6th St.', 'Medford', 'OR', 97504, 'funfunfun@email.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (39,'Rob', 'John', 5411111239, '125 Circle St.', 'Medford', 'OR', 97504, 'thatis@email.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (40,'Garland', 'Jimson', 5411111240, '126 Circle St.', 'Medford', 'OR', 97504, 'whoiswhat@yahoo.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (41, 'Ruth', 'Lund', 5411111241, '127 Circle St.', 'Medford', 'OR', 97504,  'Goaway@email.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES ('42','Beth', 'Rund', '5411111242', '128 Circle St.', 'Medford', 'OR', '97504', 'goawayfromme@email.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (43, 'Fritz', 'Fern', 5411111243, '129 Circle St.', 'Medford', 'OR', 97504, 'runmf@email.com');


-- ---------------------INSERT fosterhome--------------------------- -- 
INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (100, 34, 8675309, '123 Circle St.', 'Medford', 'OR', 97504, 2);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (200, 35, 8675311, '124 Circle St.', 'Medford', 'OR', 97504, 4);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (300, 36, 8675312, '321 Square St.', 'Medford', 'OR', 97504, 5);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (400, 37, 8675313, '859 5th St.', 'Medford', 'OR', 97504, 2);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (500, 38, 8675314, '3458 6th St.', 'Medford', 'OR', 97504, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (600, 39, 8675315, '1234 Fun St.', 'Grants Pass', 'OR', 97526, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (700, 40, 8675316, '1111 SW M St.', 'Grants Pass', 'OR', 97526, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (800, 41, 8675317, '5555 Five St.', 'Grants Pass', 'OR', 97526, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (900, 42, 8675318, '4568 NW N St.', 'Ashland', 'OR', 97502, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (999, 43, 8675319, '7777 Seven St.', 'Ashland', 'OR', 97502, 6);


-- ---------------------INSERT animal--------------------------- -- 
INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (100, 'snek', STR_TO_DATE('06-09-2020', '%m-%d-%Y'), 'Dog', 'Pitbull', 'M', TRUE, '100 lb brown and white pitbull, calm, fun', null, TRUE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (101, 'Buddy', STR_TO_DATE('06-10-2020', '%m-%d-%Y'), 'Cat', 'Maine Coon', 'F', FALSE, '15 lbs brown and black, tempermental, cuddly', null, TRUE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (102, 'Squeeker', STR_TO_DATE('06-11-2020', '%m-%d-%Y'), 'Dog', 'German Shepard', 'F', TRUE, '75 lbs, playful, working dog, food aggressive', null, TRUE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (103, 'Whiskers',STR_TO_DATE('06-12-2020', '%m-%d-%Y') , 'Cat', 'Tuxedo', 'M', TRUE, '12 lbs, energetic', null, TRUE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (104, 'Carrot', STR_TO_DATE('06-13-2020', '%m-%d-%Y'), 'Cat', 'Tuxedo', 'M', TRUE, '13 lbs, energetic', 5, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (105, 'Ridley', STR_TO_DATE('06-14-2020', '%m-%d-%Y'), 'Snake', 'Gardner', 'M', TRUE, '3 lbs fun and shy green ', 6, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (106, 'Orion', STR_TO_DATE('06-15-2020', '%m-%d-%Y'), 'Snake', 'Gardner', 'F', TRUE, '6 lbs, shy, lazy, dark green', 7, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (107, 'Bobo', STR_TO_DATE('06-16-2020', '%m-%d-%Y'), 'Dog', 'Labrador', 'F', TRUE, 'Fun loving, Black fur', 8, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (108, 'Kicker', STR_TO_DATE('06-17-2020', '%m-%d-%Y'), 'Cat', 'Maine Coon', 'F', TRUE, '10 lbs brown and black, aggressive', 9, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (109, 'Ron', STR_TO_DATE('06-18-2020', '%m-%d-%Y'), 'Dog', 'Golden Retriever', 'M', TRUE, '60 lbs, playful, blonde, gentle but excited', 10, TRUE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (90, 'Larry', STR_TO_DATE('05-15-2006', '%m-%d-%Y'), 'Dog', 'Daschund', 'M', TRUE, '10 lbs, shy, all white and very quite', 10, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (91, 'Sammy', STR_TO_DATE('06-15-2006', '%m-%d-%Y'), 'Dog', 'Great Dane', 'M', TRUE, '100 lbs brown and white', 10, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (92, 'Bobby', STR_TO_DATE('07-15-2006', '%m-%d-%Y'), 'Dog', 'Black Labrador', 'F', TRUE, '45 lbs black, enthusiastic, cuddly', 10, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (93, 'Franky', STR_TO_DATE('08-15-2006', '%m-%d-%Y'), 'Dog', 'Pitbull', 'M', TRUE, '50 lbs lazy and territorial', 1, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (94, 'Lewy', STR_TO_DATE('09-15-2006', '%m-%d-%Y'), 'Dog', 'Australian Shepard', 'F', TRUE, 'small excited and enthusiastic 40 lbs', 1, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (95, 'Dewy', STR_TO_DATE('10-15-2006', '%m-%d-%Y'), 'Cat', 'Maine Coon', 'M', TRUE, '25 lbs timid and vocal', 2, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (96, 'Phillip', STR_TO_DATE('11-15-2006', '%m-%d-%Y'), 'Cat', 'Siamese', 'M', TRUE, '15 lbs friendly and fun', 2, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (97, 'Harry', STR_TO_DATE('12-15-2006', '%m-%d-%Y'), 'Cat', 'Calico', 'F', TRUE, '10 lbs black and white very energetic', 3, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (98, 'Barry', STR_TO_DATE('01-15-2007', '%m-%d-%Y'), 'Cat', 'Tabby', 'F', TRUE, '30 lbs overweight lethargic may require extra care', 4, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (99, 'Carrie', STR_TO_DATE('02-15-2007', '%m-%d-%Y'), 'Cat', 'Siamese', 'M', TRUE, '10 lbs fun and cuddly hairless', 7, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (110, 'Beardy', STR_TO_DATE('01-13-13', '%m-%d-%Y'), 'Cat', 'Tabby', 'M', FALSE, '13 lbs Orange and timid', null, FALSE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (111, 'Grumpy', STR_TO_DATE('02-14-13', '%m-%d-%Y'), 'Cat', 'Tabby', 'M', TRUE, '10 lbs aggressive and territorial black and orange', null, FALSE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (112, 'Lazy', STR_TO_DATE('03-18-13', '%m-%d-%Y'), 'Dog', 'Daschund', 'F', TRUE, 'Small black and brown 15 lbs and fun', null, FALSE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (113, 'Scooby', STR_TO_DATE('04-19-13', '%m-%d-%Y'), 'Dog', 'Great Dane', 'M', TRUE, 'Large 90 lbs, talks really strange, also who knew dogs could talk? RUH-ROH', null, FALSE, TRUE, FALSE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (114, 'Shaggy', STR_TO_DATE('05-21-13', '%m-%d-%Y'), 'Dog', 'Puli', 'F', TRUE, '45 lbs looks like a mop, fun and cuddly', null, FALSE, TRUE, FALSE);


-- ---------------------INSERT customer--------------------------- -- 
INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6001, 'Xavier', 'Nolan', 5418881591, '123 Main St.', 'Medford', 'OR', 97504, STR_TO_DATE('04-01-2015', '%m-%d-%Y'), 'Xn@email.com', STR_TO_DATE('11-11-2010', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6002, 'Jordan', 'House', 5418881592, '321 A St.', 'Medford', 'OR', 97504, STR_TO_DATE('04-02-2015', '%m-%d-%Y'), 'ZFS@gmail.com', STR_TO_DATE('12-11-2010', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6003, 'Alex', 'Maddox', 5418881593, '465 B St.', 'Medford', 'OR', 97504, STR_TO_DATE('01-11-2011', '%m-%d-%Y'), 'what@email.com', STR_TO_DATE('01-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6004, 'Bob', 'Maynard', 5418881594, '675 C St.', 'Medford', 'OR', 97504, STR_TO_DATE('02-11-2011', '%m-%d-%Y'), 'who@yahoo.com', STR_TO_DATE('02-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6005, 'Kevin', 'Chan', 5418881595, '999 Cat St.', 'Medford', 'OR', 97504, STR_TO_DATE('03-11-2011', '%m-%d-%Y'), 'budmdum@gmail.com', STR_TO_DATE('03-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6006, 'John', 'Jones', 5418881596, '123 Dog St.', 'Medford', 'OR', 97504, STR_TO_DATE('04-11-2011', '%m-%d-%Y'), 'fightme@yahoo.com', STR_TO_DATE('04-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6007, 'Jane', 'Acosta', 5418881597, '555 L St', 'Medford', 'OR', 97504, STR_TO_DATE('05-11-2011', '%m-%d-%Y'), 'noneofyall@hotmail.com', STR_TO_DATE('05-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6008, 'Jonathon', 'Chapman', 5418881598, '999 Main St', 'Medford', 'OR', 97504, STR_TO_DATE('06-11-2011', '%m-%d-%Y'), 'this@gmail.com', STR_TO_DATE('06-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6009, 'Jarrett', 'Mendoza', 5418881599, '101 Jack St.', 'Medford', 'OR', 97504, STR_TO_DATE('07-11-2010', '%m-%d-%Y'), 'that@email.com', STR_TO_DATE('07-11-2011', '%m-%d-%Y'));

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email, register_date)
VALUES(6010, 'Graham', 'Sherman', 5418881600, '800 NW Q St.', 'Medford', 'OR', 97504, STR_TO_DATE('08-11-2020', '%m-%d-%Y'), 'runaway@email.com', STR_TO_DATE('08-11-2011', '%m-%d-%Y'));


-- ---------------------INSERT intake--------------------------- -- 
INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8000, 100, 9050012, 5, 6001, STR_TO_DATE('06-08-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8001, 101, 9050012, 5, 6001, STR_TO_DATE('06-10-2020', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8002, 102, 9050003, 3, 6002, STR_TO_DATE('06-11-2020', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8003, 103, 9050003, 3, 6003, STR_TO_DATE('10-22-2020', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8004, 104, 9050012, 5, 6004, STR_TO_DATE('10-21-2020', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8005, 105, 9050014, 6, 6005, STR_TO_DATE('09-05-2020', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8006, 106, 9050016, 7, 6006, STR_TO_DATE('06-08-2018', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8007, 107, 9050017, 8, 6007, STR_TO_DATE('07-25-2020', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8008, 108, 9050018, 9, 6008, STR_TO_DATE('10-22-2020', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8009, 109, 9050019, 10, 6009, STR_TO_DATE('06-18-2020', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7000, 90, 9050019, 10, 6001, STR_TO_DATE('09-05-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7001, 91, 9050019, 10, 6002, STR_TO_DATE('09-05-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7002, 92, 9050019, 10, 6003, STR_TO_DATE('07-15-2006', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7003, 93, 9050001, 1, 6003, STR_TO_DATE('09-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7004, 94, 9050001, 1, 6007, STR_TO_DATE('08-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7005, 95, 9050002, 2, 6003, STR_TO_DATE('08-01-2018', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7006, 96, 9050002, 2, 6004, STR_TO_DATE('07-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7007, 97, 9050003, 3, 6003, STR_TO_DATE('12-15-2006', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7008, 98, 9050004, 4, 6003, STR_TO_DATE('03-08-2010', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7009, 99, 9050016, 7, 6003, STR_TO_DATE('02-15-2007', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7010, 110, 9050017, 8, 6001, STR_TO_DATE('12-12-2013', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7011, 111, 9050003, 3, 6004, STR_TO_DATE('12-13-2013', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7012, 112, 9050003, 3, 6001, STR_TO_DATE('12-14-2013', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7013, 113, 9050003, 3, 6001, STR_TO_DATE('04-19-2013', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7014, 114, 9050003, 3, 6001, STR_TO_DATE('12-16-2013', '%m-%d-%Y'), 'Animal Control');


-- ---------------------INSERT adoption--------------------------- -- 
INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (3, 90, 6005, 9050001, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (6, 91, 6005, 9050002, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (8, 92, 6005, 9050003, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (9, 93, 6005, 9050003, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (31, 94, 6005, 9050003, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (32, 95, 6006, 9050003, STR_TO_DATE('10-23-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (30, 96, 6007, 9050016, STR_TO_DATE('10-24-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (33, 97, 6008, 9050017, STR_TO_DATE('10-25-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (34, 98, 6009, 9050017, STR_TO_DATE('10-26-2020', '%m-%d-%Y'));

INSERT INTO adoption (adoption_ID, animal_ID, customer_ID, staff_ID, adoption_date)
VALUES (35, 99, 6010, 9050017, STR_TO_DATE('10-27-2020', '%m-%d-%Y'));


-- ---------------------INSERT volunteer_shelter--------------------------- -- 
INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (34, 3);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (35, 3);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (36, 2);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (37, 1);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (38, 4);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (39, 5);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (40, 5);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (41, 3);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (42, 2);

INSERT INTO volunteer_shelter (volunteer_ID, shelter_ID)
VALUES (43, 3);


-- ---------------------INSERT fosterhome_animal--------------------------- --  
INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(122, 100, 100, STR_TO_DATE('05-09-2019', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(133, 101, 200, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(144, 102, 300, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(155, 103, 400, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(166, 109, 700, STR_TO_DATE('11-01-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(170, 110, 700, STR_TO_DATE('11-02-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(177, 111, 600, STR_TO_DATE('11-02-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(188, 112, 700, STR_TO_DATE('11-03-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(199, 113, 800, STR_TO_DATE('11-04-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(210, 114, 999, STR_TO_DATE('11-05-2020', '%m-%d-%Y'));


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

-- 
-- End of object implementations assigned to: Samuel James
-- 
-- ______________________________________________________________________________________________________
