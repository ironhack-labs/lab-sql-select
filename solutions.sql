-- Challenge 1: List authors, their books, and publishers
SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    t.title,
    p.pub_name AS publisher
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;


-- Challenge 2: Count of books per author per publisher
SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    p.pub_name AS publisher,
    COUNT(t.title_id) AS TITLE_COUNT
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY TITLE_COUNT DESC;

-- Validate total book count
SELECT SUM(book_count) FROM (
    SELECT a.au_id, p.pub_name, COUNT(t.title_id) AS book_count
    FROM authors a
    JOIN titleauthor ta ON a.au_id = ta.au_id
    JOIN titles t ON ta.title_id = t.title_id
    JOIN publishers p ON t.pub_id = p.pub_id
    GROUP BY a.au_id, p.pub_name
) AS book_summary;

-- Check if sum matches total entries in titleauthor
SELECT COUNT(*) FROM titleauthor;

-- Challenge 3: Top 3 authors by sales
SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    SUM(s.qty) AS total_sales
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY total_sales DESC
LIMIT 3;

-- Challenge 4: Total sales per author, including those with no sales
SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    COALESCE(SUM(s.qty), 0) AS total_sales
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY total_sales DESC;
