select name
from tblcountry;

select capital from tblcountry;
select bookname from book;

select publisher from book;

select name from tblcountry;

select name, capital from tblcountry;

select capital, name from tblcountry;

select name, name || '@' from tblcountry;

select name, buseo, jikwi from tblinsa;


select * from sys.dba_users;
select * from SYS.dba_tables where owner = 'HR';
select * from SYS.dba_tab_columns where owner = 'HR' and table_name = 'TBLCOUNTRY';

select * from book where price > 7000 and price < 10000;
select 10 > 5 from book;

selcet bookname, price, price * 0.9 from book;