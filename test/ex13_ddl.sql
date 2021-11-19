

-- 메모 테이블

create table tblmemo
(
    seq number(3),
    name varchar2(30),
    memo varchar2(1000),
    regdate date
);

select * from tblmemo;
select * from tabs;

select * from tblMemo where seq = 1;
select * from tblMemo where name = '홍길동';


insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);
insert into tblMemo(seq, name, memo, regdate) 
    values (2,null,null,null);
insert into tblMemo(seq, name, memo, regdate) 
    values (3,'아무개','공부할 것','2021-11-14');
insert into tblMemo(seq, name, memo, regdate) 
    values (4,'호호호','아자',to_date('2021-11-14 14:05:30','yyyy-mm-dd hh24:mi:ss'));
    
insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);

select nvl(population, 999) from tblcountry;

select nvl2(tel, '연락처 있음', '연락처 없음') from tblinsa;

select
    weight as aaaaaa,
    to_char(weight) as aaaaaa,
    to_char(weight, '99999') as aaaaaa,
    to_char(weight, '00000') as aaaaaa,
    to_char(-100, '$999'),
    '$'||to_char(-100, '999')
        from tblcomedian;
        
select
    123.456,
    to_char(123.456, '999999'),
    to_char(123.456, '999.999'),
    to_char(123.456, '9999.99')
        from dual;

drop table tblmemo;

create table tblmemo
(
    seq number(3) not null,
    name varchar2(30) null,
    memo varchar2(1000) not null,
    regdate date null
);
insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);

insert into tblMemo(seq, name, memo, regdate) 
    values (null,'홍길동','메모입니다.',sysdate);

select * from tblMemo;

drop table tblmemo;

create table tblmemo
(
    seq number(3) primary key not null,
    name varchar2(30) null,
    memo varchar2(1000) not null,
    regdate date null
);

insert into tblMemo(seq, name, memo, regdate) 
    values (null,'홍길동','메모입니다.',sysdate);
    
insert into tblMemo(seq, name, memo, regdate) 
    values (1,'아무개','테스트입니다.',sysdate);
    
drop table tblmemo;

create table tblmemo
(
    seq number(3) primary key not null,
    name varchar2(30) unique,
    memo varchar2(1000) not null,
    regdate date null
);

insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);

insert into tblMemo(seq, name, memo, regdate) 
    values (2,'홍길동','테스트입니다.',sysdate);

insert into tblMemo(seq, name, memo, regdate) 
    values (2,null,'메모입니다.',sysdate);
    

insert into tblMemo(seq, name, memo, regdate) 
    values (3,null,'메모입니다.',sysdate);
    
select * from tblMemo;

drop table tblmemo;

create table tblmemo
(
    seq number(3) primary key,
    name varchar2(30),
    memo varchar2(1000),
    regdate date null,
    lv number(1) check(lv>=1 and lv<=5)
);

insert into tblMemo(seq, name, memo, regdate, lv) 
    values (1,'홍길동','메모입니다.',sysdate, 1);

insert into tblMemo(seq, name, memo, regdate, lv) 
    values (2,'홍길동','메모입니다.',sysdate, null);

insert into tblMemo(seq, name, memo, regdate, lv) 
    values (2,'홍길동','메모입니다.',sysdate, 6);
    
    
drop table tblmemo;

create table tblmemo
(
    seq number(3) primary key,
    name varchar2(30) default '익명',
    memo varchar2(1000),
    regdate date default sysdate
);


insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);
    
    
insert into tblMemo(seq, memo) 
    values (2,'메모입니다.');

select * from tblMemo;
    
drop table tblmemo;

create table tblmemo
(
    seq number(3) constraint tblmemo_seq_pk primary key,
    name varchar2(30) constraint tblmemo_name_uq unique,
    memo varchar2(1000),
    regdate date,
    lv number(1) constraint tblmemo_lv_ck check(lv between 1 and 5)
);

insert into tblMemo(seq, name, memo, regdate, lv) 
    values (1,'홍길동','메모입니다.',sysdate,6);


select * from tblMemo;
    
drop table tblmemo;

create table tblmemo
(
    seq number(3),
    name varchar2(30),
    memo varchar2(1000),
    regdate date,
    constraint tblmemo_seq_pk primary key(seq),
    constraint tblmemo_name_uq unique(name),
    constraint tblmemo_regdate_ck 
        check(to_number(to_char(regdate,'hh24')) 
            between 9 and 15)
);

insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);

insert into tblMemo(seq, name, memo, regdate) 
    values (1,'홍길동','메모입니다.',sysdate);
    
insert into tblMemo(seq, name, memo, regdate) 
    values (2,'홍길동','메모입니다.',sysdate);
    
insert into tblMemo(seq, name, memo, regdate) 
    values (2,'아무개','메모입니다.',sysdate);