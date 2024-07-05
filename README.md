# Golden Dairy Database Project

## Overview
We have developed a database for Golden Dairy using SQL and Python. This project involves creating and populating tables for various entities essential for the dairy product company's operations.

## Tables Created
1. **Customer**: Contains information about the customers.
2. **Employee**: Contains information about the employees.
3. **Product**: Contains information about the products.
4. **Supplier**: Contains information about the suppliers.
5. **Production Facility**: Contains information about the production facilities.
6. **Orders**: Contains information about the orders placed.
7. **Cart**: Contains information about the carts used by customers.
8. **Admin**: Contains information about the administrators.
9. **Product in Cart**: A multi-valued attribute table that links products to carts.

## Data Generation
- **Customer, Employee, Orders, Supplier Data**: Generated 100 random records for each using Python scripts.
- **Product Data**: Created manually by searching for products and adding their information.
- **Production Facility Data**: Created manually with each facility producing only one type of product. Assumed that a single facility can fulfill the supply of its respective product type without needing additional facilities.
- **Admin Data**: Assumed that one admin can handle a particular task, and no more than two admins are needed. Other tasks not involving direct database management are handled by employees.
- **Cart and Product in Cart Data**: Created assuming that multiple customers can add a product to their cart, and a customer can add multiple products. Generated cart data and randomly calculated total costs using Python scripts.

## Assumptions
1. Each production facility is capable of producing enough products to meet the demand for its specific product type.
2. A maximum of two admins is sufficient for managing the database, with other tasks being handled by employees.
3. The cart can contain multiple products, and the "Product in Cart" table handles the multi-valued nature of this relationship.

By organizing the database in this manner, we aim to efficiently manage and streamline the operations of Golden Dairy.

## Relational Model:
![image](https://github.com/skyscrappers/Golden_Dairy/assets/107923239/35c48067-0e6b-4d5c-9a6f-79aaee2508bd)
