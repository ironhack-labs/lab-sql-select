-- ## Challenge 1
SELECT
    a.au_id      AS "AUTHOR_ID",
    a.au_lname   AS "LAST_NAME",
    a.au_fname   AS "FIRST_NAME",
    t.title      AS "TITLE",
    p.pub_name   AS "PUBLISHER"
FROM authors a
JOIN titleauthor ta ON ta.au_id   = a.au_id
JOIN titles t       ON t.title_id = ta.title_id
JOIN publishers p   ON p.pub_id   = t.pub_id
ORDER BY a.au_lname, a.au_fname, t.title;

-- challenge 2
SELECT
    a.au_id      AS "AUTHOR_ID",
    a.au_lname   AS "LAST_NAME",
    a.au_fname   AS "FIRST_NAME",
    p.pub_name   AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE_COUNT"
FROM authors a
JOIN titleauthor ta ON ta.au_id   = a.au_id
JOIN titles t       ON t.title_id = ta.title_id
JOIN publishers p   ON p.pub_id   = t.pub_id
GROUP BY 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    p.pub_name
ORDER BY 
	TITLE_COUNT DESC

-- challenge 3
SELECT
    a.au_id      AS "AUTHOR_ID",
    a.au_lname   AS "LAST_NAME",
    a.au_fname   AS "FIRST_NAME",
    SUM(s.qty)   AS "TOTAL"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t       ON ta.title_id = t.title_id
JOIN sales s        ON t.title_id = s.title_id
GROUP BY 
    a.au_id, 
    a.au_lname, 
    a.au_fname
ORDER BY 
    "TOTAL" DESC
LIMIT 3;

--Challenge 4

SELECT
    a.au_id    AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    CASE 
        WHEN SUM(s.qty) IS NULL THEN 0     -- si no hay ventas, muestra 0
        ELSE SUM(s.qty)                    -- si hay ventas, muestra la suma
    END AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON ta.au_id = a.au_id
LEFT JOIN titles t       ON t.title_id = ta.title_id
LEFT JOIN sales s        ON s.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL" DESC, a.au_lname, a.au_fname;


