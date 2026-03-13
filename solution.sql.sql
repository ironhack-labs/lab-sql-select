-- Challenge 1
SELECT 
    a.au_id as "Author ID",
    a.au_lname as "last name",
	a.au_fname as "First name",  
    t.title as "Title",
	p.pub_name as "Publisher"
FROM authors as a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles as t on ta.title_id = t.title_id
JOIN publishers as p on t.pub_id = p.pub_id;

-- Challenge 2
SELECT 
	a.au_id as "Author ID", 
	a.au_lname as "last name", 
	a.au_fname as "First name", 
	p.pub_name as "Publisher",
	count(t.title_id) as "Title count"
FROM authors as a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles as t on ta.title_id = t.title_id
JOIN publishers as p on t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_id, a.au_lname, a.au_fname, p.pub_name;

-- Challenge 3
SELECT
	a.au_id as "Author ID",
	a.au_lname as "Last Name",
	a.au_fname as "First Name",
	sum(s.qty) as "Total"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "Total" DESC
LIMIT 3;

-- Challenge 4
SELECT
	a.au_id as "Author ID",
	a.au_lname as "Last Name",
	a.au_fname as "First Name",
	coalesce(sum(s.qty),0) as "Total"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "Total" DESC
