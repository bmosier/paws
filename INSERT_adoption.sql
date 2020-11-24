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

select * from adoption
