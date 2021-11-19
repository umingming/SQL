/*
1. 아시아와 유럽에 속한 나라의 개수는?
    -tblCountry
*/
select count(*) from tblcountry
    where continent in('AS','EU');


/*
2. 인구수가 7000~20000인 나라의 개수는?
*/
select count(*) from tblcountry
    where population between 7000 and 20000;
    
    
/*
3. 급여가 5000불이 넘는 직원은 몇 명?
    -job_id : IT_PROG
*/
select count(*) from employees
    where job_id = 'IT_PROG'
        and salary > 5000;
    
    
/*
4. 010을 안 쓰는 사람은 몇 명?
    -연락처가 없는 사람 제외
*/
select 
    count(tel) - 
    count(case
        when tel like '010%' then '010'
    end)
        from tblinsa;


/*
5. 서울, 경기, 인천 외 지역 인원수?
*/
select 
    count(*) - 
    count(case
        when city in ('서울','경기','인천') then 1
    end)
        from tblinsa;


/*
6. 여름 태생인 여자 직원은 몇 명?
*/
select count(*)
    from tblinsa
        where ssn like '___7%-2%'
            or ssn like '___8%-2%'
            or ssn like '___9%-2%';


/*
7. 개발부 직위별 인원수는?
*/
select 
    count(case
        when jikwi = '부장' then 1
    end) as "부장",
    count(case
        when jikwi = '과장' then 1
    end) as "과장",
    count(case
        when jikwi = '대리' then 1
    end) as "대리",
    count(case
        when jikwi = '사원' then 1
    end) as "사원"
        from tblinsa
            where buseo = '개발부';
