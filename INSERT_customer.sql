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


select * from customer;
