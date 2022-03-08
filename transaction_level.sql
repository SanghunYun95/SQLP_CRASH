
-- 1
CREATE TABLE t1
AS SELECT LEVEL AS c1
FROM DUAL
CONNECT BY LEVEL <= 10;

-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Transaction 1


-- Transaction 2
-- 2
INSERT INTO t1 VALUES (11);
-- 3
UPDATE t1 SET c1 = 1 WHERE c1 >=6;
-- 4
COMMIT;
-- Transaction 2


-- Transaction 1
-- 5
SELECT COUNT (*) FROM t1 WHERE c1 >= 6; -- 결과: 5
-- 6
INSERT INTO t1 VALUES (12);
-- 7
COMMIT;
-- 격리수준이 Read Commited
-- 8
SELECT COUNT (*) FROM t1 WHERE c1 >= 6; -- 결과: 1
-- Transaction 1





TRUNCATE TABLE t1;
DROP TABLE t1;

