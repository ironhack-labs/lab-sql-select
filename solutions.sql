/*Challenge 1 - Who Have Published What At Where?*/
SELECT 
    a.au_id AS 'Author ID' ,
    a.au_lname AS 'Last name' ,
    a.au_fname AS 'First name' ,
    t.title AS Title,
    p.pub_name AS Publisher
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;

/*Challenge 2 - Who Have Published How Many At Where?*/
SELECT 
    a.au_id AS 'Author ID' ,
    a.au_lname AS 'Last name' ,
    a.au_fname AS 'First name' ,
    pub.pub_name AS publisher,
    COUNT(t.title_id) AS 'Title Count'
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers pub ON t.pub_id = pub.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, pub.pub_name
ORDER BY a.au_id, pub.pub_name;

/*Challenge 3 -  Three Best Selling Authors*/
SELECT 
    a.au_id AS 'Author ID' ,
    a.au_lname AS 'Last name' ,
    a.au_fname AS 'First name' ,
    SUM(s.qty) AS Total_sales
FROM titleauthor ta
JOIN authors a ON ta.au_id = a.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY Total_sales DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking*/
SELECT 
    a.au_id AS 'Author ID' ,
    a.au_lname AS 'Last name' ,
    a.au_fname AS 'First name' ,
    IFNULL(SUM(s.qty), 0) AS Total_sold
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY Total_sold DESC;
