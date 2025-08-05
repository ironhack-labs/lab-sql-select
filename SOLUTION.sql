-- 1. In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
SELECT 
	a.au_id,
	a.au_lname,
	a.au_fname,
	t.title, p.pub_name
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t on ta.title_id = t.title_id 
JOIN publishers AS p ON t.pub_id = p.pub_id;

--2. Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:
SELECT
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name,
	COUNT(titles.title_id) AS "TITLE COUNT"
FROM
    authors
JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN
    titles ON titleauthor.title_id = titles.title_id
JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY 
	authors.au_lname,
	publishers.pub_name

-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
'SELECT authors.au_id, authors.au_fname,authors.lname, count(s.qty) as "total"
from authors as a
join titles as t on t.title_id = a.title_id
join sales as s on t.title_id=s.title_id
group by a.au_id, a.au_lname,a.au_fname
ORDER BY "total" DESC LIMIT 3;'

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COUNT(s.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC LIMIT 3;

-- 4. Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(COUNT(s.qty), 0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC;