
-- ���� ����Ʈ�� �̿��� IN
-- JOB�� MANAGER�̸鼭 20�� �μ��� ���ϰų�
-- JOB�� CLERK�̸鼭 30�� �μ��� ���ϴ� ����� ����
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE (JOB, DEPTNO) IN (('MANAGER', 20), ('CLERK', 30));

-- �Ʒ��ʹ� �ٸ� ���
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB IN('MANAGER', 'CLERK') AND DEPTNO IN (20, 30);