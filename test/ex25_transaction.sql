

create table tblTrans
as
select name, buseo, jikwi from tblInsa where city = '서울';

select * from tblTrans;

delete from tblTrans where name = '한석봉';
delete from tblTrans where name = '김인수';

rollback;


commit;

select * from tblTrans;
insert into tblTrans values ('가가가', '영업부', '부장');
insert into tblTrans values ('나나나', '영업부', '과장');

savepoint a;
delete from tblTrans where name = '가가가';

savepoint b;

delete from tblTrans where name = '나나나';


rollback to a;