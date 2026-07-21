use music;
show tables;
#who is the most Senior employee based on job title
select * from employee order by levels desc limit  1;
select year(birthdate) from employee;
SELECT   employee_id,first_name,max(YEAR(STR_TO_DATE(birthdate, '%d-%m-%Y %H:%i'))) as year
FROM employee group by first_name,employee_id order by year asc limit 1;
describe employee;
select * from employee where first_name='Mohan';

#q2
select distinct(billing_country),count(invoice_id) as most from invoice
group by billing_country  order by most desc;


#q3
select * from invoice order by total desc limit 3;

#q4
select * from invoice;
select billing_city,sum(total) as most from invoice
group by billing_city order by most desc;

#q5
select c.First_name,c.customer_id,sum(i.total)as total from customer c join invoice i on c.customer_id=i.customer_id
group by c.customer_id,c.first_name order by total desc;

#q6
select distinct email,first_name,last_name from customer c join invoice i on
c.customer_id=i.customer_id join invoice_line ii on i.invoice_id=ii.invoice_id 
where track_id in(
select track_id from track t
join genre g on t.genre_id=g.genre_id
where g.name='Rock' )
order by email; 


#q6

select a.artist_id,a.name,count(a.artist_id) as Number_of_track from
track t join album al on t.album_id=al.album_id
join artist a on a.artist_id=al.artist_id
join genre g on t.genre_id=g.genre_id where g.name='Rock'
group by a.artist_id,a.name
order by Number_of_track desc limit 10;


#q7
select name,milliseconds from track
where milliseconds>(select avg(milliseconds) from track)
order by milliseconds desc;

#q7
with cte as(select a.artist_id,a.name,sum(i.unit_price*i.quantity) as total_sales
from track t join invoice_line i on t.track_id=i.track_id
join album al on t.album_id=al.album_id
join artist a on a.artist_id=al.artist_id
group by a.artist_id,a.name
order by total_sales desc)
select c.customer_id,c.first_name,ct.artist_id,ct.name,sum(ii.unit_price*ii.quantity) from customer c join invoice i on
i.customer_id=c.customer_id join invoice_line ii on i.invoice_id=ii.invoice_id
join track t on t.track_id=ii.track_id join album al on al.album_id=t.album_id join
cte ct on ct.artist_id=al.artist_id
group by 1,2,3,4
order by 5 desc;


#q 2 Advanced
with group_sales as(select distinct(i.billing_country) as country ,g.genre_id,g.name,count(*) as purchases from invoice i join invoice_line ii on i.invoice_id=ii.invoice_id
join track t on t.track_id=ii.track_id join genre g on t.genre_id=g.genre_id
group by 1,2,3),
max_sales as(select country,max(purchases) as max_purchase from group_sales
group by country)
select g.country,g.genre_id,g.name,g.purchases from group_sales g join max_sales m on
g.country=m.country and g.purchases=m.max_purchase
group by 1,2,3,4
order by 1;
#q3 Advanced question

 with country as(select c.customer_id,c.first_name,c.last_name,i.billing_country,sum(i.total) as total_spend from 
 customer c join invoice i on c.customer_id=i.customer_id 
 group by 1,2,3,4
 order by 1,5 desc),
 max_spending as(select billing_country,max(total_spend) as max_spend
 from country
 group by billing_country)
 select c.customer_id,c.first_name,c.last_name,c.billing_country,c.total_spend 
 from country c join max_spending m on
 c.billing_country=m.billing_country and
 c.total_spend=m.max_spend
 order by 4;
 
 with cte as(select c.customer_id,c.first_name,c.last_name,i.billing_country,sum(i.total) as total_spend,
 row_number() over(partition by i.billing_country order by sum(i.total) desc) as Rankno from customer c join
 invoice i on c.customer_id=i.customer_id
 group by 1,2,3,4
 order by 4 asc,5 desc)
 select * from cte where Rankno <=1;
 






























