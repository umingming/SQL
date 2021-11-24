
select * from tblMen m inner join tblWomen w on m.couple = w.name;
select * from tblMen m left outer join tblWomen w on m.couple = w.name;
select * from tblMen m full outer join tblWomen w on m.couple = w.name;
select * from tblMen m right outer join tblWomen w on m.couple = w.name;

select name, age from tblMen
union
select * from tblWomen;


create table tblunionA(
    name varchar2(30) not null
);


create table tblunionB(
    name varchar2(30) not null
);


insert into tblUnionA values ('강아지');
insert into tblUnionA values ('고양이');
insert into tblUnionA values ('사자');
insert into tblUnionA values ('호랑이');
insert into tblUnionA values ('닭');

insert into tblUnionA values ('타조');
insert into tblUnionA values ('코알라');
insert into tblUnionA values ('고양이');
insert into tblUnionA values ('치타');
insert into tblUnionA values ('호랑이');