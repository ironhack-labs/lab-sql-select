-- CHALLENGE 1 --

SELECT 
    a.au_id as "AUTHOR ID", 
    a.au_lname as "LAST NAME", 
    a.au_fname as "FIRST NAME",
    t.title as "TITLE",
    p.pub_name as "PUBLISHER"
FROM authors as a
JOIN titleauthor as ta on a.au_id = ta.au_id
JOIN titles as t on ta.title_id = t.title_id
JOIN publishers as p on t.pub_id = p.pub_id

-- CHALLENGE 2 --

SELECT 
    a.au_id as "AUTHOR ID", 
    a.au_lname as "LAST NAME", 
    a.au_fname as "FIRST NAME",
    p.pub_name as "PUBLISHER",
    count(t.title_id) as "TITLE COUNT"

FROM authors as a
JOIN titleauthor as ta on a.au_id = ta.au_id
JOIN titles as t on ta.title_id = t.title_id
JOIN publishers as p on t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY "TITLE COUNT" DESC

-- CHALLENGE 3 --

SELECT 
	a.au_id as "AUTHOR ID", 
	a.au_lname as "LAST NAME", 
	a.au_fname as "FIRST NAME",
	sum(s.qty) as "TOTAL"

FROM authors as a
	JOIN titleauthor as ta on a.au_id = ta.au_id
	JOIN titles as t on ta.title_id = t.title_id
	JOIN sales as s on t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3

-- CHALLENGE 4 --

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME",
    CASE 
        WHEN SUM(s.qty) IS NULL THEN 0 
        ELSE SUM(s.qty) 
    END AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC;