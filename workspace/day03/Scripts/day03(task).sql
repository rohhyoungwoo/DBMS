--과제
--모델링, 정규화, 구현까지 진행 후 각 테이블에 5개씩 값 넣어서 조회까지 할 것!


--1. 학생 정보와 성적을 관리하기 위해 다음과 같은 정보를 저장해야한다
--- 학생번호, 이름, 나이, 전화번호, 주소
--- 과목명, 강사명, 수업일자(개강일자) 수업시간, 학생성적, 수업번호, 과목번호

--개념적 설계, 논리적 설계, 물리적 설계, 구현

-- 1. 개념적 설계
--엔티티 도출 => 학생, 과목, 성적
--학생			과목			성적
--학생번호		과목번호		수업번호
--이름			과목명		학생성적
--나이			강사명	
--전화번호		개강일자
--주소			수업시간

-- 2. 논리적 설계
-- 데이터 속성과 타입, 키 정의
--학생				과목				성적
--학생번호(PK)정수		과목번호(PK)정수	수업번호(PK)정수
--이름 문자열			과목명 문자열		학생성적 문자열
--나이 정수			강사명 문자열		과목번호(FK)정수
--전화번호 문자열		개강일자 날짜
--주소 문자열			수업시간 정수
--					학생번호(FK)정수

-- 3. 물리적 설계
-- 테이블명, 컬럼명, 제약조건

--TBL_STU
--STU_NUMBER	: NUMBER PK
--STU_NAME	: VARCHAR2
--STU_AGE		: NUMBER
--STU_PHONE	: VARCHAR2
--STU_ADDRESS	: VARCHAR2

--TBL_SUB
--SUB_NUMBER	: NUMBER PK
--SUB_NAME	: VARCHAR2
--SUB_TEACHER	: VARCHAR2
--SUB_STARTDATE : DATE
--SUB_TIME	: NUMBER
--STU_NUMBER	: NUMBER FK

--TBL_GRADE
--GRADE_NUMBER : NUMBER PK
--GRADE_GRADE	: CHAR
--SUB_NUMBER	: NUMBER FK

-- 4. 정규화
-- 1차 정규화 : 하나의 컬럼이 하나의 값을 가질 수 있도록 컬럼을 분리한다
-- 학생번호(PK), 과목번호(PK), 수업번호(?)

-- 2차 정규화 : 학생, 과목, 성적 세개의 테이블로 나누고
-- 학생 번호 PK, 과목테이블 안에 과목번호는 PK, 학생 번호는 FK로 지정
-- 과목 번호 PK와 성적 정보 관리 --외래키 지정?

-- 3차 정규화
-- 학생테이블 학생 번호 PK
-- 과목테이블 과목 번호 PK, 학생 번호 FK
-- 성적테이블 ?, 과목 번호 FK

-- 5. 구현
CREATE TABLE TBL_STUD(
	STUD_NUMBER NUMBER CONSTRAINT PK_STUD PRIMARY KEY,
	STUD_NAME VARCHAR2(1000),
	STUD_AGE NUMBER,
	STUD_PHONE VARCHAR2(20),
	STUD_ADDRESS VARCHAR2(1000)
);
SELECT * FROM TBL_STUD;

CREATE TABLE TBL_SUB(
	SUB_NUMBER NUMBER,
	SUB_NAME VARCHAR2(100),
	SUB_TEACHER VARCHAR2(100),
	SUB_STARTDATE DATE,
	SUB_TIME NUMBER,
	STUD_NUMBER NUMBER,
	CONSTRAINT PK_SUB PRIMARY KEY(SUB_NUMBER),
	CONSTRAINT FK_STUD FOREIGN KEY(STUD_NUMBER) REFERENCES TBL_STUD(STUD_NUMBER)
);
SELECT * FROM TBL_SUB;

DROP TABLE TBL_GRADE;
CREATE TABLE TBL_GRADE(
	GRADE_NUMBER NUMBER,
	GRADE_GRADE CHAR(1) NOT NULL CONSTRAINT CHECK_GRADE CHECK ,
	SUB_NUMBER NUMBER,
--	CONSTRAINT PK_GRADE PRIMARY KEY(GRADE_NUMBER),
	CONSTRAINT FK_SUB FOREIGN KEY(SUB_NUMBER) REFERENCES TBL_SUB(SUB_NUMBER)
);
SELECT * FROM TBL_GRADE;

--2. 동물병원의 요구사항은 다음과 같다
--- 동물병원의 반려동물, 보호자의 정보를 저장하고 관리한다
--- 보호자는 번호, 이름, 주소, 핸드폰 번호, 이메일주소를 가진다
--- 반려동물은 번호, 이름, 성별, 나이, 종, 품종, 보호자 번호를 가진다
--- 모든 보호자는 중복이 없는 번호를 가진다
--- 보호자의 이름, 주소, 핸드폰 번호는 필수 정보이다
--- 모든 동물은 중복이 없는 번호를 가진다
--- 동물의 이름, 성별, 나이, 종, 보호자 번호는 필수 정보이다
--- 동물의 보호자 번호는 실제 존재하는 보호자 번호여야 한다

-- 1. 개념적 설계
-- 엔티티 도출 => 보호자, 반려동물
-- 엔티티 속성
--보호자			반려동물
--번호				번호
--이름				이름
--주소				성별
--핸드폰번호			나이
--이메일주소			종
--				품종
--				보호자번호

-- 2. 논리적 설계
-- 데이터의 속성과 타입, 키 정의
--보호자				반려동물
--번호(PK)정수			번호(PK)정수
--이름 문자열	N/N		이름 문자열 N/N
--주소 문자열	N/N		성별 문자열 N/N
--핸드폰번호 문자열 N/N	나이 정수 N/N
--이메일주소 문자열		종 문자열 N/N
--					품종 문자열
--					보호자번호 (FK)정수 N/N

-- 3. 물리적 설계




--3. 아래와 같은 테이블이 있을 때 3차 정규화까지 각 단계별로 테이블을 만들고 값을 삽입 후 조회 쿼리문 결과를 확인하세요.
--
--- 기본 테이블명은 아래와 같고 테이블 추가하면서 값 넣을 땐 테이블명 달라져도 됨
--
--
---- 직원 테이블 생성 (1차 정규화를 적용하지 않은 형태로 유지)
--CREATE TABLE Employees (
--    EmployeeID NUMBER PRIMARY KEY,
--    Name VARCHAR2(50),
--    BirthDate DATE,
--    DepartmentInfo VARCHAR2(255),
--    Salary NUMBER
--);
--
---- 데이터 삽입
--INSERT INTO Employees (EmployeeID, Name, BirthDate, DepartmentInfo, Salary)
--VALUES (1, '스티븐', TO_DATE('2010-12-31', 'YYYY-MM-DD'), '영업부, 서울시.. 01234', 300);
--
--INSERT INTO Employees (EmployeeID, Name, BirthDate, DepartmentInfo, Salary)
--VALUES (2, '마리', TO_DATE('2011-10-01', 'YYYY-MM-DD'), '영업부, 서울시.. 01234', 250);
--
--INSERT INTO Employees (EmployeeID, Name, BirthDate, DepartmentInfo, Salary)
--VALUES (3, '찰스', TO_DATE('2003-05-01', 'YYYY-MM-DD'), '사업부, 경기도...02345', 200);
--
--INSERT INTO Employees (EmployeeID, Name, BirthDate, DepartmentInfo, Salary)
--VALUES (4, '마리아', TO_DATE('1995-08-15', 'YYYY-MM-DD'), '인사부, 서울시.. 01234', 280);
--
--INSERT INTO Employees (EmployeeID, Name, BirthDate, DepartmentInfo, Salary)
--VALUES (5, '제임스', TO_DATE('1988-03-22', 'YYYY-MM-DD'), '영업부, 서울시.. 01234', 320);
--
--INSERT INTO Employees (EmployeeID, Name, BirthDate, DepartmentInfo, Salary)
--VALUES (6, '안나', TO_DATE('2000-12-10', 'YYYY-MM-DD'), '영업부, 서울시.. 01234', 270);
