CREATE VIEW Sales_Data_for_Power_BI AS 
SELECT 
    orderDate,
    o.orderNumber,
    productName,
    productLine,
    customerName,
    cust.country AS Customer_Country,
    offc.country AS Office_Country,
    buyPrice,
    priceEach,
    quantityOrdered,
    quantityOrdered * priceEach AS Sales_Value,
    quantityOrdered * buyPrice AS Cost_of_Sales
FROM orders o
JOIN orderdetails ord ON o.orderNumber = ord.orderNumber
JOIN customers cust ON cust.customerNumber = o.customerNumber
JOIN products p ON p.productCode = ord.productCode
JOIN employees emp ON emp.employeeNumber = cust.salesRepEmployeeNumber
JOIN offices offc ON offc.officeCode = emp.officeCode;
