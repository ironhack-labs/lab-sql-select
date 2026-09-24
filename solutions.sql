/* challenge 1*/
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors AS a

INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id

INNER JOIN titles AS t
ON ta.title_id = t.title_id

INNER JOIN publishers AS p
ON t.pub_id = p.pub_id;

/* challenge 2*/

SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title_id) as title_count
FROM authors AS a

INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id

INNER JOIN titles AS t
ON ta.title_id = t.title_id

LEFT JOIN publishers AS p
ON t.pub_id = p.pub_id

GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
order by  count(t.title_id) DESC

/* challenge 3*/

SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"

FROM authors AS a

INNER JOIN titleauthor AS ta
ON a.au_id = ta.au_id

INNER JOIN titles AS t
ON ta.title_id = t.title_id

INNER JOIN sales AS s
ON t.title_id = s.title_id

GROUP BY a.au_id, a.au_lname, a.au_fname

ORDER BY TOTAL DESC

LIMIT 3

/* challenge 4*/


SELECT
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(
        CASE
            WHEN s.qty IS NULL THEN 0
            ELSE s.qty
        END
    )AS "TOTAL"

FROM authors AS a

LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id

LEFT JOIN titles AS t
ON ta.title_id = t.title_id

LEFT JOIN sales AS s
ON t.title_id = s.title_id

GROUP BY a.au_id, a.au_lname, a.au_fname

ORDER BY TOTAL DESC



