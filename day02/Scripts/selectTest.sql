-- 한줄 주석 : 컴퓨터가 해석하지 않는다
-- 실행시키지 않고 설명을 작성할 때 사용한다

-- SELECT를 사용하여 employees 테이블의 first_name 컬럼만 선택해서 조회하기
-- SELECT first_name FROM employees;
-- SELECT first_name FROM hr.employees;
-- DBeaver가 알아서 예약어는 대문자로 바꿔준다

-- 테이블명을 작성할 때 정확하게 작성하려면 계정명을 작성하고
-- (.)을 써줘야한다 .은 ~안에 있는 이라는 의미이다
-- ; 하나의 명령이 끝나면 작성한다
-- 세미콜론 이전에 줄바꿈을 해도 상관 없다

-- SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;
-- 대문자로 작성해도 오류가 발생하지 않는다
-- 여러개의 컬럼을 같이 보고 싶다면 , 콤마를 이용해서 사용할 수 있다
-- HR계정으로 로그인되어있기 때문에 HR. 은 생략가능하다
-- 계정명을 작성한 이유는 여러 계정에 같은 이름의 테이블 이름이 존재할 수 있기 때문이다
-- 지금 로그인한 계정의 테이블 우선순위가 높기 때문에 일반적으로 계정명은 생략이 가능하다

-- [실습] 직원의 성, 이름, 핸드폰번호, 이메일주소, 사원번호를 한번에 조회하기(순서대로 조회되어야함)
-- SELECT last_name, first_name, phone_number, email, employee_id FROM employees;

-- 모든 컬럼을 다 조회하고 싶다면 *를 사용한다
SELECT * FROM EMPLOYEES;



























