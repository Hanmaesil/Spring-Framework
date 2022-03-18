-- 게시판 테이블 생성
-- number 대신 int!
-- auto_increment ->> 자동으로 1씩증가(시퀀스 안만들어도 됨!)
-- default now() ->> 현재 시간
create table tboard(
idx int not null auto_increment,
title varchar(1000) not null,
contents varchar(1000) not null,
count int not null default 0,
writer varchar(100) not null,
indate datetime not null default now(),
primary key(idx)
)

select * from tboard

insert into tboard(title, contents, writer)
values('게시판 테스트중!!','mysql 신박하네에에에에에', '한국사람');
insert into tboard(title, contents, writer)
values('와 내일 쉬는날이다아!!','하루종일 잘테다!', '쿨쿨쿨쿨');
insert into tboard(title, contents, writer)
values('오늘 저녁은 초밥이다','참치초밥!', '한국사람일까');
insert into tboard(title, contents, writer)
values('월요일 좋아~','라고 하는 사람들은 미친사람같아...', '스폰지밥');
insert into tboard(title, contents, writer)
values('망할 월화수목금금금','....', '랄라랄라라라');
insert into tboard(title, contents, writer)
values('잠이온다아..','부재중', '하하하하핳');

drop table tboard