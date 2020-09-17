/*
-- Book 3 
*/

-- Chapter 1: SQL Updates

/*
-- Practice: Employees
-- Rheta Raymen an employee of Carnival has asked to be transferred to a different dealership location. 
-- She is currently at dealership 751. She would like to work at dealership 20. Update her record to reflect her transfer.

UPDATE DealershipEmployees 
SET dealership_id = 20 
WHERE employee_id = (SELECT employee_id FROM Employees WHERE first_name = 'Rheta' AND last_name = 'Raymen');
*/

/*
-- Practice: Sales
-- A Sales associate needs to update a sales record because her customer want to pay with a Mastercard instead of American Express. 
-- Update Customer, Layla Igglesden Sales record which has an invoice number of 2781047589.

UPDATE Sales 
SET payment_method = 'Mastercard' 
WHERE invoice_number = '2781047589';
*/


-- Chapter 2: SQL Delete

/*
-- Practice: Employees
-- 1. A sales employee at carnival creates a new sales record for a sale they are trying to close. 
-- The customer, last minute decided not to purchase the vehicle. 
-- Help delete the Sales record with an invoice number of '7628231837'.

DELETE FROM Sales WHERE invoice_number = '7628231837';
*/

/*
-- 2. An employee was recently fired so we must delete them from our database. 
-- Delete the employee with employee_id of 35.
-- What problems might you run into when deleting? 
-- How would you recommend fixing it?

-- DELETE FROM Employees WHERE employee_id = 35;
*/


-- Chapter 4: Carnival Inventory Procedure

--/*
-- Selling a Vehicle

-- Carnival would like to create a stored procedure that handles the case of updating their vehicle inventory when a sale occurs.
-- They plan to do this by flagging the vehicle as is_sold which is a field on the Vehicles table. 
-- When set to True this flag will indicate that the vehicle is no longer available in the inventory. 
-- Why not delete this vehicle? 
-- We don't want to delete it because it is attached to a sales record.

CREATE PROCEDURE vehicle_is_sold(IN in_vehicle_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE Vehicles 
	SET is_sold = 'True' 
	WHERE vehicle_id = in_vehicle_id;
END
$$

-- CALL vehicle_is_sold(in_vehicle_id);
--*/

-- /*
create table OilChangeLogs (
  oil_change_log_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  date_occured timestamp with time zone,
  vehicle_id int,
  FOREIGN KEY (vehicle_id) REFERENCES Vehicles (vehicle_id)
);
-- */

-- /*
-- Returning a Vehicle

-- Carnival would also like to handle the case for when a car gets returned by a customer. 
-- When this occurs they must add the car back to the inventory and mark the original sales record as returned = True.

-- Carnival staff are required to do an oil change on the returned car before putting it back on the sales floor. 
-- In our stored procedure, we must also log the oil change within the OilChangeLog table.

CREATE PROCEDURE vehicle_is_returned(IN in_vehicle_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE Vehicles 
	SET is_sold = 'False' 
	WHERE vehicle_id = in_vehicle_id;
	
	UPDATE Sales 
	SET is_returned = 'True' 
	WHERE vehicle_id = in+vehicle_id;
END
$$

-- CALL vehicle_is_returned(in_vehicle_id);
--*/







