#challege 1 - Who Have Published What At Where?

SELECT
	authors.au_id AS "AUTHOR ID" , authors.au_fname AS "FIRST NAME" , authors.au_lname AS " LAST NAME", titles.title_id AS " TITLE" , publishers.pub_name AS "PUBLISHER NAME"

FROM authors, publishers, titles,titleauthor

WHERE
	authors.au_id == titleauthor.au_id AND
 titleauthor.title_id == titles.title_id AND
 titles.pub_id == publishers.pub_id;



 #Challenge 2 - Who Have Published How Many At Where?

SELECT
	authors.au_id AS "AUTHOR ID" ,authors.au_lname as "LAST NAME", authors.au_fname AS "FIRST NAME", 
	publishers.pub_name as "PUBLISHER",
	count(titleauthor.title_id) as "TITLE COUNT"
from 	
	authors, publishers, titles,titleauthor
WHERE
	authors.au_id == titleauthor.au_id AND
    titleauthor.title_id == titles.title_id AND
    titles.pub_id == publishers.pub_id
group by 	
	authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name
	
order by
		authors.au_id DESC;


#Challenge 3 - Best Selling Authors

SELECT
  authors.au_id AS "AUTHOR ID" , authors.au_fname AS "FIRST NAME", authors.au_lname as "LAST NAME", 
  SUM(sales.qty) as "Total" 
from
  authors, sales, titleauthor
where 
 authors.au_id == titleauthor.au_id AND
 titleauthor.title_id == sales.title_id 
group by
	authors.au_id, authors.au_fname, authors.au_lname
order by
	Total DESC limit 3; 

#Challenge 4 - Best Selling Authors Ranking

SELECT
  authors.au_id AS "AUTHOR ID",
  authors.au_fname AS "FIRST NAME",
  authors.au_lname AS "LAST NAME",
  IFNULL(SUM(sales.qty), 0) AS "TOTAL"
FROM
  authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY
  authors.au_id, authors.au_fname, authors.au_lname
ORDER BY
  "TOTAL" DESC;
