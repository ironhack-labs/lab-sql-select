SELECT
    authors.au_id AS "AUTHOR ID",
    authors.au_lname AS "LAST NAME",
    authors.au_fname AS "FIRST NAME",
	IFNULL (SUM(sales.qty) , 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
    ON titles.title_id = sales.title_id
GROUP BY
authors.au_id,
authors.au_lname,
authors.au_fname
ORDER BY TOTAL DESC;
