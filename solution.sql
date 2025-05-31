
-- Challenge 1 - Who Have Published What At Where?

SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    t.title AS "TITLE",
    p.publisher_name AS "PUBLISHER"
FROM
    authors a
JOIN
    title_author ta ON a.author_id = ta.author_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.publisher_id = p.publisher_id;



-- Challenge 2 - Who Have Published How Many At Where?

SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    p.publisher_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM
    authors a
JOIN
    title_author ta ON a.author_id = ta.author_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.publisher_id = p.publisher_id
GROUP BY
    a.author_id, a.last_name, a.first_name, p.publisher_name
ORDER BY
    "AUTHOR ID", "PUBLISHER";


-- Challenge 3 - Best Selling Authors

SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    SUM(t.sales) AS "TOTAL"
FROM
    authors a
JOIN
    title_author ta ON a.author_id = ta.author_id
JOIN
    titles t ON ta.title_id = t.title_id
GROUP BY
    a.author_id, a.last_name, a.first_name
ORDER BY
    "TOTAL" DESC
LIMIT 3;



-- Challenge 4 - Best Selling Authors Ranking

SELECT
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    COALESCE(SUM(t.sales), 0) AS "TOTAL"
FROM
    authors a
LEFT JOIN
    title_author ta ON a.author_id = ta.author_id
LEFT JOIN
    titles t ON ta.title_id = t.title_id
GROUP BY
    a.author_id, a.last_name, a.first_name
ORDER BY
    "TOTAL" DESC;
