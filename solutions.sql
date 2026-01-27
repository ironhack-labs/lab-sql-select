Challange 1

SELECT
  a.au_id      AS "AUTHOR ID",
  a.au_lname   AS "LAST NAME",
  a.au_fname   AS "FIRST NAME",
  t.title      AS "TITLE",
  p.pub_name   AS "PUBLISHER"
FROM titleauthor ta
JOIN authors a
  ON ta.au_id = a.au_id
JOIN titles t
  ON ta.title_id = t.title_id
JOIN publishers p
  ON t.pub_id = p.pub_id
ORDER BY
  a.au_id
  ASC;


Challange 2

SELECT
  a.au_id      AS "AUTHOR ID",
  a.au_lname   AS "LAST NAME",
  a.au_fname   AS "FIRST NAME",
  p.pub_name   AS "PUBLISHER",
  COUNT(*)     AS "TITLE COUNT"
FROM titleauthor ta
JOIN authors a
  ON ta.au_id = a.au_id
JOIN titles t
  ON ta.title_id = t.title_id
JOIN publishers p
  ON t.pub_id = p.pub_id
GROUP BY
  a.au_id,
  a.au_lname,
  a.au_fname,
  p.pub_name
ORDER BY
  a.au_id DESC,
  p.pub_name DESC;

Challange 3

SELECT authors.au_id   AS "AUTHOR ID",
authors.au_lname       AS "LAST NAME",
authors.au_fname       AS "FIRST NAME",
sum (titles.ytd_sales) AS "TOTAL"
FROM authors
JOIN titleauthor 
  ON titleauthor.au_id = authors.au_id
JOIN titles  
  ON titles.title_id=titleauthor.title_id
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC
LIMIT 3;

Challange 4

SELECT authors.au_id    AS "AUTHOR ID",
authors.au_lname        AS "LAST NAME",
authors.au_fname        AS "FIRST NAME",
CASE
	WHEN sum(titles.ytd_sales) IS NULL THEN 0
	ELSE sum(titles.ytd_sales)
END AS "TOTAL"
FROM authors
LEFT JOIN titleauthor 
  ON titleauthor.au_id = authors.au_id
LEFT JOIN titles  
  ON titles.title_id=titleauthor.title_id
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC;