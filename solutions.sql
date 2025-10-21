SELECT
 a.au_id as ID,
 a.au_lname as lname, 
 a.au_fname AS fname,
 t.title as title,
 p.pub_name as publishers
From authors as a
JOIN titleauthor as ta on ta.au_id = a.au_id
JOIN titles as t on t.title_id = ta.title_id
JOIN publishers as p on p.pub_id = t.pub_id;


SELECT
 a.au_id as ID,
 a.au_lname as lname, 
 a.au_fname AS fname,
 t.title as title,
 p.pub_name as publishers,
 count(t.title_id) as ntitles
 
From authors as a
JOIN titleauthor as ta on ta.au_id = a.au_id
JOIN titles as t on t.title_id = ta.title_id
JOIN publishers as p on p.pub_id = t.pub_id
JOIN sales as s on s.title_id = t.title_id
GROUP by a.au_id, p.pub_id
ORDER by ntitles DESC;


SELECT
 a.au_id as ID,
 a.au_lname as lname, 
 a.au_fname AS fname,
 sum(s.qty) as total
From authors as a
JOIN titleauthor as ta on ta.au_id = a.au_id
JOIN titles as t on t.title_id = ta.title_id
JOIN sales as s on s.title_id = t.title_id
GROUP by a.au_id
ORDER by total DESC LIMIT 3;

SELECT
 a.au_id as ID,
 a.au_lname as lname, 
 a.au_fname AS fname,
 t.title as title,
 coalesce(sum(s.qty),0) as total
From authors as a
LEFT JOIN titleauthor as ta on ta.au_id = a.au_id
LEFT JOIN titles as t on t.title_id = ta.title_id
LEFT JOIN sales as s on s.title_id = t.title_id
GROUP by a.au_id
ORDER by total DESC;










