-- 테이블을 만들면 항상 확인하기
SELECT * FROM TBL_STUDENT;

-- [실습]
-- 학생 테이블에 데이터 추가
-- 학생번호, 이름, 수학, 영어, 국어 점수
-- 1, 김철수, 90, 90, 90
-- 2, 홍길동, 75, 25, 55
-- 3, 이유리, 89, 91, 77
-- 4, 김웅이, 52, 100, 93
-- 5, 신짱구, 22, 13, 9

INSERT INTO TBL_STUDENT (
	STUDENT_NUMBER,
	STUDENT_NAME,
	STUDENT_MATH,
	STUDENT_ENG,
	STUDENT_KOR,
	STUDENT_GRADE ) 
	VALUES (5, '신짱구', 22, 13, 9, NULL);

-- 조회 결과 확인
SELECT * FROM TBL_STUDENT;


