
--1. 직원들 중 봉급이 5000 이상인 직원들의 모든 정보 조회하기
SELECT * FROM EMPLOYEES WHERE SALARY >= 5000;

--2. 직원들 중 부서번호가 30번인 직원들의 이름과 입사일 조회하기
SELECT first_name, hire_date
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

--3. 직원들 중 성이 Smith인 직원들의 이름과 봉급 조회하기
SELECT first_name, salary
FROM EMPLOYEES
WHERE last_name = 'Smith';

--4. 직원들 중 봉급이 3000미만이거나 10000이상인 직원들의 이름과 봉급 조회하기
-- 논리연산자 OR
SELECT first_name, salary
FROM EMPLOYEES
WHERE salary < 3000 OR salary >= 10000;

--5. 직원들 중 이름이 A로 시작하는 직원들의 이름과 성 조회하기
-- like
SELECT first_name, last_name
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';

--6. 직원들 중 성에 o가 포함되고 이름이 4글자인 직원들의 이름과 성, 부서번호 조회하기
-- like, and
SELECT first_name, last_name, department_id
FROM EMPLOYEES
WHERE last_name LIKE '%o%' AND first_name LIKE '____';

--7. 직원들 중 이름이 s로 끝나고 성이 J로 시작하는 직원들의 이름과 성 조회하기
SELECT first_name, last_name
FROM EMPLOYEES
WHERE first_name LIKE '%s' AND last_name LIKE 'J%';

