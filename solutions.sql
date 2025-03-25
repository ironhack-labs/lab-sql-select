#Challenge1 Who Have Published What At Where?
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    t.title, 
    p.pub_name as publishers
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id;

#Challenge2 Who Have Published How Many At Where?
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    p.pub_name as publishers,
    COUNT(t.title_id) as title_count
FROM
    titleauthor ta
JOIN
    authors a ON ta.au_id = a.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname, p.pub_name;

#Challenge3 Best Selling Authors
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    COUNT(t.title_id) AS total
FROM 
    titleauthor ta
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id
ORDER BY 
    total DESC
LIMIT 3;

#Challenge4 Best Selling Authors Ranking
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    COALESCE(COUNT(t.title_id), 0) AS total
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id
ORDER BY 
    total DESC;
