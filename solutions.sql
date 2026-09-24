/* LAB | SQL Select*/
/* Challenge 1 - Who has published what at where?*/
SELECT authors.au_id as "AUTHOR ID", 
		authors.au_lname as "LAST NAME",
		authors.au_fname as "FIRST NAME",
		titles.title as "TITLE",
		publishers.pub_name as "PUBLISHER"
FROM authors INNER JOIN titleauthor
	on authors.au_id = titleauthor.au_id
		INNER JOIN titles
		on titleauthor.title_id = titles.title_id
			INNER JOIN publishers
			on titles.pub_id = publishers.pub_id;
			
			
/* Challenge 2 - Who have publisched how many at where?*/
SELECT authors.au_id as "AUTHOR ID", 
		authors.au_lname as "LAST NAME",
		authors.au_fname as "FIRST NAME",
		publishers.pub_name as "PUBLISHER",
		count(titles.title) as "TITLE COUNT"
FROM authors INNER JOIN titleauthor
	on authors.au_id = titleauthor.au_id
		INNER JOIN titles
		on titleauthor.title_id = titles.title_id
			INNER JOIN publishers
			on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id;

/* Challenge 3 - Best selling authors */
SELECT authors.au_id as "AUTHOR ID", 
		authors.au_lname as "LAST NAME",
		authors.au_fname as "FIRST NAME",
		sum(sales.qty) as "TOTAL"
FROM authors INNER JOIN titleauthor
	on authors.au_id = titleauthor.au_id
	 INNER JOIN sales
	 on titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;

/* Challeng 4 - Best selling authors ranking */
SELECT authors.au_id as "AUTHOR ID", 
		authors.au_lname as "LAST NAME",
		authors.au_fname as "FIRST NAME",
		coalesce(sum(sales.qty), 0) as "TOTAL"
FROM authors left JOIN titleauthor
	on authors.au_id = titleauthor.au_id
	 LEFT JOIN sales
	 on titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY "TOTAL" DESC;