-- 조인을 사용할 때는 테이블간 관계를 먼저 확인해야한다
-- EMP 테이블에서 사원번호로 DEPT 테이블의 지역 검색
SELECT * FROM tbl_dept;
SELECT * FROM tbl_emp;

INSERT INTO TBL_EMP VALUES (1004, '맹구', '개발부', 3000, SYSDATE, 2500, 20);

-- ERD 확인하기
-- 두 테이블간 관계에서 DEPT_NO를 FK로 사용하고 있으므로
-- DEPT_NO를 비교하여 등가조인을 사용할 수 있다

-- DEPT 테이블의 행이 적은데 DEPT 후행 테이블로 왔다 효율이 좋지 않다
-- 별칭을 반드시 줘야 ON 절에서 구분이 가능하다
SELECT * FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPT_NO = D.DEPT_NO;

SELECT * FROM TBL_DEPT D JOIN TBL_EMP E
ON D.DEPT_NO = E.DEPT_NO;

-- 지역을 검색하라고 했으니 JOIN에서 나온 결과의 가상테이블에서
-- 내가 원하는 정보만 뽑아온다
SELECT E.EMP_NAME, DEPT_LOC FROM TBL_DEPT D JOIN TBL_EMP E
ON D.DEPT_NO = E.DEPT_NO;


-- [실습]
-- 1. PLAYER 테이블에서 송종국 선수가 속한 TEAM의 전화번호 검색하기
-- 테이블 데이터와 관계확인
SELECT * FROM PLAYER;
SELECT * FROM TEAM;

-- 일단 합치기
SELECT * FROM TEAM t JOIN PLAYER p
ON T.TEAM_ID = P.TEAM_ID;

-- 효율적인지 생각하기
-- WHERE를 안쓸 수 있다면 안쓰고 ON만 사용하는것이 좋다
SELECT PLAYER_NAME, TEL FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE PLAYER_NAME = '송종국';

-- 팀이름 같이 뽑으면 좋을 것이다
SELECT PLAYER_NAME, TEAM_NAME, TEL FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE PLAYER_NAME = '송종국';

-- 팀아이디를 SELECT로 가져오려고 하면 오류가 난다
SELECT P.TEAM_ID, PLAYER_NAME, TEAM_NAME, TEL FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE PLAYER_NAME = '송종국';
-- 양쪽 테이블 모두 TEMA_ID가 존재하기 때문에 어느 테이블의 TEAM_ID인지 컴퓨터는 알수가 없다
-- 그러므로 어느 테이블의 TEAM_ID인지 알려줘야한다 (P.TEAM_ID, T.TEAM_ID)

-- 2. JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 조회
SELECT * FROM JOBS;

-- 행 개수 확인
SELECT COUNT(*) FROM JOBS J;
SELECT COUNT(*) FROM EMPLOYEES e ;

SELECT JOB_TITLE, EMAIL, LAST_NAME || ' ' || FIRST_NAME AS FULL_NAME
FROM JOBS J JOIN EMPLOYEES e
ON J.JOB_ID = E.JOB_ID;


-- 3. EMPLOYEES 테이블에서 HIREDATE가 2001~2003년까지인 사원의 정보와 부서명 검색
SELECT COUNT(*) FROM EMPLOYEES E;
SELECT * FROM EMPLOYEES e;

SELECT COUNT(*) FROM DEPARTMENTS d;
SELECT * FROM DEPARTMENTS d;


SELECT E.LAST_NAME || ' ' || E.FIRST_NAME NAME,
   DEPARTMENT_NAME
   FROM DEPARTMENTS d JOIN EMPLOYEES e
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
   AND E.HIRE_DATE BETWEEN '2001-01-01' AND '2003-12-31';

-- BETWEEN 주어진 범위 내에 있는 값을 선택할 때 사용함
-- 비교할 열의 이름 BETWEEN 앞에 비교할 범위의 시작과 끝값을 사용한다

-- 1. 축구 선수들 중에서 각 팀별로 키가 가장 큰 선수들의 전체 정보 조회

-- 위 문제를 JOIN 없이 풀기
-- (A, B) IN (C, D) : A = C AND B = D

-- 우선 팀별로 그룹화하고 가장 큰 키를 찾는다
SELECT team_id, max(height) FROM player p
GROUP BY TEAM_ID;

-- 두 컬럼 조회되므로
-- (a, b) in (c, d) : a = c and b = d를 이용해서 두 컬럼의 조건을 건다
SELECT * FROM PLAYER
WHERE (team_id, height) in(
   SELECT TEAM_ID, max(HEIGHT)
   FROM player
   GROUP BY TEAM_ID 
);

-- join 이용 과제

-- 자기조인 예제
SELECT * FROM EMPLOYEES e;

SELECT E.first_name, m.first_name
FROM EMPLOYEES e
JOIN EMPLOYEES m ON e.MANAGER_ID = m.MANAGER_ID;

-- 2. EMPLOYEES 테이블의 각 사원의 이름, 매니저의 직무 조회
SELECT e.first_name, e.last_name,
   (SELECT J.JOB_TITLE
   FROM EMPLOYEES M
   JOIN JOBS J ON M.JOB_ID = J.JOB_ID
   WHERE M.EMPLOYEE_ID = E.MANAGER_ID) AS MANAGER_TITLE   
FROM EMPLOYEES e;


-- 사원ID, 매니저ID 조회
SELECT E.EMPLOYEE_ID, E.MANAGER_ID
FROM EMPLOYEES e;

-- 매니저의 ID 조인 매니저 ID와 직무(JOB_ID) 조회
SELECT E.EMPLOYEE_ID, E.MANAGER_ID, M.JOB_ID
FROM EMPLOYEES e
JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;

-- 직무(JOB_ID) 조인하여 매니저 ID와 매니저의 직무(JOB_TITLE)를 조회
SELECT E.EMPLOYEE_ID, E.MANAGER_ID, M.JOB_ID
FROM EMPLOYEES e
JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;
--JOIN JOBS J ON M.JOB_ID = J.JOB_ID;

-- 각 사원 이름과 매니저 직무를 조회
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE
FROM EMPLOYEES e 
JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
JOIN JOBS J ON M.JOB_ID = J.JOB_ID;


-- 3. EMPLOYEES 테이블의 모든 사원의 이름과 부서명 조회

-- 4. EMPLOYEES 테이블에서 매니저가 없는 사원의 이름과 직무 조회

-- 5. EMPLOYEES 테이블에서 직무별 평균 급여 조회

-- 6. EMPLOYEES 테이블에서 매니저별로 직속 직원 사원수 조회
-- 매니저별 직원 수 조회 과제
SELECT COUNT(E.EMPLOYEE_ID)
FROM EMPLOYEES e

SELECT M.FIRST_NAME, M.LAST_NAME, COUNT(E.EMPLOYEE_ID)
FROM EMPLOYEES e, EMPLOYEES M
WHERE E.MANAGER_ID  = M.EMPLOYEE_ID
GROUP BY M.FIRST_NAME, M.LAST_NAME;