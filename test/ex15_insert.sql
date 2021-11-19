

/*
insert
테이블에 데이터를 추가하는 명령어
INSERT INTO 테이블명(컬럼리스트) VALUES (값리스트);
*/

drop table tblMemo;

create table tblMemo(
    seq number(3) primary key,
    name varchar2(30) default '익명' not null,
    memo varchar2(1000),
    regdate date default sysdate null
);

insert into tblMemo (seq, name, memo, regdate)
    values (seqMemo.nextVal, '홍길동', null, sysdate);

insert into tblMemo (seq, name, memo, regdate)
    values (seqMemo.nextVal, '홍길동', null, sysdate);



drop sequence seqMemo;
create sequence seqMemo;

insert into tblMemo (seq, name, memo, regdate)
    values (seqMemo.nextVal, '홍길동', '메모입니다.', sysdate);
    
insert into tblMemo (name, memo, regdate, seq)
    values ('홍길동', '메모입니다.', sysdate, seqMemo.nextVal);    
insert into tblMemo (name, memo, regdate)
    values ('홍길동', '메모입니다.', sysdate, seqMemo.nextVal);    
insert into tblMemo (name, memo, regdate, seq)
    values ('홍길동', '메모입니다.', sysdate);    
select * from tblMemo;


insert into tblMemo (seq, name, memo, regdate)
    values (seqMemo.nextVal, '홍길동', '메모입니다.', null);
    
    
create table tblMemoCopy(
    seq number(3) primary key,
    name varchar2(30) default '익명' not null,
    memo varchar2(1000),
    regdate date default sysdate null
);

insert into tblMemoCopy select * from tblMemo;

select*from tblmemocopy;

commit;

rollback;

select * from tblcountry;

update tblCountry set capital = '세종' where name = '대한민국';

update tblCountry set population = population * 1.05 where continent = 'AS';

update tblCountry set
    capital = '부산',
    area = area * 1.2,
    population = population * 1.2
        where name = '대한민국';
        

commit;

rollback;

select * from tblCountry;

delete from tblCountry where name = '중국';
desc tblcomedian;
select * from tblcomedian;
order by gender;

select * from tblcomedian
order by gender;

select * from tblcomedian
order by substr(gender, 1, 1);
select * from tblInsa;
select 
	name, jikwi,
	case
		when jikwi = '부장' then 4
		when jikwi = '과장' then 3
		when jikwi = '대리' then 2
		when jikwi = '사원' then 1
	end as jikwiseq
from tblInsa
	order by jikwiseq desc;
    
select * from tblinsa 
	where buseo = '기획부' 
        order by substr(ssn, 8, 1);    
select * from tblinsa 
	where buseo = '기획부' 
		order by case 
			when ssn like '%-1%' then 1
			when ssn like '%-2%' then 2
		end desc;