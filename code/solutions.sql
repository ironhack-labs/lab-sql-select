 -- query 1 ---

   SELECT a.au_id, 
		  a.au_lname, 
		  a.au_fname, 
		  t.title,
		  p.pub_name
   FROM authors as a
   JOIN titleauthor as ta on a.au_id = ta.au_id
   JOIN titles as t on  ta.title_id = t.title_id
   JOIN publishers as p on t.pub_id = p.pub_id

 -- query 2 ---

SELECT a.au_id as "Author ID",
	   a.au_lname as "Author Last name",
	   a.au_fname as "Author First name",
	   p.pub_name as "Publisher",
	   count(ta.title_id) as "Title Count"
FROM authors as a
JOIN titleauthor as ta on a.au_id = ta.au_id
JOIN titles as t on ta.title_id = t.title_id
JOIN publishers as p on t.pub_id = p.pub_id
group by a.au_id,
		 a.au_lname,
		 p.pub_id,
		 p.pub_name
order by a.au_id DESC
	

   -- query 3 count of titles per autor --- 
   
SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    count(s.qty) AS "TOTAL"
FROM authors AS a
JOIN titleauthor AS ta ON ta.au_id = a.au_id
JOIN sales AS s ON s.title_id = ta.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3;
		  
   -- query 4 count of titles per autor --- 
		  
SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    COALESCE(count(s.qty), 0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN sales AS s ON s.title_id = ta.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
