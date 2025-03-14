--challenge 1
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
ORDER BY 
    a.au_id, t.title;
	
--challenge 2
SELECT 
 a.au_id AS AUTHOR_ID,
 a.au_lname AS LAST_NAME,
 a.au_fname AS FIRST_NAME,
 p.pub_name AS PUBLISHER,
 COUNT(t.title_id) AS TITLE_COUNT
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, p.pub_id
ORDER BY 
    a.au_id, TITLE_COUNT DESC;
	
--challenge 3
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(t.ytd_sales) AS TOTAL
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id
ORDER BY 
    TOTAL DESC
LIMIT 3;

--challenge 4
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    IFNULL(SUM(t.ytd_sales), 0) AS TOTAL
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id
ORDER BY 
    TOTAL DESC;