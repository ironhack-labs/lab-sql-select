/*Challenge1*/
SELECT 
    titleauthor.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

/*Challenge2*/
SELECT 
    ta.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY ta.au_id, p.pub_name
ORDER BY ta.au_id, p.pub_name;

/*Challenge3*/
SELECT 
    ta.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(t.ytd_sales) AS "TOTAL"
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY ta.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/*Challenge4*/
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(t.ytd_sales), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;