show tables;

create table loginUser(
	idx  int not null auto_increment primary key,
	mid varchar(20),
	pwd varchar(30),
	name varchar(20),
	identiNum varchar(20),
	email varchar(20),
	phone varchar(20),
	address varchar(20)
);

insert into loginUser values(default,'admin','1234','관리자','11111-111111','admin@test.com','010-111-1111','청주');
insert into loginUser values(default,'test1','1234','테스트1','11111-111111','test1@test.com','010-222-2222','서울');
insert into loginUser values(default,'test2','1234','테스트2','11111-111111','test2@test.com','010-222-4444','부산');
insert into loginUser values(default,'test2','1234','테스트3','11111-111111','test3@test.com','010-222-3333','제주도');

select * from loginUser;
select * from loginUser where mid='admin' and pwd='1234';

