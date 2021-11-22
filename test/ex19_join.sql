-- 고객 테이블
create table tblCustomer (
    seq number primary key,                 --고객번호(PK)
    name varchar2(30) not null,             --고객명
    tel varchar2(15) not null,              --연락처
    address varchar2(100) not null          --주소
    --sseq number null reference tblSales(seq)     --참조키(판매번호)
);

-- 판매내역 테이블
create table tblSales (
    seq number primary key,                         --판매번호(PK)
    item varchar2(50) not null,                     --제품명
    qty number not null,                            --수량
    regdate date default sysdate not null,          --판매날짜
    cseq number not null references tblCustomer(seq)       --고객번호(FK)
);

create table tblGenre (
    seq number primary key,                         --장르번호(PK)
    name varchar2(30) not null,                     --장르명
    price number not null,                          --대여가격
    period number not null                          --대여기간(일)
);

-- 비디오 테이블
create table tblVideo (
    seq number primary key,                         --비디오번호(PK)
    name varchar2(100) not null,                    --제목
    qty number not null,                            --보유 수량
    company varchar2(50) null,                      --제작사
    director varchar2(50) null,                     --감독
    major varchar2(50) null,                        --주연배우
    genre number not null references tblGenre(seq)  --장르(FK)
);

-- 고객 테이블
create table tblMember (
    seq number primary key,                         --회원번호(PK)
    name varchar2(30) not null,                     --회원명
    grade number(1) not null,                       --회원등급(1,2,3)
    byear number(4) not null,                       --생년
    tel varchar2(15) not null,                      --연락처
    address varchar2(300) null,                 --주소
    money number not null                           --예치금
);

-- 대여 테이블
create table tblRent (
    seq number primary key,                                 --대여번호(PK)
    member number not null references tblMember(seq),       --회원번호(FK)
    video number not null references tblVideo(seq),         --비디오번호(FK)
    rentdate date default sysdate not null,                 --대여시각
    retdate date null,                                      --반납시각
    remark varchar2(500) null                               --비고
);

create table tblStaff(
    seq number primary key,
    name varchar2(30) not null,
    salary number not null,
    address varchar2(300) not null,
    project varchar2(300) null
);




-- 장르 데이터
INSERT INTO tblGenre VALUES (1, '액션',1500,2);
INSERT INTO tblGenre VALUES (2, '에로',1000,1);
INSERT INTO tblGenre VALUES (3, '어린이',1000,3);
INSERT INTO tblGenre VALUES (4, '코미디',2000,2);
INSERT INTO tblGenre VALUES (5, '멜로',2000,1);
INSERT INTO tblGenre VALUES (6, '기타',1800,2);




-- 비디오 데이터
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (1, '영구와 땡칠이',5,'영구필름','심영래','땡칠이',3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (2, '어쭈구리',5,'에로 프로덕션','김감독','박에로',2);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (3, '털미네이터',3,'파라마운트','James','John',1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (4, '육복성',3,'대만영화사','홍군보','생룡',4);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (5, '뽀뽀할까요',6,'뽀뽀사','박감독','최지후',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (6, '우정과 영혼',2,'파라마운트','James','Mike',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (7, '주라기 유원지',1,NULL,NULL,NULL,1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (8, '타이거 킹',4,'Walt','Kebin','Tiger',3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (9, '텔미 에브리 딩',10,'영구필름','강감독','심으나',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (10, '동무',7,'부산필름','박감독','장동근',1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (11, '공동경쟁구역',2,'뽀뽀사','박감독','이병흔',1);




-- 회원 데이터
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (1, '김유신',1,1970,'123-4567','12-3번지 301호',10000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (2, '강감찬',1,1978,'111-1111','777-2번지 101호',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (3, '유관순',1,1978,'222-2222','86-9번지',20000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (4, '이율곡',1,1982,'333-3333',NULL,15000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (5, '신숙주',1,1988,'444-4444','조선 APT 1012호',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (6, '안중근',1,1981,'555-5555','대한빌라 102호',1000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (7, '윤봉길',1,1981,'666-6666','12-1번지',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (8, '이순신',1,1981,'777-7777',NULL,1500);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (9, '김부식',1,1981,'888-8888','73-6번지',-1000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (10, '박지원',1,1981,'999-9999','조선 APT 902호',1200);



-- 대여 데이터

INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (1, 1,1,'2007-01-01',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (2, 2,2,'2007-02-02','2001-02-03');
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (3, 3,3,'2007-02-03',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (4, 4,3,'2007-02-04','2001-02-08');
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (5, 5,5,'2007-02-05',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (6, 1,2,'2007-02-10',NULL);


insert into tblStaff(seq, name, salary, address, project)
    values (1, '홍길동', 300, '서울시', '홍콩 수출');
insert into tblStaff(seq, name, salary, address, project)
    values (2, '아무개', 250, '인천시', 'TV 광고');
insert into tblStaff(seq, name, salary, address, project)
    values (3, '하하하', 350, '의정부시', '매출 분석');

select * from tblStaff;

insert into tblStaff(seq, name, salary, address, project)
    values (4, '홍길동', 300, '서울시', '고객 관리');
insert into tblStaff(seq, name, salary, address, project)
    values (5, '호호호', 300, '서울시', '게시판 관리, 회원 응대');

update tblstaff set project = 'SNS 광고' 
where seq = (select seq from tblStaff where project = 'TV 광고');

drop table tblproject;

select * from tblstaff where project = 'TV 광고';

create table tblStaff(
    seq number primary key,
    name varchar2(30) not null,
    salary number not null,
    address varchar2(300) not null
);

create table tblProject(
    seq number primary key,
    project varchar2(300) null,
    staff_seq number not null
);


insert into tblStaff (seq, name, salary, address)
    values (1, '홍길동', 300, '서울시');

insert into tblStaff (seq, name, salary, address)
    values (2, '아무개', 250, '인천시');
    
insert into tblStaff (seq, name, salary, address)
    values (3, '아무개', 350, '의정부시');
    
insert into tblProject (seq, project, staff_seq)
    values (1, '홍콩 수출', 1);
    
insert into tblProject (seq, project, staff_seq)
    values (2, 'TV 광고', 2);
    
insert into tblProject (seq, project, staff_seq)
    values (3, '매출 분석', 1);
    
insert into tblProject (seq, project, staff_seq)
    values (4, '광고 관리', 3);
    
select * 
from (select c.seq, s.seq, c.name, s.item, s.qty 
      from tblCustomer c inner join tblSales s 
        on c.seq = s.cseq);
        
        
select * from tblGenre;
select * from tblVideo;

select v.name, g.price
from tblGenre g inner join tblVideo v on g.seq = v.genre;


select * from tblStaff;
select * from tblProject;

select s.name, p.project 
from tblStaff s inner join tblProject p 
    on s.seq = p.staff_seq;
    
select price from tblGenre;
select 
    name,
    (select price from tblGenre 
     where seq = tblVideo.genre) as price
from tblVideo;    


select 
    name,
    (select project from tblProject where staff_seq = s.seq)    
from tblStaff s;

select 
    (select name from tblStaff where seq = p.staff_seq) as name,
    project
from tblProject p;

select * from tblCustomer
    inner join tblGenre g
        on c.seq = g.seq;
        
select 
    m.name as mname,
    v.name as vname,
    r.rentdate,
    g.price
from tblGenre g inner join tblVideo v
    on g.seq = v.genre inner join tblRent r
        on v.seq = r.video inner join tblMember m
                on m.seq = r.member;
                    
select * from tblMember;

insert into tblCustomer values (4, '호호호', '010-1234-5678', '서울시');

select * from tblCustomer c inner join tblSales s on c.seq = s.cseq;

select * from tblSales;

select
    e.last_name||' '||e.first_name as name,
    j.job_title,
    d.department_name,
    l.city,
    c.country_name,
    r.region_name
from employees e
    inner join jobs j
     on e.job_id = j.job_id
        inner join departments d
            on d.department_id = e.department_id
                inner join locations l
                    on l.location_id = d.location_id
                        inner join countries c
                            on c.country_id = l.country_id
                                inner join regions r
                                    on r.region_id = c.region_id;
