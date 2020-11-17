DROP TABLE IF EXISTS staffmember;
DROP TABLE IF EXISTS shelter;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS fosterhome;
DROP TABLE IF EXISTS volunteer;
DROP TABLE IF EXISTS adoption;
DROP TABLE IF EXISTS intake;
DROP TABLE IF EXISTS fosterhome_animal;
DROP TABLE IF EXISTS volunteer_shelter;
DROP TABLE IF EXISTS staffmember_shelter;
-- animal
CREATE TABLE animal (
    animal_ID INT(7) NOT NULL,
    name VARCHAR(50) NOT NULL,
    intake_ID INT(7) NOT NULL,
    animal_DOB DATETIME NOT NULL,
    animal_species VARCHAR(50) NOT NULL,
    animal_breed VARCHAR(50) NOT NULL,
    animal_sex ENUM("M", "F") NOT NULL,
    animal_is_sterilized BOOL NOT NULL,
    animal_description MEDIUMTEXT NOT NULL,
    last_foster_home INT(7),
    shelter_ID INT,
    wellness_check BOOL,
    is_sheltered BOOL,
    PRIMARY KEY (animal_ID),
    FOREIGN KEY (last_foster_home) REFERENCES fosterhome (foster_ID),
    FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID)
);
-- adoption
CREATE TABLE adoption (
    adoption_ID INT(7) NOT NULL,
    animal_ID INT(7) NOT NULL,
    customer_ID INT(7) NOT NULL,
    staff_ID INT(7) NOT NULL,
    adoption_date DATETIME NOT NULL,
    PRIMARY KEY (adoption_ID),
    FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID),
    FOREIGN KEY (customer_ID) REFERENCES customer (customer_ID),
    FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID)
);
-- fosterhome_animal
CREATE TABLE fosterhome_animal (
    foster_animal_ID INT(7) NOT NULL,
    animal_ID INT(7) NOT NULL,
    foster_ID INT(7) NOT NULL,
    foster_date DATETIME NOT NULL,
    PRIMARY KEY (foster_animal_ID),
    FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID),
    FOREIGN KEY (foster_ID) REFERENCES fosterhome (foster_ID)
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
    PRIMARY KEY (foster_ID),
    FOREIGN KEY (volunteer_ID) REFERENCES volunteer (volunteer_ID)
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
    PRIMARY KEY (volunteer_ID, shelter_ID),
    FOREIGN KEY (volunteer_ID) REFERENCES volunteer (volunteer_ID),
    FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID)
);

-- staffmember_shelter
CREATE TABLE staffmember_shelter (
    staffmember_ID INT NOT NULL,
    shelter_ID INT NOT NULL,
    PRIMARY KEY (staffmember_ID, shelter_ID),
    FOREIGN KEY (staffmember_ID) REFERENCES staffmember (staffmember_ID),
    FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID)
);


-- staffmember
CREATE TABLE staffmember (
    staffmember_ID INT NOT NULL,
    PRIMARY KEY (staffmember_ID),
    staff_first_name VARCHAR(50) NOT NULL, 
    staff_last_name VARCHAR(50) NOT NULL,
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
    max_animals INT NOT NULL,
    PRIMARY KEY (shelter_ID)
);

-- intake
CREATE TABLE intake (
    intake_ID INT NOT NULL,
    animal_ID INT NOT NULL,
    customer_ID INT NOT NULL, -- maybe allow null?
    staff_ID INT NOT NULL,
    intake_date DATETIME NOT NULL,
   --  intake_type VARCHAR -- surrendered, stray, baby!
    PRIMARY KEY (intake_ID),
    FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID),
    FOREIGN KEY (customer_ID) REFERENCES customer (customer_ID),
    FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID)
);





-- Constraints:
--animal
PRIMARY KEY (animal_ID),
FOREIGN KEY (intake_ID) REFERENCES intake (intake_ID),
FOREIGN KEY (last_foster_home) REFERENCES fosterhome (foster_ID),
FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID)

--customer
    PRIMARY KEY (customer_ID)

--volunteer
    PRIMARY KEY (volunteer_ID)

--staff member
    PRIMARY KEY (staffmember_ID)

--shelter
    PRIMARY KEY (shelter_ID)

--adoption
PRIMARY KEY (adoption_ID),
FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID),
FOREIGN KEY (customer_ID) REFERENCES customer (customer_ID),
FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID)

--intake
PRIMARY KEY (intake_ID),
        FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID),
        FOREIGN KEY (customer_ID) REFERENCES customer (customer_ID)
       FOREIGN KEY (staff_ID) REFERENCES staffmember (staff_ID)

--fosterhome_animal
PRIMARY KEY (foster_animal_ID),
FOREIGN KEY (animal_ID) REFERENCES animal (animal_ID)
        FOREIGN KEY (foster_ID) REFERENCES fosterhome (foster_ID)

--fosterhome
    PRIMARY KEY (foster_ID),
    FOREIGN KEY (volunteer_ID) REFERENCES volunteer (volunteer_ID)

--volunteer_shelter
    FOREIGN KEY (volunteer_ID) REFERENCES volunteer (volunteer_ID)
        FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID)

--staffmember_shelter
PRIMARY KEY (staffmember_ID, shelter_ID),
        FOREIGN KEY (staffmember_ID) REFERENCES staffmember   (staffmember_ID),
        FOREIGN KEY (shelter_ID) REFERENCES shelter (shelter_ID)
