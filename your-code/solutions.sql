--Challenge 1 - Who Have Published What At Where?:
--FROM to set the starting table, JOIN to joins all 4 tables and uses AS to rename columns to match the required output. Pulls desired fields, ON defines which columns must match and pulls it all into a new table titleauthor (alias ta)
--check: output returns 25 rows which is the same as the 'titleauthor'
--Outline:
	--1. Select the columns you want
		--From all 4 tables: authors, titles, publishers, and titleauthor
		--Use AS to rename them to match the output format (ex "FIRST NAME")
	--2. Set your starting table
		--FROM titleauthor AS ta (alias)
		--This is “anchor” table — links authors to titles
	--3. Join the other tables: These JOIN lines connect each related table to the anchor, using their matching IDs
		--JOIN authors AS a ON ta.au_id = a.au_id
		-- JOIN titles AS t ON ta.title_id = t.title_id
		--JOIN publishers AS p ON t.pub_id = p.pub_id
	--4. Each ON defines the match condition
		-- Only rows where the values match (like au_id = au_id) are combined
SELECT 
  a.au_id AS "AUTHOR ID", --gets author ID from the authors table and renames it as "Author ID"
  a.au_lname AS "LAST NAME", --gets authors last name from authors table and renames it as "LAST NAME"
  a.au_fname AS "FIRST NAME", --gets authors first name from authors table and renames it as...
  t.title AS "TITLE", --gets tittle of the book from titles and renames it as...
  p.pub_name AS "PUBLISHER" --gets publichlisher name from publishers and renames it as...
  --the above take the desired columns from each table and give new labels they will take on in the resulting output table. 
FROM titleauthor AS ta --sets the starting table: start from titleauthor table and give it the shortcut name ta 
JOIN authors AS a ON ta.au_id = a.au_id --joins authors table (alias a) to titleauthor: matching records where (ON)  ta.au_id=a.au_id, this will add the author name info to each record.
JOIN titles AS t ON ta.title_id = t.title_id --joins the titles table (alias t) to title author: matches wehre (ON) title_id values are the same so results will now have book titles. 
JOIN publishers AS p ON t.pub_id = p.pub_id; --joins publishers table (alias p) to titles: matches based on (ON)  pub_id, results will incldue publishers name. 
--the above joins the table listed to the titleauthor or title table where the records match. Basically forms a chain to connect tables together using matching columns.
	-- starts with the title author table, pulling matching rows from other tables where the keys match. 
		-- 1. FROM titleauthor AS ta → Start with this table (which links authors to titles)
		--2. JOIN authors AS a ON ta.au_id = a.au_id → Add author name info only where au_id matches in both tables
		--3. JOIN titles AS t ON ta.title_id = t.title_id → Add book title info only for matching title_id
		--4. JOIN publishers AS p ON t.pub_id = p.pub_id → Add publisher info by matching pub_id from the titles table

		
--Challenge 2 - Who Have Published How Many At Where?
--goal: count how many titles each author has published with each publisher
--the process is the same as the above challenge with the addition of grouping and ordering. 
SELECT 
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  p.pub_name AS "PUBLISHER",
  COUNT(t.title) AS "TITLE COUNT" --counts how many titles each auther pubed at each publisher
FROM titleauthor AS ta
JOIN authors AS a ON ta.au_id = a.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name --groups by author names and publisher (we need 1 row per pair of author/publisher to do the count)
ORDER BY a.au_id; --sorts (if needed)

--To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`:
SELECT COUNT(*) FROM titleauthor;
--returns: 25 -correct

SELECT SUM("TITLE COUNT") FROM 
(
SELECT 
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  p.pub_name AS "PUBLISHER",
  COUNT(t.title) AS "TITLE COUNT"
FROM titleauthor AS ta
JOIN authors AS a ON ta.au_id = a.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name 
ORDER BY a.au_id
);
--also returns 25 so correct


--Challenge 3 - Best Selling Authors
--goal: find the top3 selling authors who sold the most total copies of all their respective titles
--how: count how many copies from sales.qty were sold per author and show the author ID, lastname, firstname, total. Then sort by total in order. 
SELECT --tables involved
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  SUM(s.qty) AS "TOTAL" --sums the qty column from sales table (alias is s, see below in join)
FROM titleauthor AS ta
JOIN authors AS a ON ta.au_id = a.au_id
JOIN sales AS s ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname --we need to group the sales rows by author names and IDs (so each row will be all the sales beloning to that author) to do the count for each pair of author ID and names.
ORDER BY TOTAL DESC
LIMIT 3;


--Challenge 4 - Best Selling Authors Ranking
--goal: modify challenge 3 to show all 23 authors, even those who sold 0 titles, display 0 instead of  NULL for 'TOTAL', order results based on total. 
SELECT 
  a.au_id AS "AUTHOR ID",
  a.au_lname AS "LAST NAME",
  a.au_fname AS "FIRST NAME",
  CASE --replaes null with 0
    WHEN SUM(s.qty) IS NULL THEN 0
    ELSE SUM(s.qty)
  END AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id --uses left join so authors wo titles appear
LEFT JOIN sales AS s ON ta.title_id = s.title_id --uses left so authors wo sales appear
GROUP BY a.au_id, a.au_lname, a.au_fname --we need 1 row per auther whether or not they have sales so we group the IDs with the names. 
ORDER BY TOTAL DESC;


