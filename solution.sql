SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", titles.title as "TITLE", publishers.pub_name as "PUBLISHER"
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id

SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", titles.title as "TITLE", publishers.pub_name as "PUBLISHER", COUNT(*) as "TITLE COUNT"
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id

SELECT authors.au_id  as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", SUM(titles.ytd_sales) as "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3

SELECT authors.au_id  as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", COALESCE(SUM(titles.ytd_sales), 0)as "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC