/*
CREATE TABLE `authors` (`au_id`, `au_lname`, `au_fname`, `phone`, `address`, `city`, `state`, `zip`, `contract`)
CREATE TABLE `discounts` (`discounttype`, `stor_id`, `lowqty`, `highqty`, `discount`)
CREATE TABLE `employee` (`emp_id`, `fname`, `minit`, `lname`, `job_id`, `job_lvl`, `pub_id`, `hire_date`)
CREATE TABLE `jobs` (`job_id`, `job_desc`, `min_lvl`, `max_lvl`)
CREATE TABLE `pub_info` (`pub_id`, `logo`, `pr_info`)
CREATE TABLE `publishers` (`pub_id`, `pub_name`, `city`, `state`, `country`)
CREATE TABLE `roysched` (`title_id`, `lorange`, `hirange`, `royalty`)
CREATE TABLE `sales` (`stor_id`, `ord_num`, `ord_date`, `qty`, `payterms`, `title_id`)
CREATE TABLE `stores` (`stor_id`, `stor_name`, `stor_address`, `city`, `state`, `zip`)
CREATE TABLE `titleauthor` (`au_id`, `title_id`, `au_ord`, `royaltyper`)
CREATE TABLE `titles` (`title_id`, `title`, `type`, `pub_id`, `price`, `advance`, `royalty`, `ytd_sales`, `notes`, `pubdate`)
*/

/* 
## Challenge 1 - Who Have Published What At Where?

In this challenge you will write an SQL `SELECT` query that joins various tables 
to figure out what titles each author has published at which publishers. 
Your output should have at least the following columns:

- `AUTHOR ID` - the ID of the author
- `LAST NAME` - author last name
- `FIRST NAME` - author first name
- `TITLE` - name of the published title
- `PUBLISHER` - name of the publisher where the title was published

ANSWER:

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors
JOIN titleauthor ON authors.au_id= titleauthor.au_id
JOIN titles ON titleauthor.title_id= titles.title_id
JOIN publishers ON titles.pub_id= publishers.pub_id;

## Challenge 2 - Who Have Published How Many At Where?

Elevating from your solution in Challenge 1, query how many titles each author 
has published at each publisher. Your output should look 

ANSWER:

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME",
	publishers.pub_name AS "PUBLISHER",
	COUNT(titles.title) AS "TITLE COUNT"
FROM authors
JOIN titleauthor ON authors.au_id= titleauthor.au_id
JOIN titles ON titleauthor.title_id= titles.title_id
JOIN publishers ON titles.pub_id= publishers.pub_id
GROUP BY 
	authors.au_id, 
	authors.au_lname, 
	authors.au_fname,
	publishers.pub_name
ORDER BY authors.au_lname, publishers.pub_name;



## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? 
Write a query to find out.

Requirements:

- Your output should have the following columns:
  - `AUTHOR ID` - the ID of the author
  - `LAST NAME` - author last name
  - `FIRST NAME` - author first name
  - `TOTAL` - total number of titles sold from this author
- Your output should be ordered based on `TOTAL` from high to low.
- Only output the top 3 best selling authors.


ANSWER:

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME",
	SUM(sales.qty) AS "TOTAL"
FROM authors
JOIN titleauthor ON authors.au_id= titleauthor.au_id
JOIN titles ON titleauthor.title_id= titles.title_id
JOIN sales ON titles.title_id= sales.title_id
GROUP BY 
	authors.au_id, 
	authors.au_lname, 
	authors.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 
authors instead of the top 3. Note that the authors who have sold 0 titles should 
also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). 
Also order your results based on `TOTAL` from high to low.

ANSWER:
>WE USE COALESCE TO FILL NaN OR null VALUES WITH 0
>WE USE LEFT JOIN SO THE JOIN DON'T IGNORE VALUES WITH 0

SELECT 
	authors.au_id AS "AUTHOR ID", 
	authors.au_lname AS "LAST NAME", 
	authors.au_fname AS "FIRST NAME",
	COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id= titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id= titles.title_id
LEFT JOIN sales ON titles.title_id= sales.title_id
GROUP BY 
	authors.au_id, 
	authors.au_lname, 
	authors.au_fname
ORDER BY "TOTAL" DESC;

*/