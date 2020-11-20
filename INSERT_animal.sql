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

select * from animal;
