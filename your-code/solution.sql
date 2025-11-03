
select distinct 
a.au_id as author_id, 
a.au_lname as last_name, 
a.au_fname as first_name,
 ti.title as title, 
 p.pub_name as publisher
from titleauthor ta
left join  authors a
on ta.au_id = a.au_id
left join titles ti
on ta.title_id = ti.title_id
left join publishers p
on ti.pub_id = p.pub_id ;



select 
author_id, 
last_name,
first_name, 
publisher,
count(title) as title_count
from(
select distinct 
a.au_id as author_id, 
a.au_lname as last_name, 
a.au_fname as first_name,
 ti.title as title, 
 p.pub_name as publisher
from titleauthor ta
left join  authors a
on ta.au_id = a.au_id
left join titles ti
on ta.title_id = ti.title_id
left join publishers p
on ti.pub_id = p.pub_id 
)
group by author_id, publisher
order by title_count desc ;





select  
a.au_id as author_id, 
a.au_lname as last_name, 
a.au_fname as first_name,
sum(ytd_sales) as total
from titleauthor ta
left join  authors a
on ta.au_id = a.au_id
left join titles t
on ta.title_id = t.title_id 
group by author_id 
order by total desc 
limit 3;



select  
distinct
a.au_id as author_id, 
a.au_lname as last_name, 
a.au_fname as first_name,
coalesce(sum(t.ytd_sales), 0) as total
from authors a
left join   titleauthor ta
on ta.au_id = a.au_id
left join titles t
on ta.title_id = t.title_id 
group by author_id 
order by total desc ;


