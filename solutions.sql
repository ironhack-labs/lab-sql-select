/*Challange 1- Who Have Published What At Where?
In this challenge you will write an SQL SELECT query that joins various tables to figure out 
what titles each author has published at which publishers. 
Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/
SELECT 
    a.au_id as AuthorID, 
    a.au_lname as First_Name, 
    a.au_fname as Last_Name,
    t.title,	
    p.pub_name as Publisher 
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON ta.title_id = t.title_id
JOIN publishers as p ON t.pub_id = p.pub_id
ORDER BY a.au_id, t.title;


/*Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
To check if your output is correct, sum up the TITLE COUNT column. 
The sum number should be the same as the total number of records in Table titleauthor*/
SELECT 
    a.au_id as AuthorID, 
    a.au_lname as First_Name, 
    a.au_fname as Last_Name,	
    p.pub_name as Publisher,
	COUNT(t.title_id) as Count_Title
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON ta.title_id = t.title_id
JOIN publishers as p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY  a.au_id DESC;
/*Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles?
Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.*/
SELECT 
    a.au_id AS AuthorID, 
    a.au_lname AS Last_Name, 
    a.au_fname AS First_Name,	
    p.pub_name AS Publisher,
    SUM(s.qty) AS "Total"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY "Total" DESC
LIMIT 3;


/*Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors 
instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output 
(ideally display 0 instead of NULL as the TOTAL).
Also order your results based on TOTAL from high to low.*/
SELECT 
    a.au_id AS AuthorID, 
    a.au_lname AS Last_Name, 
    a.au_fname AS First_Name,	
    p.pub_name AS Publisher,
    COALESCE(SUM(s.qty), 0) AS "Total"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY "Total" DESC;
