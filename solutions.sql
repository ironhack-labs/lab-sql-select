

SELECT * FROM publishers



SELECT * FROM titleauthor;





SELECT * FROM authors;

SELECT * FROM sales;
   


SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty AS TOTAL

FROM authors INNER JOIN titleauthor

    ON authors.au_id = titleauthor.au_id

  INNER JOIN titles

    ON titles.title_id = titleauthor.title_id

	INNER JOIN sales

	ON sales.title_id =  titles.title_id 

	GROUP BY authors.au_id

	ORDER BY TOTAL DESC

	













SELECT authors.AUTHOR_ID, authors.LAST_NAME, authors.FIRST_NAME,titles.TITILE, publishers.PUBLISHER

FROM authors INNER JOIN titleauthor

    ON authors.author_id = titleauthor.author_id

  INNER JOIN titles

    ON titles.title_id = titleauthor.title_id

	INNER JOIN publishers

	ON titleauthor.

	

SELECT authors.au_id, authors.au_lname, authors.au_fname,publishers.pub_name, COUNT(titles.title_id) AS total_titles

FROM authors INNER JOIN titleauthor

    ON authors.au_id = titleauthor.au_id

  INNER JOIN titles

    ON titles.title_id = titleauthor.title_id

	INNER JOIN publishers

	ON titles.pub_id = publishers.pub_id

	GROUP BY authors.au_id, publishers.pub_id;

	

 /*`AUTHOR ID` - the ID of the author

`LAST NAME` - author last name

`FIRST NAME` - author first name

`TITLE` - name of the published title

`PUBLISHER` - name of the publisher where the title was published*/



 /*SELECT &quot;au_id&quot;,&quot;au_lname&quot;,&quot;au_fname&quot; FROM authors*/

 /*SELECT &quot;pub_id&quot;, &quot;pub_name&quot; FROM publishers;*/</sql><sql name="SQL 2*">SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL

FROM authors INNER JOIN titleauthor

    ON authors.au_id = titleauthor.au_id

  INNER JOIN titles

    ON titles.title_id = titleauthor.title_id

	INNER JOIN sales

	ON sales.title_id =  titles.title_id 

	GROUP BY authors.au_id

	ORDER BY TOTAL DESC

	

SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty 

FROM authors INNER JOIN titleauthor

    ON authors.au_id = titleauthor.au_id

  INNER JOIN titles

    ON titles.title_id = titleauthor.title_id

	INNER JOIN sales

	ON sales.title_id =  titles.title_id 



SELECT * FROM sales

select * FROM authors