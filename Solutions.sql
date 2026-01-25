--Q1

Select
	a.au_id as "Author ID",
	a.au_lname as "Last Name",
	a.au_fname as "First Name",
	t.title as "Title",
	p.pub_name as "Publisher"
from authors as a
join titleauthor as ta
	on a.au_id = ta.au_id
join titles as t
	on ta.title_id = t.title_id 
join publishers as p 
	on t.pub_id = p.pub_id;
	
--Q2

Select
	a.au_id as "Author ID",
	a.au_lname as "Last Name",
	a.au_fname as "First Name",
	p.pub_name as "Publisher",
	count(p.pub_name) as "Title Count"
from authors as a
join titleauthor as ta
	on a.au_id = ta.au_id
join titles as t
	on ta.title_id = t.title_id 
join publishers as p 
	on t.pub_id = p.pub_id

group by 
	a.au_id,
	a.au_lname,
	a.au_fname,
	p.pub_name
order by a.au_id DESC;

--Q3

Select
	a.au_id as "Author ID",
	a.au_lname as "Last Name",
	a.au_fname as "First Name",
	sum(s.qty) as "Number of Books Sold"
from authors as a
join titleauthor as ta
	on a.au_id = ta.au_id
join sales as s
	on ta.title_id = s.title_id
	
group by
	a.au_id,
	a.au_lname,
	a.au_fname
order by "Number of Books Sold" DESC
limit 3;

--Q4

Select
	a.au_id as "Author ID",
	a.au_lname as "Last Name",
	a.au_fname as "First Name",
	Coalesce(sum(s.qty), 0) as "Number of Books Sold"
from authors as a
left join titleauthor as ta
	on a.au_id = ta.au_id
left join sales as s
	on ta.title_id = s.title_id
	
group by
	a.au_id,
	a.au_lname,
	a.au_fname
order by "Number of Books Sold" DESC;

	
	
		




