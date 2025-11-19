SELECT * FROM SweetProducts; 
SELECT * FROM SaltyProducts; 
SELECT * FROM Customers; 
SELECT * FROM SweetOrderItems; 
SELECT * FROM SaltyOrderItems; 

-- List all sweet products with a price over 5 and sort them by price in descending order.
SELECT ProductID, Name, Price 
FROM SweetProducts
WHERE Price>5 
ORDER BY Price DESC; 

-- Show all orders that were made in the year 2024.
SELECT *
FROM Orders 
WHERE Date LIKE '%2024%';

-- Find all sweet products that have ever been ordered.
SELECT E.ProductID, E.Name, T.OrderID 
FROM SweetProducts E, SweetOrderItems T 
WHERE T.ProductID = E.ProductID;

-- Calculate the total quantity of each sweet product that has been ordered.
SELECT SP.ProductID, SP.Name, SUM(SOI.Quantity) AS TotalQuantity
FROM SweetProducts SP
JOIN SweetOrderItems SOI ON SP.ProductID = SOI.ProductID
GROUP BY SP.ProductID, SP.Name
ORDER BY  TotalQuantity DESC;

-- Which customers have ordered salty products?
SELECT DISTINCT O.CustomerID
FROM Orders O 
JOIN SaltyOrderItems SOI ON O.OrderID = SOI.OrderID; 

-- Show all orders that contain both sweet and salty items.
SELECT DISTINCT SW.OrderID
FROM SweetOrderItems SW 
JOIN SaltyOrderItems SA ON SW.OrderID = SA.OrderID;

-- List the top 3 most frequently ordered salty products.
SELECT TOP 3 SP.ProductID, SP.Name, SUM(SOI.Quantity) AS TotalQuantity
FROM SaltyProducts SP
JOIN SaltyOrderItems SOI ON SP.ProductID = SOI.ProductID
GROUP BY SP.ProductID, SP.Name
ORDER BY TotalQuantity DESC;

-- Show the number of orders for each customer.
SELECT CustomerID, count(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
ORDER BY OrderCount desc; 

-- List all sweet products with the flavor 'Chocolate' or 'Vanilla' that have been ordered at least once.
SELECT DISTINCT SP.Name
FROM SweetOrderItems SOT
JOIN SweetProducts SP ON SOT.ProductID = SP.ProductID
WHERE SP.flavor IN('Chocolate', 'Vanilla');


-- List all sweet products that have been ordered, along with how many of each was ordered. Include the product name and quantity.
SELECT SP.Name, SOT.Quantity
FROM SweetProducts SP INNER JOIN SweetOrderItems SOT
ON SP.ProductID = SOT.ProductID; 

-- Show all salty products and any matching order quantities if they exist. Include salty products even if they have never been ordered.
SELECT SP.Name, SOT.Quantity
FROM SaltyProducts SP LEFT OUTER JOIN SaltyOrderItems SOT
ON SP.ProductID = SOT.ProductID; 

-- Use a CTE to select all sweet products with a price greater than 5.
WITH NewSweet as (SELECT ProductID, Name, Price FROM SweetProducts WHERE Price > 5)
SELECT *
FROM NewSweet;

-- Create a CTE that returns the total quantity ordered for each sweet product, then select the product name and total ordered amount from that CTE.
WITH TotalQuantity AS (SELECT ProductID , sum(Quantity) AS TotalQty FROM SweetOrderItems GROUP BY ProductID) 
SELECT sp.name, tq.TotalQty
FROM SweetProducts sp LEFT JOIN TotalQuantity tq ON sp.ProductID = tq.ProductID; 

-- Use a CTE to return all orders with the total number of sweet items in each order.
WITH num_of_sweets AS (SELECT OrderID, sum(Quantity) AS totalQ FROM SweetOrderItems GROUP BY OrderID)
SELECT Orders.OrderID, num_of_sweets.totalQ
FROM Orders LEFT OUTER JOIN num_of_sweets ON Orders.OrderID = num_of_sweets.OrderID;

-- Return a list of all sweet and salty products with their total ordered quantities using one CTE per category, then combine them into a single final result.
WITH salty_total AS (SELECT ProductID, sum(Quantity) as TotalSalty FROM SaltyOrderItems GROUP BY ProductID),
     sweety_total AS (SELECT ProductID, sum(Quantity) as TotalSweety FROM SweetOrderItems GROUP BY ProductID)
SELECT swp.Name, swt.TotalSweety
FROM SweetProducts swp LEFT OUTER JOIN sweety_total swt ON swp.ProductID = swt.ProductID
UNION
SELECT sap.Name, sat.TotalSalty
FROM SaltyProducts sap LEFT OUTER JOIN salty_total sat ON sap.ProductID = sat.ProductID ;

-- List sweet products whose price is greater than some price in the SaltyProducts table.
SELECT ProductID, Name 
FROM SweetProducts 
WHERE Price > some (SELECT Price FROM SaltyProducts); 

-- Find salty products where the quantity ordered is less than some salty product quantity in other orders.
SELECT ProductID, Quantity
FROM SaltyOrderItems outerT
WHERE Quantity < any(SELECT Quantity 
                     FROM SaltyOrderItems innerT
                     WHERE innerT.OrderID <> outerT.OrderID); 

-- List customers who have placed more orders than some other customers.
SELECT CustomerID, OrderCount
FROM (SELECT CustomerID, count(*) AS OrderCount FROM Orders GROUP BY CustomerID) as OuterT
WHERE OrderCount > some (SELECT count(*) FROM Orders GROUP BY CustomerID);

-- List sweet products that have been ordered at least once.
SELECT ProductID
FROM SweetProducts
WHERE exists (SELECT * FROM SweetOrderItems WHERE SweetProducts.ProductID = SweetOrderItems.ProductID); 

-- Show customers who made at least one order
SELECT FirstName, LastName
FROM Customers
WHERE exists (SELECT * FROM Orders WHERE Orders.CustomerID = Customers.CustomerID); 




