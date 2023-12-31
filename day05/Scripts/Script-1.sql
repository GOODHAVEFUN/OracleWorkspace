--	TBL_PHONE
--	-----------
--	PHONE_NUMBER : NUMBER : PRIMARY KEY
--	PHONE_COLOR : VARCHAR2(1000)
--	PHONE_SIZE : NUMBER
--	PHONE_PRICE : NUMBER
--	PHONE_PRODUCTION_DATE : DATE
--	PHONE_SALE : NUMBER 

CREATE TABLE TBL_PHONE(
	PHONE_NUMBER NUMBER,
	PHONE_COLOR VARCHAR2(1000),
	PHONE_SIZE NUMBER,
	PHONE_PRICE NUMBER,
	PHONE_PRODUCTION_DATE DATE,
	PHONE_SALE NUMBER,
	CONSTRAINT PK_PHONE PRIMARY KEY (PHONE_NUMBER)
);

--	TBL_CASE
--	-----------
--	CASE_NUMBER : NUMBER : PRIMARY KEY
--	CASE_COLOR : VARCHAR2(1000)
--	CASE_PRICE : NUMBER
--	PHONE_NUMBER : NUMBER : FOREIGN KEY

CREATE TABLE TBL_CASE(
	CASE_NUMBER NUMBER,
	CASE_COLOR VARCHAR2(1000),
	CASE_PRICE NUMBER,
	PHONE_NUMBER NUMBER,
	CONSTRAINT PK_CASE PRIMARY KEY (CASE_NUMBER),
	CONSTRAINT FK_CASE FOREIGN KEY (PHONE_NUMBER) REFERENCES TBL_PHONE(PHONE_NUMBER)
);

-- 항상 조회부터 한다!!
-- 관계를 맺은 테이블들의 DML
SELECT * FROM TBL_PHONE; --부모테이블
SELECT * FROM TBL_CASE; --자식테이블
-- 항상 부모 테이블의 데이터가 먼저 들어가야한다!(자식테이블은 부모테이블의 값을 참조하기 때문에)

INSERT INTO TBL_PHONE(PHONE_NUMBER, PHONE_COLOR, PHONE_SIZE, PHONE_PRICE, PHONE_SALE, PHONE_PRODUCTION_DATE)
	VALUES (001, 'BLACK', 1, 120, 10, SYSDATE - 10);
	-- 현재날짜 기준으로 10일전

INSERT INTO TBL_PHONE(PHONE_NUMBER, PHONE_COLOR, PHONE_SIZE, PHONE_PRICE, PHONE_SALE, PHONE_PRODUCTION_DATE)
	VALUES(002, 'BLACK', 1, 120, 20, TO_DATE('2023-05-05'));
	-- TO_DATE() 함수를 이용하여 문자열을 직접 DATE 타입으로 바꿀수있다

SELECT * FROM TBL_PHONE;

INSERT INTO TBL_CASE VALUES (101, 'WHITE', 5, 003); -- 오류 FK는 부모테이블의 값을 참조하는데 부모에 없는값을 참조하므로 오류
INSERT INTO TBL_CASE VALUES (101, 'WHITE', 5, 001);
INSERT INTO TBL_CASE VALUES (101, 'WHITE', 2, 002); -- PK number로 설정한 것이 중복되어서 오류발생
INSERT INTO TBL_CASE VALUES (105, 'WHITE', 2, 002);

SELECT * FROM tbl_case;

-- 부모의 값을 수정
UPDATE TBL_PHONE 
SET phone_number = 003
WHERE phone_number = 002;
-- 부모의 값을 변경할 때 자식에서 참조중인 값을 변경하려고 한다면 오류가 발생한다
-- 이럴 경우 자식 테이블을 먼저 수정하여 해당 값을 참조하지 않도록 수정해야한다
-- 1. 자식 테이블에서 참조중인 값을 다른 값으로 변경한다
-- 2. 자식 테이블에서 참조중인 값을 NULL값으로 변경한다

-- 1. 참조중인 값을 NULL로 변경후 수정(정말 급한경우 아니면 비추천)
UPDATE TBL_CASE
SET PHONE_NUMBER = NULL
WHERE CASE_NUMBER = 101;

UPDATE TBL_PHONE
SET PHONE_NUMBER = 003
WHERE PHONE_NUMBER = 001;

SELECT * FROM TBL_PHONE;
SELECT * FROM TBL_CASE;

--2. 참조중인 값을 다른 값으로 변경 후 수정
-- 자식의 FK를 변경할 때에는 부모에 존재하는 값으로 변경해야 한다

UPDATE TBL_CASE
SET PHONE_NUMBER = 3    -- PHONE_NUMBER에 있는 값으로 수정해야한다
WHERE CASE_NUMBER = 105;

UPDATE TBL_PHONE
SET PHONE_NUMBER = 20
WHERE PHONE_NUMBER = 2;

UPDATE TBL_CASE
SET PHONE_NUMBER = 20
WHERE  CASE_NUMBER = 105;

SELECT * FROM TBL_PHONE;
SELECT * FROM TBL_CASE;

-- 3. 부모에 없는 값으로 변경하려면 부모에 먼저 INSERT를 하고 자식 FK를 수정한다
INSERT INTO TBL_PHONE VALUES(010, 'BLUE', 2, 80, SYSDATE, 10);

UPDATE TBL_CASE
SET PHONE_NUMBER = 010
WHERE CASE_NUMBER = 101;

--5시 40분까지 만들기
--도서관에서 회원의 정보와 책의 정보가 필요하다.
--회원의 정보는 회원번호, 이름, 나이, 핸드폰 번호, 주소가 필요하고
--책의 정보는 도서번호, 책이름, 장르가 필요하다.
--단, 장르는 인문학, 추리, IT, 로맨스
--한 명의 회원은 여러권의 책을 빌릴 수 있다.
--테이블 명 MEMBER, BOOK

DROP TABLE TBL_MEMBER;

-- 어떤 테이블이 부모 테이블? 회원테이블
CREATE TABLE TBL_MEMBER(
	MEMBER_NUMBER NUMBER,
	MEMBER_NAME VARCHAR2(1000) NOT NULL,
	MEMBER_AGE NUMBER,
	MEMBER_PHONE_NUMBER VARCHAR2(1000) NOT NULL,
	MEMBER_ADDRESS VARCHAR2(1000) NOT NULL,
	CONSTRAINT PK_MEMBER PRIMARY KEY(MEMBER_NUMBER)
);

CREATE TABLE TBL_BOOK(
	BOOK_NUMBER NUMBER,
	BOOK_NAME VARCHAR2(1000) NOT NULL,
	BOOK_CATEGORY VARCHAR2(1000),
	MEMBER_NUMBER NUMBER,
	CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_NUMBER),
	CONSTRAINT CHECK_CATEGORY CHECK( BOOK_CATEGORY ='인문학'OR BOOK_CATEGORY = '추리' OR
		BOOK_CATEGORY = 'IT' OR BOOK_CATEGORY = '로맨스'),
	CONSTRAINT FK_BOOK FOREIGN KEY(MEMBER_NUMBER) REFERENCES TBL_MEMBER(MEMBER_NUMBER)
);



SELECT * FROM TBL_BOOK;
SELECT * FROM TBL_MEMBER;


















