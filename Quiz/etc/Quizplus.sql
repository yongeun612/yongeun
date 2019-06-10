create table blog(
    blog_idx number primary key, -- 인덱스
    blog_name varchar2(20),      -- 이름
    blog_id varchar2(20),        -- 아이디
    blog_pw varchar2(20),        -- 패스워드
    blog_email varchar2(40)      -- 이메일주소
);

create table board(
    board_idx number primary key,     -- 게시글의 인덱스
    board_title varchar2(40),         -- 게시글 제목
    board_content varchar2(400),      -- 게시글 내용
    board_writer varchar2(20),        -- 게시글 작성자
    board_date date DEFAULT SYSDATE,  -- 오늘 날짜
    board_cnt number                  -- 조회수
);

create table quiz( --선택형 퀴즈
    quiz_idx number primary key, -- 인덱스
    quiz_question varchar2(100), -- 문제
    quiz_answer varchar2(20),    -- 정답
    quiz_btn1 varchar2(20),      -- 선택1
    quiz_btn2 varchar2(20),      -- 선택2
    quiz_btn3 varchar2(20),      -- 선택3
    quiz_btn4 varchar2(20)       -- 선택4
);

create table oxquiz(
    oxquiz_idx number primary key,  -- 인덱스
    oxquiz_question varchar2(100),  -- 문제
    oxquiz_answer varchar2(10)      -- 정답
);

create table quizrank(
  rank_idx number primary key,        -- 인덱스
  rank_user varchar2(40),             -- 유저아이디
  rank_select_score number default 0, -- 선택형퀴즈 점수
  rank_ox_score number default 0      -- OX퀴즈 점수
);

create sequence seq_blog_idx increment by 1 start with 1;
create sequence seq_board_idx increment by 1 start with 1; 
create sequence seq_quiz_idx increment by 1 start with 1;
create sequence seq_rank_idx increment by 1 start with 1;
create sequence seq_oxquiz_idx increment by 1 start with 1;

insert into oxquiz values(seq_oxquiz_idx.nextval,'자메이카의 수도는 킹스턴이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'일본의 수도는 오사카이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'독일의 수도는 베를린이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'루마니아의 수도는 부쿠레슈티이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'베트남의 수도는 하노이이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'필리핀의 수도는 세부이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'불가리아의 수도는 세피아이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'멕시코의 수도는 칸쿤이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'알제리의 수도는 알제이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'태국의 수도는 방콕이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'러시아의 수도는 카잔이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'브라질의 수도는 브라질리아이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'세르비아의 수도는 베오그라드이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'이집트의 수도는 아스완이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'콜롬비아의 수도는 보고타이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'프랑스의 수도는 파리다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'영국의 수도는 런던이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'라오스의 수도는 팍세이다','X');
insert into oxquiz values(seq_oxquiz_idx.nextval,'아르헨티나의 수도는 부에노스아이레스이다','O');
insert into oxquiz values(seq_oxquiz_idx.nextval,'대한민국의 수도는 여수이다','X');


insert into quiz values(seq_quiz_idx.nextVal,'대한민국의 수도는?','서울','부산','속초','서울','여수');
insert into quiz values(seq_quiz_idx.nextVal,'독일의 수도는?','베를린','뮌헨','베를린','함부르크','쾰른');
insert into quiz values(seq_quiz_idx.nextVal,'라오스의 수도는?','비엔티안','방비엥','루앙프라방','비엔티안','팍세');
insert into quiz values(seq_quiz_idx.nextVal,'루마니아의 수도는?','부쿠레슈티','부쿠레슈티','브라소브','티미쇼아라','이아시');
insert into quiz values(seq_quiz_idx.nextVal,'러시아의 수도는?','모스크바','카잔','모스크바','블라디보스톡','상트페테르');
insert into quiz values(seq_quiz_idx.nextVal,'베트남의 수도는?','하노이','호치민','하노이','다낭','후에');
insert into quiz values(seq_quiz_idx.nextVal,'브라질의 수도는?','브라질리아','브라질리아','상파울로','마나우스','살바도르');
insert into quiz values(seq_quiz_idx.nextVal,'세르비아의 수도는?','베오그라드','스메데레보','니슈','노비사드','베오그라드');
insert into quiz values(seq_quiz_idx.nextVal,'인도의 수도는?','뉴델리','뭄바이','캘커타','첸나이','뉴델리');
insert into quiz values(seq_quiz_idx.nextVal,'영국의 수도는?','런던','런던','멘체스터','옥스퍼드','에든버러');
insert into quiz values(seq_quiz_idx.nextVal,'이집트의 수도는?','카이로','카이로','룩소스','아스완','기자');
insert into quiz values(seq_quiz_idx.nextVal,'콜롬비아의 수도는?','보고타','메데인','보고타','바랑키야','산타마르타');
insert into quiz values(seq_quiz_idx.nextVal,'태국의 수도는?','방콕','치앙마이','파타야','아유타야','방콕');
insert into quiz values(seq_quiz_idx.nextVal,'프랑스의 수도는?','파리','파리','니스','마르세유','리옹');
insert into quiz values(seq_quiz_idx.nextVal,'필리핀의 수도는?','마닐라','세부','마닐라','엘로엘로','다바오');
insert into quiz values(seq_quiz_idx.nextVal,'알제리의 수도는?','알제','오랑','인나바','틀렘센','알제');
insert into quiz values(seq_quiz_idx.nextVal,'일본의 수도는?','도쿄','오사카','도쿄','후쿠오카','삿포로');
insert into quiz values(seq_quiz_idx.nextVal,'멕시코의 수도는?','멕시코시티','멕시코시티','몬테레이','티후아나','칸쿤');
insert into quiz values(seq_quiz_idx.nextVal,'불가리아의 수도는?','소피아','바르나','소피아','부르가스','루세');
insert into quiz values(seq_quiz_idx.nextVal,'자메이카의 수도는?','킹스턴','포트모어','킹스턴','네그릴','몬테고베이');
