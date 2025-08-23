-- Challenge 1
select au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", title as TITLE, pub_name as PUBLISHER from (
select au_id, au_fname, au_lname, pp.title_id, title, pub_id from(
select a.au_id, au_fname, au_lname, title_id from authors a
left join titleauthor ta
on a.au_id = ta.au_id
)pp
left join titles tt
on pp.title_id = tt.title_id
)ll
left join publishers p
on ll.pub_id = p.pub_id
where ll.title_id is not null

-- Challenge 2

select au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", pub_name as PUBLISHER, count(title) as TITLE_COUNT from (
select au_id, au_fname, au_lname, pp.title_id, title, pub_id from(
select a.au_id, au_fname, au_lname, title_id from authors a
left join titleauthor ta
on a.au_id = ta.au_id
)pp
left join titles tt
on pp.title_id = tt.title_id
)ll
left join publishers p
on ll.pub_id = p.pub_id
where ll.title_id is not null
group by 1,2,3,4

-- Challenge 3

select au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", count(title) as TOTAL from (
select au_id, au_fname, au_lname, pp.title_id, title, pub_id from(
select a.au_id, au_fname, au_lname, title_id from authors a
left join titleauthor ta
on a.au_id = ta.au_id
)pp
left join titles tt
on pp.title_id = tt.title_id
)ll
left join publishers p
on ll.pub_id = p.pub_id
where ll.title_id is not null
group by 1,2,3
order by TOTAL desc
limit 3

-- Challenge 4

select au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", count(title) as TOTAL from (
select au_id, au_fname, au_lname, pp.title_id, title, pub_id from(
select a.au_id, au_fname, au_lname, title_id from authors a
left join titleauthor ta
on a.au_id = ta.au_id
)pp
left join titles tt
on pp.title_id = tt.title_id
)ll
left join publishers p
on ll.pub_id = p.pub_id
group by 1,2,3
order by TOTAL desc
