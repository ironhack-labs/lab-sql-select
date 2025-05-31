-- Challenge 1
SELECT
    a.au_id     AS "AUTHOR ID",
    a.au_lname  AS "LAST NAME",
    a.au_fname  AS "FIRST NAME",
    t.title     AS "TITLE",
    p.pub_name  AS "PUBLISHER"
FROM titleauthor ta
    JOIN authors a      ON a.au_id = ta.au_id -- lookup vers authors
    JOIN titles t       ON t.title_id = ta.title_id -- lookup vers titles
    JOIN publishers p   ON p.pub_id = t.pub_id; -- lookup vers publishers

-- Challenge 2
SELECT
    a.au_id     AS "AUTHOR ID",
    a.au_lname  AS "LAST NAME",
    a.au_fname  AS "FIRST NAME",
    p.pub_name  AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM titleauthor ta
    JOIN authors a      ON a.au_id = ta.au_id
    JOIN titles t       ON t.title_id = ta.title_id
    JOIN publishers p   ON p.pub_id = t.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY a.au_id DESC;

-- Challenge 3
SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM titleauthor ta
    JOIN authors a ON a.au_id = ta.au_id
    JOIN titles t ON t.title_id = ta.title_id
JOIN sales s ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3;

-- Challenge 4
SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
    LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
    LEFT JOIN titles t ON t.title_id = ta.title_id
    LEFT JOIN sales s ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC

