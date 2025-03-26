SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    sales s ON t.title_id = s.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    TOTAL DESC
LIMIT 3;


