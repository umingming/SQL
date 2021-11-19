/*
 1. traffic_accident. 각 교통 수단 별(지하철, 철도, 항공기, 선박, 자동차) 
 발생한 총 교통 사고 발생 수, 총 사망자 수, 사건 당 평균 사망자 수를 가져오시오.
*/
select 
    trans_type as "교통 수단",
    sum(total_acct_num) as "총 사고 발생 수",
    sum(death_person_num) as "총 사망자 수",
    (select round(avg(death_person_num / total_acct_num), 1) 
        from traffic_accident 
        where total_acct_num <> 0) as "사건 당 평균 사망자"
from traffic_accident
group by trans_type;


/*
 2. tblZoo. 종류(family)별 평균 다리의 갯수를 가져오시오.
*/
select 
    family,
    round(avg(leg), 1) as "평균 다리 갯수"
from tblZoo
group by family;

    
/*
 3. tblZoo. 체온이 변온인 종류 중 아가미 호흡과 폐 호흡을 하는 종들의 갯수를 가져오시오.
*/
select 
    breath,
    count(distinct family) as "종들의 갯수"
from tblZoo
where thermo = 'variable'
group by breath;


/*
 4. tblZoo. 사이즈와 종류별로 그룹을 나누고 각 그룹의 갯수를 가져오시오.
*/
select 
    sizeof,
    family,
    count(*) 
from tblZoo
group by sizeof, family
order by sizeof desc, family;


/*
 5. tblMen. tblWomen. 서로 짝이 있는 사람 중 남자와 여자의 정보를 모두 가져오시오.
    [남자]        [남자키]   [남자몸무게]     [여자]    [여자키]   [여자몸무게]
    홍길동         180       70            장도연     177        65
    아무개         175       null          이세영     163        null
*/
select 
    name, height, weight, couple,
    (select height
        from tblWomen
        where name = tblmen.couple) as height,
    (select height
        from tblWomen
        where name = tblmen.couple) as weight
from tblmen
where couple is not null;


/*
 10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 
 주로 어느 지역 태생(hometown)인가?
*/
select hometown
from (select hometown, count(*) as cnt from tbladdressbook 
        where job = (select job from (select job, count(*) as cnt 
                                        from tbladdressbook group by job)
                        where cnt = (select max(count(*)) 
                                        from tbladdressbook group by job))
        group by hometown)
where cnt = (select max(count(*)) from tbladdressbook 
                where job = (select job from (select job, count(*) as cnt 
                                from tbladdressbook group by job)
                                where cnt =  (select max(count(*)) 
                                                from tbladdressbook 
                                                group by job))
                group by hometown);
 

/*
 12. tblAddressBook. 관리자의 실수로 몇몇 사람들의 이메일 주소가 중복되었다. 
 중복된 이메일 주소만 가져오시오.
*/
select 
    email as "중복된 이메일"
from tbladdressbook
group by email
having count(*) > 1;


/*
 13. tblAddressBook. 이메일 도메인들 중 
 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?
*/
select 
    도메인
from (select substr(email, instr(email, '@') + 1) as 도메인, 
             avg(length(email)) as 평균 
        from tbladdressbook
        group by substr(email, instr(email, '@') + 1))
where 평균 = (select max(평균) 
                from (select avg(length(email)) as 평균 
                        from tbladdressbook
                        group by substr(email, instr(email, '@') + 1)));


/*
 14. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 
 가지고 있는 직업 중 가장 많은 직업은?
*/
select 
    job 
from (select job, count(*) as cnt
        from tbladdressbook
        where hometown = (select hometown
                            from (select hometown, avg(age) as avg_age
                                    from tbladdressbook
                                    group by hometown)
                            where avg_age = (select max(avg(age)) 
                                                from tbladdressbook
                                                group by hometown))
        group by job)
where cnt = (select max(count(*))
                from tbladdressbook
                where hometown = (select hometown
                                    from (select hometown, avg(age) as avg_age
                                            from tbladdressbook
                                            group by hometown)
                                    where avg_age = (select max(avg(age)) 
                                                        from tbladdressbook
                                                        group by hometown))
                group by job);


/*
 15. tblAddressBook. 성씨별 인원수가 100명 이상 되는 성씨들을 가져오시오.
*/
select 
    substr(name, 1, 1) as "성"
from tbladdressbook
group by substr(name, 1, 1)
having count(*) >= 100;


/*
 16. tblAddressBook. 남자 평균 나이보다 나이가 많은 
 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.
*/
select * from tblAddressBook
where hometown = '서울'
    and job not in ('취업준비생', '백수')
    and age >= (select avg(age) from tblAddressBook 
                where gender = 'm');


/*
 17. tblAddressBook. 이메일이 스네이크 명명법으로 만들어진 사람들 중에서 
 여자이며, 20대이며, 키가 150~160cm 사이며, 고향이 서울 또는 인천인 사람들만 가져오시오.
*/
select * from tblAddressBook
where instr(email, '_') > 0
    and gender = 'f'
    and hometown in ('서울', '인천')
    and height between 150 and 160;


/*
 18. tblAddressBook. gmail.com을 사용하는 사람들의 
 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.
*/
select 
    gender as 성별,
    substr(age, 1, 1) || '0대' as 세대별,
    count(*) as cnt 
from tblAddressbook
where instr(email, '@gmail') > 0
group by gender, substr(age, 1, 1)
order by gender;


/*
 19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 
 같은 직업을 가지는 사람들을 가져오시오.
*/
select * from tbladdressbook
where job 
    = (select job from tbladdressbook 
        where age = (select max(age) from tbladdressbook)
            and weight = (select max(weight) from tbladdressbook));
                

/*
 20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 
 서울과 지방의 비율이 어떻게 되느냐?
*/
select 
    job,
    round((select count(*) from tbladdressbook 
        where job = a.job 
            and instr(address, '서울특별시') > 0) /
        (select count(*) from tbladdressbook 
        where job = a.job 
            and instr(address, '서울특별시') = 0), 2) as "서울/지방"
from tbladdressbook a
where job in ('건물주', '건물주자제분')
group by job;
    

/*
 21. tblAddressBook.  동명이인이 여러명 있습니다. 
 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.
*/
select * from tbladdressbook
where name = (select name 
                from (select name, count(*) as cnt
                        from tbladdressbook
                        group by name)
                where cnt = (select max(count(*))
                                from tbladdressbook
                                group by name));


/*
 22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
    [10대]       [20대]       [30대]       [40대]
    8.7%        30.7%        28.3%        32.2%
*/
select 
    round(count(case 
        when substr(age, 1, 1) = 1 then 1
    end) / count(*) * 100, 1) as "10대" ,
    round(count(case 
        when substr(age, 1, 1) = 2 then 1
    end) / count(*) * 100, 1)  as "20대",
    round(count(case 
        when substr(age, 1, 1) = 3 then 1
    end) / count(*) * 100, 1)  as "30대",
    round(count(case 
        when substr(age, 1, 1) = 4 then 1
    end) / count(*) * 100, 1)  as "40대"
from tbladdressbook
where job = (select job from (select job, count(*) as cnt 
                                        from tbladdressbook group by job)
                        where cnt = (select max(count(*)) 
                                        from tbladdressbook group by job));
