-- CHALLENGE 1 --
SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id and
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id; 
    
-- CHALLENGE 2 --
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    publishers.pub_name AS "PUBLISHER",
    COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors, titles, publishers, titleauthor
WHERE
    authors.au_id = titleauthor.au_id AND
    titleauthor.title_id = titles.title_id AND
    titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY 
    "TITLE COUNT" DESC;
	
-- CHALLENGE 3 --
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN sales s ON ta.title_id = s.title_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    "TOTAL" DESC
LIMIT 3;

-- CHALLENGE 4 --
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta 
    ON a.au_id = ta.au_id
LEFT JOIN sales s 
    ON ta.title_id = s.title_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    "TOTAL" DESC;