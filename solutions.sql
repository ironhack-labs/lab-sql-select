### Query 1

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_name as 'PUBLISHER'
from authors as a inner JOIN  titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t 
on ta.title_id = t.title_id
INNER JOIN publishers as p
on t.pub_id = p.pub_id;

### Query 2


select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', p.pub_name as 'PUBLISHER', count(t.title) as 'TITLE COUNT'
from authors as a inner JOIN  titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t 
on ta.title_id = t.title_id
INNER JOIN publishers as p
on t.pub_id = p.pub_id
group by a.au_id, p.pub_name
order by count(t.title) DESC;


### Query 3
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    SUM(s.qty) AS 'TOTAL'
FROM authors AS a
INNER JOIN titleauthor AS ta
    ON a.au_id = ta.au_id
INNER JOIN titles AS t
    ON ta.title_id = t.title_id
INNER JOIN sales AS s
    ON t.title_id = s.title_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    SUM(s.qty) DESC
LIMIT 3;
	

### Query 4
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    IFNULL(SUM(s.qty), 0) AS 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta
    ON a.au_id = ta.au_id
LEFT JOIN titles AS t
    ON ta.title_id = t.title_id
LEFT JOIN sales AS s
    ON t.title_id = s.title_id
GROUP BY
    a.au_id,
    a.au_lname,
    a.au_fname
ORDER BY
    TOTAL DESC;
