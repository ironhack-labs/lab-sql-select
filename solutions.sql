-- CHALLENGE 1 
SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id and
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id;
	
	
	-- CHALLENGE 2
SELECT 
    authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME",	
	publishers.pub_name AS "PUBLISHER", 
	COUNT (titleauthor.title_id) AS  "TITLE COUNT" 
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id and
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
GROUP by authors.au_id;


	-- CHALLENGE 3
SELECT 
	authors.au_id AS "AUTHOR ID",  
	authors.au_lname AS "LAST NAME",  
	authors.au_fname AS "FIRST NAME",	 
	sum(sales.qty) AS  "TOTAL" 
FROM authors, titles, titleauthor, sales
WHERE 
	authors.au_id == titleauthor.au_id  AND 
	titleauthor.title_id == titles.title_id AND 
	sales.title_id == titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY sum(sales.qty) DESC
LIMIT 3
;

-- CHALLENGE 4
SELECT 
	authors.au_id AS "AUTHOR ID",  
	authors.au_lname AS "LAST NAME",  
	authors.au_fname AS "FIRST NAME",	 
	IFNULL(SUM(sales.qty), 0) AS  "TOTAL" 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY sum(sales.qty) DESC
LIMIT 23
;




SELECT
  authors.au_id AS "AUTHOR ID",
  authors.au_fname AS "FIRST NAME",
  authors.au_lname AS "LAST NAME",
  IFNULL(SUM(sales.qty), 0) AS "TOTAL"
FROM
  authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY
  authors.au_id, authors.au_fname, authors.au_lname
ORDER BY
  "TOTAL" DESC;