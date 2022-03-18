-- 멤버테이블 생성

create table tmember(
id varchar(200) not null,
pw varchar(200) not null,
nick varchar(200) not null,
tel varchar(200) not null,
primary key(id)
)

select * from tmember
select * from tboard