-- Challenge 1 - Who Have Published What At Where?
SELECT a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, p.pub_name as PUBLISHER 
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON t.title_id = ta.title_id
JOIN publishers as p ON p.pub_id = t.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, p.pub_name as PUBLISHER, COUNT(ta.title_id) as TITLE_COUNT 
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON t.title_id = ta.title_id
JOIN publishers as p ON p.pub_id = t.pub_id
GROUP BY a.au_id, p.pub_name;

-- Challenge 3 - Best Selling Authors
SELECT a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, sum(t.ytd_sales) as TOTAL
FROM authors as a
JOIN titleauthor as ta ON a.au_id = ta.au_id
JOIN titles as t ON t.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,
	CASE 
		WHEN sum(t.ytd_sales) IS NULL THEN 0
		ELSE sum(t.ytd_sales)
	END AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
LEFT JOIN titles as t ON t.title_id = ta.title_id

GROUP BY a.au_id
ORDER BY TOTAL DESC




