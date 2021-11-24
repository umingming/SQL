
drop table tbledit;

create table tblEdit (
    seq number primary key,
    data varchar2(20) not null
);

insert into tblEdit values (1, '마우스');
insert into tblEdit values (2, '키보드');
insert into tblEdit values (3, '모니터');
insert into tblEdit values (4, '2021년 출시된 최신형 노트북');

select * from tblEdit;

alter table tblEdit
add (price number(5) null);

alter table tblEdit
add (memo varchar2(100) default '임시' not null);



delete from tblEdit;

alter table tblEdit
modify (data varchar2(100));

desc tblEdit;


drop table tbledit;

create table tblEdit (
    seq number,
    data varchar2(20),
    color varchar2(30)
);

alter table tblEdit
add constraint tbledit_color_ck check (color in ('red','yellow','blue'));

insert into tblEdit values (1, '마우스', 'red');
insert into tblEdit values (2, '키보드', 'black');
insert into tblEdit values (3, '모니터');
insert into tblEdit values (4, '2021년 출시된 최신형 노트북');