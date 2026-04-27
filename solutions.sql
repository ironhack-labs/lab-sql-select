-- Chalange 1
SELECT
	authors.au_id AS "Author ID",
	authors.au_lname AS "Last name",
	authors.au_fname AS "First name",
	titles.title AS "Title",
	publishers.pub_name AS "Publisher"
	
FROM
	authors, titles, publishers, titleauthor
	
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
	;
	
-- Chalange 2
SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRTS NAME",
	publishers.pub_name AS "PUBLISHER" ,
	COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN  titles on titleauthor.title_id = titles.title_id
JOIN publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

-- Chalange 3
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	SUM(titles.ytd_sales) AS "TOTAL"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN  titles on titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;

-- Chalange 4
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	COALESCE (SUM(titles.ytd_sales), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN  titles on titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY "TOTAL" DESC


