/*
-- Book 3 
*/

-- Chapter 7: Transactions

/*
1 Write a transaction to:
Add a new role for employees called Automotive Mechanic
Add five new mechanics, their data is up to you
Each new mechanic will be working at all three of these dealerships: Sollowaye Autos of New York, Hrishchenko Autos of New York and Cadreman Autos of New York
*/
/*
BEGIN;

SELECT * FROM employeetypes;

INSERT INTO public.employeetypes(name)
	VALUES ('Automotive Mechanic');

INSERT INTO employees ( 
	first_name, last_name, email_address, phone, employee_type_id )
	VALUES 
	('Virgie', 'Howison', 'vhovison@t-online.de', '111-111-1111', 9);
--	('', '', '', '', )

SELECT * FROM employees ORDER BY employee_id DESC;

SELECT * FROM dealerships 
	WHERE business_name LIKE 'Sollowaye%' OR business_name LIKE 'Hrishchenko%' OR business_name LIKE 'Cadreman%';

INSERT INTO dealershipemployees(dealership_id, employee_id) 
	VALUES 
		(50, 1009);
		-- (,)

ROLLBACK;

COMMIT;
*/


/*
2. Create a transaction for:
 	2.1 Creating a new dealership in Washington, D.C. called Felphun Automotive
 	2.2 Hire 3 new employees for the new dealership: Sales Manager, General Manager and Customer Service.
 	2.3 All employees that currently work at Scrogges Autos of District of Columbia will now start working at Felphun Automotive instead.
*/
--/*
BEGIN;

-- 2.1 Creating a new dealership in Washington, D.C. called Felphun Automotive

SELECT * FROM Dealerships 
	WHERE business_name LIKE 'Felphun%';

INSERT INTO Dealerships( business_name, city, state ) 
	VALUES ( 'Felphun Automotive', 'Washington', 'D.C.' );

-- 2.2 Hire 3 new employees for the new dealership: Sales Manager, General Manager and Customer Service
INSERT INTO Employees( first_name, last_name, email_address, phone, employee_type_id ) 
	VALUES 
	( 'Sam', 'First', 'sam.first@net.com', '001-010-100-1000', (SELECT employee_type_id FROM EmployeeTypes WHERE name = 'Sales Manager') ),
	( 'Gem', 'Second', 'gem.second@net.com', '001-010-200-2000', (SELECT employee_type_id FROM EmployeeTypes WHERE name = 'General Manager') ),
	( 'Cus', 'Third', 'cus.third@net.com', '001-010-300-3000', (SELECT employee_type_id FROM EmployeeTypes WHERE name = 'Customer Service') );

INSERT INTO DealershipEmployees ( dealership_id, employee_id ) 
	VALUES 
	( (SELECT dealership_id FROM Dealerships WHERE business_name = 'Felphun Automotive'), 
	  (SELECT employee_id FROM Employees WHERE first_name = 'Sam' AND last_name = 'First') ), 
	( (SELECT dealership_id FROM Dealerships WHERE business_name = 'Felphun Automotive'), 
	  (SELECT employee_id FROM Employees WHERE first_name = 'Gem' AND last_name = 'Second') ), 
	( (SELECT dealership_id FROM Dealerships WHERE business_name = 'Felphun Automotive'), 
	  (SELECT employee_id FROM Employees WHERE first_name = 'Cus' AND last_name = 'Third') );
	  
-- 2.3 All employees that currently work at Scrogges Autos of District of Columbia will now start working at Felphun Automotive instead

UPDATE DealershipEmployees 
SET dealership_id = (SELECT dealership_id FROM Dealerships WHERE business_name = 'Felphun Automotive' AND state = 'D.C.')
WHERE dealership_id = (SELECT dealership_id FROM Dealerships WHERE business_name = 'Scrogges Autos' AND state = 'D.C.');

ROLLBACK;

COMMIT;
--*/


-- Chapter 8: Carnival Vehicle Transactions

/*
1. Adding 5 brand new 2021 Honda CR-Vs to the inventory. 
	They have I4 engines and are classified as a Crossover SUV or CUV. 
	All of them have beige interiors but the exterior colors are Lilac, Dark Red, Lime, Navy and Sand. 
	The floor price is $21,755 and the MSR price is $18,999.

2. For the CX-5s and CX-9s in the inventory that have not been sold, 
	change the year of the car to 2021 since we will be updating our stock of Mazdas. 
	For all other unsold Mazdas, update the year to 2020. 
	The newer Mazdas all have red and black interiors.

3. The vehicle with VIN YV4852CT5B1628541 has been brought in for servicing. 
	Document that the service department did a tire change, windshield wiper fluid refill and an oil change.
*/
















