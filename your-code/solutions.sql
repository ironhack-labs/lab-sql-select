/*
Challenge 1 - Who Have Published What At Where?

In this challenge you will write an SQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published
*/
SELECT a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_name as 'PUBLISHER' FROM
titles  as t join publishers as p on t.pub_id = p.pub_id
JOIN  titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id;

SELECT  count(t.title) as 'TITLEs' FROM
titles  as t join publishers as p on t.pub_id = p.pub_id
JOIN  titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id GROUP BY ta.title_id;

---- challenge 2
SELECT  count(t.title) as 'TITLEs' FROM
titles  as t join publishers as p on t.pub_id = p.pub_id
JOIN  titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id; -- 25
SELECT COUNT(*) FROM titleauthor; --25


--- GROUP BY ??? no glue

---Challenge 3
/*
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author 
*/
SELECT a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME' , SUM(s.qty) as 'TOTAL' FROM 
sales as s 
JOIN titles as t on t.title_id = s.title_id
JOIN titleauthor as ta on t.title_id = ta.title_id
JOIN authors as a on ta.au_id = a.au_id
GROUP BY a.au_id
ORDER BY 'TOTAL'  DESC LIMIT 3;

/* Challenge 4
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.
*/
SELECT a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME' , 
CASE 
 WHEN s.qty ISNULL THEN '0'
 ELSE SUM(s.qty) 
END
as 'TOTAL' FROM 
sales as s 
JOIN titles as t on t.title_id = s.title_id
JOIN titleauthor as ta on t.title_id = ta.title_id
RIGHT OUTER JOIN authors as a on ta.au_id = a.au_id
GROUP BY a.au_id
ORDER BY TOTAL DESC NULLS LAST;


