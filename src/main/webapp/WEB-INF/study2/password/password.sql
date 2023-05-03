show tables;

create table pwdKey(
	idx int not null auto_increment primary key,
	hKey varchar(30) not null
);
 
drop table pwdKey;
select * from pwdKey ;
insert into pwdKey values(default,0x1234A);
insert into pwdKey values(default,0xabcd1234);
insert into pwdKey values(default,0xaaaaa);
insert into pwdKey values(default,0xa1234aaa);
desc pwdKey;
select count(*) as cnt from pwdKey
select x'abcd1234';

select * from pwdKey;
select count(*) from pwdKey;

create table EncLogin(
	idx int not null auto_increment primary key,
	keyIdx int not null,
	id varchar(30) not null,
	pwd varchar(100) not null
);


desc EncLogin;
