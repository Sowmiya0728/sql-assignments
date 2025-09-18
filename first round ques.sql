CREATE TABLE sales_data(
sale_id INT,
product_id INT,
sale_date DATE,
revenue DECIMAL (10,2),
city VARCHAR(100)
);
DROP TABLE IF EXISTS sales_data;

CREATE TABLE sales_data (
    sale_id INT,
    product_id INT,
    sale_date DATE,
    revenue DECIMAL(10,2),
    city VARCHAR(100)
);
INSERT INTO sales_data( sale_id, product_id, sale_date, revenue, city) VALUES
(101, 1, '2024-01-15', 150, 'New York'),
(102, 2, '2024-01-20', 250.5, 'Los Angeles'),
(103, 1, '2024-02-10', 150, 'New York'),
(104, 3, '2024-02-25', 300.75, 'Chicago'),
(105, 2, '2024-03-05', 250.5, 'Los Angeles'),
(106, 4, '2023-04-10', 500, 'New York'),
(107, 1, '2024-03-12', 150, 'Chicago'),
(108, 5, '2024-04-01', 450, 'Los Angeles'),
(109, 3, '2024-04-15', 300.75, 'New York'),
(110, 1, '2024-05-20', 150, 'Los Angeles'),
(111, 2, '2024-06-05', 250.5, 'Chicago'),
(112, 4, '2024-07-10', 500, 'Los Angeles'),
(113, 1, '2024-08-18', 150, 'New York'),
(114, 3, '2024-09-22', 300.75, 'Chicago'),
(115, 5, '2024-10-30', 450, 'New York');
SELECT 
    city,
	total_revenue, 
    RANK() OVER (ORDER BY total_revenue DESC) AS ranking
FROM (
	SELECT
		city,
		SUM(revenue) AS total_revenue
    FROM sales_data
	WHERE YEAR(sale_date) = 2024 
	GROUP BY city
) AS sub
ORDER BY total_revenue DESC;