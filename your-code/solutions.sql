
-- I.Who Have Published What At Where?

-- what titles each author has published at which publishers
-- including the author's id, last name, first name , title of the book, and the publisher's name
DROP TABLE IF EXISTS author_title_publisher;
CREATE TABLE author_title_publisher AS
SELECT aut.au_id AS Author_id
      , aut.au_lname AS Last_name
      , aut.au_fname AS First_name
      , tit_aut_map.title_id AS Title_id
      , tit.title AS Title
      , tit.pub_id AS Publisher_id
      , pub.pub_name AS Publisher
FROM authors AS aut
-- join with titles auth table to get the title_id
LEFT JOIN titleauthor AS tit_aut_map
ON aut.au_id = tit_aut_map.au_id
-- now join with title table to get the title name and the publisher id
LEFT JOIN titles AS tit
ON tit_aut_map.title_id = tit.title_id
-- now join with publishers table to get the publisher name
LEFT JOIN publishers AS pub
ON tit.pub_id = pub.pub_id;

-- now check what was asked for 
SELECT 
Author_id
, Last_name
, First_name
, Title
, Publisher
FROM author_title_publisher
ORDER BY Author_id 
;

-- II. Who Have Published How Many At Where?
-- how many titles published by each author at each publisher
DROP TABLE IF EXISTS author_publisher_title_count;
CREATE TABLE author_publisher_title_count AS
SELECT Author_id
, Last_name
, First_name
, Publisher
, COUNT(DISTINCT Title_id) AS Title_count
FROM author_title_publisher
-- take the cases of autors with no titles out
WHERE Title_id IS NOT NULL
GROUP BY Author_id, Last_name, First_name, Publisher
ORDER BY Title_count DESC, Author_id DESC, Publisher DESC
;

SELECT *
FROM author_publisher_title_count;

-- now check if the  output is correct
-- by checking if the sum of title counts matches the total number of title-author mappings

SELECT (SELECT SUM(Title_count)
FROM author_publisher_title_count) = (SELECT COUNT(*) AS count_map
FROM titleauthor)
;

-- it does (getting a 1 on the boolean) so all good

-- III. best selling authors
-- who are the top 3 authors with the highest total sales (BI) 
-- calculate total sales per author first
DROP TABLE IF EXISTS authorts_sales;
CREATE TABLE authorts_sales AS
SELECT Author_id
      , Last_name
      , First_name
      , COALESCE(SUM(sal.qty), 0) AS Total_sales
FROM author_title_publisher AS aut_tit
LEFT JOIN sales AS sal
ON aut_tit.Title_id = sal.title_id
GROUP BY Author_id, Last_name, First_name
;

-- top 3 autors 
SELECT *
FROM authorts_sales
ORDER BY Total_sales DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking all 23 authors
SELECT *
FROM authorts_sales
ORDER BY Total_sales DESC
;
