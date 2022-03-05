-- ��Į�� ���� ����

-- emp ���̺� ��ü�� �о�� �ϴ� ��ȿ��
SELECT d.deptno
    , d.dname
    , avg_sal
    , min_sal
    , max_sal
FROM dept d 
    RIGHT OUTER JOIN
    (
        SELECT deptno
            , AVG(sal) AS avg_sal
            , MIN(sal) AS min_sal
            , MAX(sal) AS max_sal 
        FROM emp 
        GROUP BY deptno
    ) e
ON e.deptno = d.deptno
WHERE d.loc = 'CHICAGO';

-- �Ʒ��� ���� �����ϴ� ���,
-- ��Į�� ���������� �ϳ��� ���� �����ؾ� �ϱ⶧���� "too many values" ���� �߻�
SELECT d.deptno
    , d.dname
    , (
        SELECT AVG(sal)
            , MIN(sal)
            , MAX(sal) 
        FROM emp
        WHERE deptno = d.deptno
        )
FROM dept d
WHERE d.loc = 'CHICAGO';

-- �Ʒ��� ���� �����ϴ� ���,
-- emp ���̺��� �ݺ� �������ϴ� ��ȿ�� �߻�
SELECT d.deptno, d.dname
,(SELECT AVG(sal) FROM emp WHERE dptno = d.deptno) AS avg_sal
,(SELECT MIN(sal) FROM emp WHERE dptno = d.deptno) AS min_sal
,(SELECT MAX(sal) FROM emp WHERE dptno = d.deptno) AS max_sal
FROM dept d
WHERE d.loc = 'CHICAGO';

--> JOIN ���� Push Down �̿�: Join �������� View ���� ������ �о� �ִ´�
SELECT deptno, dname
, to_number(substr(sal, 1, 7)) AS avg_sal
, to_number(substr(sal, 8, 7)) AS min_sal
, to_number(substr(sal, 15)) AS max_sal
FROM (
    SELECT d.deptno, d.dname, (SELECT LPAD(AVG(sal), 7) || LPAD(MIN(sal), 7) || MAX(sal) FROM emp WHERE deptno = d.deptno) sal
    FROM dept d
    WHERE d.loc = 'CHICAGO'
);