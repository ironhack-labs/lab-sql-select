SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title) AS title_count
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY title_count DESC;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(titles.ytd_sales) AS total_sales
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total_sales DESC
LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, COALESCE(SUM(titles.ytd_sales), 0) AS total_sales
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total_sales DESC;
