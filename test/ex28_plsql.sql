
set SERVEROUT on;
set serverout off;

declare
    num number;
    name varchar2(30);
    today date;
begin
    num := 10;
    dbms_output.put_inline(num);
    name := '홍길동';
    dbms_output.put_inline(num);
    today := sysdate;
    dbms_output.put_inline(today);
end;

declare
    num number;
    num2 number;
    num3 number := 300;
begin
    dbms_output.put_inline(num);
    
    num2 := 200;
    dbms_output.put_inline(num2);

end;

declare
    vbuseo varchar2(15);
begin
    select buseo into vbuseo from tblInsa where name = '홍길동';
end;


create table tblMain(
    name varchar2(15)
);


declare
    vname tblInsa.name%type;
    vbuseo tblInsa.buseo%type;
begin
    select 
        name, buseo into vname, vbuseo
    from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);
end;


create table tblBonus (
    seq number primary key,
    num number(5) not null references tblInsa(num),
    bonus number not null
);

desc tblInsa;

select * from tblInsa;


insert into tblBonus (seq, num, bonus) values (1, '김인수의 num';




declare
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
begin
    select num, basicpay into vnum, vbasicpay from tblInsa where city = '서울' and jikwi = '부장' and buseo = '영업부';
    insert into tblBonus (seq, num, bonus) values (1, vnum, vbasicpay * 1.5);
end;

select * from tblBonus;

select s.name, s.city, s.jikwi, s.buseo, s.basicpay, b.bonus
from tblBonus b inner join tblInsa s
    on s.num = b.num;


select * from tblMen;


select * from tblWomen;


declare
    vrow tblMen%rowtype;
begin
    select * into vrow from tblMen where name = '무명씨';
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.age);
    dbms_output.put_line(vrow.height);
    dbms_output.put_line(vrow.weight);
    dbms_output.put_line(vrow.couple);
    
    delete from tblMen where name = vrow.name;
end;


declare
    vnum number := -10;
begin
    if vnum > 0 then
        dbms_output.put_line('양수');
    elsif vnum < 0 then
        dbms_output.put_line('음수');
    else
        dbms_output.put_line('0');
    end if;
end;


declare
    vgender char(1);
begin
    select substr(ssn, 8, 1) into vgender from tblInsa where num = '1002';
    
    if vgender = '1' then
        dbms_output.put_line('남자 업무 진행');
    elsif vgender = '2' then
        dbms_output.put_line('여자 업무 진행');
    end if;
end;


declare
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
    vjikwi tblInsa.jikwi%type;
    vbonus number;
begin
    select num, basicpay, jikwi into vnum, vbasicpay, vjikwi from tblInsa where name = '홍길동';
    if vjikwi in ('부장', '과장') then
        vbonus := vbasicpay * 1.5;
    else if vjikwi = '대리' or vjikwi = '사원' then
        vbonus := vbasicpay * 2;
    end if;
    
    insert into tblBonus values (2, vnum, vbonus);
end;


select * from tblBonus;



declare
    vcontinent tblCountry.continent%type;
    vresult varchar2(30);
begin
    select continent into vcontinent from tblCountry where name = '영국';
    
    if vcontinent = 'AS' then
        vresult := '아시아';
    elsif vcontinent = 'EU' then
        vresult := '유렵';
    elsif vcontinent = 'AF' then
        vresult := '아프리카';
    else 
        vresult := '기타';
    end if;
end;



