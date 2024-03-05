--rowid:

SELECT rowid, pub_id, 
	substr(rowid,1,6) obj, 
	substr(rowid,7,3) f_id, 
	substr(rowid,10,6) block, 
	substr(rowid,16,3) offset
FROM Publishers;


/* Doing the calculations: ROWID is base 64 where:
	A=0, B=1, C=2, ... ,Z=25, a=26, b=27, c=28, ... , z=51,0=52, 1=53, 2=54, ..., 9=61,+=62, /=63
		
Thus:
ROWID				PUB	OBJECT	FID	BLOCK	OFFSET
AAASezAAMAAAACVAAA	P01	AAASez	AAM	AAAACV	AAA

1) Object_id: AAASez 	= 0*64**5 + 0*64**4 + 0*64**3 + 18*64**2 + 30*64**1 + 51*64**0
					= 0 + 0 + 0 + 73,728 + 1,920 + 51 = 75,699
... confirm this calculted object_id matches the object_id value stored in user_objects:

select  object_name, object_id, data_object_id, object_type
from user_objects 
where upper(object_name) = 'PUBLISHERS';

PUBLISHERS	75699	75699	TABLE

... and they match!

2) File-ID: The 3 characters after the object_id identifes the database file the object is stored in:
... AAM translates to 12 (i.e., (0*64**2 + 0*64 + 12*1 = 12 ))

from sys as sysdba on xepdb1
desc dba_data_files

select file_name, file_id, tablespace_name
from dba_data_files;


-- this confirms FILE-ID 12 refers to the XEPDB1 USERS tablespace.

Recall 	CREATE USER JIM IDENTIFED BY CST2102
		DEFAULT TABLESPACE USERS ...)

3) Block-ID on File-id 12 (Users tablespace): AAACV = 0+0+0+0+ 2*64 + 21 = 149

4) Offset within Block:
ROWID				PUB	OBJECT	FID	BLOCK	OFFSET
AAASezAAMAAAACVAAA	P01	AAASez	AAM	AAAACV	AAA		-- offset is 0
AAASezAAMAAAACVAAB	P02	AAASez	AAM	AAAACV	AAB		-- offset is 1
AAASezAAMAAAACVAAC	P03	AAASez	AAM	AAAACV	AAC		-- offset is 2
AAASezAAMAAAACVAAD	P04	AAASez	AAM	AAAACV	AAD		-- offset is 3
AAASezAAMAAAACVAAE	P05	AAASez	AAM	AAAACV	AAE		-- offset is 4
AAASezAAMAAAACXAAA	P06	AAASez	AAM	AAAACX	AAA		-- offset is 1 in the another block (151)
