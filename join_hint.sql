-- NL Join Hint
-- ��ġ I/O �����ȹ
SELECT /*+ ordered use_nl(d) */ e.empno, e.ename, d.dname
FROM emp e, dept d
WHERE d.deptno = e.deptno;

SELECT /*+ leading(e) use_nl(d) */ e.empno, e.ename, d.dname
FROM emp e, dept d
WHERE d.deptno = e.deptno;

-- Sort Merge Join Hint
SELECT /*+ ordered use_merge(e) */ d.deptno, d.dname, e.empno, e.ename
FROM dept d, emp e
WHERE d.deptno = e.deptno;
