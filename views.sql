USE business_analytics;

CREATE OR REPLACE VIEW order_summary AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.city,
    c.segment,
    p.product_name,
    p.category,
    o.quantity,
    p.unit_price,
    ROUND(o.quantity * p.unit_price, 2) AS order_value,
    o.payment_method
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT * FROM order_summary;
