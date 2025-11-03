--Challenge 1
 
select au.au_id as auther_id,au.au_lname as "Last name",au.au_fname as "First name" ,ti.title as Title,pub.pub_name as Publisher
from authors au,titles ti,publishers pub ,titleauthor ta
where au.au_id= ta.au_id 
and ti.title_id=ta.title_id
and ti.pub_id=pub.pub_id

--Challenge 2

select au.au_id as auther_id,au.au_lname as "Last name",au.au_fname as "First name" ,pub.pub_name as Publisher, count(ta.au_id) as title_count
from authors au,titles ti,publishers pub ,titleauthor ta
where au.au_id= ta.au_id 
and ti.title_id=ta.title_id
and ti.pub_id=pub.pub_id GROUP by (ta.au_id)

--Challenge 3

select au.au_id as auther_id,au.au_lname as "Last name",au.au_fname as "First name" , count(sal.title_id) as title_count
from authors au,titles ti,sales sal ,titleauthor ta
where au.au_id= ta.au_id 
and ti.title_id=ta.title_id
and sal.title_id=ti.title_id GROUP by (sal.title_id) ORDER by title_count desc limit 3

--Challenge 4


SELECT au.au_id AS author_id,au.au_lname AS "Last name", au.au_fname AS "First name",COUNT(sal.title_id) AS title_count
FROM 
    authors au
LEFT JOIN 
    titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN 
    titles ti ON ta.title_id = ti.title_id
LEFT JOIN 
    sales sal ON ti.title_id = sal.title_id
GROUP BY 
    au.au_id, au.au_lname, au.au_fname
ORDER BY 
    title_count DESC;


