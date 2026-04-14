-- Challenge 1 - Who Have Published What At Where?

SELECT a.au_id "AUTHOR ID" , a.au_lname "LAST NAME" , a.au_fname "FIRST NAME" , t.title "TITLE" , p.pub_name "PUBLISHER"
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id=ta.au_id
JOIN titles AS t ON ta.title_id=t.title_id
JOIN publishers AS p ON t.pub_id=p.pub_id;

--Challenge 2 - Who Have Published How Many At Where?

SELECT a.au_id "AUTHOR ID" , a.au_lname "LAST NAME" , a.au_fname "FIRST NAME" , p.pub_name "PUBLISHER" , COUNT(t.title)
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id=ta.au_id
JOIN titles AS t ON ta.title_id=t.title_id
JOIN publishers AS p ON t.pub_id=p.pub_id
GROUP BY a.au_id ,p.pub_name 
ORDER BY a.au_id DESC;

-- Challenge 3 - Best Selling Authors

SELECT a.au_id "AUTHOR ID" , a.au_lname "LAST NAME" , a.au_fname "FIRST NAME" , COUNT(s.stor_id) AS TOTAL
FROM authors AS a
JOIN titleauthor AS ta ON a.au_id = ta.au_id
JOIN titles AS t ON ta.title_id = t.title_id
JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id  
ORDER BY TOTAL DESC LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking

-- Challenge 4 - Option 1

SELECT a.au_id "AUTHOR ID" , a.au_lname "LAST NAME" , a.au_fname "FIRST NAME" , COUNT(s.stor_id) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id  
ORDER BY TOTAL DESC;

-- Challenge 4 - Option 2

SELECT a.au_id "AUTHOR ID" , a.au_lname "LAST NAME" , a.au_fname "FIRST NAME" ,
SUM(CASE
					WHEN s.stor_id IS NOT NULL THEN 1
					ELSE 0
		 END) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id  
ORDER BY TOTAL DESC;
