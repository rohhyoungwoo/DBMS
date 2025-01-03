-- 계정명 : test01
-- 비밀번호 : 1234
-- 권한 create session, create table, create view, resource;

-- 계정 만들고 a1~a4 테이블 등록 후 문제 풀기

/* 1. JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 조회 */
SELECT * FROM JOBS;
SELECT * FROM JOB_HISTORY;
SELECT * FROM EMPLOYEES;
SELECT JOB_ID 아이디, JOB_TITLE 타이틀, EAMAIL 이메일, FIRET_NAME 성, LAST_NAME 이름
FROM EMPLOYEES;

SELECT J.JOB_ID, J.JOB_TITLE, E.JOB_ID, E.EMAIL, E.FIRST_NAME, E.LAST_NAME
FROM TBL_JOBS j INNER JOIN TBL_EMPLOYEES e
ON J.JOB_ID = E.JOB_ID;

SELECT E.JOB_ID, E.EMAIL, E.FIRST_NAME, E.LAST_NAME
FROM EMPLOYEES E;

	
	


/* 2. EMPLOYEES 테이블에서 HIREDATE가 2003~2004년까지인 사원의 정보와 부서명 검색 */

/* 3. EMP 테이블에서 ENAME에 L이 있는 사원들의 DNAME과 LOC 검색 */

/* 4. SCHEDULE 테이블에서 경기 일정이 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회 */

/* 5. 축구 선수들 중에서 각 팀 별로 키가 가장 큰 선수들의 전체 정보 조회 */
/* 위 문제를 JOIN없이 풀기
 * (A,B) IN (C, D) : A = C AND B = D */

/* 6. EMP 테이블의 SAL을 이용, SALGRAED 테이블을 참고하여 모든 사원의 정보를 GRADE를 포함하여 조회 */

/* 7. EMP 테이블에서 각 사원의 매니저 이름 조회 */

/* 8. 축구 선수들 중에서 각 팀 별로 키가 가장 큰 선수들의 전체 정보 조회 */