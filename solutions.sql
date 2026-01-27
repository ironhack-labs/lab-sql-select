/*Challenge 1 - Who Have Published What At Where?
In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published */


SELECT a.au_id as author_id, a.au_lname as author_lastname, a.au_fname as author_firstname, t.title, p.pub_name as publisher
from authors a
join titleauthor jta on jta.au_id = a.au_id
join titles t on t.title_id = jta.title_id
join publishers p on p.pub_id	= t.pub_id;

/* Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:*/


SELECT a.au_id as author_id, a.au_lname as author_lastname, a.au_fname as author_firstname, p.pub_name as publisher, count(t.title) as title_count
from authors a
join titleauthor jta on jta.au_id = a.au_id
join titles t on t.title_id = jta.title_id
join publishers p on p.pub_id	= t.pub_id
group by 1,2,3,4;


/*Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out. */

SELECT a.au_id as author_id, a.au_lname as author_lastname, a.au_fname as author_firstname, sum(t.ytd_sales) as sales
from authors a
left join titleauthor jta on jta.au_id = a.au_id
left join titles t on t.title_id = jta.title_id
left join sales s on t.title_id = s.title_id
group by 1,2,3
order by 4 desc
limit 3;

/* Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3.
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.

*/

SELECT a.au_id as author_id, a.au_lname as author_lastname, a.au_fname as author_firstname, COALESCE(SUM(t.ytd_sales), 0) AS total
from authors a
left join titleauthor jta on jta.au_id = a.au_id
left join titles t on t.title_id = jta.title_id
--left join sales s on t.title_id = s.title_id
group by 1,2,3
order by 4 desc;

