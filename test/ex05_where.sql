select * from tblCountry; --fullset
select * from tblCountry where continent = 'AS'; 

select name, area from tblCountry; --projection

select * from tblinsa;

select name, buseo, basicpay from tblinsa;

--영업부 직원을 가져오시오.
select * from tblinsa where buseo = '영업부';

--영업부 직원의 이름, 부서, 급여만 가져오시오.
select name as 이름, buseo as 부서, basicpay as 급여
from tblinsa 
where buseo = '영업부';

select * from tblinsa where buseo = '영업부' and city = '서울';

--영업부, 서울, 사원 또는 대리
select * from tblinsa 
where buseo = '영업부' and city = '서울' and jikwi = '사원' or jikwi = '대리';

select * from tblinsa
where basicpay >= 1500000 and basicpay <= 2000000;

select * from book where publisher = '대한미디어';

/*
tblComedian
1.몸무게가 60kg 이상이고 키가 170cm미만인 사람만 가져오기
2.여자만 가져오기
tblInsa
3.부서가 개발부이고 급여를 150만원 이상 받는 직원 가져오기
4.급여와 수당을 합한 금액이 200만원 이상 받는 직원을 가져오시오
*/
--1
select * from tblcomedian where weight >= 60 and height < 170;

select last||first as name,gender,height,weight,nick from tblcomedian where weight >= 60 and height < 170;
--2
select * from tblcomedian where gender = 'f';
--3
select * from tblinsa where buseo = '개발부' and basicpay >= 1500000;
--4
select * from tblinsa where (basicpay + sudang) >= 2800000;

--
select last || first as name, weight from tblcomedian;

select last || first as name, weight 
    from tblcomedian
        where weight >= 60 and weight <= 70;
        

select last || first as name, weight 
    from tblcomedian
        where weight between 64 and 66;
        
select * from tblinsa where name >= '박' and name <= '이';

select * from tblinsa where ibsadate >= '2010-01-01' and ibsadate <= '2010-12-31';

select * from tblinsa where buseo in ('홍보부', '개발부');

select * from tblinsa
    where jikwi in ('부장', '과장')
        and city in ('서울', '인천')
        and basicpay between 1500000 and 2000000;
        
select * from employees where first_name like '____e';

select * from tblInsa;

--tblInsa.남자 직원만
select * from tblInsa where ssn like '______-2______';

select * from tblInsa where ssn like '%-2%';

select * from tblcountry where not population is null;

select * from tblinsa where tel is null;
select * from tblinsa where tel is not null;