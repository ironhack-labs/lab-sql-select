----- Challenge 1 - Who Have Published What At Where?
drop table challenge1;
create table challenge1 as
select a.au_id as `AUTHOR ID`, a.au_lname as `LAST NAME`, a.au_fname as  `FIRST NAME`, 
	t.title as `TITLE`, p.pub_name as `PUBLISHER`
from authors as a 
join titleauthor as ta on a.au_id=ta.au_id
join titles as t on ta.title_id=t.title_id
join publishers as p on p.pub_id=t.pub_id;

---- Challenge 2 - Who Have Published How Many At Where?
select `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`, count(title) as `TITLE COUNT`
from challenge1
group by  `PUBLISHER`, `AUTHOR ID`, `LAST NAME`, `FIRST NAME` 
order by `AUTHOR ID` desc;

---- Challenge 3 - Best Selling Authors
select a.au_id as `AUTHOR ID`, a.au_lname as `LAST NAME`, a.au_fname as  `FIRST NAME`, 
	(count( s.title_id) * s.qty) as `TOTAL`-- ,  sum(s.qty) as `SALES`
from authors as a 
join titleauthor as ta on a.au_id=ta.au_id
join sales as s on s.title_id=ta.title_id
group by ta.au_id,   a.au_lname, a.au_fname
order by `TOTAL`  desc
limit 3;

-- -- Challenge 4 - Best Selling Authors Ranking
select a.au_id as `AUTHOR ID`, a.au_lname as `LAST NAME`, a.au_fname as  `FIRST NAME`, 
	(count( s.title_id) * s.qty) as `TOTAL`-- ,  sum(s.qty) as `SALES`
from authors as a 
full outer join titleauthor as ta on a.au_id=ta.au_id
full outer join sales as s on s.title_id=ta.title_id
group by ta.au_id,   a.au_lname, a.au_fname
order by `TOTAL` desc;