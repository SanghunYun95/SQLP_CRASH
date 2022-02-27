-- ������ ����
CREATE TABLE �ֹ� (
    ȸ��ID VARCHAR2(3) NOT NULL,
    �ֹ��ݾ� NUMBER(10) NOT NULL,
    CONSTRAINT PK_USER_ID PRIMARY KEY(ȸ��ID)
);

INSERT ALL
    INTO �ֹ� (ȸ��ID, �ֹ��ݾ�) VALUES ('001', 1500)
    INTO �ֹ� (ȸ��ID, �ֹ��ݾ�) VALUES ('002', 2000)
    INTO �ֹ� (ȸ��ID, �ֹ��ݾ�) VALUES ('003', 3000)
SELECT * FROM DUAL;

CREATE TABLE �ý��ۻ���̷� (
    �޴�ID VARCHAR2(1) NOT NULL,
    ��������ڵ� NUMBER(3) NOT NULL,
    ����Ͻ� DATE
);

INSERT ALL
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('1', 100, SYSDATE)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('1', 110, SYSDATE)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('1', 120, SYSDATE)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('1', 120, SYSDATE + 1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('2', 210, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('2', 210, SYSDATE)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('2', 220, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('2', 220, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('2', 230, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('3', 100, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('3', 100, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('3', 100, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('3', 110, SYSDATE-1)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('3', 120, SYSDATE)
    INTO �ý��ۻ���̷� (�޴�ID, ��������ڵ�, ����Ͻ�) VALUES ('3', 130, SYSDATE-1)
SELECT * FROM DUAL;

DROP TABLE �ý��ۻ���̷�;

-- 1
SELECT ȸ��ID, SUM(�ֹ��ݾ�) AS �հ�
FROM �ֹ�
GROUP BY ȸ��ID
HAVING COUNT(*) > 1;

-- 2
SELECT SUM(�ֹ��ݾ�) AS �հ�
FROM �ֹ�
HAVING AVG(�ֹ��ݾ�) > 100;

-- 3
SELECT �޴�ID, ��������ڵ�, COUNT(*) AS CNT
FROM �ý��ۻ���̷�
WHERE ����Ͻ� BETWEEN SYSDATE - 1 AND SYSDATE 
GROUP BY �޴�ID, ��������ڵ�
HAVING �޴�ID = 3 AND ��������ڵ� = 100;

-- 4
SELECT �޴�ID, ��������ڵ�, AVG(COUNT(*)) AS AVGCNT
FROM �ý��ۻ���̷�
GROUP BY �޴�ID, ��������ڵ�;


