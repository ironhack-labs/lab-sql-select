Query 1

SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    titles.title, 
    publishers.pub_name 
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

Query 2

SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name,
    COUNT(titles.title) AS title_count 
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name
ORDER BY title_count DESC;

Query 3

SELECT 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname, 
    publishers.pub_name,
    COUNT(titles.title_id) AS total_books
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, 
    authors.au_lname, 
    authors.au_fname
ORDER BY total_books DESC
LIMIT 3;