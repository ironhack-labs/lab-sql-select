-- QUERY 1
SELECT authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
titles.title AS "Title",
publishers.pub_name AS "Publisher"
FROM titles, authors, publishers, titleauthor
WHERE 
titles.pub_id=publishers.pub_id AND
titles.title_id=titleauthor.title_id AND
titleauthor.au_id=authors.au_id

ORDER BY authors.au_id ASC
;


-- QUERY 2
SELECT authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
publishers.pub_name AS "Publisher",
count (titleauthor.title_id) AS "Title Count"

FROM titles, authors, publishers, titleauthor

WHERE authors.au_id = titleauthor.au_id AND
titleauthor.title_id = titles.title_id AND
titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name
ORDER BY authors.au_id  DESC
;


-- QUERY 3
SELECT authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
SUM(sales.qty) AS Total

FROM titles, authors, titleauthor, sales

WHERE authors.au_id = titleauthor.au_id AND
titleauthor.title_id = titles.title_id AND
titles.title_id = sales.title_id 

GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY Total DESC 
LIMIT 3
;


-- QUERY 4
SELECT authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
COALESCE(SUM(sales.qty),0) AS Total

FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id  
LEFT JOIN titles ON titleauthor.title_id = titles.title_id  
LEFT JOIN sales ON titles.title_id = sales.title_id

GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY Total DESC 
;