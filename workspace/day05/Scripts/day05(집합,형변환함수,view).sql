-- 집합

-- 결과 6개 행
SELECT * FROM EMP e 
WHERE DEPTNO = 30;

-- 결과 3개 행
SELECT * FROM EMP e 
WHERE DEPTNO = 10;

-- EMP 테이블에서 DEPTNO가 30 또는 10인 데이터를 조회
-- 두 테이블을 UNION(합집합)으로 연결한다
SELECT * FROM EMP 
WHERE DEPTNO = 30
UNION 
SELECT * FROM EMP
WHERE DEPTNO = 10;

-- EMP 테이블에서 SAL 1000DLTKD 2000이하, 1500이상 3000이하의 결과를 같이 조회
SELECT * FROM EMP 
WHERE SAL BETWEEN 1000 AND 2000
UNION
SELECT * FROM EMP 
WHERE SAL BETWEEN 1500 AND 3000;



SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 오류 : 열의 수가 다르면 UNION을 사용할 수 없다
SELECT * FROM EMP
UNION
SELECT * FROM DEPT;

-- 오류 : 열의 타입이 다르면 UNION을 사용할 수 없다
SELECT EMPNO, DEPTNO, JOB FROM EMP
UNION
SELECT DEPNO, DNAME, LOC FROM DEPT;

-- 열의 수와 타입이 일치한다면 UNION이 가능하다
SELECT SAL, ENAME, JOB FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC FROM DEPT;

-- 위쪽 쿼리에 별칭을 주면 결과 테이블의 열 이름으로 사용된다
SELECT DEPTNO 숫자, DNAME 문자, LOC 문자 FROM DEPT
UNION
SELECT SAL, ENAME, JOB FROM EMP;

-- UNION이 두 테이블 합치고 ORDER BY가 실행되므로
-- 합쳐지기 이전의 컬럼명이나 소속을 이용해도 정렬되지 않는다
SELECT EMPNO 번호, ENAME 이름, JOB 직장
FROM EMP E
UNION
SELECT * FROM DEPT D
ORDER BY 번호;
--UNION 열의 수와 타입이 일치해야한다

-- 교집합
SELECT * FROM PLAYER p ;

SELECT PLAYER_NAME 이름, TEAM_ID 팀, HEIGHT 키, WEIGHT 몸무게
FROM PLAYER p 
WHERE HEIGHT BETWEEN 177 AND 185
INTERSECT
SELECT PLAYER_NAME 이름, TEAM_ID 팀, HEIGHT 키, WEIGHT 몸무게
FROM PLAYER p2 
WHERE WEIGHT BETWEEN 76 AND 78;

-- 차집합
SELECT PLAYER_NAME 이름, TEAM_ID 팀, HEIGHT 키, WEIGHT 몸무게
FROM PLAYER p 
WHERE HEIGHT BETWEEN 185 AND 186
MINUS 
SELECT PLAYER_NAME 이름, TEAM_ID 팀, HEIGHT 키, WEIGHT 몸무게
FROM PLAYER p2 
WHERE WEIGHT BETWEEN 76 AND 78;


-- 형 변환 함수
-- TO_CAHR()
SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY"년 "MM"월 "DD"일"') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD-HH24:MI') FROM DUAL;

-- TO NUMBER()
SELECT '1234', TO_NUMBER('1234') FROM DUAL;

SELECT '123' + '123' FROM DUAL;

-- TO_DATE()
SELECT TO_DATE('2300-12-25', 'YYYY-MM-DD') FROM DUAL;


-- view
-- 회원정보와 대여정보를 조합
CREATE VIEW MEMRENTAL AS
SELECT M.MEM_ID, M.MEM_NAME, R.REN_ID, R.BOOK_ID, R.REN_RENTALDATE, R.REN_RETURNDATE
FROM TBL_MEMBER M
JOIN TBL_RENTAL R 
ON M.MEM_ID = R.MEM_ID;

SELECT * FROM MEMRENTAL;

-- PLAYER 테이블에서 나이 컬럼을 추가한 뷰 만들기
SELECT * FROM PLAYER p ;

SELECT PLAYER_NAME, BIRTH_DATE, SYSDATE - BIRTH_DATE
FROM PLAYER p ;

CREATE VIEW VIEW_PLAYER AS 
SELECT PLAYER_NAME 이름, TRUNC(BIRTH_DATE) 생일, ROUND((SYSDATE - BIRTH_DATE)/365, 0) AS 나이
FROM PLAYER p ;
-- TRUNC 함수 : 시간정보를 제거한 날짜값만 유지됨
--TRUNC 함수 : TRUNC(DATA [, format]) : 날짜값에서 시간정보(HH:MI:SS)를 제거하고 날짜만 반환됨

DROP VIEW VIEW_PLATER;

SELECT * FROM VIEW_PLAYER;

SELECT SYSDATE, TRUNC(SYSDATE, 'YYYY') FROM DUAL;

CREATE VIEW VIEW_PLAYER AS
SELECT P.*, ROUND((SYSDATE - BIRTH_DATE)/365, 0) AS AGE
FROM PLAYER p ;

--EMPLOYEES 테이블에서 사원이름과 그 매니저 이름이 있는 VIEW 만들기

DROP view view_employees;
--SELF JOIN
CREATE VIEW VIEW_EMPLOYEES AS
SELECT e1.employee_id, e1.FIRST_NAME || ' ' || e1.LAST_NAME 사원이름, 
   e2.MANAGER_ID, e2.FIRST_NAME || ' ' || e2.LAST_NAME 매니저이름,
    e1.job_id, e1.department_id
FROM EMPLOYEES e1 JOIN EMPLOYEES e2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID;

select employee_id, e.FIRST_NAME || ' ' || e.LAST_NAME 사원이름 FROM EMPLOYEES e;
select MANAGER_id, e.FIRST_NAME || ' ' || e.LAST_NAME 사원이름 FROM EMPLOYEES e;

select employee_id, e.FIRST_NAME || ' ' || e.LAST_NAME 사원이름,
   MANAGER_id, e.FIRST_NAME || ' ' || e.LAST_NAME 매니저이름 FROM EMPLOYEES e;

-- 셀프조인 : employees 테이블내에서 직원과 해당 직원의 매니저를 같은 테이블 매칭
SELECT e1.employee_id 사원테이블, e2.EMPLOYEE_ID 매니저테이블, e1.employee_id, e1.FIRST_NAME || ' ' || e1.LAST_NAME 사원이름,
   e2.MANAGER_ID, e2.FIRST_name || ' ' || e2.last_name 매니저이름
FROM employees e1 JOIN employees e2
ON e1.MANAGER_ID = e2.employee_id;
-- e1 : 사원, e2 : 매니저
-- on e1.MANAGER_ID = e2.employee_id
-- e1 사원의 manager_id가 e2 매니저 employee_id 일치할 때 두 행을 매칭

SELECT * FROM VIEW_EMPLOYEES;

-- view_employees의 department_id를 이용해서 department_name이 나오는지 확인하기
SELECT ve.employee_id, ve.사원이름, ve.DEPARTMENT_ID, d.department_name
FROM VIEW_EMPLOYEES ve JOIN DEPARTMENTS D
ON ve.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- pk 설정된 것 확인 쿼리문
SELECT cols.table_name, cols.column_name, cons.constraint_name
FROM all_constraints cons
JOIN all_cons_columns COLS
ON cons.constraint_name = cols.constraint_name
WHERE cons.constraint_type = 'P'
AND cols.table_name = 'EMPLOYEES';

SELECT * FROM all_cons_columns COLS;

SELECT * FROM user_tab_privs_recd;

SELECT * FROM TBL_BOOKS tb ;
INSERT INTO TBL_BOOKS
VALUES(11, 'COMMIT', 'TCL');
INSERT INTO TBL_BOOKS
VALUES(12, 'ROLLBACK', 'TCL');
SELECT * FROM TBL_RENTAL tr ;

DELETE FROM TBL_RENTAL tr; 
WHERE REN_ID = 4;

TRUNCATE TABLE TBL_RENTAL;

COMMIT;
ROLLBACK;

SELECT * FROM EMPLOYEES e ;

SELECT FIRST_NAME, SALARY,
	CASE 
		WHEN SALARY >= 5000 THEN '높음'
		WHEN SALARY >= 3000 THEN '중간'
		ELSE '낮음'
	END 
FROM EMPLOYEES e ;
		
		
		
		
		
		
		
		
	END
	

