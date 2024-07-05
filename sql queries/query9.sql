select Product.Name, Product.ID, T.order_frequency from Product inner join (select product_id, count(Product_ID) as order_frequency from Orders group by(product_id) order by (order_frequency) DESC limit 1) as T where Product_ID = Product.ID; 