select Product.Name, Product.ID, T.order_frequency from Product inner join (select product_id, count(product_id) as order_frequency from Orders group by(product_id)) as T where product_id = Product.ID;