
select * from tblcountry order by area desc;

select name, jikwi
from tblinsa
where buseo = '기획부'
order by name asc;


select name, buseo, jikwi, basicpay from tblinsa order by buseo, jikwi, name;
select name, buseo, jikwi, basicpay from tblinsa order by 4;

select * from tblInsa
    order by basicpay + sudang desc;

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
    
select 
    name, jikwi
from tblInsa
    order by  case
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end desc;
    
select * from tblinsa 
    where buseo = '기획부' 
        order by case 
                    when ssn like '%-1%' then 1
                    when ssn like '%-2%' then 2
                 end;
