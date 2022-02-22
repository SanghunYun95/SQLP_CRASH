--서브쿼리

-- 다중컬럼 서브쿼리
SELECT TEAM_ID AS 팀코드, PLAYER_NAME AS 선수명, POSITION AS 포지션,
        BACK_NO AS 백넘버, HEIGHT AS 키
FROM PLAYER
WHERE (TEAM_ID, HEIGHT) 
    IN (
        SELECT TEAM_ID, MIN(HEIGHT) 
        FROM PLAYER 
        GROUP BY TEAM_ID
        )
ORDER BY TEAM_ID, PLAYER_NAME;

-- 연관 서브쿼리
SELECT B.TEAM_NAME AS 팀명, A.PLAYER_NAME AS 선수명, A.POSITION AS 포지션,
        A.BACK_NO AS 백넘버, A.HEIGHT AS 키
FROM PLAYER A, TEAM B
WHERE A.HEIGHT < (
                    SELECT AVG(X.HEIGHT)
                    FROM PLAYER X
                    WHERE X.TEAM_ID = A.TEAM_ID
                    GROUP BY X.TEAM_ID
                 )
AND B.TEAM_ID = A.TEAM_ID
ORDER BY 선수명;