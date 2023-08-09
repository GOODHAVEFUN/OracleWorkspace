CREATE TABLE TBl_School(
	school_number NUMBER,
	school_name varchar2(1000),
	CONSTRAINT pk_school PRIMARY KEY(school_number)
);

DROP TABLE TBL_STUDENT ;

CREATE TABLE TBL_STUDENT(
	student_number NUMBER,
	student_name varchar2(1000),
	student_age NUMBER,
	school_number NUMBER,
	CONSTRAINT pk_student PRIMARY KEY(student_number),
	CONSTRAINT fk_student FOREIGN KEY(school_number) REFERENCES TBL_school(school_number)
);

--학교테이블에 학교정보넣기
INSERT INTO TBL_SCHOOL VALUes (1,'DBMS 고등학교');
INSERT INTO TBL_SCHOOL VALUes (2,'JAVA 고등학교');
INSERT INTO TBL_SCHOOL VALUes (3,'웹표준 고등학교');

SELECT  * FROM TBL_SCHOOL;

--학생 테이블에 학생 정보
--INSERT INTO TBL_STUDENT VALUES(1,'짱구',17,5);
INSERT INTO TBL_STUDENT VALUES(1,'짱구',17,1);
INSERT INTO TBL_STUDENT VALUES(2,'철수',17,1);
INSERT INTO TBL_STUDENT VALUES(3,'유리',18,2);
INSERT INTO TBL_STUDENT VALUES(4,'훈이',18,3);

SELECT* FROM TBL_STUDENT;

-- UK : 다른 제약 존건 설정과 거의 동일하여 UNIQUE 고유 갓ㅂ을 가지는 컬럼이다
-- PK와 UK의 차이 : UK는 NULL을 허용한다, 즉값을 넣지않아도 된다

DROP TABLE TBL_STUDENT ;

CREATE TABLE TBL_STUDENT ( 
	STUDENT_number NUMBER CONSTRAINT pk_number PRIMARY KEY,
	student_ID varchar2(1000) CONSTRAINT uk_number UNIQUE, -- UNIQUE는 KEY를 붙이지 않음
	student_name varchar2(1000),
	student_majar varchar2(1000),
--	student_gender char(1), -- 'M', 'W'만 저장할것이므로 고정크기 1로 한다
	student_gender char(1) DEFAULT 'W' NOT NULL 
	CONSTRAINT BAN_CHAR CHECK(student_gender = 'M' OR student_gender='W')
	--default 'W'는 메모리에 들어오지 않으면 무조건 'W'값이 기본으로 들어간다
	--디폴트닶을 'W'로 설정 했으나 NULL값을 강제로 막아주는게 좋을 것이다
	-- 이럴째 사용하는 것이 NOT NULL이라는 제약조건이다
	-- 마지막으로 이 컬럼에 'M' 또는 'W'만 들어오게 하는 제약조건을 걸어줘야한다
	-- 저장되려는 값이 'M', 'W'인지 검사해야한다(체크 CHECK)
);

SELECT * FROM tbl_student;

DROP TABLE TBL_STUDENT ;

-- 각 컬럼별 값 넣기
INSERT  INTO TBL_STUDENT VALUES(1,'AA','김철수','컴공','M');
--INSERT  INTO TBL_STUDENT VALUES(2,'AA','신짱구','컴공','M');--오류 id는 uk
INSERT INTO TBL_STUDENT VALUES(2,'BB','신짱구', '컴공', 'M');
INSERT INTO TBL_STUDENT VALUES(3,'CC','신유리', '컴공', 'W');
INSERT INTO TBL_STUDENT (STUDENT_NUMBER,STUDENT_ID,STUDENT_NAME,STUDENT_MAJAR)
	values(4,'DD','김영희','컴공');
	--성별을 생략하면  디폴트 값인 'W'이 들어간다

SELECT * FROM TBL_STUDENT;

CREATE TABLE TBL_FLOWER(
	FLOWER_NAME varchar2(1000),
	FLOWER_COLOR varchar2(1000),
	FLOWER_PRICE number,
	CONSTRAINT PK_FLOWER PRIMARY KEY (FLOWER_NAME,FLOWER_COLOR)
);

--데이터 저장
INSERT INTO TBL_FLOWER values('해바라기','빨강',5000);
INSERT INTO TBL_FLOWER values('해바라기','노랑',5000);
INSERT INTO TBL_FLOWER values('튤립','노랑',9000);
INSERT INTO TBL_FLOWER values('튤립','빨강',9000);
INSERT INTO TBL_FLOWER values('해바라기','노랑색',5000); --오류 조합키 2개의 컬럼이 모두 일치함

SELECT * FROM TBL_FLOWER ;

