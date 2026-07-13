--- Challenge 1
SELECT ta.au_id, a.au_lname, a.au_fname, t.title, p.pub_name FROM titleauthor as ta
LEFT JOIN authors as a on ta.au_id = a.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
LEFT JOIN publishers as p on t.pub_id = p.pub_id;
----------

--- Challenge 2
SELECT ta.au_id, a.au_lname, a.au_fname, p.pub_name , count(t.title) as title_count FROM titleauthor as ta
LEFT JOIN authors as a on ta.au_id = a.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
LEFT JOIN publishers as p on t.pub_id = p.pub_id
GROUP BY  ta.au_id, p.pub_id
ORDER BY title_count DESC;
----------

--- Challenge 3
SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) as total_sales FROM authors as a
LEFT JOIN titleauthor as ta on ta.au_id = a.au_id
LEFT JOIN sales as s on ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY total_sales DESC
LIMIT 3;
----------

--- Challenge 4
SELECT a.au_id, a.au_lname, a.au_fname, ifnull(sum(s.qty), 0) as total_sales FROM authors as a
LEFT JOIN titleauthor as ta on ta.au_id = a.au_id
LEFT JOIN sales as s on ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY total_sales DESC;
----------
