-- 데이터 생성
CREATE TABLE 주문 (
    회원ID VARCHAR2(3) NOT NULL,
    주문금액 NUMBER(10) NOT NULL,
    CONSTRAINT PK_USER_ID PRIMARY KEY(회원ID)
);

INSERT ALL
    INTO 주문 (회원ID, 주문금액) VALUES ('001', 1500)
    INTO 주문 (회원ID, 주문금액) VALUES ('002', 2000)
    INTO 주문 (회원ID, 주문금액) VALUES ('003', 3000)
SELECT * FROM DUAL;

CREATE TABLE 시스템사용이력 (
    메뉴ID VARCHAR2(1) NOT NULL,
    사용유형코드 NUMBER(3) NOT NULL,
    사용일시 DATE
);

INSERT ALL
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('1', 100, SYSDATE)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('1', 110, SYSDATE)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('1', 120, SYSDATE)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('1', 120, SYSDATE + 1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('2', 210, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('2', 210, SYSDATE)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('2', 220, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('2', 220, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('2', 230, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('3', 100, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('3', 100, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('3', 100, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('3', 110, SYSDATE-1)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('3', 120, SYSDATE)
    INTO 시스템사용이력 (메뉴ID, 사용유형코드, 사용일시) VALUES ('3', 130, SYSDATE-1)
SELECT * FROM DUAL;

DROP TABLE 시스템사용이력;

-- 1
SELECT 회원ID, SUM(주문금액) AS 합계
FROM 주문
GROUP BY 회원ID
HAVING COUNT(*) > 1;

-- 2
SELECT SUM(주문금액) AS 합계
FROM 주문
HAVING AVG(주문금액) > 100;

-- 3
SELECT 메뉴ID, 사용유형코드, COUNT(*) AS CNT
FROM 시스템사용이력
WHERE 사용일시 BETWEEN SYSDATE - 1 AND SYSDATE 
GROUP BY 메뉴ID, 사용유형코드
HAVING 메뉴ID = 3 AND 사용유형코드 = 100;

-- 4
SELECT 메뉴ID, 사용유형코드, AVG(COUNT(*)) AS AVGCNT
FROM 시스템사용이력
GROUP BY 메뉴ID, 사용유형코드;


