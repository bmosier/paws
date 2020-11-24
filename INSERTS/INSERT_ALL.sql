-- INSERT_staffmember
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


-- INSERT_shelter
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


-- INSERT_staffmember_shelter
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


-- INSERT_volunteer
INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (34,'Barry','White',5411111234,'123 Circle St.','Medford','OR',97504, 'whiteb@workemail.com');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (35,'Roy','Barber',5411111235,'124 Circle St.','Medford','OR',97504,'catdog22@netservice.net');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (36, 'Deborah','Randolph',5411111236	,'321 Square St.'	,'Medford'	,'OR',97504,'birdluvr@birds.org');

INSERT INTO volunteer (volunteer_ID, volunteer_first_name, volunteer_last_name, volunteer_phone, volunteer_street, volunteer_city, volunteer_state, volunteer_zip_code, volunteer_email)
VALUES (37, 'Clifford', 'Hubbard'	,5411111237	,'859 5th St.'	,'Medford','OR',97504,'sasquatch88@outlook.com');

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


-- INSERT_fosterhome
INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (100, 34, 8675309, '123 Circle St.', 'Medford', 'Oregon', 97504, 2);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (200, 35, 8675311, '124 Circle St.', 'Medford', 'Oregon', 97504, 4);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (300, 36, 8675312, '321 Square St.', 'Medford', 'Oregon', 97504, 5);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (400, 37, 8675313, '859 5th St.', 'Medford', 'Oregon', 97504, 2);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (500, 38, 8675314, '3458 6th St.', 'Medford', 'Oregon', 97504, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (600, 39, 8675315, '1234 Fun St.', 'Grants Pass', 'Oregon', 97526, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (700, 40, 8675316, '1111 SW M St.', 'Grants Pass', 'Oregon', 97526, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (800, 41, 8675317, '5555 Five St.', 'Grants Pass', 'Oregon', 97526, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (900, 42, 8675318, '4568 NW N St.', 'Ashland', 'Oregon', 97502, 6);

INSERT INTO fosterhome (foster_ID, volunteer_ID, foster_phone, foster_street, foster_city, foster_state, foster_zip_code, max_animals)
VALUES (999, 43, 8675319, '7777 Seven St.', 'Ashland', 'Oregon', 97502, 6);


-- INSERT_animal
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
VALUES (109, 'Ron', STR_TO_DATE('06-18-2020', '%m-%d-%Y'), 'Lizard', 'Iguana', 'M', TRUE, '2lbs green and dark green, excited and fun', 10, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (90, 'Larry', STR_TO_DATE('05-15-2006', '%m-%d-%Y'), 'Lizard', 'Salamander', 'M', TRUE, '.5 OZ green', 3, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (91, 'Sammy', STR_TO_DATE('06-15-2006', '%m-%d-%Y'), 'Dog', 'Great Dane', 'M', TRUE, 'lbs brown and white', 4, TRUE, FALSE, TRUE);

INSERT INTO animal (animal_ID, name, animal_DOB, animal_species, animal_breed, animal_sex, animal_is_sterilized, animal_description, shelter_ID, wellness_check, is_fostered, is_sheltered)
VALUES (92, 'Bobby', STR_TO_DATE('07-15-2006', '%m-%d-%Y'), 'Dog', 'Black Labrador', 'F', TRUE, '45 lbs black, enthusiastic, cuddly', 5, TRUE, FALSE, TRUE);

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


-- INSERT_customer
-- STR_TO_DATE('06-10-2020', '%m-%d-%Y')
INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6001, 'Xavier', 'Nolan', 5418881591, '123 Main St.', 'Medford', 'OR', 97504, STR_TO_DATE('04-01-2015', '%m-%d-%Y'), 'Xn@email.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6002, 'Jordan', 'House', 5418881592, '321 A St.', 'Medford', 'OR', 97504, STR_TO_DATE('04-02-2015', '%m-%d-%Y'), 'ZFS@gmail.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6003, 'Alex', 'Maddox', 5418881593, '465 B St.', 'Medford', 'OR', 97504, STR_TO_DATE('02-02-2019', '%m-%d-%Y'), 'what@email.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6004, 'Bob', 'Maynard', 5418881594, '675 C St.', 'Medford', 'OR', 97504, STR_TO_DATE('03-15-2019', '%m-%d-%Y'), 'who@yahoo.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6005, 'Kevin', 'Chan', 5418881595, '999 Cat St.', 'Medford', 'OR', 97504, STR_TO_DATE('12-20-2018', '%m-%d-%Y'), 'budmdum@gmail.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6006, 'John', 'Jones', 5418881596, '123 Dog St.', 'Medford', 'OR', 97504, STR_TO_DATE('06-23-2019', '%m-%d-%Y'), 'fightme@yahoo.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6007, 'Jane', 'Acosta', 5418881597, '555 L St', 'Medford', 'OR', 97504, STR_TO_DATE('04-07-2015', '%m-%d-%Y'), 'noneofyall@hotmail.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6008, 'Jonathon', 'Chapman', 5418881598, '999 Main St', 'Medford', 'OR', 97504, STR_TO_DATE('04-21-2020', '%m-%d-%Y'), 'this@gmail.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6009, 'Jarrett', 'Mendoza', 5418881599, '101 Jack St.', 'Medford', 'OR', 97504, STR_TO_DATE('05-03-2020', '%m-%d-%Y'), 'that@email.com');

INSERT INTO customer (customer_ID, customer_first_name, customer_last_name, customer_phone, customer_street, customer_city, customer_state, customer_zip_code, Last_contacted, customer_email)
VALUES(6010, 'Graham', 'Sherman', 5418881600, '800 NW Q St.', 'Medford', 'OR', 97504, STR_TO_DATE('06-19-2020', '%m-%d-%Y'), 'runaway@email.com');


-- INSERT_intake
-- STR_TO_DATE('06-10-2020', '%m-%d-%Y')
INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8001, 101, 9050001, 5, 6001, STR_TO_DATE('06-08-2018', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8002, 102, 9050002, 3, 6002, STR_TO_DATE('07-25-2020', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8003, 103, 9050003, 3, 6003, STR_TO_DATE('10-22-2020', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8004, 104, 9050003, 5, 6004, STR_TO_DATE('10-21-2020', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8005, 105, 9050003, 3, 6005, STR_TO_DATE('09-05-2020', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8006, 106, 9050003, 5, 6006, STR_TO_DATE('06-08-2018', '%m-%d-%Y'), 'Surrendered');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8007, 107, 9050016, 3, 6007, STR_TO_DATE('07-25-2020', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8008, 108, 9050017, 3, 6008, STR_TO_DATE('10-22-2020', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8009, 109, 9050017, 5, 6009, STR_TO_DATE('10-21-2020', '%m-%d-%Y'), 'Baby');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(8010, 109, 9050017, 3, 6010, STR_TO_DATE('09-05-2020', '%m-%d-%Y'), 'Baby');

-- -------------------------------------Adopted Animals
INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7000, 90, 9050016, 3, 6001, STR_TO_DATE('09-05-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7001, 91, 9050017, 4, 6002, STR_TO_DATE('09-05-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7002, 92, 9050017, 5, 6003, STR_TO_DATE('09-04-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7003, 93, 9050017, 1, 6003, STR_TO_DATE('09-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7004, 94, 9050017, 1, 6007, STR_TO_DATE('08-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7005, 95, 9050003, 2, 6003, STR_TO_DATE('08-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7006, 96, 9050003, 2, 6004, STR_TO_DATE('07-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7007, 97, 9050003, 3, 6003, STR_TO_DATE('03-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7008, 98, 9050003, 4, 6003, STR_TO_DATE('03-01-2018', '%m-%d-%Y'), 'Animal Control');

INSERT INTO intake (intake_ID, animal_ID, staff_ID, shelter_ID, customer_ID, intake_date, intake_type)
VALUES(7009, 99, 9050017, 7, 6003, STR_TO_DATE('03-01-2018', '%m-%d-%Y'), 'Animal Control');


-- INSERT_adoption
-- STR_TO_DATE('06-10-2020', '%m-%d-%Y')
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


-- INSERT_volunteer_shelter
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


-- INSERT_fosterhome_animal
-- STR_TO_DATE('06-10-2020', '%m-%d-%Y')
INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(122, 100, 100, STR_TO_DATE('05-09-2019', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(133, 101, 200, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(144, 102, 300, STR_TO_DATE('10-22-2020', '%m-%d-%Y'));

INSERT INTO fosterhome_animal (foster_animal_ID, animal_ID, foster_ID, foster_date)
VALUES(155, 103, 400, STR_TO_DATE('10-21-2020', '%m-%d-%Y'));
