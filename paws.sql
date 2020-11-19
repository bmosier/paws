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
    animal_ID INT(7) NOT NULL,
    name VARCHAR(50) NOT NULL,
    animal_DOB DATETIME NOT NULL,
    animal_species VARCHAR(50) NOT NULL,
    animal_breed VARCHAR(50) NOT NULL,
    animal_sex ENUM("M", "F") NOT NULL,
    animal_is_sterilized BOOL NOT NULL,
    animal_description MEDIUMTEXT NOT NULL,
    last_foster_home INT(7),
    shelter_ID INT,
    wellness_check BOOL,
    is_fostered BOOL,
    PRIMARY KEY (animal_ID)
);

-- adoption
CREATE TABLE adoption (
    adoption_ID INT(7) NOT NULL,
    animal_ID INT(7) NOT NULL,
    customer_ID INT(7) NOT NULL,
    staff_ID INT(7) NOT NULL,
    adoption_date DATETIME NOT NULL,
    PRIMARY KEY (adoption_ID)
);

-- fosterhome_animal
CREATE TABLE fosterhome_animal (
    foster_animal_ID INT(7) NOT NULL,
    animal_ID INT(7) NOT NULL,
    foster_ID INT(7) NOT NULL,
    foster_date DATETIME NOT NULL,
    PRIMARY KEY (foster_animal_ID)
);

-- customer
CREATE TABLE customer (
    customer_ID INT NOT NULL,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_phone_ext INT(4) NOT NULL,
    customer_phone INT(10) NOT NULL,
    customer_street VARCHAR(50) NOT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state CHAR(2) NOT NULL,
    customer_zip_code INT(5) NOT NULL,
    Last_contacted DATE NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_ID)
);

-- fosterhome
CREATE TABLE fosterhome (
    foster_ID INT NOT NULL,
    volunteer_ID INT NOT NULL,
    fosterhome_phone_ext INT(4) NOT NULL,
    foster_phone INT(10) NOT NULL,
    foster_street VARCHAR(50) NOT NULL,
    foster_city VARCHAR(50) NOT NULL,
    foster_state CHAR(2) NOT NULL,
    foster_zip_code INT(5) NOT NULL,
    max_animals INT(10) NOT NULL,
    PRIMARY KEY (foster_ID)
);

-- volunteer
CREATE TABLE volunteer (
    volunteer_ID INT(7) NOT NULL,
    volunteer_first_name VARCHAR(50) NOT NULL,
    volunteer_last_name VARCHAR(50) NOT NULL,
    volunteer_phone_ext INT(4) NOT NULL,
    volunteer_phone INT(10) NOT NULL,
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
    staff_ID INT NOT NULL,
    PRIMARY KEY (staff_ID),
    staff_first_name VARCHAR(50) NOT NULL, 
    staff_last_name VARCHAR(50) NOT NULL,
    staff_phone_ext INT, -- added phone ext only for staff 
    staff_phone INT NOT NULL, 
    staff_street VARCHAR(50) NOT NULL, 
    staff_city VARCHAR(50) NOT NULL, 
    staff_state VARCHAR(50) NOT NULL,
    staff_zipcode INT NOT NULL, 
    is_admin BOOL NOT NULL
);

-- shelter
CREATE TABLE shelter (
    shelter_ID INT NOT NULL,
    shelter_name VARCHAR(50) NOT NULL,
    shelter_phone INT NOT NULL,
    shelter_street VARCHAR(50) NOT NULL,
    shelter_city VARCHAR(50) NOT NULL,
    shelter_state VARCHAR(50) NOT NULL,
    shelter_zip_code INT NOT NULL,
    max_animals INT NOT NULL,
    PRIMARY KEY (shelter_ID)
);

-- intake
CREATE TABLE intake (
    intake_ID INT NOT NULL,
    animal_ID INT NOT NULL,
    customer_ID INT NOT NULL, 
    staff_ID INT NOT NULL,
    shelter_ID INT NOT NULL, -- should we add fosterhome_ID as a FK as well?
    intake_date DATETIME NOT NULL,
    intake_type VARCHAR(255) NOT NULL, -- added type of intake 
    PRIMARY KEY (intake_ID)
);

-- Constraints
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
ALTER TABLE intake ADD CONSTRAINT FK_intake_shelter_ID --added shelter ID constraint
FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID);
