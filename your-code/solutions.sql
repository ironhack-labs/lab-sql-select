-- DROP VIEW chl_1;
-- DROP VIEW chl_2;
-- DROP VIEW chl_3;

-- Challenge 1
-- CREATE VIEW chl_1 AS
--     SELECT aut.au_id, aut.au_lname, aut.au_fname, tit.title, pub.pub_name 
--     FROM authors aut
--     JOIN titleauthor tia ON tia.au_id = aut.au_id
--     JOIN titles tit ON tia.title_id = tit.title_id
--     JOIN publishers pub ON pub.pub_id = tit.pub_id;

-- Challenge 2
-- CREATE VIEW chl_2 AS
-- 	SELECT au_id, au_lname, au_fname, pub_name, count(*) as title_count	
-- 		FROM chl_1
-- 	GROUP BY au_id;

-- Challenge 3
-- CREATE VIEW chl_3 AS
-- 	SELECT c1.au_id, c1.au_lname, c1.au_fname, sum(sal.qty) AS "total" 
-- 		FROM chl_1 c1
-- 	JOIN titles tit ON c1.title = tit.title
-- 	JOIN sales sal ON sal.title_id = tit.title_id 
-- 	GROUP BY c1.au_id ORDER BY "total" DESC
-- 	LIMIT 3;

-- Challenge 4

-- Challenge 4
-- CREATE VIEW chl_4 AS
-- 	SELECT aut.au_id, aut.au_lname, aut.au_fname, COALESCE(SUM(sal.qty), 0) AS "total"
-- 		FROM authors aut
-- 	LEFT JOIN titleauthor tia ON tia.au_id = aut.au_id
-- 	LEFT JOIN titles tit ON tia.title_id = tit.title_id
-- 	LEFT JOIN sales sal ON sal.title_id = tit.title_id
-- 	GROUP BY aut.au_id ORDER BY "total" DESC;

-- SELECT DISTINCT au_id FROM authors;

-- SELECT * FROM chl_1;
-- SELECT * FROM chl_2;
-- SELECT * FROM chl_3;
-- SELECT * FROM chl_4;