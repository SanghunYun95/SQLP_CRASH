-- 권한 부여 (Admin 계정 접속)
GRANT SELECT_CATALOG_ROLE to SCOTT;
GRANT SELECT ANY DICTIONARY to SCOTT;

-- 테이블 생성
CREATE TABLE t AS 
SELECT d.no, e.*
FROM emp e
, (SELECT ROWNUM no FROM DUAL CONNECT BY LEVEL <= 1000) d;

-- Index 생성
CREATE INDEX t_x01 ON t(deptno, no);
CREATE INDEX t_x02 ON t(deptno, job, no);

-- 통계정보 수집
EXEC dbms_stats.gather_table_stats(user, 't');

-- 실행계획 확인
SET AUTOTRACE TRACEONLY exp;

SELECT * FROM t
WHERE deptno = 10
AND no = 1;

-- Index t_x02를 사용
SELECT /*+ INDEX(t t_x02) */ * FROM t
WHERE deptno = 10
AND no = 1;

-- Table Full Scan 사용
SELECT /*+ FULL(t) */ * FROM t
WHERE deptno = 10
AND no = 1;
