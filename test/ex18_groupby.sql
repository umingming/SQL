
select * from tblinsa;
select
    round(avg(basicpay))
        from tblInsa;
        
select distinct buseo from tblInsa;

select round(avg(basicpay)) from tblInsa
            where buseo = '총무부';
select round(avg(basicpay)) from tblInsa
            where buseo = '개발부';
select round(avg(basicpay)) from tblInsa
            where buseo = '영업부';
select round(avg(basicpay)) from tblInsa
            where buseo = '기획부';
select round(avg(basicpay)) from tblInsa
            where buseo = '인사부';
select round(avg(basicpay)) from tblInsa
            where buseo = '자재부';
select round(avg(basicpay)) from tblInsa
            where buseo = '홍보부';
            
select buseo, round(avg(basicpay)) from tblInsa
    group by buseo;
    
select avg(basicpay) from tblInsa group by buseo;

select
    count(case
        when gender = 'm' then 1
    end) as 남자,
    count(case
        when gender = 'f' then 1
    end) as 여자,
    count(decode(gender,'m',1)) as 남자,
    count(decode(gender,'f',1)) as 여자,
        from tblcomedian;
select gender, count(*) 
    from tblcomedian
        group by gender;

select 
    substr(ssn, 8, 1), count(*)
        from tblInsa
            group by substr(ssn, 8, 1);
            
select
    city, count(*)
        from tblInsa
            group by city
                order by count(*);
select
    jikwi,
    count(*) as 직위별인원수,
    sum(basicpay) as 직위별급여총합,
    round(avg(basicpay)) as 직위별평균급여,
    max(ibsadate) as 직위별막내입사일
        from tblInsa
            group by jikwi;

select
    buseo,
    jikwi,
    count(*)
        from tblInsa
            group by buseo, jikwi
                order by buseo asc, jikwi asc, count(*) desc;
                
                
select
    floor(basicpay / 1000000),
    count(*)
from tblinsa
    group by floor(basicpay / 1000000);
    
select completedate from tbltodo 
    where completedate is null;
    
select
    case
        when completedate is not null then '완료된일'
		when completedate is null then '해야할일'
    end as state,
    count(*)
from tbltodo;
--    group by case
--                when completedate in not null then '한 일'
--                when completedate in not null then '안 한 일'
--             end;

select
	case
		when completedate is not null then '완료된일'
		when completedate is null then '해야할일'
	end as state,
    count(*)
from tbltodo
    group by case
                when completedate is not null then '완료된일'
                when completedate is null then '해야할일'
             end;

select
    case
        when completedate is not null then '완료된일'
		when completedate is null then '해야할일'
    end as state
from tbltodo;

select job, count(*) from tbladdressbook group by job;

select 
    name,
    buseo,
    (select count(*) from tblInsa group by buseo)
from tblInsa;
    
select * from tblinsa;
select count(*)
from tblInsa group by substr(ssn, 2, 1) having s;