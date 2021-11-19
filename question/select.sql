/*
1. 모든 행과 모든 컬럼을 가져오시오.
*/
select * from tblcountry;

/*
2. 국가명과 수도명을 가져오시오.
*/
select name, capital from tblcountry;

/*
3. 아래와 같이 가져오시오.
-국가명, 수도명, 인구수, 면적, 대륙 별칭 사용
*/
select name as 국가명, 
    capital as 수도명, 
    population as 인구수,
    area as 면적,
    continent as 대륙
    from tblcountry;
    
/*
4. 아래와 같이 가져오시오.
-별칭과 더하기 연산 사용
*/
select '국가명:' || name || 
    ', 수도명:' || capital || 
    ', 인구수' || population as 국가정보
    from tblcountry;
    
/*
5. 아래와 같이 가져오시오.
-이름, 이메일, 연락처, 급여 별칭과 더하기 연산 사용
*/
select first_name || ' ' || last_name as 이름,
    email || '@GAMIL.COM' as 이메일,
    phone_number as 연락처,
    '$' || salary as 급여
    from employees;
    
/*
6. 면적 100이하인 국가의 이름과 면적을 가져오시오.
*/
select name, area
    from tblcountry
        where area <= 100;
    
/*
7. 아시아와 유럽 대륙에 속한 나라를 가져오시오.
*/
select * from tblcountry
    where continent in('AS', 'EU');
    
/*
8. 직업이 프로그래머인 직원의 이름과 연락처를 가져오시오.
*/
select first_name || ' ' || last_name as name, phone_number
    from employees
        where job_id = 'IT_PROG';
    
/*
9. last_name이 Grant인 직원의 이름, 연락처, 고용날짜를 가져오시오.
*/
select first_name || ' ' || last_name as name, phone_number, hire_date
    from employees
        where last_name = 'Grant';    
    
/*
10. 특정 매니저가 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
*/
select first_name || ' ' || last_name as name, salary, phone_number
    from employees
        where manager_id = '120';
    
/*
11. 특정 부서에 속한 직원들의 이름, 연락처, 이메일, 부서ID 가져오시오.
*/
select first_name || ' ' || last_name as name, phone_number,
    email || '@GAMIL.COM' as email, department_id
    from employees
        where department_id in ('60', '80', '100');
  
/*
12. 기획부 직원들 가져오시오.
*/
select * from tblinsa
    where buseo = '기획부';

/*
13. 서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호 가져오시오.
*/
select name, jikwi, tel
    from tblinsa
        where jikwi = '부장' and city = '서울';
    
/*
14. 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울 직원만 가져오시오.
*/
select * from tblinsa
    where (basicpay + sudang >= 1500000) and city = '서울';  
    
/*
15. 수당이 15만원 이하인 직원 중 직위가 사원, 대리만 가져오시오.
*/
select * from tblinsa
    where (sudang <= 150000) and jikwi in ('사원', '대리');
    