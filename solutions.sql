SELECT	
	a.au_id AS "AUTHOR ID",
	a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRST NAME",
	t.title AS "TITLE",
	p.pub_name AS "PUBLISHER"
FROM authors a, titles t, publishers p, titleauthor ta
WHERE
	a.au_id == ta.au_id and
	ta.title_id == t.title_id AND
	t.pub_id == p.pub_id;

SELECT 
a.au_id AS "AUTHOR ID", 
a.au_lname AS "LAST NAME", 
a.au_fname AS "FIRST NAME",
p.pub_name AS "PUBLISHER", 
COUNT(t.title_id) AS "TITLE COUNT"
FROM authors a, publishers p, titles t,titleauthor ta
WHERE
  a.au_id == ta.au_id AND
    ta.title_id == t.title_id AND
    t.pub_id == p.pub_id
group by  
  a.au_id, a.au_fname, a.au_lname, p.pub_name
  
order by
    a.au_id DESC;


SELECT 
a.au_id AS "AUTHOR ID", 
a.au_lname AS "LAST NAME", 
a.au_fname AS "FIRST NAME",
SUM(s.qty) AS "TOTAL"
FROM authors a, sales s, titleauthor ta
WHERE 
a.au_id == ta.au_id AND
s.title_id == ta.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC LIMIT 3;


SELECT
	a.au_id AS "AUTHOR ID", 
	a.au_lname AS "LAST NAME", 
	a.au_fname AS "FIRST NAME",
	COALESCE(SUM(s.qty),0) AS "TOTAL"
FROM 
    authors a
    LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
    LEFT JOIN sales s ON ta.title_id = s.title_id
GROUP BY 
	a.au_id, a.au_lname, a.au_fname
ORDER BY 
	"TOTAL" ASC;


