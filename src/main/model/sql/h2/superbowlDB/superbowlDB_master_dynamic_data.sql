/*==============================================================
DBMS    :  H2
Version :  1.4.193
Database:  superbowlDB
Created :  07.03.2017 00:00:00
Modified:  27.05.2017 00:00:00
==============================================================*/

-- ==================================================
-- Table: TIMBERORIGIN
-- ==================================================
DELETE FROM TIMBERORIGIN;
INSERT INTO TIMBERORIGIN (TO_VERSION, TO_TIMBER_ID, TO_INDEX, TO_CITY, TO_LOCATION, TO_LOCATION_TEXT, TO_CUTDOWN, TO_COMMENT)
VALUES
	 (0,   5,  0, 'Bad Homburg v.d.H.', 'Platzenberg', 'neben grünem Haus ex. Fr. Reiner', '09.16', '100 Jahre alter Baum')
	,(0, 233,  1, 'Bad Homburg v.d.H.', 'Schlossgarten', 'Goethes Ruh', '06.12', '')
	,(0, 235,  2, 'Bad Homburg v.d.H.', 'Kurpark', 'Garten am Kurcafe', '', '')
	,(0, 239,  3, 'Friedrichsdorf', 'Garten Bahai-Tempel', '', '11.13', '')
	,(0,  49,  4, 'Frankfurt-Höchst', 'Schlossgarten', '', '08.15', '')
	,(0, 132,  5, 'Kronberg', 'Golfplatz', '', '03.14', '')
	;

COMMIT;

-- ==================================================
-- Table: CUSTOMER
-- ==================================================
INSERT INTO CUSTOMER (CUSTOMER_VERSION, CUSTOMER_INDEX, CUSTOMER_SALUTATION, CUSTOMER_GRADUATION, CUSTOMER_GIVENNAME, CUSTOMER_FAMILYNAME, 
	CUSTOMER_PHONE, CUSTOMER_FAX, CUSTOMER_MOBILE, CUSTOMER_EMAIL, CUSTOMER_STREET, CUSTOMER_HOUSENUMBER, CUSTOMER_ZIPCODE, 
	CUSTOMER_CITY, CUSTOMER_COUNTRYCODE, CUSTOMER_COUNTRY, CUSTOMER_COMMENT)
VALUES
	 (0, 0, 'Herr', '', 'Jürgen', 'Röder', '+49 69 576808', '+49 69 57800107', '+49 1522 1908464', 'roeder@gmx.net', 'Hammarskjöldring 202', '202', '60439', 'Frankfurt am Main', 'D', 'Deutschland', 'Stammkunde');

INSERT INTO CUSTOMER (CUSTOMER_VERSION, CUSTOMER_INDEX, CUSTOMER_SALUTATION, CUSTOMER_GRADUATION, CUSTOMER_GIVENNAME, CUSTOMER_FAMILYNAME, 
	CUSTOMER_PHONE, CUSTOMER_FAX, CUSTOMER_MOBILE, CUSTOMER_EMAIL, CUSTOMER_STREET, CUSTOMER_HOUSENUMBER, CUSTOMER_ZIPCODE, 
	CUSTOMER_CITY, CUSTOMER_COUNTRYCODE, CUSTOMER_COUNTRY, CUSTOMER_COMMENT)
VALUES
	 (0, 1, 'Frau', '', 'Martina', 'Schwarzbart', '+49 69 576808', '+49 69 57800107', '+49 172 6112874', 'mschwarzbartr@gmx.de', 'Hammarskjöldring 202', '202', '60439', 'Frankfurt am Main', 'D', 'Deutschland', 'Stammkundin');

-- ==================================================
-- Table: BOWL
-- ==================================================
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 0, 2, 5, 2, NULL, NULL, 309, 'tp_bowl_309', 2015, 1450.0, NULL, NULL, NULL, '100 Jahre alter Baum; gefällt 09.16');

INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 1, 1, 235, 3, NULL, NULL, 200, 'tp_bowl_200', 2016, 425.0, NULL, NULL, NULL, 'Gepflanzt im 19. Jahrhundert');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 2, 2, 49, 5, NULL, NULL, 399, 'tp_bowl_399', 2017, 500.0, NULL, NULL, NULL, '');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 3, 6, 233, 2, NULL, NULL, 23, 'tp_bowl_23', 2014, 1000.0, NULL, NULL, NULL, '100 Jahre alte Eibe');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 4, 1, 235, 3, NULL, NULL, 20, 'tp_bowl_20', 2016, 850.0, NULL, NULL, NULL, '');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 5, 4, 132, 5, NULL, NULL, 17, 'tp_bowl_17', 2017, 470.0, NULL, NULL, NULL, '');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 6, 7, 133, 2, NULL, NULL, 16, 'tp_bowl_16', 2015, 500.0, NULL, NULL, NULL, '');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 7, 3, 239, 5, NULL, NULL, 5, 'tp_bowl_5', 2015, 2500.0, NULL, NULL, NULL, '');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 8, 5, 233, 2, NULL, NULL, 18, 'tp_bowl_18', 2013, 1370.0, NULL, NULL, NULL, '');
	 
INSERT INTO BOWL (BOWL_VERSION, BOWL_INDEX, BOWL_STATUS_ID, BOWL_TIMBER_ID, BOWL_TIMBERORIGIN_ID, BOWL_CUSTOMER_ID, BOWL_EXHIBITION_ID, BOWL_ORDINAL, BOWL_IMAGENAME, BOWL_YEAR, BOWL_PRICE,
	BOWL_SALES_PRICE, BOWL_SALES_LOCATION, BOWL_SALES_DATE, BOWL_COMMENT)
VALUES
	 (0, 9, 2, 150, 5, NULL, NULL, 13, 'tp_bowl_13', 2014, 540.0, NULL, NULL, NULL, '');
	
COMMIT;
