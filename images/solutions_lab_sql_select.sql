SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_lname, a.au_fname, t.title;


SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title) AS "TITLE COUNT"
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY "AUTHOR ID", "LAST NAME", "FIRST NAME", "PUBLISHER"
ORDER BY "AUTHOR ID" DESC;

SELECT 
    A.au_id AS "AUTHOR ID",
    A.au_lname AS "LAST NAME",
    A.au_fname AS "FIRST NAME",
    SUM(S.qty) AS "TOTAL"
    from authors A
INNER JOIN titleauthor TA ON a.au_id = TA.au_id
INNER JOIN sales S ON S.title_id = TA.title_id
GROUP BY "AUTHOR ID", "LAST NAME", "FIRST NAME"
ORDER BY "TOTAL" DESC LIMIT 3;

SELECT 
    A.au_id AS "AUTHOR ID",
    A.au_lname AS "LAST NAME",
    A.au_fname AS "FIRST NAME",
    COALESCE(SUM(S.qty), 0) AS "TOTAL"
    from authors A
LEFT JOIN titleauthor TA ON a.au_id = TA.au_id
LEFT JOIN sales S ON S.title_id = TA.title_id
GROUP BY "AUTHOR ID", "LAST NAME", "FIRST NAME"
ORDER BY "TOTAL" DESC;