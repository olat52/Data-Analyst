create table sales (customer_id varchar (20),
				   order_date varchar (20),
				   product_id integer);
				   
insert into sales(customer_id,order_date,product_id)

values  ('A', '2021/01/01', 1),
        ('A', '2021/01/01', 2),
        ('A', '2021/01/07', 2),
        ('A', '2021/01/10', 3),
        ('A', '2021/01/11', 3),
        ('A', '2021/01/11', 3),
        ('B', '2021/01/01', 2),
		('B', '2021/01/02', 2),
		('B', '2021/01/04', 1),
		('B', '2021/01/11', 1),
         ('B', '2021/01/16',3),
		 ('B', '2021/02/01',3),
          ('C','2021/01/01',3),
		  ('C','2021/01/01',3),
		  ('C','2021/01/07',3);


create table members (customer_id varchar (5),
				   join_date DATE);
insert into members(customer_id,join_date)         
          
          values ('A','1/7/2021'),
                 ('A','1/9/2021');
          
         
   SELECT *FROM sales;       
    SELECT *FROM members;       
     select * from menu;     
create table Menu (product_id integer,
				  product_name varchar(5),
				  price integer); 
				  
insert into menu(product_id,product_name,price)				  
		values (1,'sushi',10),
		        (2,'curry',15),
				(3,'ramen',12);
-- What is the total amount each customer spent at the restaurant?

SELECT customer_id, SUM(price) AS total_amount
FROM sales
JOIN menu ON sales.product_id = menu.product_id
GROUP BY customer_id;

-- How many days has each customer visited the restaurant?
select customer_id, count( distinct order_date)
 from sales
 group by customer_id;
-- What was the first item from the menu purchased by each customer?
select * from sales
join menu on sales.product_id =menu.product_id
order by order_date;

-- What is the most purchased item on the menu and how many times was it purchased by all customers?
select sales.product_id, count(product_name)as number_purchsed from sales
join menu on sales.product_id =menu.product_id
group by  sales.product_id;

select product_id,product_name
from menu
where product_id =3;

-- Which item was the most popular for each customer?
SELECT sales.customer_id,menu.product_id,count(*) as purchase_count
FROM sales
JOIN menu ON sales.product_id = menu.product_id
group by sales.customer_id,menu.product_id
having count(*);


select * from sales
join sales on 





SELECT s.customer_id, m.product_name, COUNT(*) AS purchase_count
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id, m.product_name
HAVING COUNT(*) = (
    SELECT MAX(purchase_count)
    FROM (
        SELECT customer_id, COUNT(*) AS purchase_count
        FROM sales
        GROUP BY customer_id, product_id
    ) AS subquery
    WHERE subquery.customer_id = s.customer_id
)
ORDER BY s.customer_id;



-- Which item was purchased first by the customer after they became a member?
SELECT sales.customer_id, members.product_name ,sales.order_date
FROM sales 
JOIN members ON sales.customer_id = members.customer_id
order by order_date;

-- Which item was purchased just before the customer became a member?
select sales.customer_id,join_date,product_id,order_date
from sales
full join members on sales.customer_id = members.customer_id
order by join_date;
-- What is the total items and amount spent for each member before they became a member?
-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
			  
         
       select * from sales;
	   select * from members;
          
          
		  
SELECT *
FROM sales
full JOIN menu ON sales.product_id = menu.product_id;	  