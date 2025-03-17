-- Challenge 1:
SELECT
authors.au_id as "AUTHOR ID", 
authors.au_lname as "LAST NAME", 
authors.au_fname AS "fIRST nAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER"
from 
authors,
titles,
publishers,
titleauthor
WHERE
authors.au_id == titleauthor.au_id AND
titleauthor.title_id == titles.title_id AND
titles.pub_id == publishers.pub_id

--Challenge 2:

SELECT
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER",
COUNT(titles.title_id) AS "TITLE COUNT"
FROM 
authors,
titles,
publishers,
titleauthor
WHERE
authors.au_id = titleauthor.au_id AND
titleauthor.title_id = titles.title_id AND
titles.pub_id = publishers.pub_id
GROUP BY 
authors.au_id,
authors.au_lname,
authors.au_fname,
publishers.pub_name
ORDER BY
"TITLE COUNT" DESC;

--Challenge 3:

SELECT
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
sum((sales.qty)) AS "TOTAL"
FROM 
authors,
titles,
sales,
titleauthor
WHERE
authors.au_id = titleauthor.au_id AND
titleauthor.title_id = titles.title_id AND
titles.title_id == sales.title_id 
GROUP BY 
authors.au_id,
authors.au_lname,
authors.au_fname
ORDER BY
"TOTAL" DESC
LIMIT 3;

--Challenge 4:
SELECT
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM 
authors
LEFT JOIN
titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
titles ON titleauthor.title_id = titles.title_id
LEFT JOIN
 sales ON titles.title_id = sales.title_id
GROUP BY 
authors.au_id,
authors.au_lname,
authors.au_fname
ORDER BY
"TOTAL" DESC;
