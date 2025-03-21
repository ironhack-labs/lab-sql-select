-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_fname AS "FIRST NAME", 
    a.au_lname AS "LAST NAME", 
    w.title AS "TITLE", 
    p.pub_name AS "PUBLISHER"
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles w ON ta.title_id = w.title_id
JOIN publishers p ON w.pub_id = p.pub_id;


-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_fname AS "FIRST NAME", 
    a.au_lname AS "LAST NAME", 
    COUNT(w.title) AS "TITLE COUNT", 
    p.pub_name AS "PUBLISHER"
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles w ON ta.title_id = w.title_id
JOIN publishers p ON w.pub_id = p.pub_id
GROUP BY a.au_id, a.au_fname, a.au_lname, p.pub_name;


-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- Requirements:

-- Your output should have the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.
SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    COUNT(ta.title_id) AS "TOTAL"
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles w ON ta.title_id = w.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3;


-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    COALESCE(COUNT(ta.title_id), 0) AS "TOTAL"
FROM authors a 
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC;
