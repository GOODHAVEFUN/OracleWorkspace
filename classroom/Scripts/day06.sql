SELECT * FROM player;
/*1. PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수 검색*/
SELECT
	*
FROM
	player
WHERE
	WEIGHT >= 70
	AND WEIGHT <= 80;
/*2. PLAYER 테이블에서 TEAM_ID가 'K03'이고 HEIGHT가 180 미만인 선수 검색*/
SELECT
	*
FROM
	PLAYER
WHERE
	TEAM_ID = 'K03'
	AND HEIGHT < 180;
/*3. PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수 검색*/
SELECT
	*
FROM
	PLAYER
WHERE
	TEAM_ID = 'K06'
	AND NICKNAME = '제리';
/*4. PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름 검색*/
SELECT
	NAME
FROM
	PLAYER
WHERE
	HEIGHT >= 170
	AND WEIGHT >= 80;
/*5. STADIUM 테이블에서 SEAT_COUNT가 30000초과이고 41000이하인 경기장 검색*/
SELECT
	*
FROM
	STADIUM
WHERE
	SEAT_COUNT > 30000
	AND SEAT_COUNT <= 41000;
/*6. PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07'이고 포지션은 'MF'인 선수 검색*/
SELECT
	*
FROM
	PLAYER
WHERE
	(TEAM_ID = 'K02'
		OR TEAM_ID = 'K07')
	AND POSITION = 'MF';
