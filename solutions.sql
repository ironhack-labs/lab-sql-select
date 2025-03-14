-- Challenge 1: 
SELECT 
    ta.au_id AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    t.title AS TITLE, 
    p.pub_name AS PUBLISHER
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

-- Challenge 2: 
SELECT 
    ta.au_id AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    p.pub_name AS PUBLISHER, 
    COUNT(t.title_id) AS TITLE_COUNT
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY ta.au_id, p.pub_name;

-- Challenge 3: 
SELECT 
    ta.au_id AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    SUM(s.qty) AS TOTAL
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY ta.au_id
ORDER BY TOTAL DESC
LIMIT 10;

-- Challenge 4: 
SELECT 
    ta.au_id AS AUTHOR_ID, 
    a.au_lname AS LAST_NAME, 
    a.au_fname AS FIRST_NAME, 
    COALESCE(SUM(s.qty), 0) AS TOTAL
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY ta.au_id
ORDER BY TOTAL DESC;
