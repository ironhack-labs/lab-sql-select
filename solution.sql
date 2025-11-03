SELECT
  a.au_id AS &quot;AUTHOR ID&quot;,
  a.au_lname AS &quot;LAST NAME&quot;,
  a.au_fname AS &quot;FIRST NAME&quot;,
  t.title AS &quot;TITLE&quot;,
  p.pub_name AS &quot;PUBLISHER&quot;
FROM
  authors AS a
JOIN
  titleauthor AS ta ON a.au_id = ta.au_id
JOIN
  titles AS t ON ta.title_id = t.title_id
JOIN
  publishers AS p ON t.pub_id = p.pub_id
ORDER BY
  a.au_lname, a.au_fname, t.title;
  
  SELECT
  a.au_id AS &quot;AUTHOR ID&quot;,
  a.au_lname AS &quot;LAST NAME&quot;,
  a.au_fname AS &quot;FIRST NAME&quot;,
  p.pub_name AS &quot;PUBLISHER&quot;,
  COUNT(t.title_id) AS &quot;TITLE COUNT&quot;
FROM
  authors AS a
JOIN
  titleauthor AS ta ON a.au_id = ta.au_id
JOIN
  titles AS t ON ta.title_id = t.title_id
JOIN
  publishers AS p ON t.pub_id = p.pub_id
GROUP BY
  a.au_id,
  a.au_lname,
  a.au_fname,
  p.pub_name
ORDER BY
  a.au_lname,
  a.au_fname,
  p.pub_name;
  
  SELECT
  a.au_id AS &quot;AUTHOR ID&quot;,
  a.au_lname AS &quot;LAST NAME&quot;,
  a.au_fname AS &quot;FIRST NAME&quot;,
  SUM(t.ytd_sales) AS &quot;TOTAL&quot;
FROM
  authors AS a
JOIN
  titleauthor AS ta ON a.au_id = ta.au_id
JOIN
  titles AS t ON ta.title_id = t.title_id
GROUP BY
  a.au_id,
  a.au_lname,
  a.au_fname
ORDER BY
  &quot;TOTAL&quot; DESC
LIMIT 3;

SELECT
  a.au_id AS &quot;AUTHOR ID&quot;,
  a.au_lname AS &quot;LAST NAME&quot;,
  a.au_fname AS &quot;FIRST NAME&quot;,
  COALESCE(SUM(t.ytd_sales), 0) AS &quot;TOTAL&quot;
FROM
  authors AS a
LEFT JOIN
  titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN
  titles AS t ON ta.title_id = t.title_id
GROUP BY
  a.au_id,
  a.au_lname,
  a.au_fname
ORDER BY
  &quot;TOTAL&quot; DESC;
