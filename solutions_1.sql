-- Lab | SQL Select
-- Database: publications.sqlite

-- ==========================================================
-- Challenge 1 - Who Have Published What At Where?
--
-- Join authors -> titleauthor -> titles -> publishers.
-- Row count should equal the total number of records in titleauthor (25).
-- ==========================================================
SELECT
    a.au_id      AS "AUTHOR ID",
    a.au_lname   AS "LAST NAME",
    a.au_fname   AS "FIRST NAME",
    t.title      AS "TITLE",
    p.pub_name   AS "PUBLISHER"
FROM titleauthor ta
JOIN authors a     ON ta.au_id = a.au_id
JOIN titles t      ON ta.title_id = t.title_id
JOIN publishers p  ON t.pub_id = p.pub_id
ORDER BY a.au_id;


-- ==========================================================
-- Challenge 2 - Who Have Published How Many At Where?
--
-- Same join as Challenge 1, but grouped by author + publisher and
-- counted. Sum of TITLE COUNT should equal the total number of
-- records in titleauthor (25).
-- ==========================================================
SELECT
    a.au_id      AS "AUTHOR ID",
    a.au_lname   AS "LAST NAME",
    a.au_fname   AS "FIRST NAME",
    p.pub_name   AS "PUBLISHER",
    COUNT(*)     AS "TITLE COUNT"
FROM titleauthor ta
JOIN authors a     ON ta.au_id = a.au_id
JOIN titles t      ON ta.title_id = t.title_id
JOIN publishers p  ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id;


-- ==========================================================
-- Challenge 3 - Best Selling Authors
--
-- Total titles sold per author = sum of `qty` from the sales table,
-- joined through titleauthor on title_id. Top 3 by TOTAL, descending.
-- ==========================================================
SELECT
    a.au_id      AS "AUTHOR ID",
    a.au_lname   AS "LAST NAME",
    a.au_fname   AS "FIRST NAME",
    SUM(s.qty)   AS "TOTAL"
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN sales s   ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC
LIMIT 3;


-- ==========================================================
-- Challenge 4 - Best Selling Authors Ranking
--
-- Same idea as Challenge 3, but for ALL 23 authors, including those
-- with 0 sales. LEFT JOINs keep authors with no titleauthor/sales
-- rows, and COALESCE turns the resulting NULL sum into 0.
-- ==========================================================
SELECT
    a.au_id             AS "AUTHOR ID",
    a.au_lname          AS "LAST NAME",
    a.au_fname          AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN sales s        ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY "TOTAL" DESC;
