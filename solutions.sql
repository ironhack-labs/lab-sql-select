<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="/Users/bshanmugam/Documents/SQL/lab-sql-select/publications.sqlite" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="1020"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="9" parent="0"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><table title="titles" custom_title="0" dock_id="12" table="4,6:maintitles"/><dock_state state="000000ff00000000fd0000000100000002000005940000032bfc0100000005fb000000160064006f0063006b00420072006f00770073006500310100000000000003560000000000000000fb000000160064006f0063006b00420072006f00770073006500320100000000000005940000000000000000fb000000180064006f0063006b00420072006f007700730065003100300100000000ffffffff0000000000000000fb000000180064006f0063006b00420072006f007700730065003100310100000000ffffffff0000000000000000fb000000180064006f0063006b00420072006f007700730065003100320100000000000005940000010b00ffffff000005940000000000000004000000040000000800000008fc00000000"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="authors" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_" freeze_columns="0"><sort/><column_widths><column index="1" value="75"/><column index="2" value="79"/><column index="3" value="73"/><column index="4" value="81"/><column index="5" value="117"/><column index="6" value="79"/><column index="7" value="42"/><column index="8" value="43"/><column index="9" value="63"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="titles" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_" freeze_columns="0"><sort/><column_widths><column index="1" value="54"/><column index="2" value="300"/><column index="3" value="79"/><column index="4" value="53"/><column index="5" value="52"/><column index="6" value="71"/><column index="7" value="53"/><column index="8" value="71"/><column index="9" value="300"/><column index="10" value="114"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1*">
--Challenge 1 - Who Have Published What At Where?

SELECT
	authors.au_id AS &quot;Author ID&quot;, authors.au_lname AS &quot;Last name&quot;, authors.au_fname AS &quot;First name&quot;,
	titles.title AS &quot;Title&quot;,
	publishers.pub_name AS &quot;Publisher&quot;
	
FROM
	authors, titles, publishers, titleauthor
	
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
	--------------------------
	--Challenge 2 - Who Have Published How Many At Where?
SELECT 
    authors.au_id AS &quot;Author ID&quot;, 
    authors.au_lname AS &quot;Last name&quot;, 
    authors.au_fname AS &quot;First name&quot;,
    publishers.pub_name AS &quot;Publisher&quot;,
    COUNT(titles.title_id) AS title_count

FROM
    authors, titles, publishers, titleauthor

WHERE
    authors.au_id = titleauthor.au_id AND
    titleauthor.title_id = titles.title_id AND
    titles.pub_id = publishers.pub_id

GROUP BY
    authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name

ORDER BY
    title_count DESC, authors.au_id;
-----------------------------------
--## Challenge 3 - Best Selling Authors

--Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SELECT 
    authors.au_id AS &quot;Author ID&quot;, 
    authors.au_lname AS &quot;Last name&quot;, 
    authors.au_fname AS &quot;First name&quot;,
    SUM(sales.qty) AS total_titles_sold

FROM 
    authors, titles, titleauthor, sales

WHERE 
    authors.au_id = titleauthor.au_id AND
    titleauthor.title_id = titles.title_id AND
    titles.title_id = sales.title_id

GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname

ORDER BY 
    total_titles_sold DESC, authors.au_id

LIMIT 3;
-------
--## Challenge 4 - Best Selling Authors Ranking

SELECT 
    authors.au_id AS &quot;Author ID&quot;, 
    authors.au_lname AS &quot;Last name&quot;, 
    authors.au_fname AS &quot;First name&quot;,
    COALESCE(SUM(sales.qty), 0) AS TOTAL

FROM
    authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id

GROUP BY
    authors.au_id, authors.au_lname, authors.au_fname

ORDER BY
    TOTAL DESC, authors.au_id;

</sql><current_tab id="0"/></tab_sql></sqlb_project>
