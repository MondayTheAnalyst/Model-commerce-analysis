---Que 1. Can you please give me an overview of sales for 2004?
-----I would like to see a break down by product, country and city, and please include sales value, cost of sales and profit. 
with Sales_cte as
(
SELECT
	   orderDate,
	   t1.orderNumber,
	   quantityOrdered,
	   priceEach,
	   productName,
	   productLine,
	   buyPrice,
	   city,
	   country,
	   quantityOrdered * priceEach as Sales_Value,
	   quantityOrdered * buyPrice as Cost_of_Sales
FROM orders t1 JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN products t3
	ON t3.productCode = t2.productCode
	JOIN customers t4
	ON t4.customerNumber =t1.customerNumber
WHERE 
	YEAR(orderDate) = 2004
)
SELECT
	*,
	Sales_Value - Cost_of_Sales as Net_Profit
FROM
	Sales_cte


-------Que 2
-----Can you give me a breakdown of what products are commonly purchased together, and any products that are rarely purchased together.

with Prod_CTE as 
(
SELECT 
	t1.orderNumber,
	t1.productCode,
	t2.productLine
FROM
	orderdetails t1 JOIN products t2
	ON t1.productCode = t2.productCode
)
SELECT DISTINCT 
	t1.orderNumber,
	t1.productLine as product_1,
	t2.productLine as product_2
FROM 
	Prod_CTE t1 LEFT JOIN  Prod_CTE t2
	ON t1.orderNumber = t2.orderNumber
	AND t1.productLine != t2.productLine

ORDER BY
	t1.orderNumber;


----- Que 3
---Can you show me a breakdown of sales but also show the credit limit? 
---Maybe group the credit limits as I want a high level view to see if we get higher sales for customers who have a higher credit limit which we would expect.

with sales as
(
SELECT 
	t1.orderNumber,
	t3.customerNumber,
	productCode,
	priceEach,
	quantityOrdered,
	priceEach*quantityOrdered as Sales_Value,
	creditLimit
FROM
	orders t1 JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN customers t3
	ON t1.customerNumber = t3.customerNumber
	)

SELECT
	orderNumber,
	customerNumber,
CASE WHEN creditLimit < 75000 then 'a: less than $75k'
	 WHEN creditLimit between  75000 and 100000 then 'b: $75k - $100k'
	 WHEN creditLimit between  100000 and 150000 then 'c: $100k - $150k' 
	 WHEN creditLimit > 150000 then 'c: Over $150k' 
	 ELSE 'other'
END AS Creditlimit_Group,
	SUM(Sales_Value) as Sales_value
FROM
	sales
GROUP BY
	orderNumber,
	customerNumber,
	creditLimit
ORDER BY
	customerNumber;



---- Q4
--Can I have a view showing customers sales and include a column which shows the difference in value  from their previous sale? 
--I want to see if new customers who make their first purchase  are likely to spend 


with sales as
(
SELECT
	t1.orderNumber,
	t1.orderDate,
	productCode,
	t1.customerNumber,
	priceEach*quantityOrdered as Sales_Value
FROM
	orders t1 JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN customers t3
	ON t1.customerNumber = t3.customerNumber
),
 main_cte as 
(
SELECT
	orderNumber,
	orderDate,
	customerNumber,
	SUM(Sales_Value) as Sales_Value
FROM
	sales
GROUP BY
	orderNumber,
	orderDate,
	customerNumber
),
Sales_query as
(
SELECT
	t1.*,
	customerName,
	ROW_NUMBER() OVER (PARTITION BY customername ORDER BY orderdate) as Purcahse_Number,
	LAG(Sales_Value) OVER (PARTITION BY customername ORDER BY orderdate) as Previous_Sale_Value
FROM
	main_cte t1 JOIN customers t2
	ON t1.customerNumber = t2.customerNumber
)

SELECT 
	*,
	Sales_Value - Previous_Sale_Value as Purchase_Value_Change
FROM
	Sales_query
WHERE
	Previous_Sale_Value IS NOT NULL;



------- Q5
----Can you show me a view of where the customers of each office are located.
with CTE as
(
SELECT 
	t1.orderNumber,
	t2.productCode,
	quantityOrdered,
	priceEach,
	quantityOrdered * priceEach as Sales_Value,
	t3.city as Customer_City,
	t3.country as Customer_Country,
	productLine,
	t6.city as Office_City,
	t6.country as Office_Country
FROM 
	orders t1 JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN customers t3
	ON t3.customerNumber = t1.customerNumber
	JOIN products t4
	ON t4.productCode = t2.productCode
	JOIN employees t5
	ON t5.employeeNumber = t3.salesRepEmployeeNumber
	JOIN offices t6
	ON t6.officeCode = t5.officeCode
)

SELECT 
	orderNumber,
	Customer_City,
	Customer_Country,
	productLine,
	Office_City,
	Office_Country,
	SUM(Sales_Value) as Sales_Value 
FROM
	CTE
GROUP BY
	orderNumber,
	Customer_City,
	Customer_Country,
	productLine,
	Office_City,
	Office_Country;

---QUE 6
--- We have discovered that shipping is delayed due to the weather , and its possible they will take up to 3 days to arrive.
--- Can you get me a list of affected orders

WITH Late_flag_CTE as
(
SELECT
	 *,
	 DATEADD(day,3,shippeddate) as Latest_arrival,
CASE WHEN DATEADD(day,3,shippeddate) > requiredDate THEN 1 ELSE 0
END  AS Late_flag
FROM
	orders
)
SELECT
	*
FROM 
	Late_flag_CTE
WHERE
	Late_flag = 1
