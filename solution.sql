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
group by `AUTHOR ID` ;

---- Challenge 3 - Best Selling Authors
select `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, count(s.title_id) as `TOTAL`
from challenge1
join sales as s on `TITLE_ID`==s.title_id
group by `TITLE`
order by `TOTAL` desc 
limit 3;