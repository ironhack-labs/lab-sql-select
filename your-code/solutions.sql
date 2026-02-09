-- query 1
SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME', 
	authors.au_fname AS 'FIRST NAME', 
	titles.title AS 'TITLE', 
	publishers.pub_name AS 'PUBLISHER'
FROM 
	authors, 
	titles, 
	publishers
JOIN 
	titleauthor
ON 
	authors.au_id = titleauthor.au_id AND
	titleauthor.title_id = titles.title_id AND 
	titles.pub_id = publishers.pub_id
ORDER BY 
	authors.au_id ASC, 
	titles.pubdate DESC 
;

-- query 2
SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME', 
	authors.au_fname AS 'FIRST NAME', 
	publishers.pub_name AS 'PUBLISHER',
	COUNT(titles.title) AS 'TITLE COUNT'
FROM 
	authors, 
	titles, 
	publishers
JOIN 
	titleauthor
ON 
	authors.au_id = titleauthor.au_id AND
	titleauthor.title_id = titles.title_id AND 
	titles.pub_id = publishers.pub_id
GROUP BY
	authors.au_id, publishers.pub_id
ORDER BY 
	COUNT(titles.title) DESC,
	authors.au_id DESC
;

-- query 3
SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME', 
	authors.au_fname AS 'FIRST NAME', 
	SUM(titles.ytd_sales) AS "TOTAL"
FROM 
	authors, 
	titles
JOIN 
	titleauthor
ON 
	authors.au_id = titleauthor.au_id AND
	titleauthor.title_id = titles.title_id
GROUP BY
	authors.au_id
ORDER BY 
	"TOTAL" DESC
LIMIT 3
;

-- query 4
SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME', 
	authors.au_fname AS 'FIRST NAME',
	SUM(IFNULL(titles.ytd_sales,0)) AS "TOTAL"
FROM 
	authors,
	titles
JOIN 
	titleauthor
ON 
	authors.au_id = titleauthor.au_id AND titleauthor.title_id = titles.title_id AND authors.contract = '1'
GROUP BY
	authors.au_id
	
UNION

SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME', 
	authors.au_fname AS 'FIRST NAME',
	0 AS "TOTAL"
FROM 
	authors
WHERE 
	authors.contract = '0'
GROUP BY
	authors.au_id

ORDER BY 
	"TOTAL" DESC
;

