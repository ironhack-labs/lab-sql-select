-- Challenge 1 

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
    publishers p ON t.pub_id = p.pub_id;
	

-- Challenge 2 
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
    TITLE_COUNT DESC, AUTHOR_ID;
	
	
-- Challenge 3 
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id
ORDER BY 
    TOTAL DESC
LIMIT 3;

-- Challenge 4 

SELECT 
    a.au_id AS AUTHOR_ID,               --Author ID from the authors table
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    IFNULL(SUM(s.qty), 0) AS TOTAL        -- to replace NULL with 0 for authors with no sales
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id  -- Join with titleauthor to link authors to titles
LEFT JOIN 
    sales s ON ta.title_id = s.title_id   -- join with sales to get the quantity of titles sold
GROUP BY 
    a.au_id                               -- author ID to calculate total sales per author 
ORDER BY 
    TOTAL DESC;                           -- total sales (highest to lowest)
	
	