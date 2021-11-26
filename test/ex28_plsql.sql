
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


declare
    vnum number := 1;
begin
    loop
        dbms_output.put_line(to_char(sysdate, 'hh24:mi:ss'));
        
        vnum := vnum + 1;
        exit when vnum > 10;
    end loop;
end;


begin
    for i in 1..10 loop
    
    end loop;
end;


create table tblGugudan
    dan number not null,
    num number not null,
    result number not null,
    
    constraint tblgugudan_dan_num_pk primary key(dan, num)
);

alter table tblGugudan
    add constraint tblgugudan_dan_num_pk primary key(dan, num);

create table tblLoop(
    seq number primary key,
    data varchar2(30) not null
);



begin
    for dan in 2..9 loop
        for num in 1..9 loop
            insert into tblGugudan (dan, num, result)
                values (dan, num, dan * num);
        end loop;
    end loop;
end;

end





create table tblCourse (
    seq number(3) primary key,
    name varchar2(10) not null
);

create table tblRoom (
    seq varchar2(10) primary key,
    cseq number(3) unique,
    
    foreign key(cseq) references tblCourse(seq)
        on delete set null
);


insert into tblCourse values (1, '이유미');

insert into tblCourse values (2, '이유미');

insert into tblCourse values (3, '이유미');

insert into tblCourse values (4, '이유미');

insert into tblCourse values (5, '이유미');

insert into tblRoom values (1, 1);
insert into tblRoom values (2, 2);

insert into tblRoom values (1, 6);



drop table tblRoom;
drop table tblCourse;
select * from tblRoom;
select * from tblCourse;



declare
    vname tblInsa.name%type;
    cursur 
begin
    select name into vname from tblInsa;
    dbms_output.put_line(vname);
end;


declare
    cursor vcursor
        is select name, jikwi, basicpay from tblInsad where buseo = '기획부' order by num asc;
    vname tblInsa.name%type;
    vjikwi tblInsa.jikwi%type;
    vbasicpay tblInsa.basicpay%type;
begin
    cursor vcursor;
    
    loop
        fetch vcursor into vname, vjikwi, vbasicpay;
        exit when vcursor%notfound;
        dbms_output.put_line(vname || '_' || vjikwi || '_' || vbasicpay);
    end loop;
    
    close vcursor;
end;


declare
    cursor vcursor is
        select * from tblInsa;
    vrow tblInsa%rowtype;
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        if vrow.jikwi in ('과장', '부장') then
    end loop;
    close vcursor;
end;
    


declare
    vname number;
begin
    dbms_output.put_line('시작');
    select name into vname from tblInsa where num = '1001';
    dbms_output.put_line('끝');

exception
    when others then
        dbms_output.put_line('예외 처리');
end;

create table tblLog (
    seq number primary key,
    code varchar2(7) not null check (code in ('A001', 'BOO1', 'B002', 'COO2')),
    message varchar2(1000) not null,
    regdate date default sysdate not null
);

create sequence seqLog;

commit;
rollback;
delete from tblCountry;


select * from tblCountry;
declare
    vcnt number;
    vname tblInsa.name%type;
begin
    select count(*) into vcnt from tblCountry;
    select name into vname from tblInsa where num = '1001';
    
    dbms_output.put_line(100/vcnt);
--exception
--    when others then
--        dbms_output.put_line('예외');
        
end;