-- Practice case SQL DATA FELLOWSHIP IYKRA BATCH 6
-- LAILA FITRIA


-- - Question1 : A customer wants to know the films about “astronauts”. How many recommendations could you give for him?
select count(film_id) from film where description like '%stronaut%'

select * from film where description like '%stronaut%'

 --- Question2 : I wonder, how many films have a rating of “R” and a replacement cost between $5 and $15?
select * from film where rating = 'R' and replacement_cost between 5 and 15


--- Question3 : We have two staff members with staff IDs 1 and 2.
--- We want to give a bonus to the staff member that handled the most payments.
--- How many payments did each staff member handle? And how much was the total amount processed by each staff member?
select S.staff_id as Staffid, 
S.first_name as FirstName, 
sum (P.amount) as sumAmount
,count(P.customer_id)as CountAmount from staff s 
inner join payment P on S.staff_id = P.staff_id
group by S.staff_id

--- Question4 : Corporate headquarters is auditing the store! They want to know the average replacement cost of movies by rating!

select rating, avg(replacement_cost) 
as AVGReplacementCost from film
group by rating order by rating asc


--- Question5 : We want to send coupons to the 5 customers who have spent the most amount of money.
-- Get the customer name, email and their spent amount!

select c.first_name as 
FirstName, c.email, sum(p.amount) as TotalAmount
from customer C inner join payment p
on c.customer_id = p.customer_id
group by c.customer_id order by TotalAmount desc limit 5

--- Question6 : We want to audit our stock of films in all of our stores 
--- How many copies of each movie in each store, do we have?

select film_id,
count (film_id) as TotalFilm, store_id
from inventory group by film_id, store_id 
order by film_id 

--- Question7 : -	We want to know what customers are eligible for our platinum credit card.
--- The requirements are that the customer has at least a total of 40 transaction payments. 
--- Get the customer name, email who are eligible for the credit card! 

select c.first_name as firstName
, c.email as Email
, count(p.payment_id) as Total
from customer c 
inner join payment p 
on c.customer_id = p.customer_id 
group by c.customer_id having count (p.payment_id) >= 40

