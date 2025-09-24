-- Task 1: Calculate the percentage contribution of each pizza type to total revenue.
SELECT p2.name AS pizza_type,
       SUM(o.quantity * p1.price) AS revenue,
       ROUND(
           SUM(o.quantity * p1.price) * 100.0 /
           (SELECT SUM(o2.quantity * p3.price)
            FROM order_details o2
            JOIN pizzas p3 ON o2.pizza_id = p3.pizza_id),
           2
       ) AS percentage_contribution
FROM order_details o
JOIN pizzas p1 ON o.pizza_id = p1.pizza_id
JOIN pizza_types p2 ON p1.pizza_type_id = p2.pizza_type_id
GROUP BY p2.name
ORDER BY percentage_contribution DESC;


-- Task 2: Analyze the cumulative revenue generated over time.
SELECT o.date,
       ROUND(SUM(od.quantity * p.price), 2) AS daily_revenue,
       ROUND(SUM(SUM(od.quantity * p.price)) 
             OVER (ORDER BY o.date), 2) AS cumulative_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.date
ORDER BY o.date;


-- Task 3: Determine the top 3 most ordered pizza types based on revenue for each pizza category.
WITH cte AS (
    SELECT p1.category,
           p1.name,
           SUM(o.quantity * p.price) AS revenue,
           RANK() OVER (PARTITION BY p1.category ORDER BY SUM(o.quantity * p.price) DESC) AS rnk
    FROM order_details AS o
    LEFT JOIN pizzas AS p ON o.pizza_id = p.pizza_id
    LEFT JOIN pizza_types AS p1 ON p.pizza_type_id = p1.pizza_type_id
    GROUP BY p1.category, p1.name
)
SELECT *
FROM cte
WHERE rnk <= 3;
