-- Challenge 1
SELECT
	authors.au_id AS "Author ID",
	authors.au_lname AS "Last name",
	authors.au_fname AS "First name",
	titles.title AS "Title",
	publishers.pub_name AS "Publisher"
	
FROM
	authors, titles, publishers, titleauthor
	
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
	;

/*	
-- Challange 2
SELECT
authors.au_id AS "Author ID",
authors.au_lname AS "Last Name",
authors.au_fname AS "First Name",
publishers.pub_name AS "Publisher",
COUNT(titles.title) AS "Title Count"

FROM
authors, titles, publishers, titleauthor

WHERE
authors.au_id = titleauthor.au_id AND
titleauthor.title_id = titles.title_id AND
titles.pub_id = publishers.pub_id

GROUP BY
authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name

ORDER BY
"Title Count" DESC


-- Challenge 3
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    SUM(sales.qty) AS "TOTAL"

FROM
    authors, titleauthor, sales

WHERE
    authors.au_id = titleauthor.au_id AND
    titleauthor.title_id = sales.title_id

GROUP BY
    authors.au_id, authors.au_lname, authors.au_fname

ORDER BY
    "TOTAL" DESC

LIMIT 3;

*/

-- Challenge 4
SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
    COALESCE(SUM(sales.qty), 0) AS "TOTAL"

FROM
    authors
    LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN sales ON titleauthor.title_id = sales.title_id

GROUP BY
    authors.au_id, authors.au_lname, authors.au_fname

ORDER BY
    "TOTAL" DESC;

