show tables;

create table pwdKey(
	idx int not null auto_increment primary key,
	hKey varchar(30) not null
);
 

select * from pwdKey ;
insert into pwdKey values(default,'ABC123');
insert into pwdKey values(default,'A1B2C3');
insert into pwdKey values(default,'123ABC');

desc pwdKey;
select count(*) as cnt from pwdKey
select x'abcd1234';

select * from pwdKey;
select count(*) from pwdKey;

create table EncLogin(
	idx int not null auto_increment primary key,
	keyIdx int not null,
	id varchar(30) not null,
	encPwd varchar(100) not null,
	pwd varchar(50) not null
);


desc EncLogin;
