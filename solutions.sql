--- Challenge 1 - Who Have Published What At Where?
  
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM authors
JOIN titleauthor 
    ON authors.au_id = titleauthor.au_id
JOIN titles 
    ON titleauthor.title_id = titles.title_id
JOIN publishers 
    ON titles.pub_id = publishers.pub_id;
	
--- Challenge 2 - Who Have Published How Many At Where?

WITH joined_table AS (
    SELECT 
        authors.au_id AS "AUTHOR ID",
        authors.au_lname AS "LAST NAME",
        authors.au_fname AS "FIRST NAME",
        titles.title AS "TITLE",
        publishers.pub_name AS "PUBLISHER"
    FROM authors
    JOIN titleauthor 
        ON authors.au_id = titleauthor.au_id
    JOIN titles 
        ON titleauthor.title_id = titles.title_id
    JOIN publishers 
        ON titles.pub_id = publishers.pub_id
)

SELECT 
    "AUTHOR ID",
    "LAST NAME",
    "FIRST NAME",
    "PUBLISHER",
    COUNT("TITLE") AS "TITLE COUNT"
FROM joined_table
GROUP BY 
    "AUTHOR ID",
    "LAST NAME",
    "FIRST NAME",
    "PUBLISHER"
ORDER BY 
    "AUTHOR ID",
    "PUBLISHER";

--- Challenge 3 - Best Selling Authors

WITH joined_table AS (
    SELECT 
        authors.au_id AS "AUTHOR ID",
        authors.au_lname AS "LAST NAME",
        authors.au_fname AS "FIRST NAME",
        sales.*
    FROM authors
    JOIN titleauthor 
        ON authors.au_id = titleauthor.au_id
    JOIN sales 
        ON sales.title_id = titleauthor.title_id
)

SELECT
    "AUTHOR ID",
    "LAST NAME",
    "FIRST NAME",
    SUM(qty) AS "TOTAL"
FROM joined_table
GROUP BY 
    "AUTHOR ID",
    "LAST NAME",
    "FIRST NAME"
ORDER BY "TOTAL" DESC
LIMIT 3;

--- Challenge 4 - Best Selling Authors Ranking

WITH joined_table AS (
    SELECT 
        authors.au_id AS "AUTHOR ID",
        authors.au_lname AS "LAST NAME",
        authors.au_fname AS "FIRST NAME",
        sales.qty
    FROM authors
    LEFT JOIN titleauthor 
        ON authors.au_id = titleauthor.au_id
    LEFT JOIN sales 
        ON sales.title_id = titleauthor.title_id
)

SELECT
    "AUTHOR ID",
    "LAST NAME",
    "FIRST NAME",
    COALESCE(SUM(qty), 0) AS "TOTAL"
FROM joined_table
GROUP BY 
    "AUTHOR ID",
    "LAST NAME",
    "FIRST NAME"
ORDER BY "TOTAL" DESC;