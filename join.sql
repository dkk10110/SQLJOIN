
select CUSTOMERS.NAME, CUSTOMERS.AGE,CUSTOMERS.SALARY,ord.amount, ord.oid, ord.customer_id as customerid,shp.shopamount as dileep,shp.name 
from ORDERS as ord  
LEFT JOIN CUSTOMERS 
ON  ord.customer_id = CUSTOMERS.ID
LEFT JOIN SHOP as shp
ON shp.oid_id = ord.oid 
GROUP BY ord.customer_id
