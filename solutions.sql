-- Challenge 1: Who Have Published What At Where?
select a.au_id as "Author ID", 
	 a.au_lname as "Last Name", 
	 a.au_fname as "First Name",
	 t.title as "Title", 
	 p.pub_name as "Publisher"
from authors as a
join titleauthor as ta
	on a.au_id = ta.au_id
join titles as t
	on t.title_id = ta.title_id
join publishers as p
	on t.pub_id = p.pub_id;

-- Challenge 2: Who Have Published How Many At Where?
select a.au_id as "Author ID", 
	 a.au_lname as "Last Name", 
	 a.au_fname as "First Name",
	 p.pub_name as "Publisher",
	 count(t.title_id) as "Title Count"
from authors as a
join titleauthor as ta
	on a.au_id = ta.au_id
join titles as t
	on t.title_id = ta.title_id
join publishers as p
	on t.pub_id = p.pub_id
group by 
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name
ORDER BY COUNT(t.title_id) DESC;

-- Challenge 3: Best Selling Authors
select a.au_id as "Author ID", 
	 a.au_lname as "Last Name", 
	 a.au_fname as "First Name",
	 count(s.title_id) as "Total"
from authors as a
join titleauthor as ta
	on a.au_id = ta.au_id
join titles as t
	on t.title_id = ta.title_id
JOIN sales AS s
    ON t.title_id = s.title_id
group by 
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY COUNT(t.title_id) DESC
limit 3;



-- Challenge 4: Best Selling Authors Ranking
select a.au_id as "Author ID", 
	 a.au_lname as "Last Name", 
	 a.au_fname as "First Name",
	 COALESCE(count(s.qty), 0) as "Total"
from authors as a
left join titleauthor as ta
	on a.au_id = ta.au_id
left join titles as t
	on t.title_id = ta.title_id
left join sales as s
	on s.title_id = t.title_id
group by 
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY COUNT(t.title_id) DESC;