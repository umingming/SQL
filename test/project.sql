create table ex1
(
    seq number(3) primary key check (seq <= 10),
    name varchar2(30) default '익명' not null,
    date DATE check (date < sysdate)    
);

insert into ex1(seq) 
    values (10);

DROP TABLE EX1;
select * from ex1;