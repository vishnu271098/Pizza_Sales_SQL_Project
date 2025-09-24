-- Task 1: Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT p2.category,
       SUM(o1.quantity) AS total_qty
FROM order_details AS o1
LEFT JOIN pizzas AS p1 ON o1.pizza_id = p1.pizza_id
LEFT JOIN pizza_types AS p2 ON p1.pizza_type_id = p2.pizza_type_id
GROUP BY p2.category;


-- Task 2: Join relevant tables to find the category-wise distribution of pizzas.
SELECT p2.category,
       SUM(o1.quantity) AS total_quantity
FROM order_details AS o1
LEFT JOIN pizzas AS p1 ON o1.pizza_id = p1.pizza_id
LEFT JOIN pizza_types AS p2 ON p1.pizza_type_id = p2.pizza_type_id
GROUP BY p2.category;


-- Task 3: Group the orders by the date and calculate the average number of pizzas ordered per day.
WITH daily_pizzas AS (
    SELECT o.date,
           SUM(od.quantity) AS pizzas_per_day
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.date
)
SELECT ROUND(AVG(pizzas_per_day), 2) AS avg_pizzas_per_day
FROM daily_pizzas;
