-- Challenge 1 - Who Have Published What At Where?

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id;  --Link publishers using pub_id in titles table

--Challenge 2 - Who Have Published How Many At Where?

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"  -- Count the number of addresses
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, p.pub_name;  -- Data collection by author and publisher


--Challenge 3 - Best Selling Authors

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"  -- Calculate the total number of titles sold per author.
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    sales s ON t.title_id = s.title_id  -- Join the sales table
GROUP BY 
    a.au_id
ORDER BY 
    "TOTAL" DESC  -- Descending order by total number of sales
LIMIT 3;  -- Extract only the top 3 authors.

--Challenge 4 - Best Selling Authors Ranking

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"  -- Replace NULL with 0 for authors who have not sold any books.
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
LEFT JOIN 
    sales s ON t.title_id = s.title_id  -- LEFT JOIN to ensure all authors are displayed
GROUP BY 
    a.au_id
ORDER BY 
    "TOTAL" DESC;  -- Descending order by total sales