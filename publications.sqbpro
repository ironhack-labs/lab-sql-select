<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="publications.sqlite" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="602"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><table title="authors" custom_title="0" dock_id="1" table="4,7:mainauthors"/><dock_state state="000000ff00000000fd00000001000000020000000000000000fc0100000001fb000000160064006f0063006b00420072006f00770073006500310100000000ffffffff0000010100ffffff000000000000000000000004000000040000000800000008fc00000000"/><default_encoding codec=""/><browse_table_settings/></tab_browse><tab_sql><sql name="SQL 1*">-- Challenge 1: Who Have Published What At Where?
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id;


-- Challenge 2: Who Have Published How Many At Where?
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(t.title_id) AS 'TITLE COUNT'
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY a.au_id DESC;

-- Challenge 3: Best Selling Authors (Top 3)
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    SUM(s.qty) AS 'TOTAL'
FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4: Best Selling Authors Ranking (All 23 authors)
SELECT 
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COALESCE(SUM(s.qty), 0) AS 'TOTAL'
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;

</sql><current_tab id="0"/></tab_sql></sqlb_project>
