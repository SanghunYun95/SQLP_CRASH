-- Table ���ΰ�
CREATE TABLE "���ΰ�"
("���ι�ȣ" VARCHAR2(10 BYTE), "���ΰ���" VARCHAR2(20 BYTE));

-- Index ���ΰ�_PK
CREATE UNIQUE INDEX "���ΰ�_PK" ON "���ΰ�" ("���ι�ȣ");

-- Constraints for Table ���ΰ�
ALTER TABLE "���ΰ�" ADD CONSTRAINT "���ΰ�_PK" PRIMARY KEY ("���ι�ȣ");

-- Table ���ΰ�
CREATE TABLE "SQLPADMIN"."���ΰ�"
("���ι�ȣ" VARCHAR2(10 BYTE), "���θ�" VARCHAR2(20 BYTE));

-- Index ���ΰ�_PK
CREATE UNIQUE INDEX "���ΰ�_PK" ON "���ΰ�" ("���ι�ȣ");

-- Constraints for Table ���ΰ�
ALTER TABLE "���ΰ�" ADD CONSTRAINT "���ΰ�_PK" PRIMARY KEY ("���ι�ȣ");

-- Table �ֹ�
CREATE TABLE "�ֹ�"
("�ֹ���ȣ" VARCHAR2(7 BYTE), "�������ڵ�" VARCHAR2(20 BYTE),
"���ι��ι�ȣ" VARCHAR2(10 BYTE));

-- Index �ֹ�_PK
CREATE UNIQUE INDEX "�ֹ�_PK" ON "�ֹ�" ("�ֹ���ȣ");

-- Constraints for Table �ֹ�
ALTER TABLE "�ֹ�" ADD CONSTRAINT "�ֹ�_PK" PRIMARY KEY ("�ֹ���ȣ");

INSERT INTO "���ΰ�" ("���ι�ȣ", "���ΰ���") VALUES ('1234', 'ȫ�浿');
INSERT INTO "���ΰ�" ("���ι�ȣ", "���ΰ���") VALUES ('1356', '������');
INSERT INTO "���ΰ�" ("���ι�ȣ", "���ΰ���") VALUES ('2556', '�ֹθ�');

INSERT INTO "���ΰ�" ("���ι�ȣ", "���θ�") VALUES ('1122334455', '��)ī��');
INSERT INTO "���ΰ�" ("���ι�ȣ", "���θ�") VALUES ('2233445566', '��)�ش�');

INSERT INTO "�ֹ�" ("�ֹ���ȣ", "�������ڵ�", "���ι��ι�ȣ") VALUES ('1100001', '01', '1234');
INSERT INTO "�ֹ�" ("�ֹ���ȣ", "�������ڵ�", "���ι��ι�ȣ") VALUES ('1100002', '02', '1122334455');
INSERT INTO "�ֹ�" ("�ֹ���ȣ", "�������ڵ�", "���ι��ι�ȣ") VALUES ('1100003', '01', '1356');
INSERT INTO "�ֹ�" ("�ֹ���ȣ", "�������ڵ�", "���ι��ι�ȣ") VALUES ('1100004', '01', '2556');
INSERT INTO "�ֹ�" ("�ֹ���ȣ", "�������ڵ�", "���ι��ι�ȣ") VALUES ('1100005', '02', '2233445566');

-- UNION ALL
SELECT B.���ΰ���
    FROM �ֹ� A, ���ΰ� B
WHERE A.�ֹ���ȣ = 1100001
    AND A.�������ڵ� = '01'
    AND A.���ι��ι�ȣ = B.���ι�ȣ

UNION ALL

SELECT B.���θ�
    FROM �ֹ� A, ���ΰ� B
WHERE A.�ֹ���ȣ = 1100001
    AND A.�������ڵ� = '02'
    AND A.���ι��ι�ȣ = B.���ι�ȣ;
    
    
-- COALESCE
-- ���ι�ȣ�� ���ι�ȣ�� �ߺ����� �ʴ´ٴ� �����Ͽ�
SELECT COALESCE(B.���ΰ���, C.���θ�) ����
FROM �ֹ� A
LEFT OUTER JOIN ���ΰ� B
    ON (A.���ι��ι�ȣ = B.���ι�ȣ)
LEFT OUTER JOIN ���ΰ� C
    ON (A.���ι��ι�ȣ = C.���ι�ȣ)
WHERE A.�ֹ���ȣ = 1100001;

-- UNION ALL
SELECT B.���ΰ���
    FROM �ֹ� A, ���ΰ� B
WHERE A.�ֹ���ȣ = 1100009
    AND A.�������ڵ� = '01'
    AND A.���ι��ι�ȣ = B.���ι�ȣ

UNION ALL

SELECT B.���θ�
    FROM �ֹ� A, ���ΰ� B
WHERE A.�ֹ���ȣ = 1100009
    AND A.�������ڵ� = '02'
    AND A.���ι��ι�ȣ = B.���ι�ȣ;
 
 -- ���� ���ΰ���� ���� ��� NO ROWS ���
    
    
-- COALESCE
-- ���ι�ȣ�� ���ι�ȣ�� �ߺ����� �ʴ´ٴ� �����Ͽ�
SELECT COALESCE(B.���ΰ���, C.���θ�) ����
FROM �ֹ� A
LEFT OUTER JOIN ���ΰ� B
    ON (A.���ι��ι�ȣ = B.���ι�ȣ)
LEFT OUTER JOIN ���ΰ� C
    ON (A.���ι��ι�ȣ = C.���ι�ȣ)
WHERE A.�ֹ���ȣ = 1100009;

-- ���� ���ΰ���� ���� ��� NULL ROWS ��� 

