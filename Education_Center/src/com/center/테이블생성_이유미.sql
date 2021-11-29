create table tblRoom
(
	room_seq number,
	room_name varchar2(20) not null,
	room_capacity number not null
);

create sequence room_seq;

alter table tblRoom
    add constraint tblr_room_seq_pk primary key(room_seq);
    
alter table tblRoom
    add constraint tblr_room_capacity_ck check(room_capacity in (26,30));

create table tblOpenSubject
(
	os_seq number,
	subject_seq number not null,
	oc_seq number not null,
	os_startdate date default sysdate not null,
	os_enddate date not null
);

create sequence os_seq;

alter table tblOpenSubject
    add constraint tblos_os_seq_pk primary key(os_seq);

alter table tblOpenSubject
    add constraint tblos_subject_seq_fk foreign key(subject_seq) references tblSubject(subject_seq);

create table tblSubject
(
	subject_seq number,
	subject_name varchar2(60) not null,
	subject_period number not null
);

create sequence subject_seq;

alter table tblSubject
    add constraint tbls_subject_seq_pk primary key(subject_seq);

create table tblBook
(
	book_seq number,
	book_nmae varchar2(100) not null,
	book_publisher varchar2(50) not null,
	book_price number null,
	subject_seq number not null
);

create sequence book_seq;

alter table tblBook
    add constraint tblb_book_seq_pk primary key(book_seq);

alter table tblBook
    add constraint tblb_subject_seq_fk foreign key(subject_seq) references tblSubject(subject_seq);

create table tblTest
(
	test_seq number,
	test_file varchar2(300) null,
	os_seq number not null,
	test_type varchar2(6) not null,
	test_date date default sysdate not null
);

create sequence test_seq;

alter table tblTest
    add constraint tqlt_test_seq_pk primary key(test_seq);

alter table tblTest
    add constraint tqlt_os_seq_fk foreign key(os_seq) references tblOpenSubject(os_seq);
    
alter table tblTest
    add constraint tqlt_test_file_uq unique(test_file);
    
alter table tblTest
    add constraint tqlt_test_type_ck check (test_type in ('필기','실기'));

create table tblScorePercent
(
	os_seq number,
	sp_seq number not null,
	exam_per number default 40 not null,
	skill_per number default 40 not null,
	attendance_per number default 20 not null
);

alter table tblScorePercent
    add constraint tqlsp_os_seq_pk primary key(os_seq);

alter table tblScorePercent
    add constraint tqlsp_os_seq_fk foreign key(os_seq) references tblOpenSubject(os_seq);

alter table tblScorePercent
    add constraint tqlsp_sp_seq_fk foreign key(sp_seq) references tblScore(sp_seq);
    
alter table tblScorePercent
    add constraint tqlsp_sp_seq_uq unique(sp_seq);
    
alter table tblScorePercent
    add constraint tqlsp_att_per_ck check(attendance_per >= 20);
