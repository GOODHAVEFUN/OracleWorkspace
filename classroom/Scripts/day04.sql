--[과제1] 동물 테이블 생성(TBL_ANIMAL)
--	고유번호 NUMBER
--	종류	KIND
--	나이	AGE
--	먹이	FEED
--
--- 수정을 이용해 제약조건 추가(PK)
--- 제약조건 삭제(PK)
--- 컬럼 추가(성별 GENDER)
--- 컬럼이름 수정(고유번호 NUM)
--- 컬럼 삭제(먹이)
--- 컬럼 수정(종류 컬럼을 다른 자료형으로)
--- 조회


CREATE TABLE TBL_ANIMAL(
	ANIMAL_NUMBER NUMBER,
	ANIMAL_KIND varchar2(1000),
	animal_feed varchar2(1000)	
);

ALTER TABLE TBL_ANIMAL ADD CONSTRAINT pk_number PRIMARY KEY(animal_number);

ALTER TABLE TBL_ANIMAL DROP CONSTRAINT pk_number;

ALTER TABLE TBL_ANIMAL ADD(animal_gender varchar2(30));

ALTER TABLE TBL_ANIMAL ADD(animal_age varchar2(30));


ALTER TABLE TBL_ANIMAL DROP COLUMN animal_feed;

ALTER TABLE TBL_ANIMAL modify(animal_age number);

 SELECT * FROM TBL_ANIMAL;
