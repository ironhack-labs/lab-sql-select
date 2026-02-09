-- challenge 1
SELECT 
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First Name", 
	titles.title AS "Title", 
	publishers.pub_name as "Publisher"
FROM titles, authors, publishers, titleauthor
WHERE
	titles.pub_id == publishers.pub_id AND
	titles.title_id == titleauthor.title_id AND
	titleauthor.au_id == authors.au_id
ORDER BY authors.au_id ASC
;
-- challenge 2
SELECT 
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First Name", 
	publishers.pub_name AS "Publisher",
	count(titles.title_id) AS "Title Count" 
FROM titles, authors, publishers, titleauthor
WHERE
	titles.pub_id = publishers.pub_id AND
	titles.title_id = titleauthor.title_id AND
	titleauthor.au_id = authors.au_id
GROUP BY
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY
    authors.au_id ASC,
    publishers.pub_name ASC
;
-- challenge 3
SELECT 
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First Name", 
	SUM(sales.qty) AS "Total" 
FROM titles, authors, publishers, titleauthor, sales
WHERE
	titles.pub_id = publishers.pub_id AND
	titles.title_id = titleauthor.title_id AND
	titles.title_id = SALES.title_id AND
	titleauthor.au_id = authors.au_id
GROUP BY
	authors.au_id,
    authors.au_lname,
    authors.au_fname,
ORDER BY
	"Total" DESC
LIMIT 3
;
-- challenge 4
SELECT 
    a.au_id AS "Author ID",
    a.au_lname AS "Last Name",
    a.au_fname AS "First Name",
    COALESCE(SUM(s.qty), 0) AS "Total"
FROM authors a
LEFT JOIN titleauthor ta
    ON a.au_id = ta.au_id
LEFT JOIN titles t
    ON ta.title_id = t.title_id
LEFT JOIN sales s
    ON t.title_id = s.title_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    Total DESC;