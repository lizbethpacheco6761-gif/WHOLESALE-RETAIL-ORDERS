
-- CHECKING TO SEE IF THERE ARE MISSING VALUES IN orders --
SELECT *
FROM orders
WHERE
  "Customer ID" IS NULL
  OR "Customer Status" IS NULL
  OR "Date Order was placed" IS NULL
  OR "Delivery Date" IS NULL
  OR "Order ID" IS NULL
  OR "Product ID" IS NULL
  OR "Quantity Ordered" IS NULL
  OR "Total Retail Price for This Order" IS NULL
  OR "Cost Price Per Unit" IS NULL;

-- CHECKING FOR MISSING VALUES IN product_supplier --
SELECT *
FROM product_supplier
WHERE
	"Product ID" IS NULL
	OR "Product Line" IS NULL
	OR "Product Category" IS NULL
	OR "Product Group" IS NULL
	OR "Product Name" IS NULL
	OR "Supplier Country" IS NULL
	OR "Supplier Name" IS NULL
	OR "Supplier ID" IS NULL;

--- NO MISSING VALUES IN ANY TABLE ---

-- CHECKING FOR DUPES IN orders TABLE --
SELECT o."Order ID", COUNT(*) AS uniqueOrders
FROM orders o 
GROUP BY o."Order ID"
HAVING COUNT(*) > 1;

-- CHECKING FOR DUPES IN product_supplier TABLE --
SELECT ps."Product ID", COUNT(*) AS uniqueProduct
FROM product_supplier ps 
GROUP BY ps."Product ID"
HAVING COUNT(*) > 1;

--- THERE WERE NO DUPLICATES FOUND IN EITHER TABLE ---

-- QUERY 1
	-- Which year had the highest total revenue?
SELECT
  ('20' || substr("Date Order was placed", -2)) AS orderYear,
  ROUND(SUM("Total Retail Price for This Order"), 2) AS totalRevenue
FROM orders
GROUP BY orderYear
ORDER BY totalRevenue DESC
LIMIT 1;

-- QUERY 2
	-- What are the top 3 best selling products by revenue?
SELECT
	o."Product ID" AS productID,
	ps."Product Name" AS productName,
	ps."Product Category" AS productCategory,
	ROUND(SUM(o."Total Retail Price for this Order"),2) AS totalRevenue,
	SUM(o."Quantity Ordered") AS totalUnitsSold
FROM orders o 
INNER JOIN product_supplier ps 
	ON o."Product ID" = ps."Product ID"
GROUP BY o."Product ID", ps."Product Name", ps."Product Category"
ORDER BY totalRevenue DESC
LIMIT 3;

-- QUERY 3
	-- What's the total revenue for each category?
SELECT
	ps."Product Category" AS productCategory,
	ROUND(SUM(o."Total Retail Price for This Order"), 2) AS totalRevenue,
	SUM(o."Quantity Ordered") AS totalUnitsSold
FROM orders o
INNER JOIN product_supplier ps 
	ON o."Product ID" = ps."Product ID" 
GROUP BY ps."Product Category" 
ORDER BY totalRevenue DESC;

-- QUERY 4
	-- What is the average order value for each customer status?
SELECT 
	UPPER(o."Customer Status") AS customerStatus,
	ROUND(AVG(o."Total Retail Price for This Order"),2) AS orderAvg
FROM orders o 
GROUP BY UPPER(o."Customer Status")
ORDER BY orderAvg DESC;

-- QUERY 5
	-- What is the average order valuer by category?
WITH category_orders AS (
	SELECT 
		ps."Product Category" AS productCategory,
		o."Total Retail Price for This Order" AS orderValue
	FROM orders o 
	INNER JOIN product_supplier ps 
		ON o."Product ID" = ps."Product ID"
)
SELECT
	productCategory,
	ROUND(AVG(orderValue),2) AS avgOrderValue
FROM category_orders 
GROUP BY productCategory 
ORDER BY avgOrderValue DESC;
