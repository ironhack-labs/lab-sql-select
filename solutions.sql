<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="publications.sqlite" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="0"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="1060"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="0" parent="0"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><table title="authors" custom_title="0" dock_id="1" table="4,7:mainauthors"/><dock_state state="000000ff00000000fd0000000100000002000005bc0000038efc0100000001fb000000160064006f0063006b00420072006f00770073006500310100000000000005bc0000011e00ffffff000002580000000000000004000000040000000800000008fc00000000"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="authors" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_" freeze_columns="0"><sort/><column_widths><column index="1" value="93"/><column index="2" value="117"/><column index="3" value="93"/><column index="4" value="101"/><column index="5" value="163"/><column index="6" value="117"/><column index="7" value="36"/><column index="8" value="46"/><column index="9" value="54"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="Challenge 1">SELECT
  a.au_id      AS &quot;AUTHOR ID&quot;,
  a.au_lname   AS &quot;LAST NAME&quot;,
  a.au_fname   AS &quot;FIRST NAME&quot;,
  t.title      AS &quot;TITLE&quot;,
  p.pub_name   AS &quot;PUBLISHER&quot;
FROM titleauthor ta
JOIN authors    a ON a.au_id   = ta.au_id
JOIN titles     t ON t.title_id = ta.title_id
JOIN publishers p ON p.pub_id   = t.pub_id
ORDER BY a.au_lname, a.au_fname, t.title;


</sql><sql name="Challenge 2">SELECT
  a.au_id                    AS &quot;AUTHOR ID&quot;,
  a.au_lname                 AS &quot;LAST NAME&quot;,
  a.au_fname                 AS &quot;FIRST NAME&quot;,
  p.pub_name                 AS &quot;PUBLISHER&quot;,
  COUNT(DISTINCT t.title_id) AS &quot;NUMBER OF TITLES&quot;
FROM authors a, titleauthor ta, titles t, publishers p
WHERE a.au_id   = ta.au_id
  AND ta.title_id = t.title_id
  AND t.pub_id    = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY &quot;NUMBER OF TITLES&quot; DESC, a.au_lname, a.au_fname;
--check if correct
-- Conta o total na tabela original
SELECT COUNT(*) FROM titleauthor;

-- Soma os valores do resultado anterior
SELECT SUM(&quot;TITLE COUNT&quot;) FROM (
  SELECT
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name,
    COUNT(*) AS &quot;TITLE COUNT&quot;
  FROM authors a, titleauthor ta, titles t, publishers p
  WHERE a.au_id   = ta.au_id
    AND ta.title_id = t.title_id
    AND t.pub_id    = p.pub_id
  GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
);
</sql><sql name="Challenge 3">SELECT
  a.au_id      AS &quot;AUTHOR ID&quot;,
  a.au_lname   AS &quot;LAST NAME&quot;,
  a.au_fname   AS &quot;FIRST NAME&quot;,
  SUM(t.ytd_sales) AS &quot;TOTAL&quot;
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t       ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY &quot;TOTAL&quot; DESC
LIMIT 3;
</sql><sql name="Challenge 4">SELECT
  a.au_id    AS &quot;AUTHOR ID&quot;,
  a.au_lname AS &quot;LAST NAME&quot;,
  a.au_fname AS &quot;FIRST NAME&quot;,
  IFNULL(SUM(t.ytd_sales), 0) AS &quot;TOTAL&quot;
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t       ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY &quot;TOTAL&quot; DESC, a.au_lname, a.au_fname;
</sql><current_tab id="3"/></tab_sql></sqlb_project>
