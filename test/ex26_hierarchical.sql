

create table tblComputer (
    seq number primary key,
    name varchar2(50) not null,
    qty number not null,
    pseq number null references tblComputer(seq)
);


insert into tblComputer values (1, '컴퓨터', 1, null);
insert into tblComputer values (2, '본체', 1, 1);
insert into tblComputer values (3, '메인보드', 1, 2);
insert into tblComputer values (4, '그래픽카드', 1, 2);
insert into tblComputer values (5, '랜카드', 1, 2);
insert into tblComputer values (6, 'CPU', 1, 2);
insert into tblComputer values (7, '메모리', 2, 2);

insert into tblComputer values (8, '모니터', 1, 1);
insert into tblComputer values (9, '보호필름', 1, 8);
insert into tblComputer values (10, '모니터암', 1, 8);

insert into tblComputer values (11, '프린터', 1, 1);
insert into tblComputer values (12, 'A4용지', 1, 11);
insert into tblComputer values (13, '잉크카트리지', 3, 11);


select 
    c1.name as 부품명,
    c2.name as 부모부품명
from tblComputer c1 inner join tblComputer c2
    on c1.pseq = c2.seq
order by c1.seq;



select 
    c1.name as 부품명,
    c2.name as 부모부품명
from tblComputer c1 left outer join tblComputer c2
    on c1.pseq = c2.seq
order by c1.seq;

select * from tblComputer;

select
    lpad(' ', (level-1) * 5) || name as "부품명",
    name as "부품명",
    prior name as "부모부품명",
    level
from tblComputer c
start with seq = 1
connect by prior seq = pseq;

select
    lpad(' ', (level-1) * 2) || name as "부품명",
    name as "부품명",
    prior name as "부모부품명",
    level
from tblComputer c
start with pseq is null
connect by prior seq = pseq
order siblings by name asc;


    