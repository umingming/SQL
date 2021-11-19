

select
    to_char(123.456, '999999'),
    to_char(123.456, '999.999'),
    to_char(123.456, '9999.99')
        from dual;
        

select
    to_char(123456789, '999999999'),
    to_char(123456789, '999,999,999'),   --자동으로 찍히지 않음.
    to_char(123456789, '999,999999')
        from dual;
        
select sysdate from dual;


select to_char(sysdate, 'yyyy') from dual;
select to_char(sysdate, 'yy') from dual;
select to_char(sysdate, 'month') from dual;
select to_char(sysdate, 'mon') from dual;
select to_char(sysdate, 'mm') from dual;
select to_char(sysdate, 'day') from dual;
select to_char(sysdate, 'dy') from dual;
select to_char(sysdate, 'ddd') from dual;
select to_char(sysdate, 'dd') from dual;
select to_char(sysdate, 'd') from dual;
select to_char(sysdate, 'hh') from dual;
select to_char(sysdate, 'hh24') from dual;
select to_char(sysdate, 'mi') from dual;
select to_char(sysdate, 'ss') from dual;
select to_char(sysdate, 'am') from dual;
select to_char(sysdate, 'pm') from dual;


select
    to_char(sysdate, 'yyyy-mm-dd')
from dual;


select
    to_char(sysdate, 'hh24:mi:ss')
from dual;

select
    to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

select
    to_char(sysdate, 'day am hh:mi:ss')
from dual;

select name, ibsadate,
    to_char(ibsadate, 'yyyy-mm-dd hh24:mi:ss') as 입사일
    from tblinsa
    where ibsadate >= '2010-01-01 00:00:00' 
        and ibsadate <= '2010-12-31 23:59:59';
        
select name, ibsadate,
    to_char(ibsadate, 'yyyy-mm-dd hh24:mi:ss') as 입사일
    from tblinsa
    where to_char(ibsadate, 'yyyy') = '2010';
    
    
select 
    to_char(ibsadate, 'd')
        from tblinsa
            order by to_char(ibsadate, 'd');
            
select
    name, to_char(ibsadate, 'yyyy-mm-dd day'),
    basicpay,
    case
        when to_char(ibsadate, 'd') in ('1', '7') then basicpay / 2
        else basicpay * 2
    end as "실급여"
        from tblinsa;
        
select
    count(case
        when to_char(ibsadate, 'd') in ('1', '7') then basicpay / 2
    end) as "주말입사",
    count(case
        when to_char(ibsadate, 'd') not in ('1', '7') then basicpay / 2
    end) as "평일입사"
        from tblinsa;
        
select '123' as "aaaaaaaaaaaaaaaaaaaaaaaaaa", 
    to_number('123') * 2 as "aaaaaaaaaaaaaaaaaaaaaaaaaa"
        from dual;

select * from tblinsa where ibsadate > '2010-01-01';
select * from tblinsa where ibsadate > to_date('2010-01-01');
select name, '2010-01-01', sysdate from tblinsa;

select to_date('2010-11-15') - ibsadate
   from tblinsa;
        