-- Challenge 1: Who Have Published What At Where?
-- Goal: Show each author, the title they published, and the publisher.
-- Tables needed: authors, titleauthor, titles, publishers.
-- Relationship path:
-- authors -> titleauthor -> titles -> publishers

SELECT
    authors.au_id AS author_id,
    authors.au_lname AS last_name,
    authors.au_fname AS first_name,
    titles.title AS title,
    publishers.pub_name AS publisher
FROM authors
JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
JOIN titles
    ON titleauthor.title_id = titles.title_id
JOIN publishers
    ON titles.pub_id = publishers.pub_id;
	
-- Challenge 2: Who Have Published How Many At Where?
-- Goal: Count how many titles each author has published at each publisher.
-- Tables needed: authors, titleauthor, titles, publishers.
-- Relationship path:
-- authors -> titleauthor -> titles -> publishers

SELECT
    authors.au_id AS author_id,
    authors.au_lname AS last_name,
    authors.au_fname AS first_name,
    publishers.pub_name AS publisher,
    COUNT(titles.title_id) AS title_count
FROM authors
JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
JOIN titles
    ON titleauthor.title_id = titles.title_id
JOIN publishers
    ON titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY
    title_count DESC;
	
-- Challenge 3: Best Selling Authors
-- Goal: Find the top 3 authors by total number of titles sold.
-- Tables needed: authors, titleauthor, titles, sales.
-- Relationship path:
-- authors -> titleauthor -> titles -> sales

SELECT
    authors.au_id AS author_id,
    authors.au_lname AS last_name,
    authors.au_fname AS first_name,
    SUM(sales.qty) AS total
FROM authors
JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
JOIN titles
    ON titleauthor.title_id = titles.title_id
JOIN sales
    ON titles.title_id = sales.title_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY
    total DESC
LIMIT 3;

-- Challenge 4: Best Selling Authors Ranking
-- Goal: Rank all authors by total sales, including authors with no sales.
-- Tables needed: authors, titleauthor, titles, sales.
-- Relationship path:
-- authors -> titleauthor -> titles -> sales
-- Note: LEFT JOIN keeps authors with no matching sales; COALESCE converts NULL to 0.

SELECT
    authors.au_id AS author_id,
    authors.au_lname AS last_name,
    authors.au_fname AS first_name,
    COALESCE(SUM(sales.qty), 0) AS total
FROM authors
LEFT JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
    ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
    ON titles.title_id = sales.title_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY
    total DESC;