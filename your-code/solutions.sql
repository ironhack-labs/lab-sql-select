SELECT
 a.au_id    AS "Author_id",
 a.au_lname AS "Last_Name",
 a.au_fname AS "First_name",
 t.title as "title",
 p.pub_id   AS "Publisher"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles  AS t ON  ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;

SELECT
 a.au_id    AS "Author_id",
 a.au_lname AS "Last_Name",
 a.au_fname AS "First_name",
 p.pub_id   AS "Publisher",
  COUNT(t.title_id) AS "Num_Titles"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles  AS t ON  ta.title_id = t.title_id
JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;

SELECT
 a.au_id    AS "Author_id",
 a.au_lname AS "Last_Name",
 a.au_fname AS "First_name",
 SUM(s.qty) AS "Books_sold"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles  AS t ON  ta.title_id = t.title_id
JOIN sales AS s  ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY SUM(s.qty) DESC
LIMIT 3;

SELECT
 a.au_id    AS "Author_id",
 a.au_lname AS "Last_Name",
 a.au_fname AS "First_name",
 coalesce(SUM(s.qty),0) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles  AS t ON  ta.title_id = t.title_id
LEFT JOIN sales AS s  ON s.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;