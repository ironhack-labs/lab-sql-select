SELECT
  ta.au_id      AS `AUTHOR ID`,
  aut.au_lname    AS `LAST NAME`,
  aut.au_fname    AS `FIRST NAME`,
  titl.title       AS `TITLE`,
  publ.pub_name    AS `PUBLISHER`
FROM titleauthor AS ta
JOIN authors     AS aut ON aut.au_id   = ta.au_id
JOIN titles      AS titl ON titl.title_id = ta.title_id
JOIN publishers  AS publ ON publ.pub_id  = titl.pub_id
ORDER BY
  ta.au_id;
  
  
  
  
  
SELECT
  ta.au_id      AS `AUTHOR ID`,
  aut.au_lname    AS `LAST NAME`,
  aut.au_fname    AS `FIRST NAME`,
  publ.pub_name    AS `PUBLISHER`,
  COUNT(*) AS `TITLE COUNT`
  
FROM titleauthor AS ta
JOIN authors     AS aut ON aut.au_id   = ta.au_id
JOIN titles      AS titl ON titl.title_id = ta.title_id
JOIN publishers  AS publ ON publ.pub_id  = titl.pub_id
GROUP BY
  ta.au_id,
  aut.au_lname,
  aut.au_fname,
  publ.pub_name
ORDER BY
  ta.au_id DESC;
  
  
  
  
  

SELECT
  ta.au_id     AS `AUTHOR ID`,
  aut.au_lname AS `LAST NAME`,
  aut.au_fname AS `FIRST NAME`,
  COALESCE(SUM(s.qty),0)   AS `TOTAL TITLES`
FROM titleauthor AS ta
JOIN authors AS aut ON aut.au_id = ta.au_id
LEFT JOIN sales as s on s.title_id=ta.title_id
GROUP BY
  ta.au_id, aut.au_lname, aut.au_fname
ORDER BY
  `TOTAL TITLES` DESC
  limit 3;



SELECT
  ta.au_id     AS `AUTHOR ID`,
  aut.au_lname AS `LAST NAME`,
  aut.au_fname AS `FIRST NAME`,
  COALESCE(SUM(s.qty),0)   AS `TOTAL TITLES`
FROM titleauthor AS ta
JOIN authors AS aut ON aut.au_id = ta.au_id
LEFT JOIN sales as s on s.title_id=ta.title_id
GROUP BY
  ta.au_id, aut.au_lname, aut.au_fname
ORDER BY
  `TOTAL TITLES` DESC

