--자료형 
--	char ,varchar2, number, date
	
--연산자
--	연결연산자 a||b
SELECT
	FIRST_NAME || LAST_NAME
FROM
	EMPLOYEES;
--연결연산 결과 값은 항상 varchar2로 출력
SELECT
	FIRST_NAME || EMPLOYEE_ID || EMAIL || HIRE_DATE
FROM
	EMPLOYEES;
--결과값 Steven100SKING03/06/17
--위처럼 무엇이든 문자로 변환되어 출력한다

--[실습] 사원의 이름과 메일주소 출력하기
-- 이 때 이름은 first_name과 last_name이 띄어쓰기로 이어져있고
-- 메일의 주소는 사원메일주소@koreait.com이다
SELECT
	FIRST_NAME || ' ' || LAST_NAME 이름 ,
	EMAIL || '@koreait.com' e메일
FROM
	EMPLOYEES;

--산술연산자 +-*/
-- [실습] 직원의 이름, 봉급, 인상봉급, 감축봉급을 조회하기
-- 이름은 성과 함께 띄어쓰기로 연결되어있다
-- 인상봉급은 기존봉급의 10% 증가되었고 -> 1.1
-- 감축봉급은 기존봉급의 10% 감소되었다 -> 0.9
-- 결과를 기존 봉급 오름차순으로 정렬하여 조회한다
SELECT
	FIRST_NAME || LAST_NAME 이름,
	SALARY 봉급,
	SALARY * 1.1 인상봉급,
	SALARY * 0.9 감축봉급
FROM
	EMPLOYEES
ORDER BY
	SALARY ASC;
--날짜 타입도 연산가능하다 
--날짜 숫자 연산
SELECT
	SYSDATE  현재시각,
	SYSDATE -1 마이너스1, --하루전
	SYSDATE +1 플러스1,	--하루후
	SYSDATE -HIRE_DATE --지난일
--	SYSDATE +HIRE_DATE --오류
FROM 
EMPLOYEES
ORDER BY HIRE_DATE ;
--sysdate 현재date

-- 시간을 연산할 때는 시간을 일로 환산해서 진행한다
-- 12시간 -> 0.5일 / 24시간 -> 1일
-- 날짜와 숫자 연산에서 기본적으로 숫자는 일수를 의미하기 때문에
-- 시간, 분 단위로 연산하고 싶다면 일(24h)로 환산해야한다
SELECT
	SYSDATE  현재시각,
	SYSDATE - 1/24, --1시간전
	SYSDATE - 1/24/2, --30분전
	SYSDATE - 1/24/60 --1분전
FROM 
	dual;

--관계연산자
--WHERE절에 < > >= <= = <> != true가 나오면해당 행을 조회 아니면 조회안함 
--java는 아래구문을 실행하는데 sql은 아래에 행을 조회하는 실행문이 있다고 생각하는 게 편하다
--실행순서가 있기때문에 별칭을 사용할시 주의해야한다

-- 직원의 이름, 성, 봉급을 조회한다
-- 단, 봉급이 10000이상인 직원 정보만 조회한다
SELECT
	FIRST_NAME 이름,
	LAST_NAME 성 ,
	SALARY 봉급
FROM 
	EMPLOYEES
WHERE 
	SALARY >= 10000;

-- 직원의 이름 'David', 성을 조회한다
SELECT 
	FIRST_NAME ,LAST_NAME 
FROM 
	EMPLOYEES
WHERE 
	FIRST_NAME = 'David';
--sql문은 대소문자를 가리지않지만 데이터값은 구분한다

--SQL연산자
--	BETWEEN a AND b
-- employess 테이블에서 salary가 10000이상 12000이하인 직원의
-- first_name, last_name, salary를 salary 오름차순으로 조회하기
SELECT 
	FIRST_NAME ,
	LAST_NAME ,
	SALARY 
FROM 
	EMPLOYEES
WHERE 
	SALARY BETWEEN 10000 AND 12000
ORDER BY
	FIRST_NAME , LAST_NAME , SALARY ;

--	IN(a, b, c, ..) 안에 a나 혹은 b나
-- employees 테이블에서
-- salary가 10000 혹은 11000 혹은 12000인 직원의
-- first_name, last_name, salary를
-- salary 내림차순으로 정렬하여 조회
SELECT
	FIRST_NAME ,
	LAST_NAME ,
	SALARY 
FROM
	EMPLOYEES
WHERE 
	SALARY IN(10000,11000,12000)
ORDER BY 
	SALARY DESC ;
	

--	LIKE % _ 문자조회
SELECT
	FIRST_NAME
FROM
	EMPLOYEES
WHERE
	FIRST_NAME LIKE '%e'
	AND 
FIRST_NAME LIKE '_____'
	OR 
FIRST_NAME LIKE '%n%'; 
--	IS NULL/IS NOT NULL 관계연산자로 null값을 가진 데이터는 조회할수없다
-- employees 테이블에서
-- comminssion_id가 NULL인 직원의
-- 이름, 성, commission_pct 조회하기
SELECT FIRST_NAME ,LAST_NAME ,COMMISSION_PCT 
FROM EMPLOYEES
WHERE COMMISSION_PCT  IS NOT NULL ;

SELECT FIRST_NAME ,LAST_NAME ,COMMISSION_PCT 
FROM EMPLOYEES
WHERE COMMISSION_PCT  IS NULL ;

--	ANY(a, b, c) a이거나 b이거나 c
SELECT salary
FROM employees
WHERE salary != ANY(10000, 11000, 12000)
ORDER BY salary;
--	ALL(a, b, c) a이면서 b 이면서
SELECT salary
FROM employees
WHERE salary > ALL(10000, 11000, 12000)
ORDER BY salary;

--	논리연산자
--		피연산자 자리에 조건이 온다
--		여러개의 조건을 연결할 때 사용한다
--		a AND b	: a조건 그리고 b조건을 만족하는 조건
--			  a와 b 모두 True -> True
--		a OR b	: a조건 또는 b조건을 만족하는 조건
--			  a와 b 둘 중 하나라도 True -> True
--		NOT a	: a조건을 만족하지 않는 조건
--			  True -> False, False -> True

-- employees 테이블에서 부서id가 80이면서 봉급이 10000이상인 직원들의
-- 이름, 성, 봉급, 부서id를 봉급 오름차순으로 조회하기
SELECT 
	FIRST_NAME ,LAST_NAME ,SALARY ,DEPARTMENT_ID 
FROM
	EMPLOYEES
WHERE 
	DEPARTMENT_ID = 80 AND SALARY >= 10000
ORDER BY 
	SALARY ;

SELECT first_name
FROM employees
--WHERE NOT first_name = 'David'; 
--WHERE first_name <> 'David';
WHERE first_name != 'David'; --일반적으로 SQL문은 <>를 사용한다

--3. CRUD
--	기본적인 데이터 처리 기능
--	C(Create) 생성, R(Read) 읽기, U(Update) 수정, D(Delete) 삭제
--
--SQL문(쿼리문)의 종류
--	SQL 명령어의 성격에 따라 분류한 것이다
--	1. DDL(Data Definition Language) : 데이터 정의 언어
--		테이블 조작 또는 제어 관련 쿼리문
--		
--	2. DML(Data Manipulation Language) : 데이터 조작 언어
--		데이터를 조작하는 쿼리문
--
--	3. DCL(Data Control Language) : 데이터 제어 언어(권한)
--	4. TCL(Transction Control Language) : 트랜잭션 제어 언어

--DML : 데이터 조작언어
--SELECT : 조회
--	SELECT 컬럼명 FROM 테이블명 [WHERE 조건식];
--
--INSERT : 추가
--	원하는 컬럼만 골라서 값을 저장할 때 사용
--	INSERT INTO 테이블명(컬럼명, ...) VALUES (값, ..);
--	
--	모든 컬럼에 값을 넣을 때 사용
--	INSERT INTO 테이블명 VALUES (값,...);
--
--UPDATE : 수정
--	UPDATE 테이블명 SET 컬럼명1 = 값1, 컬럼명2 = 값2, ... [WHERE 조건식];
--	WHERE 절을 생략하면 내가 선택한 컬럼의 모든 행에 값이 저장된다
--
--DELETE : 삭제
--	DELETE FROM 테이블명 [WHERE 조건식];
--	WHERE를 생략하면 모든 값이 삭제된다(주의)

-- [과제] 동물이름, 나이(5개만) 추가
CREATE TABLE ANIMAL(
	ANIMAL_NAME VARCHAR2(1000),
	ANIMAL_AGE NUMBER
);

INSERT INTO ANIMAL
VALUES('호랑이', 2);
INSERT INTO ANIMAL
VALUES('앵무새', 12);
INSERT INTO ANIMAL
VALUES('토끼', 1);
INSERT INTO ANIMAL
VALUES('고양이', 5);
INSERT INTO ANIMAL
VALUES('강아지', 7);

SELECT *
FROM ANIMAL; 

--1. 직원들 중 봉급이 5000 이상인 직원들의 모든 정보 조회하기
SELECT
	*
FROM
	EMPLOYEES
WHERE
	SALARY >= 5000;

--2. 직원들 중 부서번호가 30번인 직원들의 이름과 입사일 조회하기
SELECT
	first_name,
	hire_date
FROM
	EMPLOYEES
WHERE
	DEPARTMENT_ID = 30;

--3. 직원들 중 성이 Smith인 직원들의 이름과 봉급 조회하기
SELECT
	first_name,
	salary
FROM
	EMPLOYEES
WHERE
	last_name = 'Smith';

--4. 직원들 중 봉급이 3000미만이거나 10000이상인 직원들의 이름과 봉급 조회하기
-- 논리연산자 OR
SELECT
	first_name,
	salary
FROM
	EMPLOYEES
WHERE
	salary < 3000
	OR salary >= 10000;

--5. 직원들 중 이름이 A로 시작하는 직원들의 이름과 성 조회하기
-- like
SELECT
	first_name,
	last_name
FROM
	EMPLOYEES
WHERE
	FIRST_NAME LIKE 'A%';

--6. 직원들 중 성에 o가 포함되고 이름이 4글자인 직원들의 이름과 성, 부서번호 조회하기
-- like, and
SELECT
	first_name,
	last_name,
	department_id
FROM
	EMPLOYEES
WHERE
	last_name LIKE '%o%'
	AND first_name LIKE '____';

--7. 직원들 중 이름이 s로 끝나고 성이 J로 시작하는 직원들의 이름과 성 조회하기
SELECT
	first_name,
	last_name
FROM
	EMPLOYEES
WHERE
	first_name LIKE '%s'
	AND last_name LIKE 'J%';