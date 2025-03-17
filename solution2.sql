--SQL Lab 2 
--Challenge 1
SELECT 
authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name", 
titles.title, 
publishers.pub_name AS "pub_name"
FROM 
authors, titles, publishers,titleauthor
WHERE
authors.au_id==titleauthor.au_id AND
titleauthor.title_id==titles.title_id AND 
titles.pub_id==publishers.pub_id;

--Challenge 2
SELECT 
authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name", 
titles.title, 
publishers.pub_name AS "pub_name",
count(titles.title_id) as "title count"
FROM 
authors, titles, publishers,titleauthor
WHERE
authors.au_id==titleauthor.au_id AND
titleauthor.title_id==titles.title_id AND 
titles.pub_id==publishers.pub_id
group by
authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name 
ORDER by 
authors.au_id, authors.au_lname, authors.au_fname;

--Challenge 3
SELECT
authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name", 
count(sales.qty) AS "Total"
FROM 
authors, titles, titleauthor, sales
WHERE
authors.au_id==titleauthor.au_id AND
titleauthor.title_id==titles.title_id AND 
sales.title_id==titleauthor.title_id
group by
authors.au_id, authors.au_lname, authors.au_fname
ORDER by 
total DESC
LIMIT 3;

--Challenge 4

SELECT
authors.au_id AS "Author ID", 
authors.au_lname AS "Last name", 
authors.au_fname AS "First name", 
COALESCE(count(sales.qty), 0) AS "Total"
FROM
authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
group by
authors.au_id, authors.au_lname, authors.au_fname
ORDER by 
total DESC;