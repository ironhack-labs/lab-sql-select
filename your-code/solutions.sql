--Challenge 1

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

-- Challenge 2

SELECT 
	authors.au_id AS "Author ID", 
	authors.au_lname AS "Last name", 
	authors.au_fname AS "First Name", 
	publishers.pub_name as "Publisher",
	count(titles.title) as "Title Count"
FROM titles, authors, publishers, titleauthor
WHERE
	titles.pub_id == publishers.pub_id AND
	titles.title_id == titleauthor.title_id AND
	titleauthor.au_id == authors.au_id
GROUP by authors.au_id, publishers.pub_id
order by authors.au_id DESC
;

-- Challenge 3

SELECT
	authors.au_id as "Author ID",
	authors.au_lname as "Last Name",
	authors.au_fname as "First Name",
	sum(titles.ytd_sales) as "Total"
FROM titles, titleauthor, authors
WHERE	
	titles.title_id == titleauthor.title_id AND
	titleauthor.au_id == authors.au_id
GROUP by authors.au_id
ORDER by "Total" DESC
LIMIT 3
;

--Challenge 4

SELECT
	authors.au_id as "Author ID",
	authors.au_lname as "Last Name",
	authors.au_fname as "First Name",
	total(titles.price * sales.qty) as "Total"
FROM authors
LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
		ON titles.title_id = sales.title_id
GROUP by authors.au_id
ORDER by "Total" DESC
;

