-- Challenge 1 - Who Have Published What At Where?
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors AS a
JOIN titleauthor AS at ON a.au_id = at.au_id
JOIN titles AS t ON at.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(t.title_id) AS title_count
FROM authors AS a
JOIN titleauthor AS at ON a.au_id = at.au_id
JOIN titles AS t ON at.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;

-- Challenge 3 - Best Selling Authors
SELECT a.au_id, a.au_lname, a.au_fname, SUM(t.ytd_sales) AS total 
FROM authors AS a
JOIN titleauthor AS at ON a.au_id = at.au_id
JOIN titles AS t ON at.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY total DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id, a.au_lname, a.au_fname, 
	CASE WHEN SUM(t.ytd_sales) IS NULL THEN 0 ELSE SUM(t.ytd_sales) END AS total
FROM authors AS a
LEFT JOIN titleauthor AS at ON a.au_id = at.au_id
LEFT JOIN titles AS t ON at.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY total DESC;