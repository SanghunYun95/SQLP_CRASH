CREATE TABLE t1
AS SELECT LEVEL AS c1
FROM DUAL
CONNECT BY LEVEL <= 10;

-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Transaction 1

-- Transaction 2
INSERT INTO t1 VALUES (11);
UPDATE t1 SET c1 = 1 WHERE c1 >=6;

COMMIT;
-- Transaction 2

-- Transaction 1
SELECT COUNT (*) FROM t1 WHERE c1 >= 6; --> 결과: 5

INSERT INTO t1 VALUES (12);
COMMIT;
-- 격리수준이 Read Commited
SELECT COUNT (*) FROM t1 WHERE c1 >= 6; --> 결과: 1
-- Transaction 1