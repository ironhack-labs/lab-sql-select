-- ============================================================
-- Lab | SQL Select
-- Database: publications.sqlite
-- ============================================================


-- ------------------------------------------------------------
-- Challenge 1 - Who Have Published What At Where?
-- ------------------------------------------------------------
-- Write an SQL SELECT query that joins various tables to figure
-- out what titles each author has published at which publishers.
-- Output columns:
--   AUTHOR ID  - the ID of the author
--   LAST NAME  - author last name
--   FIRST NAME - author first name
--   TITLE      - name of the published title
--   PUBLISHER  - name of the publisher where the title was published
--
-- If correct, total rows == total records in table `titleauthor`.
-- ------------------------------------------------------------
SELECT
    a.au_id          AS "AUTHOR ID",
    a.au_lname       AS "LAST NAME",
    a.au_fname       AS "FIRST NAME",
    t.title          AS "TITLE",
    p.pub_name       AS "PUBLISHER"
FROM authors a
JOIN titleauthor ta ON a.au_id    = ta.au_id
JOIN titles      t  ON ta.title_id = t.title_id
JOIN publishers  p  ON t.pub_id    = p.pub_id;


-- ------------------------------------------------------------
-- Challenge 2 - Who Have Published How Many At Where?
-- ------------------------------------------------------------
-- Elevating from Challenge 1, query how many titles each author
-- has published at each publisher.
--
-- To verify: SUM of the TITLE COUNT column should equal the total
-- number of records in table `titleauthor`.
--
-- Hint: use COUNT() and GROUP BY.
-- ------------------------------------------------------------
SELECT
    a.au_id          AS "AUTHOR ID",
    a.au_lname       AS "LAST NAME",
    a.au_fname       AS "FIRST NAME",
    p.pub_name       AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM authors a
JOIN titleauthor ta ON a.au_id    = ta.au_id
JOIN titles      t  ON ta.title_id = t.title_id
JOIN publishers  p  ON t.pub_id    = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY "TITLE COUNT" DESC;




-- ------------------------------------------------------------
-- Challenge 3 - Best Selling Authors
-- ------------------------------------------------------------
-- Who are the top 3 authors who have sold the highest number of
-- titles?
--
-- Requirements:
--   Output columns:
--     AUTHOR ID  - the ID of the author
--     LAST NAME  - author last name
--     FIRST NAME - author first name
--     TOTAL      - total number of titles sold from this author
--   Order by TOTAL from high to low.
--   Only output the top 3 best selling authors.
-- ------------------------------------------------------------

SELECT
    a.au_id        AS "AUTHOR ID",
    a.au_lname     AS "LAST NAME",
    a.au_fname     AS "FIRST NAME",
    SUM(s.qty)     AS "TOTAL"
FROM authors a
JOIN titleauthor ta ON a.au_id     = ta.au_id
JOIN sales       s  ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC
LIMIT 3;




-- ------------------------------------------------------------
-- Challenge 4 - Best Selling Authors Ranking
-- ------------------------------------------------------------
-- Modify Challenge 3 so the output displays all 23 authors instead
-- of the top 3. Authors who have sold 0 titles should also appear
-- (display 0 instead of NULL as the TOTAL).
-- Order the results based on TOTAL from high to low.
-- ------------------------------------------------------------

SELECT
    a.au_id                 AS "AUTHOR ID",
    a.au_lname              AS "LAST NAME",
    a.au_fname              AS "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id     = ta.au_id
LEFT JOIN sales       s  ON ta.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC;


