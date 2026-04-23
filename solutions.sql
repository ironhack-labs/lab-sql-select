-- Challenge 1 - Who Have Published What At Where?
--In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. 
--Your output should have at least the following columns:

--AUTHOR ID - the ID of the author
--LAST NAME - author last name
--FIRST NAME - author first name
--TITLE - name of the published title
--PUBLISHER - name of the publisher where the title was published

select a.au_id,
	   a.au_lname,
	   a.au_fname,
	   t.title,
	   p.pub_name
FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- Self-reference . quantos titulos cada autor publicou em cada editora 

select a.au_id,
	   a.au_lname,
	   a.au_fname,
	   count(t.title) as title_count,
	   p.pub_name
FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
group by a.au_id, a.au_lname,  a.au_fname, p.pub_name;

-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

select a.au_id,
	   a.au_lname,
	   a.au_fname,
	   sum(s.qty) as total
FROM authors a
JOIN titleauthor ta on a.au_id = ta.au_id
JOIN sales s on ta.title_id = s.title_id
GROUP by s.qty,
	     a.au_id,
		a.au_lname,
		a.au_fname
ORDER by total DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking

select a.au_id as 'Author ID',
	   a.au_lname as 'Last Name',
	   a.au_fname as 'First Name',
	   COALESCE(sum(s.qty), 0) as total
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
LEFT JOIN sales s on ta.title_id = s.title_id
GROUP by a.au_id,
		a.au_lname,
		a.au_fname
ORDER by total DESC;
