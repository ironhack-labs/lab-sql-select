--Who Have Published What At Where?
SELECT
	authors.au_id as "Author ID",
	authors.au_lname as "Last Name",
	authors.au_fname as "First Name",
	titles.title as "Title",
	publishers.pub_name as "Publishers"
from authors, titles, publishers, titleauthor
where authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and titles.pub_id=publishers.pub_id;

--Who Have Published How Many At Where?
SELECT
	authors.au_id as "Author ID",
	authors.au_lname as "Last Name",
	authors.au_fname as "First Name",
	publishers.pub_name as "Publishers",
	count(titles.title_id) as "Title count"
from authors,titleauthor, titles, publishers
where authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and titles.pub_id=publishers.pub_id
group by
	authors.au_id,
	authors.au_lname,
	authors.au_fname,
	publishers.pub_name
order by 
	authors.au_id desc,
	publishers.pub_name desc;

--Best Selling Authors
SELECT
	a.au_id as "Author ID",
	a.au_lname as "Last name",
	a.au_fname as "First name",
	sum(t.ytd_sales) as "Total"
from authors a 
join titleauthor ta on a.au_id=ta.au_id
join titles t on ta.title_id=t.title_id
join sales s on t.title_id=s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by "total" DESC limit 3;
   
--Best Selling Authors Ranking
SELECT
	a.au_id as "Author ID",
	a.au_lname as "Last name",
	a.au_fname as "First name",
	coalesce(sum(t.ytd_sales), 0) as "Total"
from authors a   
left join titleauthor ta on a.au_id=ta.au_id
left join titles t on ta.title_id=t.title_id
group by a.au_id, a.au_lname, a.au_fname
order by "total" desc;
	

