

create or replace function sum_dept
( v_dept_id in s_emp.dept_id%type )
return s_emp.salary%type
is
    v_dept s_dept%rowtype;
begin 
    select *
    into v_dept
    from s_dept
    where dept_id = v_id;
    dbms_output.put_line('부서명: ' || v_dept.name);
    dbms_output.put_line('지역번호: ' || v_dept.region_id);
end;

    
