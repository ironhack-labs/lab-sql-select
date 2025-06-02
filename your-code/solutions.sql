-- Challenge #1:
SELECT 
authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", 
titles.title AS "TITLE", 
publishers.pub_name AS "PUBLISHER"

FROM
authors, titles, publishers, titleauthor

WHERE
titleauthor.title_id == titles.title_id AND
titleauthor.au_id == authors.au_id AND
titles.pub_id == publishers.pub_id;

-- Challenge #2:
SELECT 
authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER",
COUNT(titles.title_id) AS "TITLE COUNT"

FROM
authors, titles, publishers, titleauthor

WHERE
titleauthor.title_id == titles.title_id AND
titleauthor.au_id == authors.au_id AND
titles.pub_id == publishers.pub_id

GROUP BY 
authors.au_id, publishers.pub_id

ORDER BY
authors.au_id DESC;

-- Challenge #3:
SELECT 
authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", 
SUM(titles.ytd_sales) AS "TOTAL"

FROM
authors, titles, publishers, titleauthor

WHERE
titleauthor.title_id == titles.title_id AND
titleauthor.au_id == authors.au_id AND
titles.pub_id == publishers.pub_id

GROUP BY 
authors.au_id

ORDER BY
SUM(titles.ytd_sales) DESC

LIMIT 3;

-- Challenge #4:
SELECT 
authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", 
coalesce(SUM(titles.ytd_sales), 0) AS "TOTAL"

FROM
authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id

GROUP BY 
authors.au_id

ORDER BY
SUM(titles.ytd_sales) DESC;
