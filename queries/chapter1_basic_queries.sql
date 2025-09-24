-- Task 1: Retrieve the total number of orders placed.
SELECT COUNT(order_id) AS total_orders FROM orders;

-- Task 2: Calculate the total revenue generated from pizza sales.
WITH revenue AS (
    SELECT o.*, p.price
    FROM order_details AS o
    LEFT JOIN pizzas AS p ON o.pizza_id = p.pizza_id
)
SELECT SUM(price) AS total_revenue FROM revenue;

-- Task 3: Identify the highest-priced pizza.
SELECT pizza_id, price
FROM pizzas
WHERE price = (SELECT MAX(price) FROM pizzas);

-- Task 4: Identify the most common pizza size ordered.
SELECT p.size, SUM(o.quantity) AS total_ordered
FROM order_details o
JOIN pizzas p ON o.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_ordered DESC
LIMIT 1;
