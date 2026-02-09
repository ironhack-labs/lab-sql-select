## Exercice 1

SELECT 
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First Name", 
	titles.title AS "Title", 
	publishers.pub_name as "Publisher"
FROM titles, authors, publishers, titleauthor
WHERE
	titles.pub_id == publishers.pub_id AND
	titles.title_id == titleauthor.title_id AND
	titleauthor.au_id == authors.au_id
	ORDER BY authors.au_id ASC
;


## Exercice 2

SELECT 
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First Name", 
	publishers.pub_name as "Publisher",
	COUNT(titles.title_id) AS "Title Count"	
FROM authors
JOIN titleauthor 
    ON titleauthor.au_id = authors.au_id
JOIN titles 
    ON titles.title_id = titleauthor.title_id
JOIN publishers 
    ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY 
    authors.au_id ASC
;

## Exercice 3

SELECT 
    authors.au_id AS "Author ID",
    authors.au_lname AS "Last name",
    authors.au_fname AS "First Name",
    SUM(sales.qty) AS "Total"
FROM authors 
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles      ON titles.title_id = titleauthor.title_id
JOIN sales         ON sales.title_id = titles.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    SUM(sales.qty) DESC
LIMIT 3
;

## Exercice 4

SELECT
  authors.au_id AS "Author ID",
  authors.au_lname AS "Last name",
  authors.au_fname AS "First Name",
  COALESCE(sales.total, 0) AS "Total"
FROM authors 
LEFT JOIN (
  SELECT
    titleauthor.au_id,
    SUM(sales.qty) AS total
  FROM titleauthor
  JOIN sales 
    ON sales.title_id = titleauthor.title_id
  GROUP BY titleauthor.au_id
) sales
  ON sales.au_id = authors.au_id
ORDER BY
  "Total" DESC
 ;

