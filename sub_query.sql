--��������

-- �����÷� ��������
SELECT TEAM_ID AS ���ڵ�, PLAYER_NAME AS ������, POSITION AS ������,
        BACK_NO AS ��ѹ�, HEIGHT AS Ű
FROM PLAYER
WHERE (TEAM_ID, HEIGHT) 
    IN (
        SELECT TEAM_ID, MIN(HEIGHT) 
        FROM PLAYER 
        GROUP BY TEAM_ID
        )
ORDER BY TEAM_ID, PLAYER_NAME;

-- ���� ��������
SELECT B.TEAM_NAME AS ����, A.PLAYER_NAME AS ������, A.POSITION AS ������,
        A.BACK_NO AS ��ѹ�, A.HEIGHT AS Ű
FROM PLAYER A, TEAM B
WHERE A.HEIGHT < (
                    SELECT AVG(X.HEIGHT)
                    FROM PLAYER X
                    WHERE X.TEAM_ID = A.TEAM_ID
                    GROUP BY X.TEAM_ID
                 )
AND B.TEAM_ID = A.TEAM_ID
ORDER BY ������;