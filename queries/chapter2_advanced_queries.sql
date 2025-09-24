-- Task 1: List the top 5 most ordered pizza types along with their quantities.
WITH cte AS (
    SELECT o.pizza_id, o.quantity, p.pizza_type_id
    FROM order_details AS o
    LEFT JOIN pizzas AS p ON o.pizza_id = p.pizza_id
),
cte1 AS (
    SELECT pizza_type_id, SUM(quantity) AS quan
    FROM cte
    GROUP BY pizza_type_id
),
cte2 AS (
    SELECT *
    FROM (
        SELECT pizza_type_id, quan,
               RANK() OVER(ORDER BY quan DESC) AS rnk
        FROM cte1
    ) AS a
    WHERE rnk <= 5
)
SELECT c.*, p.name
FROM cte2 AS c
LEFT JOIN pizza_types AS p ON c.pizza_type_id = p.pizza_type_id;


-- Task 2: Determine the distribution of orders by hour of the day.
SELECT HOUR(time) AS order_hour,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY HOUR(time)
ORDER BY order_hour;


-- Task 3: Determine the top 3 most ordered pizza types based on revenue.
SELECT p1.name,
       SUM(o.quantity * p.price) AS revenue
FROM order_details AS o 
LEFT JOIN pizzas AS p ON o.pizza_id = p.pizza_id
LEFT JOIN pizza_types AS p1 ON p.pizza_type_id = p1.pizza_type_id
GROUP BY p1.name
ORDER BY revenue DESC
LIMIT 3;
