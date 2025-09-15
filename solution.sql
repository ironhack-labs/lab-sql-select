
-- 1. `AUTHOR ID` - the ID of the author, `LAST NAME` - author last name,  `FIRST NAME` - author first name, `TITLE` - name of the published title, `PUBLISHER` - name of the publisher where the title was published
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

-- check for number of records in titleauthor for check from instructions
SELECT COUNT(*) FROM titleauthor t;


-- 2. query how many titles each author has published at each publisher.
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(t.title_id) AS publication_count
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_lname;

-- sanity check, should add up to 25 again
SELECT SUM(publication_count) AS total_publications
FROM (SELECT a.au_id, a.au_lname, p.pub_name, COUNT(t.title_id) AS publication_count
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_lname
);


-- 3. Who are the top 3 authors who have sold the highest number of titles? 
-- au_id, au_lname, au_fname, number of titles
SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) AS sales_count
FROM authors a 
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sales_count DESC
LIMIT 3;

-- 4. Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
-- Also order your results based on TOTAL from high to low.

-- need to use LEFT JOIN to include authors without title entries
SELECT a.au_id, a.au_lname, a.au_fname,
	CASE 
		WHEN SUM(s.qty) IS NULL THEN 0
		ELSE SUM(s.qty)
	END AS TOTAL
FROM authors a 
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

-- alternative with COALESCE
SELECT a.au_id, a.au_lname, a.au_fname, COALESCE(SUM(s.qty),0) TOTAL
FROM authors a 
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;




