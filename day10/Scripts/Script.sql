--- 해당 계정명으로 테이블 생성 후 문제 풀기
--- Orders 테이블 생성
--   OrderID   CustomerID    OrderDate   TotalAmount
--   1   101      2023-06-01   150,000
--   2   102      2023-06-02   200,000
--   3   103      2023-06-03   50,000
--   4   104      2023-06-04   452,000
--
--- Customers 테이블 생성
--   CustomerID   FirstName   LastName   Email
--   101      박      찬호      bch111@abc.com
--   102      손      흥민      ss1234@abc.com
--   103      박      지성      ba7777@abc.com
--   104		홍		길동		hong123@abc.com

CREATE TABLE orders(
ORDERID NUMBER,
CustomerID NUMBER,
OrderDate DATE,
TotalAmount NUMBER,
CONSTRAINT PK_ORDERID PRIMARY KEY (ORDERID),
CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

CREATE TABLE Customers(
CustomerID NUMBER,
FirstName VARCHAR2(1000),
LastName VARCHAR2(1000),
Email VARCHAR2(1000),
CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID) 
);

INSERT INTO Customers VALUES (101,'박','찬호','bch111@abc.com');
INSERT INTO Customers VALUES (102,'손','흥민','ss1234@abc.com');
INSERT INTO Customers VALUES (103,'박','지성','ba7777@abc.com');
INSERT INTO Customers VALUES (104,'홍','길동','hong123@abc.com');

INSERT INTO orders VALUES (1,   101,      '2023-06-01',   150000);
INSERT INTO orders VALUES (2,102    ,  '2023-06-02' ,  200000);
INSERT INTO orders VALUES (3  , 103  ,    '2023-06-03' ,  50000);
INSERT INTO orders VALUES (4,104,'2023-06-04',452000);

SELECT * FROM Customers;
SELECT * FROM orders;
--1. Orders 테이블에서 주문일자가 2023-06-02인 주문번호와 총금액 조회하기
SELECT ORDERID  주문번호,TOTALAMOUNT 총금액 FROM ORDERS o  
WHERE ORDERDATE ='2023-06-02';

--2. Customer테이블에서 ba7777@abc.com인 고객의 성과 이름을 Name으로 조회하기
SELECT FIRSTNAME ||LASTNAME  
FROM CUSTOMERS c 
WHERE EMAIL ='ba7777@abc.com';

--3. Orders 테이블에서 각 고객별로 주문한 총금액 조회
--   [조회결과]
--   CustomerId      TotalAmount
--   101         150,000
--   102         200,000
--   103         50,000
SELECT C.CustomerId, O.TotalAmount FROM Customers C
JOIN ORDERS o
ON O.CUSTOMERID =C.CUSTOMERID ;

--4. Customers 테이블에서 주문한적없는 고객의 성과 이름, Email 조회하기
SELECT FIRSTNAME ||LASTNAME 이름 ,EMAIL 이메일  FROM CUSTOMERS c 
JOIN ORDERS o 
ON C.CUSTOMERID  = O.CUSTOMERID 
WHERE O.ORDERID  IS  NULL;
--4.

--5. Customers 테이블과 Orders 테이블에서 고객의 이름, 이메일, 주문일, 총 주문금액을 조회하기
--   단, 주문일이 가장 최근인 주문 정보만 포함되어야함
SELECT MAX(ORDERDATE)  FROM ORDERS o ; --가장 최근 값

SELECT FIRSTNAME ||LASTNAME 이름, EMAIL 이메일,O.ORDERDATE 주문일 ,O.TOTALAMOUNT 총주문금액
FROM CUSTOMERS c 
JOIN ORDERS o 
ON C.CUSTOMERID  = O.CUSTOMERID 
WHERE O.ORDERDATE = (SELECT MAX(ORDERDATE)  FROM ORDERS o ) ;

--6. Orders 테이블에서 주문금액이 평균 주문금액보다 큰 주문들의 정보를 조회하기
--   단, 평균 주문 금액은 서브쿼리를 사용하여 계산하기
SELECT  * FROM ORDERS o 
WHERE TOTALAMOUNT > (SELECT  AVG(TOTALAMOUNT) FROM ORDERS o ) ;




