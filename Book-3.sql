-- Book 3
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
