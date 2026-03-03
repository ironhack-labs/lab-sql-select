--Challenge 1
SELECT titleauthor.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER' FROM titles 
JOIN titleauthor  ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN publishers ON publishers.pub_id = titles.pub_id;

--Challenge 2
SELECT titleauthor.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER', COUNT(*) AS 'TITLE COUNT' FROM titles 
JOIN titleauthor  ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY titleauthor.au_id, publishers.pub_id;

--Challenge 3
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;


--Challenge 4
DROP VIEW IF EXISTS sales_per_author;

CREATE VIEW sales_per_author AS 
	SELECT authors.au_id, SUM(sales.qty) AS "sales_qty"
	FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
	JOIN sales ON sales.title_id = titleauthor.title_id
	GROUP BY titleauthor.au_id;
	

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', CASE WHEN sales_per_author.sales_qty IS NULL THEN 0 ELSE sales_per_author.sales_qty END AS 'TOTAL'
 FROM authors
 LEFT JOIN sales_per_author ON sales_per_author.au_id = authors.au_id
 ORDER BY sales_per_author.sales_qty DESC