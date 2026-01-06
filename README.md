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

## Query 3
Going off on the query before, this query helps show the total revenue for each category.  Both tables were joined on Product ID, the sum of units sold and total revenue were also aggregated.  The results show that there are 12 different categories in this sporting goods store that generate revenue.  The highest total revenue was from the **OUTDOORS** category with a total revenue of **$5,688,483.11** and **45,527** units sold. The category with the lowest revenue was **SWIM SPORTS** with a revenue of **$286,498.79** and **8,270** units sold.

## Query 4
For the fourth query, I calculated the average order value for each customer status (Silver, Platinum, and Gold) by grouping orders on status and using the AVG() function on the total retail prices.  The three averages did not differ too much from each other, meaning the customer status does not impact the average total per order. 

**Silver is $139.23**

**Platinum is $139.20**

**Gold is $137.89**

## Query 5
For the final query, I used a CTE to show the average order value by product category.  The top three are **Winter Sports ($251.80)**, **Indoor Sports ($231.11)**, and **Outdoors ($210.79)**. The three categories with the least average order value are **Children Sports ($59.44)**, **Swim Sports ($55.86)**, and **Team Sports ($49.87)**.  This indicates that the higher categories have higher-priced items & the lower categories make revenue through lower-priced items
