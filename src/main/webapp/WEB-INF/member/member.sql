show tables;

create table member(
	idx 	int not null auto_increment,		/* 고유 번호*/
	mid 	varchar(20) not null,				/* 회원 아이디(중복 불허) */
	pwd 	varchar(100) not null,				/* 회원 비밀번호(SHA256) */
	nickName varchar(20) not null,				/* 회원 별명(수정가능) */
	name 	varchar(20) not null,				/* 회원 이름 */
	gender 	varchar(4) default '남자', 			/* 회원 성별 */
	birthday datetime default now(), 			/* 회원 생일 */
	tel		varchar(15),						/* 전화번호 */
	address varchar(100),						/*주소 (다음API 우편번호 활용)*/
	email	varchar(50) not null,				/* 이메일(아이디 / 비밀번호 분실시 사용)-형식 체크 필수 */
	homePage varchar(50),						/* 홈페이지(블로그 등) */
	job		varchar(20),						/* 직업 */
	hobby	varchar(100),						/* 취미(2개이상 선택 가능 구분자 '/') */
	photo	varchar(100), default 'noimage.jpg', /* 회원 사진 */
	content text,								/* 자기소개 */
	userInfor char(6) default '공개',			/*회원정보 공개 여부(공개/비공개)*/
	userDel	char(2) default 'NO'				/* 회원 탈퇴 여부(NO:활동중 OK:탈퇴 신청중 */
	point	int default 100,					/* 회원 누적 포인트(가입포인트:100 증정 / 1회 방문시 10포인프(최대 5번 가능)) */
	level	int default	1,						/* 0:관리자, 1:준회원, 2:정회원, 3:우수회원, (4:운영자) */
	visitCnt int default 0,						/* 가입 후 총 방문횟수 */
	startDate datetime default now(),			/* 최초 가입일 */
	lastDate datetime default now(),			/* 마지막 접속일 */
	todayCnt int default 0,						/* 오늘 방문 횟수 */
	primary key(idx,mid)
);
create table member(
	idx 	int not null auto_increment,		
	mid 	varchar(20) not null,				
	pwd 	varchar(100) not null,				
	nickName varchar(20) not null,				
	name 	varchar(20) not null,				
	gender 	varchar(4) default '남자', 			
	birthday datetime default now(), 			
	tel		varchar(15),						
	address varchar(100),						
	email	varchar(50) not null,				
	homePage varchar(50),						
	job		varchar(20),						
	hobby	varchar(100),						
	photo	varchar(100) default 'noimage.jpg', 
	content text,								
	userInfor char(6) default '공개',			
	userDel	char(2) default 'NO',				
	point	int default 100,					
	level	int default	1,						
	visitCnt int default 0,						
	startDate datetime default now(),			
	lastDate datetime default now(),			
	todayCnt int default 0,						
	primary key(idx,mid)
);

desc member;