-- Challenge 1
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

--Challenge 2

SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER",
	COUNT (*) AS "TITLE COUNT"
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id 
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name;

--Challenge 3
SELECT 
	authors.au_id as "AUTHOR ID",
	authors.au_lname as "LAST NAME", 
	authors.au_fname as "FIRST NAME", 
	COUNT (*) AS "TOTAL"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY COUNT (*) DESC
LIMIT 3;

--Challenge 4

SELECT 
	authors.au_id as "AUTHOR ID",
	authors.au_lname as "LAST NAME", 
	authors.au_fname as "FIRST NAME", 
	COUNT (*) AS "TOTAL"
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY COUNT (*) DESC
LIMIT 23;


