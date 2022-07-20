-- tables:
-- SELECT * FROM ecommerce.list_of_orders LIMIT 10	
-- SELECT * FROM ecommerce.order_details LIMIT 10	
-- SELECT * FROM ecommerce.sales_target LIMIT 10


-- dimentions:
-- a ecommerce.order_details --> a.amount, a.profit, a.quantity, category, subcategory
-- b.ecommerce.list_of_orders --> b.order_id, b.order_date, b.customer_name, b.state_name, b.city,
-- c.sales_target --> c.target


SELECT

      order_id,
      order_date,
      customer_name,
      state_name,
      city,
      category,
      subcategory,
      amount,
      profit,
      quantity,
      target


FROM 
      (SELECT DISTINCT
                  b.order_id, 
                  a.amount, 
                  b.order_date,
                  b.customer_name,
                  b.state_name,
                  b.city,
                  a.profit,
                  a.quantity,
                  a.category,
                  a.subcategory,
                  c.target
                  
                  FROM ecommerce.order_details as a 
                  LEFT JOIN ecommerce.list_of_orders b ON a.order_id = b.order_id
                  LEFT JOIN ecommerce.sales_target c ON a.category = c.category AND date_part('year', order_date) = date_part('year', month_of_order) 
                                                                                AND date_part('month', order_date) = date_part('month', month_of_order)

                  
                  ) AS d
                  

order by order_id, order_date
