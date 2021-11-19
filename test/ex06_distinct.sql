
select distinct continent, name from tblcountry;

select continent, name from tblcountry;

select distinct continent from tblcountry;

select * from tblinsa;

select distinct buseo, jikwi from tblinsa;

select buseo, jikwi from tblinsa;

select last || first as name,
    case
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as gender
from tblComedian;

select 
    name,
    continent,
    case
        when continent = 'AS' then '아시아'
        when continent = 'SA' then '아메리카'
        when continent = 'EU' then '유럽'
        else continent
    end
from tblcountry;


select
    last || first as name,
    weight,
    case
        when weight > 100 then '과체중'
        when weight > 50 then '정상체중'
        when weight > 0 then '저체중'
    end as state,
    case
        when weight > 50 and weight < 100 then '정상체중'
        else '이상체중'
    end as state2
from tblcomedian;

select 
    name,
    jikwi,
    case
        when jikwi in('부장', '과장') then '간부'
        else '평사원'
    end as 직위
from tblInsa;

select
    name,
    ibsadate,
    case
        when ibsadate > '2010-11-11' then '주니어'
        when ibsadate > '2008-11-11' then '시니어'
        else '익스퍼트'
    end as 구분
from tblInsa;

select
    title,
    case
        when completedate is not null then '완료된일'
        when completedate is not null then '해야할일'
    end as state
from tbltodo;

select 
    name,
    case
        when couble is not null then '여자친구 있음'
        when couble is null then '여자친구 없음'
    end
from tblmen;

select 
    name, jikwi, sudang,
    case
        when jikwi = '부장' then sudang * 2
        when jikwi = '과장' then sudang * 1.7
        when jikwi = '대리' then sudang * 1.5
        when jikwi = '사원' then sudang * 1.3
        when jikwi in ('부장','과장') then sudang * 2
        when jikwi in ('대리','사원') then sudang * 1.5
    end as sudang2
from tblinsa;