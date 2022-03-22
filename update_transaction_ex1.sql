-------------------------- EX.1-----------------
SHOW AUTOCOMMIT;
SELECT * FROM emp WHERE empno = 7788; 
-- initial sal value: 3000

-- TX1
UPDATE EMP SET sal = sal + 100
WHERE empno = 7788;
-- TX1

-- TX2
UPDATE emp SET sal = sal + 200
WHERE empno = 7788;
-- TX2

-- TX1
COMMIT;
-- TX1

-- TX2
COMMIT;
-- TX2

SELECT * FROM emp WHERE empno = 7788;
-------------------------- EX.1-----------------