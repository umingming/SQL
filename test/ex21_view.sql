create table tblMovie (
    seq number primary key,
    title varchar2(200) not null,
    title_en varchar2(100) null,
    year varchar2(4) null,
    country varchar2(100) not null,
    type varchar2(20) not null,
    genre varchar2(100) null,
    status varchar2(20) not null,
    director varchar2(300) null,
    company varchar2(500) null
);

create view vwInsa
as
select * from tblInsa;

select * from vwinsa;

select * from tblInsa;

select * from tblinsa where buseo = '영업부';

create view vwInsa2
as
select * from tblInsa where buseo = '영업부';

select 
    r.seq as rseq,
    m.name as mname,
    v.name as vname,
    to_char(r.rentdate, 'yyyy-mm-dd') as rentdate
from tblRent r inner join tblVideo v
    on v.seq = r.video inner join tblMember m
    on m.seq = r.meber;
    
drop view vwinsa2;

create or replace view vwInsa2
as
select * from tblInsa where buseo = '홍보부';


create or replace view vwSeoul
as
select * from tblInsa where city = '서울';

select * from (select * from tblInsa where city = '서울');


create or replace view vwComedian
as
select * from tblComedian;

insert into tblComedian values ('나미','오','f',165,50,'오나미');

select * from tblComedian;

select * from vwComedian;

delete from tblComedian where first = '나미' or first = '민상';

delete from vwComedian where first = '나미' or first = '민상';

insert into vwComedian values ('나미','오','f',165,50,'오나미');

update vwComedian set first = '나비' where first = '나미';


create or replace view vwSales
as
select name, item
from tblCustomer c inner join tblSales s
    on c.seq = s.cseq;
    
select * from vwSales;

insert into vwSales (name, item) values ('유재석', '마우스패드');

create or replace view vwA
as
select department_id, first_name, last_name from employees;

create or replace view vwB
as
select department_id, department_name from departments;

