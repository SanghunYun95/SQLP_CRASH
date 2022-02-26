-- Ȩ���� ������ �����ϴ� ������� ������ȣ�� ��ȭ��ȣ�� Ȩ���� ������ȣ�� ��ȭ��ȣ�� �����Ѵ�.
-- ���̺� TEAM�� 2�� ��ȸ�ϰ� �־� ��ȿ����
UPDATE STADIUM A
    SET (A.DDD, A.TEL) = (
                            SELECT X.DDD, X.TEL
                            FROM TEAM X
                            WHERE X.TEAM_ID = A.HOMETEAM_ID
                            );
WHERE EXISTS (
                SELECT 1
                FROM TEAM X
                WHERE X.TEAM_ID = A.HOMETEAM_ID
                );
                
-- MERGE�� ���
MERGE
   INTO STADUIM T
USING TEAM S
   ON (T.TEAM_ID = S.HOMETEAM_ID)
WHEN MATCHED THEN
    UPDATE
        SET     T.DDD = S.DDD
            ,   T.TEL = S.TEL;

                