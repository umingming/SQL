create table 테이블명 (
    컬럼 선언
    컬럼명 자료형(도메인) 제양사항
);

create table tblType (
    num number
);

drop table tblType;

select * from tblType;

insert into tblType (num) values (100);
insert into tblType (num) values (200);
insert into tblType (num) values (3.14);
insert into tblType (num) values (3.123456);
insert into tblType (num) values (-3123456123456123456123456612345612345123456);

--정수형
create table tblType (
    num number
);

drop table tblType;

select * from tblType;

insert into tblType (num) values (100);
insert into tblType (num) values (200);
insert into tblType (num) values (3.14);
insert into tblType (num) values (3.123456);
insert into tblType (num) values (-3123456123456123456123456612345612345123456);

--실수형
create table tblType (
    num number(4,2)
);

drop table tblType;

select * from tblType;
commit;
select * from hr.tblType;

insert into tblType (num) values (100);
insert into tblType (num) values (200);
insert into tblType (num) values (3.14);
insert into tblType (num) values (3.123456);
insert into tblType (num) values (-3123456123456123456123456612345612345123456);

create table tblType (
    txt char(3)
);

drop table tblType;

insert into tblType (txt) values ('ABC');
insert into tblType (txt) values ('A');
insert into tblType (txt) values ('');
insert into tblType (txt) values ('ABCD');

select * from tblType;

create table tblType (
    txt1 char(10),
    txt2 varchar(20)
);

drop table tblType;

insert into tblType (txt1, txt2) values ('ABC','ABC');
insert into tblType (txt1, txt2) values ('ABCDEFGHIJ','ABCDEFGHIJ');
insert into tblType (txt1, txt2) values ('홍길동','홍길동');
--insert into tblType (txt1, txt2) values ('홍길동님','홍길동');
select * from tblType;

--

create table tblType (
    txt1 char(10),
    txt2 varchar(20)
);

drop table tblType;

insert into tblType (txt1, txt2) values ('ABC','ABC');
insert into tblType (txt1, txt2) values ('ABCDEFGHIJ','ABCDEFGHIJ');
insert into tblType (txt1, txt2) values ('홍길동','홍길동');
insert into tblType (txt1, txt2) values ('홍길동님','홍길동');
select * from tblType;