

create sequence seqNum1;

create sequence seqNum2;

select seqNum1.nextVal from dual;
select to_char(seqNum1.nextVal, '00') || seqNum2.nextVal from dual;
select to_char(seqNum.currVal, '000') from dual;

select to_char(seqNum1.currVal||seqNum2.currVal, '00000') from dual;

create table tblmemo2
(
    seq number(3) primary key,
    name varchar2(30),
    memo varchar2(1000),
    regdate date
);



create sequence seqMemo;

--현재 사용중인 시퀀스 객체의 마지막 번호?
select seqMemo.currVal from dual;
select seqMemo.nextVal from dual;


create sequence seqTest
    increment by -1
    start with 1
--    maxvalue 30
    minvalue -5
    cycle;
--    cache 20;
    
select * from tblmemo;
insert into tblmemo values(seqMemo.nextVal, '1', '테스트', sysdate);
drop sequence seqMemo;
create sequence seqMemo
    start with 1;


select seqTest.nextVal from dual;

drop sequence seqTest;