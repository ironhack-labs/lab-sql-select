-- Challenge 1
select 
    au.au_id as "author id",
    au.au_lname as "last name",
    au.au_fname as "first name",
    t.title as "title",
    p.pub_name as "publisher"
from authors as au
join titleauthor as tau on au.au_id = tau.au_id
join titles as t on tau.title_id = t.title_id
join publishers as p on t.pub_id = p.pub_id
order by au.au_id, t.title;

-- select count(*) from titleauthor; --25

-- Challenge 2 
select 
    au.au_id as "author id",
    au.au_lname as "last name",
    au.au_fname as "first name",
    p.pub_name as "publisher",
    count(*) as "title count"
from authors as au
join titleauthor as tau on au.au_id = tau.au_id
join titles as t on tau.title_id = t.title_id
join publishers as p on t.pub_id = p.pub_id
group by au.au_id, au.au_lname, au.au_fname, p.pub_name
order by au.au_id, p.pub_name;

-- Challenge 3
select 
    au.au_id as "author id",
    au.au_lname as "last name",
    au.au_fname as "first name",
    sum(s.qty) as "total"
from authors as au
join titleauthor as tau on au.au_id = tau.au_id
join titles as t on tau.title_id = t.title_id
join sales as s on t.title_id = s.title_id
group by au.au_id, au.au_lname, au.au_fname
order by "total" desc
limit 3;

-- Challenge 4
select 
    au.au_id as "author id",
    au.au_lname as "last name",
    au.au_fname as "first name",
    coalesce(sum(s.qty), 0) as "total"
from authors as au
left join titleauthor as tau on au.au_id = tau.au_id
left join titles as t on tau.title_id = t.title_id
left join sales as s on t.title_id = s.title_id
group by au.au_id, au.au_lname, au.au_fname
order by "total" desc;