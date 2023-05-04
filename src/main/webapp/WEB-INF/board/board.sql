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

/* 날짜함수 처리 연습 */

select now();
select year(now());
select month(now());
select day(now());

select concat(year(now()),'년',month(now()),'월',day(now()),'일') as today;

select date(now()) /*날짜를 년-월-일로 출력*/

select weekday(now()); /*0:월 1:화 ...... 6:일*/
select dayofweek(now()); 

select year('2023-05-03');

select idx, year(wDate) from board;

/* 날짜 연산 */

/*date_add(date, interval 값 Type)*/

select date_add(now(), interval 1 day); /*오늘 날짜 + 1 --> 내일 날짜 */
/*오늘 날짜 - 1 --> 어제 날짜 */
select date_add(now(), interval -1 day); 
/* 오늘 날짜보다 +10시간 이후의 날짜 시간 출력 */
select now() ,date_add(now(), interval 10 day_hour); 
select now() ,date_add(now(), interval -10 day_hour); 



/* date_sub(date, interval 값 Type) */
/*오늘 날짜 + 1 --> 어제 날짜 */
select date_sub(now(), interval 1 day);
/*오늘 날짜 - 1 --> 내일 날짜 */
select date_sub(now(), interval -1 day);

/* board 테이블에 적용 */
/* 게시글중에서 하루전에 올라온 글만 보여주세요 */

select * from board where substring((wDate),1,10) = substring((date_add(now(), interval 0 day)),1,10);


/* 날짜 차이 계산 */
select datediff(now(),'2023-05-01');
select idx , wDate,datediff(now(),wDate)from board;

select idx , wDate,datediff(now(),wDate)from board;

select idx, wDate,TIMESTAMPDIFF(hour,wDate,now()) from board where wDate >= date_add(now(), interval -24 day_hour);

select *,TIMESTAMPDIFF(hour,wDate,now()) as hour_diff from board order by idx desc;
select *,TIMESTAMPDIFF(hour,wDate,now()) as hour_diff,datediff(wDate,now()) as day_diff from board order by idx desc;

/* Date 포맷 : date_format() :  년:%Y(4자리) 월:%M 일:%d */

select *,date_format(wDate,'%Y-%m-%d %H:%i') as date_format ,TIMESTAMPDIFF(hour,wDate,now()) as hour_diff from board;







