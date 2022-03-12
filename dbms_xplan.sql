-- PLAN TABLE
@$ORACLE_HOME/rdbms/admin/utlxpls.sql
@?/rdbms/admin/utlxpls.sql

SELECT *
FROM all_synonyms
WHERE synonym_name = 'PLAN_TABLE';


EXPLAIN PLAN FOR
SELECT * FROM emp WHERE empno = 7900;


SET LINESIZE 200
@$ORACLE_HOME/rdbms/admin/utlxpls

-- VERSION CEHCK
select * from v$version;

-- DBMS_XPLAN
SET LINESIZE 130
SET PAGESIZE 0
SELECT * FROM table(DBMS_XPLAN.DISPLAY);

-- SET PARAMETERS
EXPLAIN PLAN SET statement_id = 'SI0001' FOR
SELECT * FROM emp WHERE ename = 'KING';

SET LINESIZE 130
SET PAGESIZE 0
SELECT * FROM table(DBMS_XPLAN.DISPLAY('PLAN_TABLE', 'SI0001')); 

SELECT * FROM table(DBMS_XPLAN.DISPLAY('PLAN_TABLE', null, 'BASIC')); 
SELECT * FROM table(DBMS_XPLAN.DISPLAY('PLAN_TABLE', null, 'BASIC ROWS BYTES COST')); 

-- Parallel
ALTER TABLE emp PARALLEL;

EXPLAIN PLAN for
SELECT /*+ ordered use_has(d) full(d) full(e) noparallel(d) parallel(e 4)*/ 
count(*), min(sal), sum(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.ename    ='hermann'
ORDER BY e.empno;
   
SET LINESIZE 130
SET PAGESIZE 0
SELECT * FROM table(DBMS_XPLAN.DISPLAY);   