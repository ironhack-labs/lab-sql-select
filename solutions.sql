--- Challenge 1---
SELECT A.au_id, A.au_lname,A.au_fname ,T.title, P.pub_name
FROM authors A
JOIN titleauthor TA on A.au_id = TA.au_id
JOIN titles T on T.title_id = TA.title_id
JOIN publishers P on P.pub_id = T.pub_id;

-- Challenge 2---
SELECT A.au_id, A.au_lname, A.au_fname, P.pub_name, count(T.title)AS "TITLE COUNT"
FROM authors A
JOIN titleauthor TA on A.au_id = TA.au_id
JOIN titles T on T.title_id = TA.title_id
JOIN publishers P on P.pub_id = T.pub_id
group by A.au_id, P.pub_id;

-- Challenge 3---
SELECT A.au_id, A.au_lname, A.au_fname, SUM(T.ytd_sales) AS "TOTAL"
FROM authors A
JOIN titleauthor TA ON A.au_id = TA.au_id
JOIN titles T ON TA.title_id = T.title_id
GROUP BY A.au_id
ORDER BY TOTAL DESC
LIMIT 3;;

-- Challenge 4---
SELECT A.au_id, A.au_lname, A.au_fname, COALESCE(SUM(T.ytd_sales), 0) AS "TOTAL"
FROM authors A
LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
LEFT JOIN titles T ON TA.title_id = T.title_id
GROUP BY A.au_id
ORDER BY TOTAL DESC;




