-- Challenge 1 - Who Have Published What At Where?
SELECT 
    authors.au_id          AS "AUTHOR ID",
    authors.au_lname       AS "LAST NAME",
    authors.au_fname       AS "FIRST NAME",
    titles.title           AS "TITLE",
    publishers.pub_name    AS "PUBLISHER"
FROM authors 
JOIN titleauthor  ON authors.au_id = titleauthor.au_id
JOIN titles       ON titleauthor.title_id = titles.title_id
JOIN publishers   ON titles.pub_id = publishers.pub_id
    
    
-- Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       publishers.pub_name AS "PUBLISHER",
       COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles      ON titles.title_id = titleauthor.title_id 
JOIN publishers  ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY authors.au_fname, authors.au_lname 
    
-- Challenge 3 - Best Selling Authors
SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       SUM(sales.qty)             AS "TOTAL"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN sales      ON sales.title_id = titleauthor.title_id 
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY  SUM(sales.qty) DESC
LIMIT 3

-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       -- COALESCE used to convert a NULL value (resulting from an absence of sales) into 0
       COALESCE(SUM(sales.qty), 0)   AS "TOTAL"
FROM authors 
-- used LEFT JOIN in the last challenge to include all authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN sales      ON sales.title_id = titleauthor.title_id 
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY  SUM(sales.qty) DESC

