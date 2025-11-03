-- LAB | SQL Select
-- Database: publications.sqlite

-- 1. Quem publicou o quê e em qual editora
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
ORDER BY a.au_id, p.pub_name;

-- Comentário: junção direta das quatro tabelas principais.
-- Mostra cada combinação autor–título–editora.

--------------------------------------------------------------

-- 2. Quantos títulos cada autor publicou em cada editora
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id, "TITLE COUNT" DESC;

-- Comentário: usa COUNT() + GROUP BY para agrupar publicações por autor e editora.
-- A soma da coluna TITLE COUNT deve igualar o total de linhas da tabela titleauthor.

--------------------------------------------------------------

-- 3. Top 3 autores com mais vendas
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Comentário: soma a quantidade total de vendas (qty) de cada autor.
-- Exibe apenas os 3 primeiros (melhores vendedores).

--------------------------------------------------------------

-- 4. Ranking completo dos autores por número total de vendas
SELECT 
    a.au_id AS "AUTHOR ID",
    a.au_lname AS "LAST NAME",
    a.au_fname AS "FIRST NAME",
    IFNULL(SUM(s.qty), 0) AS "TOTAL"
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

-- usa LEFT JOIN para incluir autores sem vendas (NULL → 0).
-- Ordena todos os 23 autores do mais vendido ao menos vendido.
