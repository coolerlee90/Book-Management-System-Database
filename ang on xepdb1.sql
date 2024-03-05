DROP TABLE Authors Cascade Constraints;
CREATE TABLE Authors  (
  Au_id    	char(3)     ,
  Fname 	varchar2(15),
  Lname 	varchar2(15),
  Phone    	varchar2(12),
  Street        varchar2(20),
  City     	varchar2(15),
  State    	char(2)     ,
  Zip      	char(5)     ,
  CONSTRAINT Authors_pk PRIMARY KEY (au_id)
  );


DROP TABLE Publishers Cascade Constraints;
CREATE TABLE Publishers
  (
  Pub_id   	char(3)     ,
  Pub_name 	varchar2(20),
  City     	varchar2(15),
  State    	char(2)     ,
  Country  	varchar2(15),
  CONSTRAINT Publishers_pk PRIMARY KEY (pub_id)
  );


DROP TABLE Titles Cascade Constraints;
CREATE TABLE Titles
  (
  Title_id      char(3)     ,
  Title         varchar2(40),
  Genre     	varchar2(10),
  Pages     	number      ,
  Price     	number(5,2) ,
  Sales     	number      ,
  Pub_id        char(3)     ,
  Pubdate    	date        ,
  Advance      	number(9,2) ,
  Royalty_rate 	number(5,2) ,
  CONSTRAINT Titles_pk PRIMARY KEY (title_id),
  CONSTRAINT Titles_Publishers_fk FOREIGN KEY (Pub_id)
				REFERENCES Publishers (pub_id)
  );


DROP TABLE Author_Titles Cascade Constraints;
CREATE TABLE Author_Titles
  (
  Title_id      char(3)     ,
  Au_id         char(3)     ,
  Au_order      number      ,
  Royalty_share number(5,2) ,
  CONSTRAINT Author_Titles_pk PRIMARY KEY (title_id, au_id),
  CONSTRAINT Author_Titles__Authors_fk FOREIGN KEY (au_id) 
						REFERENCES Authors(au_id),
  CONSTRAINT Author_Titles__Titles_fk FOREIGN KEY (title_id) 
						REFERENCES Titles(title_id)
  );



INSERT INTO AUTHORS 
VALUES ('A01','Sarah','Buchman','718-496-7223','75 West 205 St','Bronx','NY','10468');

INSERT INTO AUTHORS 
VALUES ('A02','Wendy','Heydemark','303-986-7020','2922 Baseline Rd','Boulder','CO','80303');

INSERT INTO AUTHORS 
VALUES ('A03','Hallie','Hull','415-549-4278','3800 Waldo Ave, #14F','San Francisco','CA','94123');

INSERT INTO AUTHORS 
VALUES ('A04','Klee','Hull','415-549-4278','3800 Waldo Ave, #14F','San Francisco','CA','94123');

INSERT INTO AUTHORS 
VALUES ('A05','Christian','Kells','212-771-4680', '114 Horatio St','New York','NY','10014');

INSERT INTO AUTHORS 
VALUES ('A06',' ','Kellsey','650-836-7128', '390 Sierra Mall','Palo Alto','CA','94305');

INSERT INTO AUTHORS 
VALUES ('A07','Paddy','O''Furniture','941-925-0752', '1442 Main St','Sarasota','FL','34236');

INSERT INTO AUTHORS 
VALUES ('A08','Ang','Li','613-666-6666','1385 Woodroffe Ave','Ottawa','ON','11111');

INSERT INTO AUTHORS 
VALUES ('A09','Elon','Musk','613-888-8888','Algonquin College','Ottawa','CA','22222');

--INSERT INTO AUTHORS(Au_id)
--VALUES ('A20');

--INSERT INTO AUTHORS(Au_id)
--VALUES ('A21');


INSERT INTO PUBLISHERS VALUES ('P01','Abatis Publishers','New York','NY','USA');
INSERT INTO PUBLISHERS VALUES ('P02','Core Dump Books','San Francisco','CA','USA');
INSERT INTO PUBLISHERS VALUES ('P03','Schadenfreude Press','Hamburg','' ,'Germany');
INSERT INTO PUBLISHERS VALUES ('P04','Tenterhooks Press','Berkeley','CA','USA');
INSERT INTO PUBLISHERS VALUES ('P05','AC Press','','','');
INSERT INTO PUBLISHERS VALUES ('P06','Ottawa Press','','','');
--INSERT INTO PUBLISHERS(Pub_id) VALUES ('P20');


INSERT into Titles VALUES ('T01','1977!','history', 107, 21.99, 566,'P01','000801',10000,0.05);
INSERT into Titles VALUES ('T02','200 Years of German Humor','history', 14, 19.95, 9566, 'P03','050401', 1000,0.06);
INSERT into Titles VALUES ('T03','Ask Your System Administrator','computer', 1226, 39.95, 25667, 'P02','070912', 15000,0.07);
INSERT into Titles VALUES ('T04','But I Did It Unconsciously','psychology', 510, 12.99, 13001, 'P04','030528', 20000,0.08);
INSERT into Titles VALUES ('T05','Exchange of Platitudes','psychology', 201, 6.95, 201440,'P04','010101', 100000,0.09);
INSERT into Titles VALUES ('T06','How About Never?','biography', 473, 19.95, 11320, 'P01', '100702', 20000,0.08);
INSERT into Titles VALUES ('T07','I Blame My Mother','biography', 333, 23.95, 1500200, 'P03','091014', 1000000,0.11);
INSERT into Titles VALUES ('T08','Just Wait Until After School','children', 86, 10.00, 4095, 'P04','080601',0, 0.04);
INSERT into Titles VALUES ('T09','Kiss My Boo-Boo','children', 22, 13.95, 5000, 'P04','020721',0, 0.05);
INSERT into Titles VALUES ('T10','Not Without My Faberge Egg','biography','' ,'' ,'' ,'','' ,'' ,NULL);
INSERT into Titles VALUES ('T11','Perhaps It''s a Glandular Problem','psychology', 826, 7.99, 94123, 'P04','051114',100000, 0.07);
INSERT into Titles VALUES ('T12','Spontaneous, Not Annoying','biography', 507, 12.99, 100001, 'P01','071008',50000, 0.09);
INSERT into Titles VALUES ('T13','What Are The Civilian Applications?','history', 802, 29.99, 10467, 'P03','090201',20000, 0.06);
INSERT INTO Titles VALUES('T14','How to Success in BISI Program ','education', '' ,'' ,'' ,'','' ,'' ,NULL);
INSERT INTO Titles VALUES('T15',NULL,'', '' ,'' ,'' ,'P06','' ,'' ,NULL);
--INSERT INTO Titles(title_id,Pub_id) VALUES('T20','P03');
--INSERT INTO Titles(title_id) VALUES('T21');
--INSERT INTO Titles(Title_id,Genre) VALUES('T24','Computer');




select 1 from dual;


INSERT ALL
 INTO author_TITLES values ('T01','A01',1,1.0)
 INTO author_TITLES values ('T02','A01',1,1.0)
 INTO author_TITLES values ('T03','A05',1,1.0)
 INTO author_TITLES values ('T04','A03',1,0.6)
 INTO author_TITLES values ('T04','A04',2,0.4)
 INTO author_TITLES values ('T05','A04',1,1.0)
 INTO author_TITLES values ('T06','A02',1,1.0)
 INTO author_TITLES values ('T07','A02',1,0.5)
 INTO author_TITLES values ('T07','A04',2,0.5)
 INTO author_TITLES values ('T08','A06',1,1.0)
 INTO author_TITLES values ('T09','A06',1,1.0)
 INTO author_TITLES values ('T10','A02',1,1.0)
 INTO author_TITLES values ('T11','A03',2,0.3)
 INTO author_TITLES values ('T11','A04',3,0.3)
 INTO author_TITLES values ('T11','A06',1,0.4)
 INTO author_TITLES values ('T12','A02',1,1.0)
 INTO author_TITLES values ('T13','A01',1,1.0)
 INTO author_TITLES values ('T14','A08',1,1.0)
--INTO author_TITLES(au_id,title_id) values ('A20','T20') ;
--INTO author_TITLES(title_id) values('T21');
 
 SELECT 1 from dual;
 
 
        
SELECT a.au_id, a.fname, a.lname, at.title_id, t.title, p.pub_id, p.pub_name
FROM authors a 
LEFT JOIN author_titles at ON a.au_id = at.au_id
LEFT JOIN titles t ON at.title_id= t.title_id
FULL OUTER JOIN publishers p ON t.pub_id=p.pub_id
ORDER BY a.au_id, at.title_id, p.pub_id;


--Extract(year from Pubdate)
--Pub_id,genre,year
--Select Pub_id, genre, Extract (year from PUBDATE) Pub_yr, sum(price*Sales) Revenue
--From Titles

--Rollup Pub_id, genre, Extract (year from PUBDATE)
--Group By Cube (Pub_id, genre, Extract (year from PUBDATE))
--Group By Pub_id, genre, Extract (year from PUBDATE)
--Group By Grouping Sets((),(Pub_id),(Genre),(Extract (year from PUBDATE)))




--select rowid, rownum, au_id,fname, lname, state
--from Authors
--order by lname desc;
 
--select a.au_id, a.state, p.pub_id, p.state
--from authors a, author_titles at, titles t, publishers p
--where  a.au_id=at.au_id and
        --at.title_id=t.title_id and
        --t.pub_id=p.pub_id and
        --a.state = p.state
        
       
--drop table basic_revenue;
--create table basic_row_revenue(aid,tid,type,sales,revenue,pid,yr,mm) as
--(
--Select at au_id,genre,price*sales,p.pub_id,extract(year from pubdate), extract(month from pubdate)
--From author_titles at inner join titles t on at.title_id=t.title_id
--inner join publishers p on t.pub_id=p.pub_id);

--select*from basic_row_revenue;

--select*from basic_row_revenue order by yr,mm,aid;


--select aid,tid,type,prd,yr,mm,revenue,
    --lag(revenue,1) OVER (PARTITION BY Yr Order by Yr nulls last,mm)prev1_wiYY,
    --lag(revenue,2) OVER (PARTITION BY YR Order by Yr nulls last,mm)prev2_wiYY,
    --lag(revenue,1) OVER (PARTITION BY YR Order by Yr nulls last,mm)next1_wiYY,
    --lag(revenue,2) OVER (PARTITION BY YR Order by Yr nulls last,mm)next2_wiYY,
    --lag(revenue,1) OVER (                Order by Yr nulls last,mm)prev1_ALL,
    --lag(revenue,1) OVER (                Order by Yr nulls last,mm)next_ALL,
--from basic_row_revenue
--order by yr,mm;

    
    
    

