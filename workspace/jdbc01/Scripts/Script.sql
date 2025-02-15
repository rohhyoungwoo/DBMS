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


INSERT INTO TBL_USER(USER_NUMBER, USER_ID, USER_PW, USER_NAME, USER_AGE, USER_GENDER, USER_BIRTH)
VALUES(SEQ_USER.NEXTVAL, 'ABC', '1234', '짱구', 5, 'M', '2000-01-01');

DELETE FROM TBL_USER tu
WHERE user_number = 21;

SELECT user_number
FROM TBL_USER tu
WHERE USER_ID = 'aaa' AND USER_PW = '1234';

-- 이름과 생일로 아이디 찾기
SELECT user_id
FROM TBL_USER tu 
WHERE USER_NAME = '홍길동' AND USER_BIRTH = '2000-10-10';

-- 회원 전체 정보 수정
UPDATE TBL_USER 
SET USER_ID = ?, USER_PW = ?, USER_NAME = ?, USER_AGE =?, USER_GENDER = ?, USER_BIRTH = ?;

-- 회원1명의 전체정보 조회
SELECT USER_ID, USER_PW, USER_NAME, USER_AGE, USER_GENDER, USER_BIRTH
FROM TBL_USER
WHERE USER_NUMBER = 1;

--회원탈퇴
DELETE FROM TBL_USER
WHERE USER_NUMBER = '1';

SELECT * FROM tbl_user;


