SELECT * FROM TBL_MEMBER;

INSERT INTO TBL_MEMBER(MEMBER_NAME, MEMBER_AGE)
VALUES('김영선', 20);

INSERT INTO TBL_MEMBER
VALUES('홍길동', 22);

-- 짱구 이름을 강감찬 수정
UPDATE TBL_MEMBER SET MEMBER_NAME = '홍길동' WHERE MEMBER_AGE = 20;
-- UPDATE를 사용할 때는 WHERE 조건을 주지 않으면 전체 데이터의 이름이 변경이 된다
-- 여기서는 =는 관계연산자가 아니다

DELETE FROM TBL_MEMBER;
-- 삭제할 때 WHERE절을 생략하면 모든 행의 데이터가 지워진다(주의)

-- [과제] 동물이름, 나이(5개만) 추가





