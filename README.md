# WHOLESALE-RETAIL-ORDERS
The dataset for my final project is this wholesale &amp; retail one found from Kaggle. It shows transactional data from a sporting goods store from the years 2017-2021.  It includes information about the customers, the products, and the suppliers.


The link to my dataset: https://www.kaggle.com/datasets/gabrielsantello/wholesale-and-retail-orders-dataset


After downloading my files from Kaggle, I created a new database in DBeaver and imported the data.
<img width="546" height="268" alt="image" src="https://github.com/user-attachments/assets/82761dfe-150c-4598-a119-6b08d125f95d" />

My **PRIMARY KEY** from the product_supplier table is **Product ID**.
In the orders table the **PRIMARY KEY** is **Order ID** and the **FOREIGN KEY** is **Product ID**.

I then checked for missing values & duplicates and found that this dataset had none! 

## Query 1
For the first query, the goal was to see what year had the highest total revenue.  The year was extracted from the dates to focus on yearly sales.  The total revenue was also calculated for each year, then these results were grouped by year and ordered by total revenue. 

**The year with the highest revenue was 2021 with $5,936,507.**


## Query 2
The second query helped find what were the top three selling products based on total revenue.  Both tables from our dataset were joined using the Product ID. Aggregation was used to find the total of units sold & the total revenue.  The top three selling items were all in the outdoor category, this tells us that outdoor products are a significant contributor to the revenue for the store. 

**The top three products sold were: Family Holiday 4, Hurricane 4, and Family Holiday 6.**
