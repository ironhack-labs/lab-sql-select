-- Challenge 1
SELECT
  authors.au_id AS "AUTHOR ID",
  authors.au_lname AS "LAST NAME",
  authors.au_fname AS "FIRST NAME",
  titles.title AS "TITLE",
  publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers, titleauthor
WHERE
  authors.au_id = titleauthor.au_id AND
  titleauthor.title_id = titles.title_id AND
  titles.pub_id = publishers.pub_id;



-- Challenge 2
SELECT
  authors.au_id AS "AUTHOR ID",
  authors.au_lname AS "LAST NAME",
  authors.au_fname AS "FIRST NAME",
  publishers.pub_name AS "PUBLISHER",
  COUNT(titles.title_id) AS "TITLE COUNT"
FROM
  authors, titles, publishers, titleauthor
WHERE
  authors.au_id = titleauthor.au_id AND
  titleauthor.title_id = titles.title_id AND
  titles.pub_id = publishers.pub_id
GROUP BY
  authors.au_id,
  publishers.pub_name;

 -- SELECT: Tells the database what columns you want in your output, 
 -- and allows you to rename columns for clarity.​

-- FROM: Lists the tables you want to get data from.​

-- WHERE: Defines the conditions that must be met for rows to be included 
--in the result—such as matching keys between tables, or filtering by value.

-- Challenge 3
SELECT
  authors.au_id AS "AUTHOR ID",
  authors.au_lname AS "LAST NAME",
  authors.au_fname AS "FIRST NAME",
  SUM(titles.ytd_sales) AS "TOTAL"
FROM
  authors, titles, titleauthor
WHERE
  authors.au_id = titleauthor.au_id AND
  titleauthor.title_id = titles.title_id
GROUP BY
  authors.au_id
ORDER BY
  "TOTAL" DESC
LIMIT 3;


-- Challenge 4 (implicit join style, authors with titles only)
SELECT
  authors.au_id AS "AUTHOR ID",
  authors.au_lname AS "LAST NAME",
  authors.au_fname AS "FIRST NAME",
  SUM(titles.ytd_sales) AS "TOTAL"
FROM
  authors, titles, titleauthor
WHERE
  authors.au_id = titleauthor.au_id
  AND titleauthor.title_id = titles.title_id
GROUP BY
  authors.au_id
ORDER BY
  "TOTAL" DESC
LIMIT 23;


