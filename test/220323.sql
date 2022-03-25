create table tbletc (
    name varchar2(30) primary key,
    content varchar2(300)
)

drop table tbletc;

SELECT ename
        , hiredate
        , LEAD(hiredate, 1) OVER (ORDER BY hiredate) AS "nexthired"
FROM emp;



SELECT NAME
        , age
FROM student;


SELECT studno
        , NAME
        , deptno
FROM student;

SELECT deptno
        , dname
FROM department
WHERE deptno IN (101, 102, 201);


SELECT studno
        , NAME
        , student.deptno
        , department.dname
FROM student
        , department
WHERE student.deptno = department.deptno;



select name
        , student.deptno
        , dname
        , loc
from student, department;


select name
        , student.deptno
        , dname
        , loc
from student cross join department;




DECLARE
    VCONTINENT TBLCOUNTRY.CONTINENT%TYPE;
    VRESULT VARCHAR2(30);
BEGIN
    SELECT CONTINENT 
				INTO VCONTINENT 
		FROM TBLCOUNTRY 
		WHERE NAME = '영국';
    IF VCONTINENT = 'AS' THEN
        VRESULT := '아시아';
    ELSIF VCONTINENT = 'EU' THEN
        VRESULT := '유럽';
    ELSIF VCONTINENT = 'AF' THEN
        VRESULT := '아프리카';
    ELSE
        VRESULT := '기타';
    END IF;
    DBMS_OUTPUT.PUT_LINE(VRESULT);
END;



SELECT S.NAME, S.grade, S.deptno, D.dname
FROM student S, department D
WHERE S.deptno = D.deptno
AND S.grade = '4';


SELECT NAME
        , dname
        , loc
FROM student S, department D
WHERE S.deptno = D.deptno
    AND NAME LIKE '김%';

SELECT S.NAME
        , D.dname
        , D.loc
FROM student S
        NATURAL JOIN department D
WHERE NAME LIKE '김%';

SELECT NAME
        , dname
        , loc
FROM student JOIN department 
        USING(deptno)
WHERE NAME LIKE '김%';


SELECT P.profno
        , P.NAME
        , P.sal
        , S.grade
FROM professor P, salgrade S
WHERE P.sal BETWEEN S.losal AND S.hisal;


select s.name
        , s.grade
        , p.name
        , p.position
from student s, professor p
where s.profno = p.profno(*)
order by p.profno;


SELECT studno
        , S.name
        , grade
        , S.deptno
        , S.profno
        , P.name
FROM student S FULL OUTER JOIN professor P
        ON S.profno = P.profno;
        
SELECT S.NAME
        , S.grade
        , P.NAME
        , P.POSITION
FROM student S, professor P
WHERE S.profno = P.profno(+);

select * from department;

SELECT C.deptno
        , C.dname
        , C.college
        , D.dname
        , D.college
FROM department C, department D
WHERE C.college = D.deptno;


SELECT dept.dname || '의 소속은 ' || org.dname
FROM department dept JOIN department org
        ON dept.college = org.deptno;
        
        

SELECT dept.dname || '의 소속은 ' || org.dname
FROM department dept JOIN department org
        ON dept.college = org.deptno
WHERE dept.deptno >= 201;



SELECT dept.dname || '의 소속은 ' || org.dname
FROM department dept, department org
WHERE dept.college = org.deptno
        AND dept.deptno >= 201;
        
        
SELECT studno
        , grade
FROM student
WHERE grade = (SELECT grade
                        FROM student
                        WHERE userid = 'jun123');
                        
SELECT deptno
    , weight
FROM student
WHERE weight < (SELECT AVG(weight)
                        FROM student
                        WHERE deptno = 101)
ORDER BY deptno;


SELECT grade    
        , height
FROM student
WHERE grade = (SELECT grade
                         FROM student
                         WHERE studno = 20101)
AND height > (SELECT height
                      FROM student
                      WHERE studno = 20101);

SELECT name
        , grade
        , deptno
FROM student
WHERE deptno IN (
                        SELECT deptno
                        FROM department
                        WHERE college IN (100, 102)
                        );
                        
select * from student;

SELECT studno
        , name
        , deptno
FROM student
WHERE deptno IN (
                            SELECT deptno
                            FROM department
                            WHERE college = 100
                           );

SELECT studno
        , name
        , deptno
FROM student
WHERE deptno IN (
                            SELECT deptno
                            FROM department
                            WHERE college = 100
                           );
SELECT studno
        , name
        , height
FROM student
WHERE height > ALL (
                                 SELECT height
                                 FROM student
                                 WHERE grade = '4'
                               );
SELECT profno
        , name
        , sal
        , comm
FROM professor
WHERE EXISTS (
                        SELECT position
                        FROM professor
                        WHERE comm IS NOT NULL
                      );

SELECT name
        , deptno
        , height
FROM student s1
WHERE height > (
                           SELECT AVG(height)
                           FROM student s2
                           WHERE s2.deptno = s1.deptno
                         );

select name
        , position
        , sal
from professor
where sal = (
                    select min(sal)
                            , comm
                    from professor
                    where deptno = 101
                  );


select * from emp;

SELECT ename
        , hiredate
FROM emp
WHERE deptno = (
                         SELECT deptno
                         FROM emp
                         WHERE ename = 'BLAKE'
                        );

SELECT empno
        , ename
FROM emp
WHERE sal >= (
                     SELECT AVG(sal)
                     FROM emp
                    )
ORDER BY sal;


select * from emp;

SELECT ename
        , deptno
        , sal
FROM emp
WHERE (deptno, sal) IN (
                                     SELECT deptno, sal
                                     FROM emp
                                     WHERE comm IS NOT NULL
                                   );
    AND sal IN (
                    SELECT sal
                    FROM emp
                    WHERE comm IS NOT NULL
                   );

select employee_id
        , last_name
        , (
           select department_name
           from departments d
           where e.department_id = d.department_id
          ) department_name
from employees e
order by department;


SELECT employee_id
        , last_name
FROM employees E
WHERE ((
            SELECT location_id
            FROM departments D
            WHERE E.department_id = D.department_id
           )
           =
           (
            SELECT location_id
            FROM locations L
            WHERE state_province = 'california'
          ));
          
insert into student
    values (10110, 


create table height_info 
(
    studno number(5),
    name varchar2(10),
    height number(5,2)
);

create table weight_info 
(
    studno number(5),
    name varchar2(10),
    weight number(5,2)
);


create table address
(
    id number(3)
    , name varchar2(50)
    , addr varchar2(100)
    , phone varchar2(30)
    , email varchar2(100)
);

alter table address
    modify phone varchar2(50);
    
    
SELECT * FROM CLIENT_ADDRESS;

select * from client_address;



COMMENT ON TABLE address IS '고객 주소록을 관리하기 위한 테이블';