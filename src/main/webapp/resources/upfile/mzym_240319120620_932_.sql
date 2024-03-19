-- 시퀀스 생성 구문 작성

-- 맴버 회원번호 시퀀스
create sequence SEQ_MEMEBERNO NOCACHE;
-- 공시사항 글번호 시퀀스
create sequence SEQ_NOTICENO NOCACHE;
-- 게시글 글번호 스퀀스
create sequence SEQ_BOARDNO NOCACHE;
-- 게시판 카테고리 시퀀스
create sequence SEQ_BOARD_CATEGORYNO NOCACHE;
-- 댓글 번호 시퀀스
create sequence SEQ_COMMENTNO NOCACHE;
-- 신고번호 시퀀스
create sequence SEQ_REPORTNO NOCACHE;
-- 신고 카테고리 시퀀스
create sequence SEQ_REPORT_CATEGORYNO NOCACHE;
-- 인바디 회원번호는 맴버 식별코드
-- 상담문의 카테고리 시뭔스
create sequence SEQ_ADVICE_CAREGORYNO NOCACHE;
-- 상담문의 글번호
create sequence SEQ_ADVICENO NOCACHE;
-- 고객 센터 카테고리번호
create sequence SEQ_SERVICE_CATEGORYNO NOCACHE;
-- 고객 센터 글번호 
create sequence SEQ_SERVICENO NOCACHE;
-- 첨부파일 파일번호
create sequence SEQ_ATTACHMENT NOCACHE;