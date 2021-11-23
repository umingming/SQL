
/*
의사 컬럼
실제 컬럼이 아닌데 컬럼처럼 행동하는 객체

*/


select name, buseo from tblInsa where rownum = 1;
select name, buseo from tblInsa where rownum = 1 and rownum =3;

select name, buseo, rownum, rnum from (select name, buseo, rownum as rnum from tblInsa);

select name, buseo, rownum from tblInsa;
select name, buseo, rownum from (select name, buseo from tblInsa order by basicpay desc) where rownum <= 3;


select name, buseo, rownum, rnum 
from (select name, buseo, rownum as rnum 
      from (select name, buseo from tblInsa order by basicpay desc))
where rnum = 3;

select tblAddressBook.*, rownum from tblAddressBook;


select a.*, rownum from tblAddressBook a where rownum <= 20;


select a.*, rownum from tblAddressBook a where rownum <= 20 order by name asc ;

select a.*, rownum as rnum from (select * from tblAddressBook order by name asc) a;

select * from tblAddressBook order by name asc;


select * from (select a.*, rownum as rnum from (select * from tblAddressBook order by name asc) a)
where rnum between 1 and 10;


select name, buseo, basicpay
from (select a.*, rownum as rnum 
      from (select name, buseo, basicpay 
            from tblInsa 
            order by basicpay desc) a)
where rnum between 1 and 10;

select b.*
from (select a.*, rownum as rnum 
      from (select name, population 
            from tblCountry 
            order by population desc nulls last) a) b
where rnum = 3;

select * 
from (select a.*, rownum as rnum 
      from (select * 
            from tblComedian 
            order by weight desc) a) 
where rnum <= 3;