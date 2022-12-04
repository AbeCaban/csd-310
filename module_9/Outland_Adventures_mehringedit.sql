-- EXISTENCE CHECK TO DROP DATABASE IF ALREADY EXISTS --
DROP DATABASE IF EXISTS outland_adventures; 


-- CREATING DATABASE --
CREATE DATABASE outland_adventures; 


-- POINTING TO THE PREFERRED DATABASE --
USE outland_adventures; 


-- EXISTENCE CHECK BEFORE CREATING EACH TABLE IN THE DATABASE --
DROP TABLE IF EXISTS department; 
CREATE TABLE department ( 
    department_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    department_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS customer;
    CREATE TABLE customer (
    customer_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS equipment;
    CREATE TABLE equipment (
    equipment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(50),
    acquisition_date date
);

DROP TABLE IF EXISTS visa;
    CREATE TABLE visa (
    visa_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    visa_number VARCHAR(10) NOT NULL,
    visa_type VARCHAR(10)
);

DROP TABLE IF EXISTS airfare;
    CREATE TABLE airfare (
    ticket_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ticket_number VARCHAR(10) NOT NULL,
    ticket_type VARCHAR(50),
    airline VARCHAR(50)
);

DROP TABLE IF EXISTS destination;
    CREATE TABLE destination (
    continent_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    continent_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS jobs; 
CREATE TABLE jobs ( 
    job_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    job_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    
	CONSTRAINT FK_department_ID
	FOREIGN KEY (department_ID)
		REFERENCES department(department_id)
    
); 

DROP TABLE IF EXISTS employee;
    CREATE TABLE employee (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    
    CONSTRAINT FK_department
	FOREIGN KEY (department_ID)
		REFERENCES department(department_id)
);

DROP TABLE IF EXISTS purchases;
    CREATE TABLE purchases (
    purchase_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT,
    customer_id INT NOT NULL,
    purchase_amt DECIMAL(15,2),
    purchase_date DATE,
    
    CONSTRAINT FK_equipment_id
	FOREIGN KEY (equipment_id)
		REFERENCES equipment(equipment_id),
        
	CONSTRAINT FK__customer
	FOREIGN KEY (customer_id)
		REFERENCES customer(customer_id)
);

DROP TABLE IF EXISTS rental;
    CREATE TABLE rental (
    rental_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT,
    customer_id INT NOT NULL,
    rental_amt DECIMAL(15,2),
    rental_date DATE,
    
    CONSTRAINT FK_equipment
	FOREIGN KEY (equipment_id)
		REFERENCES equipment(equipment_id),
        
	CONSTRAINT FK_customer
	FOREIGN KEY (customer_id)
		REFERENCES customer(customer_id)
);

DROP TABLE IF EXISTS trips;
    CREATE TABLE trips (
    trip_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    continent_ID INT NOT NULL,
    country VARCHAR(50),
    region VARCHAR(50),
    inoculation CHAR(1),
    customer_ID INT NOT NULL,
    visa_ID INT NOT NULL,
    ticket_ID INT NOT NULL,
    
    CONSTRAINT FK_visa_ID
	FOREIGN KEY (visa_ID)
		REFERENCES visa(visa_ID),
        
	CONSTRAINT FK_ticket_ID
	FOREIGN KEY (ticket_ID)
		REFERENCES airfare(ticket_ID),
        
	CONSTRAINT FK_continent_ID
	FOREIGN KEY (continent_ID)
		REFERENCES destination(continent_ID),
        
	CONSTRAINT FK___customer
	FOREIGN KEY (customer_id)
		REFERENCES customer(customer_id)
);

DROP TABLE IF EXISTS orders;
    CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_date date,
    customer_id INT NOT NULL,
    trip_id INT,
    purchase_id int,
    rental_id INT,
    employee_id INT NOT NULL,

	CONSTRAINT FK_customer_id
    FOREIGN KEY (customer_id)
		REFERENCES customer(customer_id),

	CONSTRAINT FK_trip_id 
    FOREIGN KEY (trip_id) 
		REFERENCES trips(trip_id),

	CONSTRAINT FK_purchase_id 
    FOREIGN KEY (purchase_id) 
		REFERENCES purchases(purchase_id),

	CONSTRAINT FK_rental_id
    FOREIGN KEY (rental_id ) 
		REFERENCES rental(rental_id ),

	CONSTRAINT FK_employee_id 
    FOREIGN KEY (employee_id) 
		REFERENCES employee(employee_id)
);


-- INSERT INTO DEPARTMENT TABLE --
INSERT INTO department(department_name)
    VALUES('Guides');

INSERT INTO department(department_name)
    VALUES('Marketing');

INSERT INTO department(department_name)
    VALUES('Inventory');

INSERT INTO department(department_name)
    VALUES('Web Design');

INSERT INTO department(department_name)
    VALUES('Administrative');


-- INSERTING INTO JOBS TABLE --
INSERT INTO jobs(job_name, department_id)
    VALUES('investigating airfare', (SELECT department_id FROM department WHERE department_name= 'Guides'));

INSERT INTO jobs(job_name, department_id)
    VALUES('visa requirements', (SELECT department_id FROM department WHERE department_name= 'Guides'));

INSERT INTO jobs(job_name, department_id)
    VALUES('marketing', (SELECT department_id FROM department WHERE department_name= 'Marketing'));

INSERT INTO jobs(job_name, department_id)
    VALUES('ordering supplies', (SELECT department_id FROM department WHERE department_name= 'Inventory'));

INSERT INTO jobs(job_name, department_id)
    VALUES('equipment inventory', (SELECT department_id FROM department WHERE department_name= 'Inventory'));

INSERT INTO jobs(job_name, department_id)
    VALUES('ecommerce site', (SELECT department_id FROM department WHERE department_name= 'Web Design'));

INSERT INTO jobs(job_name, department_id)
    VALUES('office operations', (SELECT department_id FROM department WHERE department_name= 'Administrative'));


-- INSERTING INTO EMPLOYEE TABLE --
INSERT INTO employee(emp_name, department_id)
    VALUES('Blythe Timmerson', (SELECT department_id FROM department WHERE department_name= 'Administrative'));

INSERT INTO employee(emp_name, department_id)
    VALUES('Jim Ford', (SELECT department_id FROM department WHERE department_name= 'Administrative'));

INSERT INTO employee(emp_name, department_id)
    VALUES('John "Mac" MacNell', (SELECT department_id FROM department WHERE department_name= 'Guides'));

INSERT INTO employee(emp_name, department_id)
    VALUES('D.B. "Duke" Marland', (SELECT department_id FROM department WHERE department_name= 'Guides'));

INSERT INTO employee(emp_name, department_id)
    VALUES('Anita Gallegos', (SELECT department_id FROM department WHERE department_name= 'Marketing'));

INSERT INTO employee(emp_name, department_id)
    VALUES('Dimitrios Stravopolous', (SELECT department_id FROM department WHERE department_name= 'Inventory'));

INSERT INTO employee(emp_name, department_id)
    VALUES('Mei Wong', (SELECT department_id FROM department WHERE department_name= 'Web Design'));
  	

-- INSERTING INTO CUSTOMER TABLE --
INSERT INTO customer(customer_name)
    VALUES('Bethany Mehring'); 

INSERT INTO customer(customer_name)
    VALUES('Oscar Acheampong');  

INSERT INTO customer(customer_name)
    VALUES('Abe Can-Rios');  

INSERT INTO customer(customer_name)
    VALUES('Isaac Frett');  

INSERT INTO customer(customer_name)
    VALUES('Ryan Hoover');  

INSERT INTO customer(customer_name)
    VALUES('Sue Sampson');  


-- INSERT INTO EQUIPMENT TABLE --
INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Pole', '2022-07-14');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Tent','2015-11-23' );

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Boots', '2020-10-06');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Backpack', '2010-01-06');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Straps', '2020-05-18');
    
INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Hiking Shoes', '2020-05-18');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('First-aid Kit', '2020-05-18');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('M9 Bayonet', '2021-12-01');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Sunglasses', '2021-12-01');
    
INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Sunglasses Straps', '2021-12-01');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Water Bottles', '2019-04-12');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Flash Lights', '2019-04-12');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Compass', '2019-04-12');

INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Altimeter Watch', '2018-05-04');
    
INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Satellite Messenger', '2018-05-04');
    
INSERT INTO equipment(equipment_name, acquisition_date)
    VALUES('Sun hat', '2018-05-04');


-- INSERTING INTO VISA --
INSERT INTO VISA (visa_number, visa_type)
	VALUES('GR22984', 'Tourist');
    
INSERT INTO VISA (visa_number, visa_type)
	VALUES('RW92367', 'Tourist');

INSERT INTO VISA (visa_number, visa_type)
	VALUES('SK33974', 'Tourist');
    
INSERT INTO VISA (visa_number, visa_type)
	VALUES('GH24659', 'Tourist');

INSERT INTO VISA (visa_number, visa_type)
	VALUES('JP385630', 'Tourist');
    
INSERT INTO VISA (visa_number, visa_type)
	VALUES('ET72456', 'Tourist');

INSERT INTO VISA (visa_number, visa_type)
	VALUES('VT63592', 'Tourist');
    
INSERT INTO VISA (visa_number, visa_type)
	VALUES('IT28035', 'Tourist');

INSERT INTO VISA (visa_number, visa_type)
	VALUES('SA98205', 'Tourist');
    
INSERT INTO VISA (visa_number, visa_type)
	VALUES('MA73946', 'Tourist');

INSERT INTO VISA (visa_number, visa_type)
	VALUES('NA46292', 'Tourist');
    
INSERT INTO VISA (visa_number, visa_type)
	VALUES('MO22084', 'Tourist');


-- INSERTING INTO AIRFARE --
INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('DL925638', 'Economy', 'Delta Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('DL627839', 'Economy', 'Delta Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('AA501742', 'Economy', 'American Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('AA190482', 'Business Class', 'American Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('UA893674', 'Economy', 'United Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('BA357910', 'First Class', 'Brirish Airways');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('DL835620', 'Economy', 'Delta Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('DL612205', 'Economy', 'Delta Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('DL926403', 'Economy', 'Delta Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('AA846539', 'Economy', 'American Airlines');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('BA003549', 'Economy', 'Brirish Airways');

INSERT INTO AIRFARE (ticket_number, ticket_type, airline)
	VALUES('AA945305', 'Economy', 'United Airlines');


-- INSERTING INTO DESTINATION TABLE --
INSERT INTO destination(continent_name)
	VALUES('Africa');

INSERT INTO destination(continent_name)
	VALUES('Asia');
    
INSERT INTO destination(continent_name)
	VALUES('Southern Europe');


-- INSERTING INTO TRIPS TABLE --
INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Africa'), 'Ghana', 'Greater Accra',  'N', (SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'), (SELECT visa_ID FROM visa WHERE visa_number = 'GH24659'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'UA893674'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Asia'), 'South korea', 'Gangwon', 'N', (SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'), (SELECT visa_ID FROM visa WHERE visa_number = 'SK33974'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'DL627839'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Southern Europe'), 'Greece', 'Athens', 'Y', (SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'), (SELECT visa_ID FROM visa WHERE visa_number = 'GR22984'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'BA357910'));
    
INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Asia'), 'Japan', 'Tokyo', 'N', (SELECT customer_id FROM customer WHERE customer_name = 'Isaac Frett'), (SELECT visa_ID FROM visa WHERE visa_number = 'JP385630'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'AA501742'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Africa'), 'Egypt', 'Cairo', 'N', (SELECT customer_id FROM customer WHERE customer_name = 'Abe Can-Rios'), (SELECT visa_ID FROM visa WHERE visa_number = 'ET72456'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'AA190482'));
    
INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Africa'), 'Rwanda', 'Kigali', 'Y', (SELECT customer_id FROM customer WHERE customer_name = 'Ryan Hoover'), (SELECT visa_ID FROM visa WHERE visa_number = 'RW92367'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'DL925638'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Africa'), 'South Africa', 'Western Cape',  'N', (SELECT customer_id FROM customer WHERE customer_name = 'Isaac Frett'), (SELECT visa_ID FROM visa WHERE visa_number = 'SA98205'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'DL926403'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Southern Europe'), 'Italy', 'Rome', 'N', (SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'), (SELECT visa_ID FROM visa WHERE visa_number = 'IT28035'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'BA003549'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Asia'), 'Vietnam', 'Hanoi', 'Y', (SELECT customer_id FROM customer WHERE customer_name = 'Abe Can-Rios'), (SELECT visa_ID FROM visa WHERE visa_number = 'VT63592'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'AA846539'));
    
INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Asia'), 'Malaysia', 'Kuala Lumpur', 'N', (SELECT customer_id FROM customer WHERE customer_name = 'Sue Sampson'), (SELECT visa_ID FROM visa WHERE visa_number = 'MA73946'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'AA945305'));

INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Africa'), 'Morocco', 'Rabat', 'N', (SELECT customer_id FROM customer WHERE customer_name = 'Sue Sampson'), (SELECT visa_ID FROM visa WHERE visa_number = 'MO22084'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'DL612205'));
    
INSERT INTO trips(continent_ID, country, region, inoculation, customer_ID, visa_ID, ticket_ID)
    VALUES((SELECT continent_ID FROM destination WHERE continent_name = 'Africa'), 'Namibia', 'Windhoek', 'Y', (SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'), (SELECT visa_ID FROM visa WHERE visa_number = 'NA46292'), (SELECT ticket_ID FROM airfare WHERE ticket_number = 'DL835620'));


-- INSERTING INTO PURCHASES TABLE --
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Boots'), 
			(SELECT customer_id FROM customer WHERE customer_name = 'Isaac Frett'),
            50.00, '2021-02-17');

INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Straps'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'),
            25.00, '2022-11-20');
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'First-aid Kit'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'),
            100.00, '2022-11-20');    

INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'M9 Bayonet'), 
			(SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'),
            150.00, '2022-10-11');
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Sunglasses'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Abe Can-Rios'),
            50.00, '2021-02-17');
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Sunglasses Straps'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'),
            20.00, '2021-02-17');
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Pole'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Sue Sampson'),
            100.00, '2022-11-20');    
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Hiking Shoes'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Abe Can-Rios'),
            150.00, '2022-10-11');
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Sun hat'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Isaac Frett'),
             50.00, '2021-02-17');
    
INSERT INTO PURCHASES (equipment_id, customer_id, purchase_amt, purchase_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Water Bottles'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Ryan Hoover'),
            20.00, '2021-02-17');


-- INSERTING INTO RENTAL TABLE --
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Tent'), 
			(SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'),
            100.00, '2022-11-20');    
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Compass'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'),
            150.00, '2022-10-11');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Flash Lights'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Sue Sampson'),
            50.00, '2021-02-17');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Altimeter Watch'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Sue Sampson'),
			20.00, '2021-02-17');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Backpack'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'),
            20.00, '2021-02-17');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Satellite Messenger'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Ryan Hoover'),
            20.00, '2021-02-17');

INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Backpack'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Isaac Frett'),
            100.00, '2022-11-20');    
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Altimeter Watch'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Isaac Frett'),
            150.00, '2022-10-11');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Compass'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Abe Can-Rios'),
            50.00, '2021-02-17');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Backpack'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Abe Can-Rios'),
            20.00, '2021-02-17');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Flash Lights'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'),
            20.00, '2021-02-17');
    
INSERT INTO RENTAL (equipment_id, customer_id, rental_amt, rental_date)
	VALUES((SELECT equipment_id FROM equipment WHERE equipment_name = 'Satellite Messenger'),
			(SELECT customer_id FROM customer WHERE customer_name = 'Oscar Acheampong'),
            20.00, '2021-02-17');


-- INSERTING INTO ORDER TABLE --
INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-08-15', (SELECT customer_id FROM customer WHERE customer_name = 'Bethany Mehring'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Southern Europe'
                                AND customer_name = 'Bethany Mehring'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 5), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 12 and C.customer_name = 'Bethany Mehring'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));
                      
INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-12-01',(SELECT customer_id FROM customer WHERE customer_name= 'Bethany Mehring'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE D.continent_name = 'Africa'
                                AND C.customer_name = 'Bethany Mehring'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 7), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 2 and C.customer_name = 'Bethany Mehring'),  
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));

INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Oscar Acheampong'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Southern Europe'
                                AND customer_name = 'Oscar Acheampong'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 8), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 13 and C.customer_name = 'Oscar Acheampong'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));
 
INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Oscar Acheampong'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Asia'
                                AND customer_name = 'Oscar Acheampong'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 10), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 4 and C.customer_name = 'Oscar Acheampong'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));
					
INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Isaac Frett'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Africa'
                                AND customer_name = 'Isaac Frett'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 3), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 4 and C.customer_name = 'Isaac Frett'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));
                        
INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Isaac Frett'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Asia'
                                AND customer_name = 'Isaac Frett'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 16), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 14 and C.customer_name = 'Isaac Frett'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));

INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Oscar Acheampong'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Africa'
                                AND customer_name = 'Oscar Acheampong'), 
						NULL, 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 15 and C.customer_name = 'Oscar Acheampong'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));

INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Ryan Hoover'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Africa'
                                AND customer_name = 'Ryan Hoover'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 11), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 15 and C.customer_name = 'Ryan Hoover'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));

INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Sue Sampson'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Africa'
                                AND customer_name = 'Sue Sampson'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 1),
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 12 and C.customer_name = 'Sue Sampson'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));

INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Sue Sampson'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Asia'
                                AND customer_name = 'Sue Sampson'), 
						NULL, 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 14 and C.customer_name = 'Sue Sampson'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));

INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Abe Can-Rios'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Africa'
                                AND customer_name = 'Abe Can-Rios'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 9), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 13 and C.customer_name = 'Abe Can-Rios'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));
                        
INSERT INTO orders(order_date, customer_id, trip_id, purchase_id, rental_id, employee_id)
    VALUES('2022-10-16',(SELECT customer_id FROM customer WHERE customer_name= 'Abe Can-Rios'),
						(SELECT T.trip_id FROM trips T INNER JOIN destination D
							ON T.continent_ID = D.continent_ID
                            INNER JOIN customer C 
                            ON C.customer_ID = T.customer_ID
								WHERE continent_name = 'Asia'
                                AND customer_name = 'Abe Can-Rios'), 
						(SELECT purchase_id FROM purchases WHERE equipment_id = 6), 
						(SELECT rental_id FROM rental R INNER JOIN customer C 
							ON R.customer_id = C.customer_id
                            WHERE R.equipment_id = 4 and C.customer_name = 'Abe Can-Rios'), 
						(SELECT employee_id FROM employee WHERE emp_name= 'John "Mac" MacNell'));