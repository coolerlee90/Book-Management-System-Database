-- example 1: Multi-column Subquery

select at.au_id, t.title_id, t.pub_id
from author_titles at inner join titles t on at.title_id = t.title_id
where (genre, pub_id) in (Select genre, pub_id
                          from titles
                          where sales*price >100000)
order by at.au_id, t.title_id;

-- example 2: Correlated subquery
-- rows 
select title_id, price*sales rev, genre, pub_id
from titles
order by pub_id, genre, rev, title_id;

-- rows rev > overall avg
select title_id, price*sales rev, genre, pub_id
from titles
where ((price * sales), pub_id) in (	Select avg(price*sales), pub_id
									From titles
									Group By pub_id)
order by pub_id, genre, rev, title_id;

-- P0x rows with rev > avg rev for P0x
select title_id, price*sales rev, pub_id
from titles
where pub_id ='P01'
	and price*sales > (	select avg(price*sales)
						from titles
						where pub_id = 'P01'
                    )
UNION
select title_id, price*sales rev, pub_id
from titles
where pub_id ='P02'
	and price*sales > (	select avg(price*sales)
						from titles
						where pub_id = 'P02'
                    )
UNION
select title_id, price*sales rev, pub_id
from titles
where pub_id ='P03'
	and price*sales > (	select avg(price*sales)
						from titles
						where pub_id = 'P03'
                    )
UNION
select title_id, price*sales rev, pub_id
from titles
where pub_id ='P04'
	and price*sales > (	select avg(price*sales)
						from titles
						where pub_id = 'P04'
                    )
ORDER by pub_id, rev, title_id;





select title_id, price*sales rev, pub_id
  from titles outer_t
  where price*sales > (select avg(price*sales)
  from titles inner_T
  where inner_t.pub_id = outer_t.pub_id
                      )
  ORDER by pub_id, rev, title_id;

