-- Challenge 1 - Who Have Published What At Where?
SELECT 
    A.au_id AS "AUTHOR ID",
    A.au_lname AS "LAST NAME",
    A.au_fname AS "FIRST NAME",
    T.title AS "TITLE",
    P.pub_name AS "PUBLISHER"
FROM titleauthor TA
JOIN authors A ON TA.au_id = A.au_id
JOIN titles T ON TA.title_id = T.title_id
JOIN publishers P ON T.pub_id = P.pub_id
ORDER BY A.au_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT 
    A.au_id AS "AUTHOR ID",
    A.au_lname AS "LAST NAME",
    A.au_fname AS "FIRST NAME",
	P.pub_name AS "PUBLISHER",
    count (T.title) as "TITLE_COUNT" 
FROM titleauthor TA
JOIN authors A ON TA.au_id = A.au_id
JOIN titles T ON TA.title_id = T.title_id
JOIN publishers P ON T.pub_id = P.pub_id
GROUP BY 
 A.au_id,
 A.au_lname,
 A.au_fname,
 P.pub_name
ORDER BY TITLE_COUNT DESC;

-- Challenge 3 - Best Selling Authors: Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT 
    A.au_id AS "AUTHOR ID",
    A.au_lname AS "LAST NAME",
    A.au_fname AS "FIRST NAME",
    SUM(Q.qty) AS "Q_SALES"
FROM titleauthor TA
JOIN authors A ON TA.au_id = A.au_id
JOIN sales Q ON TA.title_id = Q.title_id
GROUP BY 
    A.au_id,
    A.au_lname,
    A.au_fname
ORDER BY Q_SALES DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT 
    A.au_id AS "AUTHOR ID",
    A.au_lname AS "LAST NAME",
    A.au_fname AS "FIRST NAME",
    IFNULL (SUM(Q.qty), 0)  AS "Q_SALES"
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T on  TA.title_id = T.title_id
LEFT JOIN sales Q ON T.title_id = Q.title_id
GROUP BY 
    A.au_id,
    A.au_lname,
    A.au_fname
ORDER BY Q_SALES DESC;


























