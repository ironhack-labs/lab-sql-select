--step 1
SELECT 
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    t.title AS "TITLE",
    p.publisher_name AS "PUBLISHER"
FROM authors a
JOIN author_title at ON a.author_id = at.author_id
JOIN titles t ON at.title_id = t.title_id
JOIN publishers p ON t.publisher_id = p.publisher_id
ORDER BY a.author_id;
--step2
SELECT 
    a.author_id AS "AUTHOR ID",
    a.last_name AS "LAST NAME",
    a.first_name AS "FIRST NAME",
    p.publisher_name AS "PUBLISHER",
    COUNT(t.title_id) AS "TITLE COUNT"
FROM authors a
JOIN author_title at ON a.author_id = at.author_id
JOIN titles t ON at.title_id = t.title_id
JOIN publishers p ON t.publisher_id = p.publisher_id
GROUP BY a.author_id, a.last_name, a.first_name, p.publisher_name
ORDER BY a.author_id, "TITLE COUNT" DESC;
--step3
Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
--step 4
Challenge 4 - Best Selling Authors Ranking

Now modify your solution in 
Challenge 3 so that the output will display
 all 23 authors instead of the top 3. Note that the 
 authors who have sold 0 titles should also appear in 
 your output (ideally display 0 instead of NULL as the TOTAL)
 . Also order your results based on TOTAL from high to low.
 solution.sql