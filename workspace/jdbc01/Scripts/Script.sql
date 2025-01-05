CREATE SEQUENCE seq_user;

-- 사용자 정보 저장하는 유저 테이블 tbl_user
-- 사용자 번호
-- 아이디
-- 패스워드
-- 이름
-- 나이
-- 성별
-- 생일
CREATE TABLE tbl_user(
	user_number NUMBER,
	user_id varchar2(100),
	user_pw varchar2(100),
	user_name varchar2(10),
	user_age NUMBER,
	user_gender char(1) DEFAULT 'M',
	user_birth DATE,
	CONSTRAINT pk_user PRIMARY key(user_number)
);

SELECT * FROM tbl_user;

INSERT INTO tbl_user
--values(seq_user.nextVal, 'aaa', '1234', '홍길동', 22, 'M', '20001010');
--values(seq_user.nextVal, 'bbb', '1234', '노형우', 20, 'M', '20000101');