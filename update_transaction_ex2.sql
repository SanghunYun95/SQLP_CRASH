-------------------------- EX.2-----------------
-- TX.1
UPDATE emp SET sal = 2000
WHERE empno = 7788
AND sal = 3300;
-- TX.1

--TX.2
UPDATE emp SET sal = 3000
WHERE empno = 7788
AND sal = 2000;
--TX.2

--TX.1
COMMIT;
--TX.1

--TX.2
COMMIT;
--TX.2

SELECT * FROM emp WHERE empno = 7788;
-------------------------- EX.2-----------------