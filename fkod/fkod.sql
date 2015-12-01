<!-- system 스키마에서 수행 -->

create user movie identified by movie;
grant dba to movie;

<!-- movie 스키마로 이동한후 수행 -->

create table member(
	id varchar2(50),
	password varchar2(50),
	name varchar2(50),
	birth varchar2(50),
	gender varchar2(50),
	phone varchar2(50),
	addr varchar2(255),
	email varchar2(50),
	my_theater varchar2(100),
	regdate date,
	constraint member_pk primary key(id)
);

create table movie(
	film_number varchar2(50),
	film_name varchar2(50),
	director varchar2(50),
	actor varchar2(255),
	rate varchar2(50),
	runtime number,
	price number,
	country varchar2(50),
	genre varchar2(50),
	release_date date,
	end_date date,
	story varchar2(255),
	cut varchar2(255),
	trailer varchar2(255),
	constraint movie_pk primary key(film_number)
);


create table theater(
	theater_name varchar2(50),
	constraint theater_pk primary key(theater_name)
);

create table room(
	theater_name varchar2(50),
	room_name varchar2(50),
	seat_number number,
	constraint room_fk foreign key(theater_name)
		references theater(theater_name),
	constraint room_pk primary key(theater_name,room_name)
);

create table seat(
	theater_name varchar2(50),
	room_name varchar2(50),
	seat_number number,
	is_empty varchar2(10) check(is_empty in('false','true')),
	constraint seat_fk foreign key(theater_name,room_name)
		references room(theater_name,room_name),
	constraint seat_pk primary key(theater_name,room_name,seat_number)
);

create table theater_info(
	theater_name varchar2(50),
	room_name varchar2(50),
	start_time date,
	film_number varchar2(50),
	constraint theater_info_fk foreign key(theater_name,room_name)
		references room(theater_name,room_name),
	constraint theater_info_fk2 foreign key(film_number)
		references movie(film_number),
	constraint theater_info_pk primary key(theater_name,room_name,start_time)
);

create table ticket(
	ticket_number varchar2(50),
	id varchar2(50),
	film_number varchar2(50),
	theater_name varchar2(50),
	room_name varchar2(50),
	seat_number number,
	start_time date,
	ticket_date date,
	adult number,
	old_man number,
	teenager number,
	constraint ticket_fk foreign key(theater_name,room_name,start_time)
		references theater_info(theater_name,room_name,start_time),
	constraint ticket_fk2 foreign key(theater_name,room_name,seat_number)
		references seat(theater_name,room_name,seat_number),
	constraint ticket_fk3 foreign key(film_number)
		references movie(film_number),
	constraint ticket_fk4 foreign key(id)
		references member(id),
	constraint ticket_pk primary key(ticket_number)	
);

<!-- 테이블 더미값 입력 -->

insert into member values('choa','1','초아','90','여','010-1111-1111','서울특별시 강남구','choa@naver.com',null,sysdate);
insert into member values('hong','1','홍길동','44','남','010-2222-2222','서울특별시 동작구','hong@naver.com',null,sysdate-5);
insert into member values('yeon','1','태연','90','여','010-3333-3333','서울특별시 마포구','yeon@naver.com',null,sysdate-20);
insert into member values('bang','1','이방원','37','남','010-4444-4444','수원시 권선구','bang@naver.com',null,sysdate-150);
insert into member values('kim','1','김유신','55','남','010-5555-5555','서울특별시 구로구','kim@naver.com',null,sysdate-120);
insert into member values('jiwoo','1','지우','88','남','010-6666-6666','수원시 팔달구','jiwoo@naver.com',null,sysdate-35);
insert into member values('lux','1','럭스','78','여','010-7777-7777','수원시 호매실동','lux@naver.com',null,sysdate-27);
insert into member values('talon','1','탈론','94','남','010-8888-8888','부산시 해운대','talon@naver.com',null,sysdate-15);
insert into member values('zed','1','제드','90','남','010-9999-9999','부천시 원미구','zed@daum.net',null,sysdate);
insert into member values('shen','1','쉔','86','남','010-1010-1010','서울특별시 강서구','shen@daum.net',null,sysdate);
insert into member values('jonadan','1','조나단','80','남','010-1101-1101','서울특별시 강남구','jonadan@daum.net',null,sysdate-10);
insert into member values('jane','1','제인','90','여','010-1212-1212','서울특별시 강남구','jane@nate.com',null,sysdate-10);
insert into member values('iu','1','아이유','90','여','010-1313-1313','인천시 연수구','iu@nate.com',null,sysdate-25);
insert into member values('rise','1','라이즈','98','남','010-1414-1414','인천시 남동구','rise@lycos.com',null,sysdate-40);
insert into member values('fortune','1','미스포츈','93','여','010-1515-1515','인천시 남동구','fortune@lycos.com',null,sysdate-30);

insert into movie values('A001','내부자들','우민호','이병헌, 조승우, 백윤식','청소년 관람불가',130,10000,'한국','범죄, 드라마','2015/11/18','2015/12/18',null,null,null);
insert into movie values('A002','이터널 선샤인','미셸 공드리','짐 캐리, 케이트 윈슬렛, 커스틴 던스트, 마크 러팔로, 일라이저 우드','15세 이상',107,10000,'미국','로맨스, 멜로','2015/11/05','2015/12/05',null,null,null);
insert into movie values('A003','검은 사제들','장재현','김윤석, 강동원, 박소담','15세 이상',108,10000,'한국','미스터리, 드라마','2015/11/05','2015/12/05',null,null,null);
insert into movie values('A004','열정같은소리하고있네','정기훈','정재영, 박보영, 오달수, 진경, 배성우, 류현경, 류덕환, 윤균상','15세 이상',106,10000,'한국','드라마','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A005','괴물의 아이','호소다 마모루','야쿠쇼 코지, 미야자키 아오이, 소메타니 쇼타, 히로세 스즈, 오이즈미 요, 릴리 프랭키','12세 이상',119,10000,'일본','애니메이션, 어드벤처, 환타지','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A006','도리화가','이종필','류승룡, 배수지, 송새벽, 김남길, 이동휘, 안재홍','12세 이상',109,10000,'한국','드라마','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A007','헝거게임:더 파이널','프랜시스 로렌스','제니퍼 로렌스, 조쉬 허처슨, 리암 헴스워드, 니탈리 도머, 줄리안 무어, 필립 세이무어 호프만, 릴리 라베','15세 이상',137,10000,'미국','액션, 환타지','2015/11/18','2015/12/18',null,null,null);
insert into movie values('A008','크림슨 피크','길예르모 델 토로','톰 히들스턴, 제시카 차스테인, 미아 와시코브스카','청소년 관람불가',119,10000,'미국','스릴러, 환타지','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A009','007 스펙터','샘 멘데스','다니엘 크레이그, 레아 세이두, 크리스토프 왈츠, 모니카 벨루치','15세 이상',148,10000,'미국, 영국','스릴러, 환타지','2015/11/11','2015/12/11',null,null,null);
insert into movie values('A010','프리덤','피터 코센스','쿠바 구딩 주니어, 베르나르드 포처, 윌리암 새들러','12세 이상',95,10000,'미국','드라마','2015/11/19','2015/12/19',null,null,null);

insert into theater values('강남');
insert into theater values('영등포');
insert into theater values('구로');
insert into theater values('마포');
insert into theater values('동서울');
insert into theater values('동수원');
insert into theater values('부천');
insert into theater values('수원');
insert into theater values('군자');
insert into theater values('신도림');
insert into theater values('용산');
insert into theater values('인천');
insert into theater values('대전');
insert into theater values('해운대');
insert into theater values('제주');

insert into room values('강남','1관',90);
insert into room values('강남','2관',90);
insert into room values('강남','3관',85);
insert into room values('강남','4관',85);
insert into room values('강남','5관',75);
insert into room values('영등포','1관',150);
insert into room values('영등포','2관',160);
insert into room values('영등포','3관',350);
insert into room values('영등포','4관',140);
insert into room values('영등포','5관',150);
insert into room values('구로','1관',140);
insert into room values('구로','2관',140);
insert into room values('구로','3관',300);
insert into room values('구로','4관',300);
insert into room values('구로','5관',300);

insert into seat values('강남','1관',1,'false');
insert into seat values('강남','1관',2,'false');
insert into seat values('강남','1관',3,'false');
insert into seat values('강남','1관',4,'false');
insert into seat values('강남','1관',5,'false');
insert into seat values('강남','1관',6,'false');
insert into seat values('강남','1관',7,'false');
insert into seat values('강남','1관',8,'false');
insert into seat values('강남','1관',9,'false');
insert into seat values('강남','1관',10,'false');
insert into seat values('강남','1관',11,'false');
insert into seat values('강남','1관',12,'false');
insert into seat values('강남','1관',13,'false');
insert into seat values('강남','1관',14,'false');
insert into seat values('강남','1관',15,'false');
insert into seat values('강남','1관',16,'false');
insert into seat values('강남','1관',17,'false');
insert into seat values('강남','1관',18,'false');
insert into seat values('강남','1관',19,'false');
insert into seat values('강남','1관',20,'false');
insert into seat values('강남','1관',21,'false');
insert into seat values('강남','1관',22,'false');
insert into seat values('강남','1관',23,'false');
insert into seat values('강남','1관',24,'false');
insert into seat values('강남','1관',25,'false');
insert into seat values('강남','1관',26,'false');
insert into seat values('강남','1관',27,'false');
insert into seat values('강남','1관',28,'false');
insert into seat values('강남','1관',29,'false');
insert into seat values('강남','1관',30,'false');
insert into seat values('강남','1관',31,'false');
insert into seat values('강남','1관',32,'false');
insert into seat values('강남','1관',33,'false');
insert into seat values('강남','1관',34,'false');
insert into seat values('강남','1관',35,'false');
insert into seat values('강남','1관',36,'false');
insert into seat values('강남','1관',37,'false');
insert into seat values('강남','1관',38,'false');
insert into seat values('강남','1관',39,'false');
insert into seat values('강남','1관',40,'false');
insert into seat values('강남','1관',41,'false');
insert into seat values('강남','1관',42,'false');
insert into seat values('강남','1관',43,'false');
insert into seat values('강남','1관',44,'false');
insert into seat values('강남','1관',45,'false');
insert into seat values('강남','1관',46,'false');
insert into seat values('강남','1관',47,'false');
insert into seat values('강남','1관',48,'false');
insert into seat values('강남','1관',49,'false');
insert into seat values('강남','1관',50,'false');
insert into seat values('강남','1관',51,'false');
insert into seat values('강남','1관',52,'false');
insert into seat values('강남','1관',53,'false');
insert into seat values('강남','1관',54,'false');
insert into seat values('강남','1관',55,'false');
insert into seat values('강남','1관',56,'false');
insert into seat values('강남','1관',57,'false');
insert into seat values('강남','1관',58,'false');
insert into seat values('강남','1관',59,'false');
insert into seat values('강남','1관',60,'false');
insert into seat values('강남','1관',61,'false');
insert into seat values('강남','1관',62,'false');
insert into seat values('강남','1관',63,'false');
insert into seat values('강남','1관',64,'false');
insert into seat values('강남','1관',65,'false');
insert into seat values('강남','1관',66,'false');
insert into seat values('강남','1관',67,'false');
insert into seat values('강남','1관',68,'false');
insert into seat values('강남','1관',69,'false');
insert into seat values('강남','1관',70,'false');
insert into seat values('강남','1관',71,'false');
insert into seat values('강남','1관',72,'false');
insert into seat values('강남','1관',73,'false');
insert into seat values('강남','1관',74,'false');
insert into seat values('강남','1관',75,'false');
insert into seat values('강남','1관',76,'false');
insert into seat values('강남','1관',77,'false');
insert into seat values('강남','1관',78,'false');
insert into seat values('강남','1관',79,'false');
insert into seat values('강남','1관',80,'false');
insert into seat values('강남','1관',81,'false');
insert into seat values('강남','1관',82,'false');
insert into seat values('강남','1관',83,'false');
insert into seat values('강남','1관',84,'false');
insert into seat values('강남','1관',85,'false');
insert into seat values('강남','1관',86,'false');
insert into seat values('강남','1관',87,'false');
insert into seat values('강남','1관',88,'false');
insert into seat values('강남','1관',89,'false');
insert into seat values('강남','1관',90,'false');
insert into seat values('강남','2관',1,'false');
insert into seat values('강남','2관',2,'false');
insert into seat values('강남','2관',3,'false');
insert into seat values('강남','2관',4,'false');
insert into seat values('강남','2관',5,'false');
insert into seat values('강남','2관',6,'false');
insert into seat values('강남','2관',7,'false');
insert into seat values('강남','2관',8,'false');
insert into seat values('강남','2관',9,'false');
insert into seat values('강남','2관',10,'false');
insert into seat values('강남','2관',11,'false');
insert into seat values('강남','2관',12,'false');
insert into seat values('강남','2관',13,'false');
insert into seat values('강남','2관',14,'false');
insert into seat values('강남','2관',15,'false');
insert into seat values('강남','2관',16,'false');
insert into seat values('강남','2관',17,'false');
insert into seat values('강남','2관',18,'false');
insert into seat values('강남','2관',19,'false');
insert into seat values('강남','2관',20,'false');
insert into seat values('강남','2관',21,'false');
insert into seat values('강남','2관',22,'false');
insert into seat values('강남','2관',23,'false');
insert into seat values('강남','2관',24,'false');
insert into seat values('강남','2관',25,'false');
insert into seat values('강남','2관',26,'false');
insert into seat values('강남','2관',27,'false');
insert into seat values('강남','2관',28,'false');
insert into seat values('강남','2관',29,'false');
insert into seat values('강남','2관',30,'false');
insert into seat values('강남','2관',31,'false');
insert into seat values('강남','2관',32,'false');
insert into seat values('강남','2관',33,'false');
insert into seat values('강남','2관',34,'false');
insert into seat values('강남','2관',35,'false');
insert into seat values('강남','2관',36,'false');
insert into seat values('강남','2관',37,'false');
insert into seat values('강남','2관',38,'false');
insert into seat values('강남','2관',39,'false');
insert into seat values('강남','2관',40,'false');
insert into seat values('강남','2관',41,'false');
insert into seat values('강남','2관',42,'false');
insert into seat values('강남','2관',43,'false');
insert into seat values('강남','2관',44,'false');
insert into seat values('강남','2관',45,'false');
insert into seat values('강남','2관',46,'false');
insert into seat values('강남','2관',47,'false');
insert into seat values('강남','2관',48,'false');
insert into seat values('강남','2관',49,'false');
insert into seat values('강남','2관',50,'false');
insert into seat values('강남','2관',51,'false');
insert into seat values('강남','2관',52,'false');
insert into seat values('강남','2관',53,'false');
insert into seat values('강남','2관',54,'false');
insert into seat values('강남','2관',55,'false');
insert into seat values('강남','2관',56,'false');
insert into seat values('강남','2관',57,'false');
insert into seat values('강남','2관',58,'false');
insert into seat values('강남','2관',59,'false');
insert into seat values('강남','2관',60,'false');
insert into seat values('강남','2관',61,'false');
insert into seat values('강남','2관',62,'false');
insert into seat values('강남','2관',63,'false');
insert into seat values('강남','2관',64,'false');
insert into seat values('강남','2관',65,'false');
insert into seat values('강남','2관',66,'false');
insert into seat values('강남','2관',67,'false');
insert into seat values('강남','2관',68,'false');
insert into seat values('강남','2관',69,'false');
insert into seat values('강남','2관',70,'false');
insert into seat values('강남','2관',71,'false');
insert into seat values('강남','2관',72,'false');
insert into seat values('강남','2관',73,'false');
insert into seat values('강남','2관',74,'false');
insert into seat values('강남','2관',75,'false');
insert into seat values('강남','2관',76,'false');
insert into seat values('강남','2관',77,'false');
insert into seat values('강남','2관',78,'false');
insert into seat values('강남','2관',79,'false');
insert into seat values('강남','2관',80,'false');
insert into seat values('강남','2관',81,'false');
insert into seat values('강남','2관',82,'false');
insert into seat values('강남','2관',83,'false');
insert into seat values('강남','2관',84,'false');
insert into seat values('강남','2관',85,'false');
insert into seat values('강남','2관',86,'false');
insert into seat values('강남','2관',87,'false');
insert into seat values('강남','2관',88,'false');
insert into seat values('강남','2관',89,'false');
insert into seat values('강남','2관',90,'false');
insert into seat values('강남','3관',1,'false');
insert into seat values('강남','3관',2,'false');
insert into seat values('강남','3관',3,'false');
insert into seat values('강남','3관',4,'false');
insert into seat values('강남','3관',5,'false');
insert into seat values('강남','3관',6,'false');
insert into seat values('강남','3관',7,'false');
insert into seat values('강남','3관',8,'false');
insert into seat values('강남','3관',9,'false');
insert into seat values('강남','3관',10,'false');
insert into seat values('강남','3관',11,'false');
insert into seat values('강남','3관',12,'false');
insert into seat values('강남','3관',13,'false');
insert into seat values('강남','3관',14,'false');
insert into seat values('강남','3관',15,'false');
insert into seat values('강남','3관',16,'false');
insert into seat values('강남','3관',17,'false');
insert into seat values('강남','3관',18,'false');
insert into seat values('강남','3관',19,'false');
insert into seat values('강남','3관',20,'false');
insert into seat values('강남','3관',21,'false');
insert into seat values('강남','3관',22,'false');
insert into seat values('강남','3관',23,'false');
insert into seat values('강남','3관',24,'false');
insert into seat values('강남','3관',25,'false');
insert into seat values('강남','3관',26,'false');
insert into seat values('강남','3관',27,'false');
insert into seat values('강남','3관',28,'false');
insert into seat values('강남','3관',29,'false');
insert into seat values('강남','3관',30,'false');
insert into seat values('강남','3관',31,'false');
insert into seat values('강남','3관',32,'false');
insert into seat values('강남','3관',33,'false');
insert into seat values('강남','3관',34,'false');
insert into seat values('강남','3관',35,'false');
insert into seat values('강남','3관',36,'false');
insert into seat values('강남','3관',37,'false');
insert into seat values('강남','3관',38,'false');
insert into seat values('강남','3관',39,'false');
insert into seat values('강남','3관',40,'false');
insert into seat values('강남','3관',41,'false');
insert into seat values('강남','3관',42,'false');
insert into seat values('강남','3관',43,'false');
insert into seat values('강남','3관',44,'false');
insert into seat values('강남','3관',45,'false');
insert into seat values('강남','3관',46,'false');
insert into seat values('강남','3관',47,'false');
insert into seat values('강남','3관',48,'false');
insert into seat values('강남','3관',49,'false');
insert into seat values('강남','3관',50,'false');
insert into seat values('강남','3관',51,'false');
insert into seat values('강남','3관',52,'false');
insert into seat values('강남','3관',53,'false');
insert into seat values('강남','3관',54,'false');
insert into seat values('강남','3관',55,'false');
insert into seat values('강남','3관',56,'false');
insert into seat values('강남','3관',57,'false');
insert into seat values('강남','3관',58,'false');
insert into seat values('강남','3관',59,'false');
insert into seat values('강남','3관',60,'false');
insert into seat values('강남','3관',61,'false');
insert into seat values('강남','3관',62,'false');
insert into seat values('강남','3관',63,'false');
insert into seat values('강남','3관',64,'false');
insert into seat values('강남','3관',65,'false');
insert into seat values('강남','3관',66,'false');
insert into seat values('강남','3관',67,'false');
insert into seat values('강남','3관',68,'false');
insert into seat values('강남','3관',69,'false');
insert into seat values('강남','3관',70,'false');
insert into seat values('강남','3관',71,'false');
insert into seat values('강남','3관',72,'false');
insert into seat values('강남','3관',73,'false');
insert into seat values('강남','3관',74,'false');
insert into seat values('강남','3관',75,'false');
insert into seat values('강남','3관',76,'false');
insert into seat values('강남','3관',77,'false');
insert into seat values('강남','3관',78,'false');
insert into seat values('강남','3관',79,'false');
insert into seat values('강남','3관',80,'false');
insert into seat values('강남','3관',81,'false');
insert into seat values('강남','3관',82,'false');
insert into seat values('강남','3관',83,'false');
insert into seat values('강남','3관',84,'false');
insert into seat values('강남','3관',85,'false');
insert into seat values('강남','4관',1,'false');
insert into seat values('강남','4관',2,'false');
insert into seat values('강남','4관',3,'false');
insert into seat values('강남','4관',4,'false');
insert into seat values('강남','4관',5,'false');
insert into seat values('강남','4관',6,'false');
insert into seat values('강남','4관',7,'false');
insert into seat values('강남','4관',8,'false');
insert into seat values('강남','4관',9,'false');
insert into seat values('강남','4관',10,'false');
insert into seat values('강남','4관',11,'false');
insert into seat values('강남','4관',12,'false');
insert into seat values('강남','4관',13,'false');
insert into seat values('강남','4관',14,'false');
insert into seat values('강남','4관',15,'false');
insert into seat values('강남','4관',16,'false');
insert into seat values('강남','4관',17,'false');
insert into seat values('강남','4관',18,'false');
insert into seat values('강남','4관',19,'false');
insert into seat values('강남','4관',20,'false');
insert into seat values('강남','4관',21,'false');
insert into seat values('강남','4관',22,'false');
insert into seat values('강남','4관',23,'false');
insert into seat values('강남','4관',24,'false');
insert into seat values('강남','4관',25,'false');
insert into seat values('강남','4관',26,'false');
insert into seat values('강남','4관',27,'false');
insert into seat values('강남','4관',28,'false');
insert into seat values('강남','4관',29,'false');
insert into seat values('강남','4관',30,'false');
insert into seat values('강남','4관',31,'false');
insert into seat values('강남','4관',32,'false');
insert into seat values('강남','4관',33,'false');
insert into seat values('강남','4관',34,'false');
insert into seat values('강남','4관',35,'false');
insert into seat values('강남','4관',36,'false');
insert into seat values('강남','4관',37,'false');
insert into seat values('강남','4관',38,'false');
insert into seat values('강남','4관',39,'false');
insert into seat values('강남','4관',40,'false');
insert into seat values('강남','4관',41,'false');
insert into seat values('강남','4관',42,'false');
insert into seat values('강남','4관',43,'false');
insert into seat values('강남','4관',44,'false');
insert into seat values('강남','4관',45,'false');
insert into seat values('강남','4관',46,'false');
insert into seat values('강남','4관',47,'false');
insert into seat values('강남','4관',48,'false');
insert into seat values('강남','4관',49,'false');
insert into seat values('강남','4관',50,'false');
insert into seat values('강남','4관',51,'false');
insert into seat values('강남','4관',52,'false');
insert into seat values('강남','4관',53,'false');
insert into seat values('강남','4관',54,'false');
insert into seat values('강남','4관',55,'false');
insert into seat values('강남','4관',56,'false');
insert into seat values('강남','4관',57,'false');
insert into seat values('강남','4관',58,'false');
insert into seat values('강남','4관',59,'false');
insert into seat values('강남','4관',60,'false');
insert into seat values('강남','4관',61,'false');
insert into seat values('강남','4관',62,'false');
insert into seat values('강남','4관',63,'false');
insert into seat values('강남','4관',64,'false');
insert into seat values('강남','4관',65,'false');
insert into seat values('강남','4관',66,'false');
insert into seat values('강남','4관',67,'false');
insert into seat values('강남','4관',68,'false');
insert into seat values('강남','4관',69,'false');
insert into seat values('강남','4관',70,'false');
insert into seat values('강남','4관',71,'false');
insert into seat values('강남','4관',72,'false');
insert into seat values('강남','4관',73,'false');
insert into seat values('강남','4관',74,'false');
insert into seat values('강남','4관',75,'false');
insert into seat values('강남','4관',76,'false');
insert into seat values('강남','4관',77,'false');
insert into seat values('강남','4관',78,'false');
insert into seat values('강남','4관',79,'false');
insert into seat values('강남','4관',80,'false');
insert into seat values('강남','4관',81,'false');
insert into seat values('강남','4관',82,'false');
insert into seat values('강남','4관',83,'false');
insert into seat values('강남','4관',84,'false');
insert into seat values('강남','4관',85,'false');
insert into seat values('강남','5관',1,'false');
insert into seat values('강남','5관',2,'false');
insert into seat values('강남','5관',3,'false');
insert into seat values('강남','5관',4,'false');
insert into seat values('강남','5관',5,'false');
insert into seat values('강남','5관',6,'false');
insert into seat values('강남','5관',7,'false');
insert into seat values('강남','5관',8,'false');
insert into seat values('강남','5관',9,'false');
insert into seat values('강남','5관',10,'false');
insert into seat values('강남','5관',11,'false');
insert into seat values('강남','5관',12,'false');
insert into seat values('강남','5관',13,'false');
insert into seat values('강남','5관',14,'false');
insert into seat values('강남','5관',15,'false');
insert into seat values('강남','5관',16,'false');
insert into seat values('강남','5관',17,'false');
insert into seat values('강남','5관',18,'false');
insert into seat values('강남','5관',19,'false');
insert into seat values('강남','5관',20,'false');
insert into seat values('강남','5관',21,'false');
insert into seat values('강남','5관',22,'false');
insert into seat values('강남','5관',23,'false');
insert into seat values('강남','5관',24,'false');
insert into seat values('강남','5관',25,'false');
insert into seat values('강남','5관',26,'false');
insert into seat values('강남','5관',27,'false');
insert into seat values('강남','5관',28,'false');
insert into seat values('강남','5관',29,'false');
insert into seat values('강남','5관',30,'false');
insert into seat values('강남','5관',31,'false');
insert into seat values('강남','5관',32,'false');
insert into seat values('강남','5관',33,'false');
insert into seat values('강남','5관',34,'false');
insert into seat values('강남','5관',35,'false');
insert into seat values('강남','5관',36,'false');
insert into seat values('강남','5관',37,'false');
insert into seat values('강남','5관',38,'false');
insert into seat values('강남','5관',39,'false');
insert into seat values('강남','5관',40,'false');
insert into seat values('강남','5관',41,'false');
insert into seat values('강남','5관',42,'false');
insert into seat values('강남','5관',43,'false');
insert into seat values('강남','5관',44,'false');
insert into seat values('강남','5관',45,'false');
insert into seat values('강남','5관',46,'false');
insert into seat values('강남','5관',47,'false');
insert into seat values('강남','5관',48,'false');
insert into seat values('강남','5관',49,'false');
insert into seat values('강남','5관',50,'false');
insert into seat values('강남','5관',51,'false');
insert into seat values('강남','5관',52,'false');
insert into seat values('강남','5관',53,'false');
insert into seat values('강남','5관',54,'false');
insert into seat values('강남','5관',55,'false');
insert into seat values('강남','5관',56,'false');
insert into seat values('강남','5관',57,'false');
insert into seat values('강남','5관',58,'false');
insert into seat values('강남','5관',59,'false');
insert into seat values('강남','5관',60,'false');
insert into seat values('강남','5관',61,'false');
insert into seat values('강남','5관',62,'false');
insert into seat values('강남','5관',63,'false');
insert into seat values('강남','5관',64,'false');
insert into seat values('강남','5관',65,'false');
insert into seat values('강남','5관',66,'false');
insert into seat values('강남','5관',67,'false');
insert into seat values('강남','5관',68,'false');
insert into seat values('강남','5관',69,'false');
insert into seat values('강남','5관',70,'false');
insert into seat values('강남','5관',71,'false');
insert into seat values('강남','5관',72,'false');
insert into seat values('강남','5관',73,'false');
insert into seat values('강남','5관',74,'false');
insert into seat values('강남','5관',75,'false');

<!-- alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS'; 시간조회는 해당명령이 필요 -->
insert into theater_info values('강남','1관',TO_DATE('2015/11/18 09:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','1관',TO_DATE('2015/11/18 12:20:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','1관',TO_DATE('2015/11/18 15:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','1관',TO_DATE('2015/11/18 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A003');
insert into theater_info values('강남','1관',TO_DATE('2015/11/18 21:20:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/18 09:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','2관',TO_DATE('2015/11/18 12:00:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','2관',TO_DATE('2015/11/18 15:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/18 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','2관',TO_DATE('2015/11/18 21:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','3관',TO_DATE('2015/11/18 08:40:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','3관',TO_DATE('2015/11/18 11:40:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','3관',TO_DATE('2015/11/18 14:20:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','3관',TO_DATE('2015/11/18 17:50:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','3관',TO_DATE('2015/11/18 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A010');
insert into theater_info values('강남','4관',TO_DATE('2015/11/18 10:40:00','yyyy/mm/dd hh24:mi:ss'),'A009');
insert into theater_info values('강남','4관',TO_DATE('2015/11/18 12:40:00','yyyy/mm/dd hh24:mi:ss'),'A008');
insert into theater_info values('강남','4관',TO_DATE('2015/11/18 16:20:00','yyyy/mm/dd hh24:mi:ss'),'A007');
insert into theater_info values('강남','4관',TO_DATE('2015/11/18 20:50:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','4관',TO_DATE('2015/11/18 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A006');
insert into theater_info values('강남','5관',TO_DATE('2015/11/18 12:40:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','5관',TO_DATE('2015/11/18 15:40:00','yyyy/mm/dd hh24:mi:ss'),'A003');
insert into theater_info values('강남','5관',TO_DATE('2015/11/18 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','5관',TO_DATE('2015/11/18 21:00:00','yyyy/mm/dd hh24:mi:ss'),'A006');
insert into theater_info values('강남','5관',TO_DATE('2015/11/18 23:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');

insert into theater_info values('강남','1관',TO_DATE('2015/11/19 09:40:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','1관',TO_DATE('2015/11/19 12:20:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','1관',TO_DATE('2015/11/19 15:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','1관',TO_DATE('2015/11/19 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','1관',TO_DATE('2015/11/19 21:20:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','2관',TO_DATE('2015/11/19 09:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/19 12:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/19 15:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/19 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A003');
insert into theater_info values('강남','2관',TO_DATE('2015/11/19 21:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','3관',TO_DATE('2015/11/19 08:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','3관',TO_DATE('2015/11/19 11:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','3관',TO_DATE('2015/11/19 14:20:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','3관',TO_DATE('2015/11/19 17:50:00','yyyy/mm/dd hh24:mi:ss'),'A006');
insert into theater_info values('강남','3관',TO_DATE('2015/11/19 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A010');
insert into theater_info values('강남','4관',TO_DATE('2015/11/19 10:40:00','yyyy/mm/dd hh24:mi:ss'),'A009');
insert into theater_info values('강남','4관',TO_DATE('2015/11/19 12:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','4관',TO_DATE('2015/11/19 16:20:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','4관',TO_DATE('2015/11/19 20:50:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','4관',TO_DATE('2015/11/19 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','5관',TO_DATE('2015/11/19 12:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','5관',TO_DATE('2015/11/19 15:40:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','5관',TO_DATE('2015/11/19 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','5관',TO_DATE('2015/11/19 21:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','5관',TO_DATE('2015/11/19 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A005');

insert into theater_info values('강남','1관',TO_DATE('2015/11/20 09:40:00','yyyy/mm/dd hh24:mi:ss'),'A003');
insert into theater_info values('강남','1관',TO_DATE('2015/11/20 12:20:00','yyyy/mm/dd hh24:mi:ss'),'A003');
insert into theater_info values('강남','1관',TO_DATE('2015/11/20 15:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','1관',TO_DATE('2015/11/20 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','1관',TO_DATE('2015/11/20 21:20:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/20 09:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/20 12:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/20 15:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','2관',TO_DATE('2015/11/20 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','2관',TO_DATE('2015/11/20 21:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','3관',TO_DATE('2015/11/20 08:40:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','3관',TO_DATE('2015/11/20 11:40:00','yyyy/mm/dd hh24:mi:ss'),'A006');
insert into theater_info values('강남','3관',TO_DATE('2015/11/20 14:20:00','yyyy/mm/dd hh24:mi:ss'),'A005');
insert into theater_info values('강남','3관',TO_DATE('2015/11/20 17:50:00','yyyy/mm/dd hh24:mi:ss'),'A007');
insert into theater_info values('강남','3관',TO_DATE('2015/11/20 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A007');
insert into theater_info values('강남','4관',TO_DATE('2015/11/20 10:40:00','yyyy/mm/dd hh24:mi:ss'),'A008');
insert into theater_info values('강남','4관',TO_DATE('2015/11/20 12:40:00','yyyy/mm/dd hh24:mi:ss'),'A009');
insert into theater_info values('강남','4관',TO_DATE('2015/11/20 16:20:00','yyyy/mm/dd hh24:mi:ss'),'A008');
insert into theater_info values('강남','4관',TO_DATE('2015/11/20 20:50:00','yyyy/mm/dd hh24:mi:ss'),'A010');
insert into theater_info values('강남','4관',TO_DATE('2015/11/20 23:30:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','5관',TO_DATE('2015/11/20 12:40:00','yyyy/mm/dd hh24:mi:ss'),'A001');
insert into theater_info values('강남','5관',TO_DATE('2015/11/20 15:40:00','yyyy/mm/dd hh24:mi:ss'),'A010');
insert into theater_info values('강남','5관',TO_DATE('2015/11/20 18:00:00','yyyy/mm/dd hh24:mi:ss'),'A002');
insert into theater_info values('강남','5관',TO_DATE('2015/11/20 21:00:00','yyyy/mm/dd hh24:mi:ss'),'A004');
insert into theater_info values('강남','5관',TO_DATE('2015/11/20 23:00:00','yyyy/mm/dd hh24:mi:ss'),'A001');

insert into ticket values('R001','choa','A001','강남','1관',10,);


