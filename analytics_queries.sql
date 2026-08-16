USE business_analytics;

-- 1. Total revenue
SELECT ROUND(SUM(o.quantity * p.unit_price), 2) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 2. Revenue by category
SELECT
    p.category,
    ROUND(SUM(o.quantity * p.unit_price), 2) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 3. Top products by revenue
SELECT
    p.product_name,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(o.quantity * p.unit_price), 2) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

-- 4. Customer contribution
SELECT
    c.customer_name,
    c.segment,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(o.quantity * p.unit_price), 2) AS customer_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY customer_revenue DESC;

-- 5. Monthly revenue
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(o.quantity * p.unit_price), 2) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- 6. Payment method distribution
SELECT
    payment_method,
    COUNT(*) AS transactions
FROM orders
GROUP BY payment_method
ORDER BY transactions DESC;

-- 7. Premium vs regular customer revenue
SELECT
    c.segment,
    ROUND(SUM(o.quantity * p.unit_price), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.segment
ORDER BY revenue DESC;

-- 8. Average order value
SELECT
    ROUND(SUM(o.quantity * p.unit_price) / COUNT(DISTINCT o.order_id), 2)
    AS average_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 9. Orders by city
SELECT
    c.city,
    COUNT(DISTINCT o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY order_count DESC;
