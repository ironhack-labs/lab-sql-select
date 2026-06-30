SELECT a.au_id as "AUTHOR ID",
				a.au_lname as "LAST NAME",
				a.au_fname as "FIRST NAME",
				t.title as "TITLE",
				p.pub_name as "PUBLISHER"
FROM authors as a
JOIN titleauthor as ta
			on a.au_id = ta.au_id
JOIN titles as t
			on t.title_id = ta.title_id
JOIN  publishers as p
			on p.pub_id = t.pub_id  

			
SELECT a.au_id as "AUTHOR ID",
				a.au_lname as "LAST NAME",
				a.au_fname as "FIRST NAME",
				p.pub_name as "PUBLISHER",
				count(*) as "TITLE COUNT" 
FROM authors as a
JOIN titleauthor as ta
			on a.au_id = ta.au_id
JOIN titles as t
			on t.title_id = ta.title_id
JOIN  publishers as p
			on p.pub_id = t.pub_id  
GROUP by a.au_id,  a.au_lname, a.au_fname, publisher





SELECT a.au_id as "AUTHOR ID",
				a.au_lname as "LAST NAME",
				a.au_fname as "FIRST NAME",
			   sum(s.qty) as "TOTAL"
FROM authors as a
JOIN titleauthor as ta
			on a.au_id = ta.au_id
JOIN titles as t
			on t.title_id = ta.title_id
JOIN  sales as s
			on s.title_id = t.title_id
GROUP by a.au_id, a.au_lname, a.au_fname ORDER by total DESC LIMIT 3





SELECT a.au_id as "AUTHOR ID",
				a.au_lname as "LAST NAME",
				a.au_fname as "FIRST NAME",
			   COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors as a
left JOIN titleauthor as ta
			on a.au_id = ta.au_id
left JOIN titles as t
			on t.title_id = ta.title_id
LEFT JOIN  sales as s
			on s.title_id = t.title_id
GROUP by a.au_id, a.au_lname, a.au_fname ORDER by total DESC 


