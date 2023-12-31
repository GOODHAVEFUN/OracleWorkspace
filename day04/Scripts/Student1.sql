/*
 * 1. 학생 테이블의 모든 데이터 조회하기
 * 2. 전체 학생들의 이름과 평균점수를 조회하기(별칭)
 * */

SELECT * FROM TBL_STUDENT;

SELECT STUDENT_NAME 이름,
	(STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 평균점수
FROM TBL_STUDENT;

-- 특정 조건에 따라 테이블의 열 값을 가져와 계산하는 것
UPDATE TBL_STUDENT 
SET STUDENT_GRADE = (STUDENT_KOR + STUDENT_MATH + STUDENT_ENG )/3 
WHERE STUDENT_NAME ='김철수';

SELECT * FROM TBL_STUDENT;

/* [실습] 학생의 평균점수를 구하고 학점을 수정하기
 * A : 90점 이상
 * B : 80점 이상 90점 미만
 * C : 50점 이상 80점 미만
 * F : 50점 미만
 */

UPDATE TBL_STUDENT
SET STUDENT_GRADE  = 'A'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 >= 90

UPDATE TBL_STUDENT
SET STUDENT_GRADE  = 'B'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 >= 80
AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 < 90;

UPDATE TBL_STUDENT
SET STUDENT_GRADE  = 'C'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 >= 50
AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 < 80;

UPDATE TBL_STUDENT
SET STUDENT_GRADE  = 'F'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 < 50;

/*[실습]
 * 1. 학점이 잘 들어갔는지 확인하기 위해서 학생번호, 이름, 평균, 학점 조회하기(별칭넣기)
 */
SELECT STUDENT_NUMBER "학생 번호",
	STUDENT_NAME 이름,
	(STUDENT_MATH + STUDENT_ENG + STUDENT_KOR ) / 3 평균,
	STUDENT_GRADE
FROM TBL_STUDENT;

/*
 * 2. 학생의 수학, 영어, 국어점수 중 한 과목이라도 50점 미만이 아니고 학점이 B이상인 학생만 학생번호, 이름, 학점 출력하기
 */
SELECT STUDENT_NUMBER, STUDENT_NAME, STUDENT_GRADE
FROM TBL_STUDENT
WHERE
NOT(STUDENT_MATH < 50 OR
	STUDENT_ENG < 50 OR
	STUDENT_KOR < 50)
	AND STUDENT_GRADE = 'B' OR STUDENT_GRADE = 'A';

-- 참고 학점이 B인 학생들의 50점 이상만 조회하기
SELECT STUDENT_NUMBER, STUDENT_NAME, STUDENT_GRADE
FROM TBL_STUDENT
WHERE STUDENT_GRADE >= 'B' AND
	STUDENT_NUMBER IN (
	SELECT STUDENT_NUMBER 
	FROM TBL_STUDENT 
	WHERE STUDENT_MATH >= 50 AND STUDENT_ENG >= 50 AND STUDENT_KOR >= 50);

/*
 * 3. 학생의 수학, 영어, 국어점수 중 한 과목이라도 30점 미만이면 퇴학시키기(DB에서 삭제)
 * 
 */

DELETE FROM TBL_STUDENT
WHERE STUDENT_MATH < 30 OR
	STUDENT_KOR < 30 OR
	STUDENT_ENG < 30;


