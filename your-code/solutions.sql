-- 1 
SELECT a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME',
a.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_name as 'PUBLISHER' FROM
titles  as t join publishers as p on t.pub_id = p.pub_id
JOIN  titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id;

SELECT  count(t.title) as 'TITLEs' FROM
titles  as t join publishers as p on t.pub_id = p.pub_id
JOIN  titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id GROUP BY ta.title_id;


-- 2
SELECT  count(t.title) as 'TITLEs' FROM
titles  as t join publishers as p on t.pub_id = p.pub_id
JOIN  titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id;
SELECT COUNT(*) FROM titleauthor;


-- 3
SELECT a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', SUM(s.qty) as 'TOTAL' FROM 
sales as s JOIN titles as t on t.title_id = s.title_id
JOIN titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id
GROUP BY a.au_id ORDER BY 'TOTAL'  DESC LIMIT 3;


-- 4
SELECT a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME',
CASE 
 WHEN s.qty ISNULL THEN '0'
 ELSE SUM(s.qty) 
END
as 'TOTAL' FROM sales as s 
JOIN titles as t on t.title_id = s.title_id
JOIN titleauthor as ta on t.title_id = ta.title_id
RIGHT OUTER JOIN authors as a on ta.au_id = a.au_id
GROUP BY a.au_id ORDER BY TOTAL DESC NULLS LAST;
