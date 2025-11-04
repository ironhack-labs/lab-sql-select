SELECT DISTINCT
  a.au_id,
  a.au_lname,
  a.au_fname,
  p.pub_name
FROM authors AS a
JOIN titleauthor AS ta
  ON ta.au_id = a.au_id
JOIN titles AS t
  ON t.title_id = ta.title_id
JOIN publishers AS p
  ON p.pub_id = t.pub_id;
  
  SELECT 
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name,
    COUNT(t.title_id) AS total_titles
FROM authors AS a
JOIN titleauthor AS ta
    ON a.au_id = ta.au_id
JOIN titles AS t
    ON ta.title_id = t.title_id
JOIN publishers AS p
    ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 
    a.au_lname, p.pub_name;
	
	SELECT SUM(total_titles) AS grand_total_titles
FROM (
    SELECT 
        a.au_id,
        COUNT(t.title_id) AS total_titles
    FROM authors a
    JOIN titleauthor ta ON a.au_id = ta.au_id
    JOIN titles t ON ta.title_id = t.title_id
    GROUP BY a.au_id
) AS author_counts;

 SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta
    ON a.au_id = ta.au_id
JOIN titles AS t
    ON ta.title_id = t.title_id
JOIN sales AS s
    ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;


SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta
    ON a.au_id = ta.au_id
LEFT JOIN titles AS t
    ON ta.title_id = t.title_id
LEFT JOIN sales AS s
    ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;

