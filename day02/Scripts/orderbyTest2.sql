-- 회사에 존재하는 직급(job_id) 조회하기
SELECT job_id FROM employees;

-- 107개의 결과가 나온다, 어떤 종류가 존재하는지 알고싶은 것이기 때문에 중복을 제외시킨다
-- DISTINCT : 해당 컬럼에서 중복되는 값을 제외시킨다
SELECT DISTINCT job_id, hire_date FROM employees;
-- 여러 컬럼을 DISTINCT 하게 되면 복합적으로 적용된다
-- 두 컬럼의 데이터가 모두 중복되어야 중복이라고 생각한다

-- 정렬기준을 내가 조회하는 컬럼으로 사용하지 않아도 된다!!
SELECT first_name, last_name
FROM employees
ORDER BY salary DESC;

-- [실습1] 사원의 이름, 성, 봉급을 봉급기준 내림차순으로 정렬하여 조회하기
-- 별명 사용하기
SELECT first_name 이름,
	last_name 성,
	salary 봉급
FROM employees
ORDER BY "봉급" DESC;

-- [실습2] 이름, 성을 조회하는데 봉급기준 오름차순으로 정렬하여 조회하기
-- 별명 사용하기
SELECT first_name 이름,
	last_name 성,
	SALARY
FROM employees;
--ORDER BY "봉급" ASC;




























