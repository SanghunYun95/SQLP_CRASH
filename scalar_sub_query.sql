-- 스칼라 서브 쿼리

-- emp 테이블 전체를 읽어야 하는 비효율
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

-- 아래와 같이 변경하는 경우,
-- 스칼라 서브쿼리는 하나의 값만 리턴해야 하기때문에 "too many values" 오류 발생
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

-- 아래와 같이 변경하는 경우,
-- emp 테이블을 반복 엑세스하는 비효율 발생
SELECT d.deptno, d.dname
,(SELECT AVG(sal) FROM emp WHERE dptno = d.deptno) AS avg_sal
,(SELECT MIN(sal) FROM emp WHERE dptno = d.deptno) AS min_sal
,(SELECT MAX(sal) FROM emp WHERE dptno = d.deptno) AS max_sal
FROM dept d
WHERE d.loc = 'CHICAGO';

--> JOIN 조건 Push Down 이용: Join 조건절을 View 쿼리 안으로 밀어 넣는다
SELECT deptno, dname
, to_number(substr(sal, 1, 7)) AS avg_sal
, to_number(substr(sal, 8, 7)) AS min_sal
, to_number(substr(sal, 15)) AS max_sal
FROM (
    SELECT d.deptno, d.dname, (SELECT LPAD(AVG(sal), 7) || LPAD(MIN(sal), 7) || MAX(sal) FROM emp WHERE deptno = d.deptno) sal
    FROM dept d
    WHERE d.loc = 'CHICAGO'
);