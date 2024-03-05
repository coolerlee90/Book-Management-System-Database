-- GROUP BY CUBE:
select pub_id, genre, extract( year from pubdate) pub_yy, sum (price * sales) revenue
from titles
where pubdate is not null
group by cube  (pub_id, genre, extract(year from pubdate))
order by revenue desc nulls last,  pub_id, genre, extract(year from pubdate) ;


create view all_revenue (pid, type, Pub_year, revenue)
as
select pub_id, genre, extract( year from pubdate) pub_yy, sum (price * sales) revenue
from titles
where pubdate is not null
group by cube  (pub_id, genre, extract(year from pubdate))
order by revenue desc nulls last,  pub_id, genre, extract(year from pubdate) ;

View created.

-- using the view:
select * from all_revenue order by pub_year desc;


-- create materialized view and grouping sets
 
create materialized view grouping_set_revenue
as
select pub_id, genre, extract( year from pubdate) pub_yy, sum (price * sales) revenue
from titles
where pubdate is not null
group by grouping sets ( (), (pub_id), (genre), (extract(year from pubdate)) );

Materialized view created.


-- use the materialized VIEW

select * 
from grouping_set_revenue;


-- with ROW SELECTION condition
select * 
from grouping_set_revenue 
where revenue > 500000;


-- Adding a Publishers Left Join to the query

select * 
from grouping_set_revenue left join publishers using (pub_id) 
order by revenue desc nulls last;

 -- selecting specific columns rather than *
select pub_id, pub_name, genre, pub_yy, revenue 
from grouping_set_revenue p left join publishers using (pub_id) 
order by revenue desc nulls last;

desc user_objects
 

-- CHANGE COLUMN FORMATS

column object_name format a30

-- Select interesting COLUMNS from user_objects
select object_name, object_id, object_type, data_object_id
from user_objects
order by object_id;


  1  create view all_joins 
  2  as
  3  select a.au_id, fname, lname, t.title_id, title, genre, price*sales revenue, t.pub_id, pub_name
  4  from authors a inner join author_titles at on a.au_id = at.au_id
  5  	inner join titles t on at.title_id = t.title_id
  6  	inner join publishers p on t.pub_id = p.pub_id
  7* where price*sales >50000


select * 
from all_joins 
order by 1,4;
select au_id, genre, sum(revenue)
  from all_joins
  group by au_id, genre
  order by au_id, genre;


column sum(revenue) format $999,999,999.99
select au_id, genre, sum(revenue)
  from all_joins
  group by au_id, genre
  order by au_id, genre;

                                                                                                               

select au_id, genre, count(au_id), sum(revenue)
  from all_joins
  group by au_id, genre
  order by au_id, genre;



select au_id, genre, count(au_id), sum(revenue)
  from all_joins
  group by au_id, genre
  having count(au_id) >1
  order by au_id, genre;

                                                                                                  

 -- rowid calculation to tie logical record to physical file storage location
select rowid, au_id  from authors ;


select rowid, length(rowid) , au_id from authors where au_id = 'A01';

                                                                                                         

select au_id, length(au_id), substring(au_id,0,2), substring(au_id,1,2), substring(au_id, -1,2) from authors ;
select au_id, length(au_id), substring(au_id,0,2), substring(au_id,1,2), substring(au_id, -1,2) from authors 
                                                                         *


select au_id, length(au_id), substr(au_id,0,2), substr(au_id,1,2), substr(au_id, -1,2) from authors ;



select au_id, length(au_id), substr(au_id,0,2), substr(au_id,1,2), substr(au_id, -2,2) from authors ;

                                                                                                     

select au_id, rowid, length(rowid), substr(rowid,1,6), substr(rowid,7,3), substr(rowid, 10,6), substr(rowid, 16,3) from authors ;


select au_id, rowid, length(rowid), substr(rowid,1,6), substr(rowid,7,3), substr(rowid, 10,6), substr(rowid, 16,3)
  from authors
  where au_id = 'A01';


select (power(64,2)*18  + 64*30 + 49) as object_id, 
		12 as file_number, 
		(64*2 + 5) as block_number, 
		1*0 as row_number
from dual;

 OBJECT_ID FILE_NUMBER BLOCK_NUMBER ROW_NUMBER  
---------- ----------- ------------   ---------- 
     75697          12          133          0                                

desc user_objects



select object_name, object_id, data_object_id, object_type
  from user_objects
  where upper(object_name) = 'AUTHORS';




desc dba_data_files
 
-- a few column formats
column file_name format a30                                       
column file_name format a60

-- query to list db file name to file_id and tablespace_name

select file_name, file_id, tablespace_name 
from dba_data_files ;


-- rowid for 'A01' points to file 12 which is the users tablespace and file users01.dbf
