-- Query 1
SELECT a.au_id as 'Author ID', a.au_lname as 'Last Name', a.au_fname as 'First Name', t.title as 'Title', p.pub_name as 'Publisher' 
From authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

--Query 2
SELECT a.au_id as 'Author ID', a.au_lname as 'Last Name', a.au_fname as 'First Name', p.pub_name as 'Publisher', count(t.title) as 'Title count'
From authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
group by "Author ID" ,"Publisher"
order by "Author ID" desc;

--Query 3
SELECT 
    a.au_id AS 'Author ID', 
    a.au_lname AS 'Last Name', 
    a.au_fname AS 'First Name', 
    SUM(s.qty) AS 'Total Copies Sold'
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY `Total Copies Sold` DESC
LIMIT 3;

--Query 4
SELECT 
    a.au_id AS 'Author ID', 
    a.au_lname AS 'Last Name', 
    a.au_fname AS 'First Name', 
    COALESCE(SUM(s.qty), 0) AS 'Total Copies Sold'
FROM authors a
left JOIN titleauthor ta ON a.au_id = ta.au_id
Left JOIN titles t ON ta.title_id = t.title_id
left JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY `Total Copies Sold` DESC
LIMIT 23;

