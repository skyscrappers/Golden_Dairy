SELECT Customers.Name,Customers.customer_id, COUNT(*) as num_orders FROM Orders INNER JOIN Customers ON Orders.Customer_ID = Customers.customer_id GROUP BY Customers.customer_id HAVING num_orders > 2; 