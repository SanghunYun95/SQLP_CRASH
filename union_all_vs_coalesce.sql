-- Table 개인고객
CREATE TABLE "개인고객"
("개인번호" VARCHAR2(10 BYTE), "개인고객명" VARCHAR2(20 BYTE));

-- Index 개인고객_PK
CREATE UNIQUE INDEX "개인고객_PK" ON "개인고객" ("개인번호");

-- Constraints for Table 개인고객
ALTER TABLE "개인고객" ADD CONSTRAINT "개인고객_PK" PRIMARY KEY ("개인번호");

-- Table 법인고객
CREATE TABLE "SQLPADMIN"."법인고객"
("법인번호" VARCHAR2(10 BYTE), "법인명" VARCHAR2(20 BYTE));

-- Index 법인고객_PK
CREATE UNIQUE INDEX "법인고객_PK" ON "법인고객" ("법인번호");

-- Constraints for Table 법인고객
ALTER TABLE "법인고객" ADD CONSTRAINT "법인고객_PK" PRIMARY KEY ("법인번호");

-- Table 주문
CREATE TABLE "주문"
("주문번호" VARCHAR2(7 BYTE), "고객구분코드" VARCHAR2(20 BYTE),
"개인법인번호" VARCHAR2(10 BYTE));

-- Index 주문_PK
CREATE UNIQUE INDEX "주문_PK" ON "주문" ("주문번호");

-- Constraints for Table 주문
ALTER TABLE "주문" ADD CONSTRAINT "주문_PK" PRIMARY KEY ("주문번호");

INSERT INTO "개인고객" ("개인번호", "개인고객명") VALUES ('1234', '홍길동');
INSERT INTO "개인고객" ("개인번호", "개인고객명") VALUES ('1356', '곽두팔');
INSERT INTO "개인고객" ("개인번호", "개인고객명") VALUES ('2556', '최민림');

INSERT INTO "법인고객" ("법인번호", "법인명") VALUES ('1122334455', '주)카밀');
INSERT INTO "법인고객" ("법인번호", "법인명") VALUES ('2233445566', '주)해달');

INSERT INTO "주문" ("주문번호", "고객구분코드", "개인법인번호") VALUES ('1100001', '01', '1234');
INSERT INTO "주문" ("주문번호", "고객구분코드", "개인법인번호") VALUES ('1100002', '02', '1122334455');
INSERT INTO "주문" ("주문번호", "고객구분코드", "개인법인번호") VALUES ('1100003', '01', '1356');
INSERT INTO "주문" ("주문번호", "고객구분코드", "개인법인번호") VALUES ('1100004', '01', '2556');
INSERT INTO "주문" ("주문번호", "고객구분코드", "개인법인번호") VALUES ('1100005', '02', '2233445566');

-- UNION ALL
SELECT B.개인고객명
    FROM 주문 A, 개인고객 B
WHERE A.주문번호 = 1100001
    AND A.고객구분코드 = '01'
    AND A.개인법인번호 = B.개인번호

UNION ALL

SELECT B.법인명
    FROM 주문 A, 법인고객 B
WHERE A.주문번호 = 1100001
    AND A.고객구분코드 = '02'
    AND A.개인법인번호 = B.법인번호;
    
    
-- COALESCE
-- 개인번호와 법인번호가 중복되지 않는다는 전제하에
SELECT COALESCE(B.개인고객명, C.법인명) 고객명
FROM 주문 A
LEFT OUTER JOIN 개인고객 B
    ON (A.개인법인번호 = B.개인번호)
LEFT OUTER JOIN 법인고객 C
    ON (A.개인법인번호 = C.법인번호)
WHERE A.주문번호 = 1100001;

-- UNION ALL
SELECT B.개인고객명
    FROM 주문 A, 개인고객 B
WHERE A.주문번호 = 1100009
    AND A.고객구분코드 = '01'
    AND A.개인법인번호 = B.개인번호

UNION ALL

SELECT B.법인명
    FROM 주문 A, 법인고객 B
WHERE A.주문번호 = 1100009
    AND A.고객구분코드 = '02'
    AND A.개인법인번호 = B.법인번호;
 
 -- 만약 조인결과가 없는 경우 NO ROWS 출력
    
    
-- COALESCE
-- 개인번호와 법인번호가 중복되지 않는다는 전제하에
SELECT COALESCE(B.개인고객명, C.법인명) 고객명
FROM 주문 A
LEFT OUTER JOIN 개인고객 B
    ON (A.개인법인번호 = B.개인번호)
LEFT OUTER JOIN 법인고객 C
    ON (A.개인법인번호 = C.법인번호)
WHERE A.주문번호 = 1100009;

-- 만약 조인결과가 없는 경우 NULL ROWS 출력 


SELECT NVL(COALESCE(B.개인고객명, C.법인명),'NULL') 고객명
   FROM 주문 A
LEFT OUTER JOIN 개인고객 B
   ON (A.개인법인번호 = B.개인번호)
LEFT OUTER JOIN 법인고객 C
   ON (A.개인법인번호 = C.법인번호)
WHERE A.주문번호 = 1100009;  

SELECT NVL(U.고객명, 'NULL') AS 결과
FROM(
SELECT B.개인고객명 AS 고객명
    FROM 주문 A, 개인고객 B
WHERE A.주문번호 = 1100009                    
   AND A.고객구분코드 = '01'
   AND A.개인법인번호 = B.개인번호

UNION ALL

SELECT B.법인명 AS 고객명
   FROM 주문 A, 법인고객 B
WHERE A.주문번호 = 1100009                    
   AND A.고객구분코드 = '02'
   AND A.개인법인번호 = B.법인번호) U;
