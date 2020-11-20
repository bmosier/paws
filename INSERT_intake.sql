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

select * from intake;