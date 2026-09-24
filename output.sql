/*Challenge 1*/
select 
a.au_id as "AUTHOR ID", 
a.au_id as "LAST NAME", 
a.au_id as "FIRST NAME", 
t.title as "TITLE", 
p.pub_name as "PUBLISHER"
from authors as a
join titleauthor as ta
on a.au_id = ta.au_id
join titles as t
on ta.title_id = t.title_id
join publishers as p
on t.pub_id = p.pub_id;

/*Challenge 2*/
select
a.au_id as "AUTHOR ID",
a.au_lname as "LAST NAME",
a.au_fname as "FIRST NAME",
p.pub_name as "PUBLISHER",
count(t.title_id) as "TITLE COUNT"
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
    p.pub_id,
    p.pub_name;
	
/*Challenge 3*/
select
a.au_id as "AUTHOR ID",
a.au_lname as "LAST NAME",
a.au_fname as "FIRST NAME",
sum(s.qty) as "TOTAL"
from authors as a
join titleauthor as ta
on a.au_id = ta.au_id
join sales as s
on ta.title_id = s.title_id
group by
a.au_id,
a.au_lname,
a.au_fname
order by "TOTAL" desc
limit 3;



