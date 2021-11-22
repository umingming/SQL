


select * from tblCustomer c 
    inner join tblSales s
        on c.seq = s.cseq;

select * from tblcustomer;

select * 
from tblCustomer c left outer join tblSales s
    on (c.seq = s.cseq);
    
select * 
from tblVideo v left outer join tblRent r 
    on (v.seq = r.video);


--대여를 한 번이라도 한 회원과 그 대여 내역
select * from tblRent;

select *
from tblMember m inner join tblRent r
    on m.seq = r.member;


--대여와 상관 없이 모든 회원과 그 대여 내역

select *
from tblMember m left outer join tblRent r
    on m.seq = r.member;

--대여를 한 번이라도 한 회원의이름을 가져오시오.

select distinct m.name
from tblMember m inner join tblRent r
on m.seq = r.member;

select count(distinct m.seq)
from tblMember m inner join tblRent r
on m.seq = r.member;


select m.name, m.name, m.tel
from tblMember m inner join tblRent r
on m.seq = r.member;

select 
    m.name, count(r.member)
from tblMember m inner join tblRent r
    on m.seq = r.member
group by m.name;

select * from tblMember;
select * from tblRent;


select 
    m.name, count(r.member)
from tblMember m left outer join tblRent r
    on m.seq = r.member
group by m.name;

select * from employees;
select * from department;

select 
    first_name || ' ' || last_name as name,
    department_name
from employees e inner join departments d
    on e.department_id = d.department_id;
    
select 
    first_name || ' ' || last_name as name,
    department_name
from (select first_name, last_name, department_id from employees) e 
    inner join (select department_name, department_id from departments) d
        on e.department_id = d.department_id;



create table tblSelf (
    seq number primary key,
    name varchar2(30) not null,
    department varchar2(50) null,
    super number null references tblSelf(seq)
);

insert into tblSelf values (1,'홍사장',null,null);
insert into tblSelf values (2,'김부장','영업부',1);
insert into tblSelf values (3,'이과장','영업부',2);
insert into tblSelf values (4,'정대리','영업부',3);
insert into tblSelf values (5,'최사원','영업부',4);
insert into tblSelf values (6,'박부장','개발부',1);
insert into tblSelf values (7,'하과장','개발부',6);

select * from tblSelf;

select 
    e.name as 직원명,
    m.name as 상사명
from tblself e inner join tblself m
on e.super = m.seq
order by e.seq asc;

select 
    e.name as 직원명,
    m.name as 상사명
from tblself e left outer join tblself m
on e.super = m.seq
order by e.seq asc;

select
    e.name as 직원명,
    (select name from tblSelf m 
     where e.super = m.seq) as 상사명
from tblSelf e;
    