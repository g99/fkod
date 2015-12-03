create table movie (film_number varchar2(20), film_name varchar2(30), director varchar2(20), 
actor varchar2(20), rate varchar2(20), runtime number, price number, genre varchar2(20),
release_date date, end_date date, story varchar2(50), cut varchar2(50), trailer varchar2(100));


insert into movie(film_number, film_name, director, actor, rate, runtime, price, genre, release_date, end_date, story, cut, trailer) 
 values('a001', '마션', '리들리스콧', '맷데이먼', '12세','142','10000','SF', '2015/10/01', '2015/10/30', '화성에서 탈출하자', 'default.jpg', 'default.mp4' );