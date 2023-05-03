show tables;

create table board(
	idx int not null auto_increment primary key,	/* 게시글 고유 번호 */
	mid varchar(20) not null,		/*아이디*/
	nickName varchar(20) not null,	/* 닉네임 */
	title varchar(100) not null,	/*게시글 제목*/
	email varchar(50),				/*이메일 주소*/
	homePage varchar(50),			/*홈페이지 주소*/
	content text not null,			/*게시글 내용*/
	hostIp varchar(40) not null,	/*작성자 IP*/
	readNum int default 0,			/* 조회수 */
	openSw char(2) default 'OK',		/* 게시글 공개 여부 */
	wDate datetime default now(),	/* 글 올린 일자 */
	good int default 0				/*'좋아요' 클릭 횟수 */
);

insert into board values(default,'admin','관리자','게시판 서비스를 시작합니다.','gyuri@naver.com','gyuri.com','이곳은 게시판입니다.','192.168.50.87',default,default,default,default);


select * from board