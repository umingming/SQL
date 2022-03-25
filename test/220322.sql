SELECT studno
        , name
        , weight
        , deptno
FROM student
WHERE grade='1'
    AND weight >= 70;


SELECT studno
        , name
        , weight
        , deptno
FROM student
WHERE grade = '1'
    OR weight >= 70;


SELECT studno
        , name
        , weight
        , deptno
FROM student
WHERE NOT deptno = 101;


SELECT name
FROM student
WHERE weight BETWEEN 50 AND 70;

SELECT name
FROM student
WHERE birthdate BETWEEN '81/01/01' AND '83/12/31';

SELECT name
FROM student
WHERE deptno IN (102, 201);


SELECT name
FROM student
WHERE name LIKE '김%'
    OR name LIKE '_진_';



INSERT INTO STUDENT (STUDNO, NAME)
    VALUES (33334, '황보A정');
SELECT name
FROM student
WHERE name LIKE '황보\_%'; 




SELECT *
FROM EMP;

SELECT ename
         , sal
         , deptno
FROM emp
ORDER BY deptno, sal DESC;

SELECT ename
        ,  deptno
FROM emp
WHERE deptno IN (10, 30)
ORDER BY ename;

SELECT * FROM EMP;

SELECT ename
        , hiredate
FROM emp
WHERE hiredate LIKE '%82';


SELECT ename
        , sal
        , comm
FROM emp
WHERE comm IS NOT NULL 
    AND comm != 0
ORDER BY sal DESC, comm DESC;

SELECT CONCAT('유미', '님')
FROM DEPARTMENT;  
SELECT SUBSTR('이유미', 2, 2)
FROM DEPARTMENT;
SELECT INSTR('Welcome to Oracle', 'o', 3, 2)
FROM DEPARTMENT; 


SELECT LPAD('유미', 5, '*')
FROM DEPARTMENT;   --유미

SELECT RTRIM('유미', '미')
FROM DEPARTMENT;   --유미*
SELECT ename
    , sal
    , comm
FROM emp
WHERE deptno = 30
    AND comm/sal >= 0.2;



SELECT floor(123.17)
FROM dual;

SELECT trunc(123.17, 1)
FROM dual;

SELECT mod(4, 3)
FROM dual;


SELECT name "이름"
        , hiredate+30 "입사 30일 후"
        , hiredate+60 "입사 60일 후"
FROM professor
WHERE profno = 9908;


SELECT sysdate
FROM dual;

SELECT profno
        , hiredate
        , months_between(sysdate, hiredate)
FROM professor;


SELECT add_months(sysdate, 3)
FROM dual;

select '01-11-11' + '03-11-01'
from dual;

select round(sysdate + '01-11-11')
from dual;

SELECT next_day(sysdate, '일')
FROM dual;

SELECT trunc(sysdate)
FROM dual;

SELECT studno
        , to_char(birthdate, 'YY-MM')
FROM student
WHERE name = '전인하';
    
    
select name
        , position
        , to_char(hiredate, 'Mon "the" DDTH "of" YYYY')
from professor;


select name
        , position
        , sal
        , comm
        , sal+comm
        , sal+nvl(comm, 0)
        , nvl(sal+comm, sal)
from professor
where deptno = 201;

select name
        , position
        , sal
        , comm
        , nvl2(comm, sal+comm, sal) total
from professor
where deptno = 102;

SELECT name
        , comm
        , sal
        , COALESCE(comm, sal, 0)
FROM professor;

select deptno, avg(sal)
from professor
group by deptno;

select deptno
        , avg(sal)
        , min(sal)
        , max(sal)
from professor
group by deptno;

select deptno
        , profno
        , sal
from professor
order by deptno;

select deptno
        , grade
        , count(*)
        , round(avg(weight))
from student
group by deptno, grade;

SELECT deptno
        , COUNT(*)
FROM student
GROUP BY CUBE(deptno)
HAVING to_number(deptno) < 200;
SELECT deptno
        , COUNT(*)
FROM student
GROUP BY ROLLUP(deptno)
HAVING to_number(deptno) < 200;

SELECT * FROM STUDENT;
SELECT deptno
        , COUNT(*)
FROM student
GROUP BY ROLLUP(deptno);


SELECT deptno, SUM(sal)
FROM professor
GROUP BY ROLLUP(deptno);

SELECT deptno
        , position
        , COUNT(*)
FROM professor
GROUP BY CUBE(deptno, position);


select max(count(studno)) max_cnt
        , min(count(studno)) min_cnt
from student


SELECT deptno
        , empno
        , sal
        , SUM(sal) OVER (PARTITION BY deptno) S_SAL
FROM emp;


select studno
        , name
        , birthdate
        , ntile(4) over (order by birthdate) class
from student;
        
        