-- Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER"
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id=titleauthor.title_id
JOIN publishers ON titles.pub_id=publishers.pub_id

-- Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER",
count(titles.title_id) AS "TITLE COUNT"
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id=titleauthor.title_id
JOIN publishers ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY authors.au_id DESC

-- Challenge 3 - Best Selling Authors
SELECT authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
sum (sales.qty) as "TOTAL"
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN sales ON sales.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY "TOTAL" DESC
LIMIT 3

-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
sum(coalesce (sales.qty,0)) as "TOTAL"
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN sales  ON titleauthor.title_id=sales.title_id
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC