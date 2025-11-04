--Challenge 1 - Who Have Published What At Where?
--Write an SQL SELECT query that joins various tables to figure out what titles each author has published at which 
-- publiishers. The output should have at least the following columns: Author ID, Last Name, First Name, Title, Publisher

-- HOW THE TABLES FIT TOGETHER:
-- authors - titleauthor - titles - publishers
-- titleauthor is the bridge (many-to-many) between authors and titles
-- titles.pub_id links each title to a single publisher in publishers
-- using old-style comma join (cartesian product + filters) with equijoin conditions in WHERE

-- 3 predicates connect the 4 tables: 
-- authors & titleauthor by au_id
-- titleauthor & titles by title_id
-- titles & publishers by pub_id

SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id;
	
-- Challenge 2
-- Titles per author per publisher
-- with the comma-join version:

SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	publishers.pub_name AS "PUBLISHER",
	COUNT(DISTINCT titleauthor.title_id) AS "TITLE COUNT"
FROM authors, titleauthor, titles, publishers -- comma joins, 
WHERE --join conditions
	authors.au_id == titleauthor.au_id AND -- pairs each author with their authored titles (via bridge table)
	titleauthor.title_id == titles.title_id AND -- brings in the title rows
	titles.pub_id == publishers.pub_id -- attaches the publisher of each title
	-- after these filters each row represents one author, title, publisher
GROUP BY
	authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name -- groups by all these
ORDER BY
	authors.au_lname, authors.au_fname, publishers.pub_name; -- sort final report alphabetically by author name, then publisher
	
-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles?
-- Write a query to find out.
-- Output should have Author ID, Last Name, First Name, Total (total no. of titles)
-- Order output from high TOTAL to lower
-- Limit output to 3
-- with comma-join style QUERY (syntax)
-- Top 3 best selling authors 

SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	SUM(sales.qty) AS "TOTAL" -- sums the sold units across all matching sales rows - total units sold for that author
FROM authors, titleauthor, titles, sales -- comma joins the lists in these tables
WHERE  -- turns the big product data into meaningful joins where: 
	authors.au_id = titleauthor.au_id -- connects authors to their authored titles
	AND titleauthor.title_id = titles.title_id -- brings in each title row
	AND titles.title_id = sales.title_id -- attaches all sales rows for each title
	-- after these filters, each joined row corresponds to one sale line for one of the author's titles
GROUP BY
	authors.au_id, authors.au_lname, authors.au_fname -- so the sum is computed per author
ORDER BY
	"TOTAL" DESC -- sort from most to least units sold
LIMIT 3; -- keep only top three authors

-- Challenge 4 - Best Selling Authors Ranking
-- modify the solution in Challenge 3 so that the output 
-- will display all 23 authors instead of the top 3.
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
-- Also order your results based on TOTAL from high to low.
-- 1 CTE autor_sales - precomputes totals per author

WITH author_sales AS (
	SELECT
		ta.au_id, -- for each author adds up all units sold across all their titles
		SUM(s.qty) AS total
	FROM titleauthor ta
	JOIN titles t ON ta.title_id = t.title_id
	JOIN sales s ON t.title_id = s.title_id
	GROUP BY ta.au_id 
)
SELECT -- main query, lists all authors, attach totals, fill 0s
  a.au_id    AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  COALESCE(asl.total, 0) AS "TOTAL"
FROM authors a
LEFT JOIN author_sales asl ON a.au_id = asl.au_id  
ORDER BY "TOTAL" DESC, a.au_lname, a.au_fname;  
 