create database Sales;
use sales;
select * from sales_dataset;

# Q1. Retrieve all customers who bought Electronics.
select distinct * 
from sales_dataset 
where category="Electronics";

#Q2. Find total sales revenue.
select sum(quantity * price) as Total_Revenue
from sales_dataset;

#Q3. Find the number of orders by each region.
select region, count(orderid) 
from sales_dataset 
group by region;

#Q4. Find the average age of customers buying Apparel.
select avg(age) as AVG_Age_Apparel
from sales_dataset
where category="Apparel";

#Q5. List top 3 highest value orders (Quantity * Price).
select * , (Quantity*Price) as OrderValue
from sales_dataset
order by OrderValue desc
limit 3;

#Q6. Find the customer who spent the most overall.
select customername, sum(Quantity*Price) as Total_Spent
from sales_dataset
group by customername
order by Total_Spent desc
limit 1;

#Q7. Find monthly sales revenue.
select date_format(orderdate, "%Y-%m") as Month,
sum(Quantity*Price) as Total_Revenue
from sales_dataset
group by date_format(orderdate, "%Y-%m");

#Q8. Count how many unique customers are from each region.
select region, count(distinct customerid) 
from sales_dataset
group by region;

#Q9. Find products bought by customers aged below 30.
select distinct(Product) 
from sales_dataset
where age<30;

#Q10. Show category-wise revenue contribution.
select category, sum(Quantity*Price) as Revenue
from sales_dataset
group by category
order by revenue desc;

#Q11. Find the top-selling product by quantity.
select product, sum(quantity) as Total_Quantity
from sales_dataset
group by product
order by Total_Quantity desc
limit 1;

#Q12. Find the average order value (AOV).
select avg(quantity*price) as AVG_Ordervalue
from sales_dataset;

#Q13. Show the number of male vs female customers.
select Gender, count(distinct customerid) as CustomerCount
from sales_dataset
group by gender;

#Q14. Find customers who placed more than 1 order.
select customername, count(orderid) as Order_Placed
from sales_dataset
group by customername
Having count(orderid) >1;

#Q15. Show each customer’s last purchase date.
select customername, max(orderdate)	 as Last_Purchase
from sales_dataset
group by customername;