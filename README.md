# # GOLDEN DAIRY:
A database for a dairy product company using SQL and Python.

We have generated a database for Golden dairy. Then we started making tables for Customer, Employee, product, supplier, production facility, orders, cart, admin and product in cart. We generated 100 random customer, employee, orders and supplier data using python code. We created product table manually searching products and adding their information. We created the production facility table manually, each production facility making only one type of product. We are doing this under the assumption that a production facility can create enough products to fulfil the supply of a particular type of product and there is no need for more production facilities. We made admin table assuming that only one admin can handle a particular work, and that there is no need for more than 2 admins. Other work that does not include managing and changing the database directly can be done by employees. We are making cart and "product in cart" by assuming that the cart can have many products so we created a multi-valued attribute table "product in cart" so that multiple customers can add a product and a customer can add multiple products. We generated cart by python script and randomly generated total cost. 
