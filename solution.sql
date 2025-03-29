/*
 	In this challenge you will write an SQL SELECT query that joins various tables 
	to figure out what titles each author has published at which publishers.
	Your output should have at least the following columns:

		AUTHOR ID - the ID of the author
		LAST NAME - author last name
		FIRST NAME - author first name
		TITLE - name of the published title
		PUBLISHER - name of the publisher where the title was published
*/

SELECT 
    authors.au_id        AS "AUTHOR ID",
    authors.au_lname     AS "LAST NAME",
    authors.au_fname     AS "FIRST NAME",
    titles.title        AS "TITLE",
    publishers.pub_name     AS "PUBLISHER"
FROM authors 
JOIN titleauthor  
    ON authors.au_id = titleauthor.au_id
JOIN titles 
    ON titleauthor.title_id = titles.title_id
JOIN publishers 
    ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id, titles.title;


/*
	Elevating from your solution in Challenge 1,query how many titles each author has published at each publisher.
*/
SELECT 
    authors.au_id        AS "AUTHOR ID",
    authors.au_lname     AS "LAST NAME",
    authors.au_fname     AS "FIRST NAME",
    publishers.pub_name     AS "PUBLISHER",
    COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors 
JOIN titleauthor  
    ON authors.au_id = titleauthor.au_id
JOIN titles 
    ON titleauthor.title_id = titles.title_id
JOIN publishers 
    ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY
    COUNT(titles.title_id) DESC, 
    authors.au_id DESC;

/*
  This query calculates how many titles each author has published at each publisher.
  It then sums the TITLE COUNT values to verify that the total equals the number of rows in the titleauthor table.
*/
SELECT SUM("TITLE COUNT") AS "TOTAL TITLE COUNT"
FROM (
    SELECT 
        authors.au_id AS "AUTHOR ID",
        authors.au_lname AS "LAST NAME",
        authors.au_fname AS "FIRST NAME",
        publishers.pub_name AS "PUBLISHER",
        COUNT(titles.title_id) AS "TITLE COUNT"
    FROM authors
    JOIN titleauthor
        ON authors.au_id = titleauthor.au_id
    JOIN titles
        ON titleauthor.title_id = titles.title_id
    JOIN publishers
        ON titles.pub_id = publishers.pub_id
    GROUP BY 
        authors.au_id, 
        authors.au_lname, 
        authors.au_fname, 
        publishers.pub_name
) AS title_counts;


/*
  Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
*/
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    SUM(sales.qty) AS "TOTAL"
FROM authors
JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
JOIN titles
    ON titleauthor.title_id = titles.title_id
JOIN sales
    ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

/*
  Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
  Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL).
  Also order your results based on TOTAL from high to low.
*/
SELECT 
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
    ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY COALESCE(SUM(sales.qty), 0) DESC;


