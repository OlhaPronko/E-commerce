/*
this code creat the following tables:
1. ecommerce.list_of_orders
2. ecommerce.order_details
3. ecommerce.sales_target
*/

create table ecommerce.list_of_orders (
        order_id varchar(100),
        order_date date,
        customer_name varchar(100),
        state_name varchar(100),
        city varchar(50));
        
        
create table ecommerce.order_details (
        order_id varchar(100),
        amount int,
        profit int,
        quantity int,
        category varchar(50),
        subcategory varchar (50));
            
       
create table ecommerce.sales_target (
        month_of_order date,
        category varchar(50),
        target int)

