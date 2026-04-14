-- Challenge 1 - Who Have Published What At Where?
/*In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published*/

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    t.title AS title,
    p.pub_name AS publisher
FROM authors a
JOIN titleauthor ta
    ON a.au_id = ta.au_id
JOIN titles t
    ON ta.title_id = t.title_id
JOIN publishers p
    ON t.pub_id = p.pub_id;
	
-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    p.pub_name AS publisher,
    COUNT(t.title_id) AS title_count
FROM authors a
JOIN titleauthor ta
    ON a.au_id = ta.au_id
JOIN titles t
    ON TA.title_id = t.title_id
JOIN publishers p
    ON t.pub_id = p.pub_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name
ORDER BY
    a.au_id DESC,
    p.pub_name;
	
-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    COUNT(ta.title_id) AS total
FROM authors a
JOIN titleauthor ta
    ON a.au_id = ta.au_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    total DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    COUNT(ta.title_id) AS total
FROM authors a
LEFT JOIN titleauthor ta
    ON a.au_id = ta.au_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    total DESC;

