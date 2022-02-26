-- 홈팀의 정보가 존재하는 경기장의 지역번호와 전화번호를 홈팀의 지역번호와 전화번호로 수정한다.
-- 테이블 TEAM을 2번 조회하고 있어 비효율적
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
                
-- MERGE문 사용
MERGE
   INTO STADUIM T
USING TEAM S
   ON (T.TEAM_ID = S.HOMETEAM_ID)
WHEN MATCHED THEN
    UPDATE
        SET     T.DDD = S.DDD
            ,   T.TEL = S.TEL;

                