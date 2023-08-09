-- 테이블의 컬럼 이름을 바꿔서 조회하기
-- 테이블의 컬럼명을 별칭(별명)으로 설정하기
-- AS alias 
SELECT 	employee_id AS "사원번호",
	last_name AS "성", 
	first_name AS "이름", 
	salary AS "봉급"
FROM employees;

-- AS 생략 가능 "" 생략가능
-- 단, 별명에 띄어쓰기가 있을때는 "" 생략 불가능
SELECT employee_id "사원 번호",
	last_name 성,
	first_name 이름,
	salary 봉급
FROM employees;




