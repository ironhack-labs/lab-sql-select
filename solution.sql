-- Challenge 1
SELECT 
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    titles.title,
    publishers.pub_name
	
FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id;

	
	
	-- Challenge 2

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(*) AS "TITLE COUNT"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 
    a.au_id DESC, p.pub_name;

	
	-- Challenge 3
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(t.ytd_sales) AS "TOTAL SALES"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL SALES" DESC
LIMIT 3;

	
	-- Challenge 4

SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
     COALESCE(SUM(t.ytd_sales), 0) AS "TOTAL SALES"
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL SALES" DESC
	
	
	
