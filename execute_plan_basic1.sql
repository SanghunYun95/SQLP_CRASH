-- ���� �ο� (Admin ���� ����)
GRANT SELECT_CATALOG_ROLE to SCOTT;
GRANT SELECT ANY DICTIONARY to SCOTT;

-- ���̺� ����
CREATE TABLE t AS 
SELECT d.no, e.*
FROM emp e
, (SELECT ROWNUM no FROM DUAL CONNECT BY LEVEL <= 1000) d;

-- Index ����
CREATE INDEX t_x01 ON t(deptno, no);
CREATE INDEX t_x02 ON t(deptno, job, no);

-- ������� ����
EXEC dbms_stats.gather_table_stats(user, 't');

-- �����ȹ Ȯ��
SET AUTOTRACE TRACEONLY exp;

SELECT * FROM t
WHERE deptno = 10
AND no = 1;

-- Index t_x02�� ���
SELECT /*+ INDEX(t t_x02) */ * FROM t
WHERE deptno = 10
AND no = 1;

-- Table Full Scan ���
SELECT /*+ FULL(t) */ * FROM t
WHERE deptno = 10
AND no = 1;
