/* Challenge 1
SELECT
	au.au_id AS "AUTHOR ID",
	au.au_lname AS "LAST NAME",
	au.au_fname AS "FIRST NAME",
	t.title AS "TITLE",
	pub.pub_name AS "PUBLISHER"
	
FROM
	authors AS au
	
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS pub ON pub.pub_id = t.pub_id

ORDER BY au.au_id ASC
*/

/* Challenge 2
SELECT
	au.au_id AS "AUTHOR ID",
	au.au_lname AS "LAST NAME",
	au.au_fname AS "FIRST NAME",
	t.title AS "TITLE",
	pub.pub_name AS "PUBLISHER",
	COUNT(t.title_id) AS "TITLE COUNT"
	
FROM
	authors AS au
	
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS pub ON pub.pub_id = t.pub_id

GROUP BY au.au_id

ORDER BY au.au_id ASC
*/

/* Challenge 3
SELECT
	au.au_id AS "AUTHOR ID",
	au.au_lname AS "LAST NAME",
	au.au_fname AS "FIRST NAME",
	COUNT(t.title_id) AS "TITLE COUNT"
	
FROM
	authors AS au
	
JOIN titleauthor AS ta ON au.au_id = ta.au_id
JOIN titles AS t ON t.title_id = ta.title_id
JOIN publishers AS pub ON pub.pub_id = t.pub_id

GROUP BY au.au_id

ORDER BY COUNT(t.title_id) DESC LIMIT 3
*/

/* Challenge 4
SELECT
	au.au_id AS "AUTHOR ID",
	au.au_lname AS "LAST NAME",
	au.au_fname AS "FIRST NAME",
	COUNT(t.title_id) AS "TITLE COUNT"
	
FROM
	authors AS au
	
LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
LEFT JOIN titles AS t ON t.title_id = ta.title_id
LEFT JOIN publishers AS pub ON pub.pub_id = t.pub_id

GROUP BY au.au_id

ORDER BY COUNT(t.title_id) DESC
*/
