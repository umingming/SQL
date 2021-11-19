/*
16. 수당을 제외한 기본 연봉이 2천만원 이상, 서울, 직위 과장만 가져오시오.
*/
select * from tblinsa 
    where basicpay * 12 >= 20000000
        and city = '서울' 
        and jikwi IN('과장','부장');
    
/*
17. 국가명이 'O국'인 나라를 가져오시오.
    -2글자
    -글자 수 상관 없이
*/
select * from tblcountry
    where name like '_국';
    
select * from tblcountry
    where name like '%국';
    
    
/*
18. 연락처가 515로 시작하는 직원들 가져오시오.
*/
select * from employees
    where phone_number like '515%'; 
    
    
/*
19. 직업 ID가 SA로 시작하는 직원들 가져오시오.
*/
select * from employees
    where job_id like 'SA%'; 
    
    
/*
20. first_name에 'de'가 들어간 직원들 가져오시오.
    -대소문자 상관없이
*/
select * from employees
    where first_name like '%de%' 
        or first_name like 'De%'; 


/*
21. 남자직원만 가져오시오.
*/
select * from tblinsa
    where ssn like '%-1%';

    
/*
22. 여자직원만 가져오시오.
*/
select * from tblinsa
    where ssn like '%-2%';


/*
23. 여름에 태어난 직원들 가져오시오.
    -7,8,9월
*/
select * from tblinsa
    where ssn like '___7%' 
        or ssn like '___8%'  
        or ssn like '___9%';
    

/*
24. 서울, 인천에 사는 김씨만 가져오시오.
*/
select * from tblinsa
    where city in ('서울', '인천')
        and name like '김%';
   
   
/*
25. 영업부, 총무부, 개발부 사원 중 010을 사용하는 직원을 가져오시오.
*/
select * from tblinsa
    where buseo in ('영업부', '총무부', '개발부')
        and jikwi = '사원'
        and tel like '010%';
   
    
/*
26. 서울, 인천, 경기에 살고 입사일이 2008~2010년 사이인 직원들을 가져오시오.
*/
select * from tblinsa
    where city in ('서울', '인천', '경기')
        and ibsadate between '2008-01-01' and '2010-12-31';
   
    
/*
27. 아직 부서가 배정 안 된 직원들을 가져오시오.
*/
select * from employees
    where department_id is null;
   
    
/*
28. 직업이 어떤 것들이 있는지 가져오시오/
*/
select distinct job_id from employees;


/*
29. 고용일이 2002~2004년 사이인 직원들은 어느 부서에 근무합니까?
*/
select distinct department_id from employees
    where hire_date between '2002-01-01' and '2004-12-31';


/*
30. 급여가 5000불 이상인 직원들은 담당 매니저가 누구입니까?
*/
select distinct manager_id from employees
    where salary >= 5000;


/*
31. 남자 직원 + 80년대생들의 직급은 뭡니까?
*/ 
select distinct jikwi from tblinsa
    where ssn like '8%-1%';

    
/*
32. 수당이 20만원 넘는 직원들은 어디 삽니까?
*/ 
select distinct city from tblinsa
    where sudang >= 200000;

   
/*
33. 연락처가 아직 없는 직원은 어느 부서입니까?
*/ 
select distinct buseo from tblinsa
    where tel is null;