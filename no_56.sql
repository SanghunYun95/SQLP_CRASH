-- Q: 다음중 오류가 발생하는 쿼리는?

-- 1 
SELECT 지역, SUM(매출금액) AS 매출금액
FROM 지역별매출
GROUP BY 지역
ORDER BY 매출금액 DESC;

-- 2
SELECT 지역, 매출금액
FROM 지역별매출
ORDER BY 년 ASC;

-- 3
SELECT 지역, SUM(매출금액) AS 매출금액
FROM 지역별매출
GROUP BY 지역
ORDER BY 년 DESC;

-- 4
SELECT 지역, SUM(매출금액) AS 매출금액
FROM 지역별매출
GROUP BY 지역
HAVING SUM(매출금액) > 1000
ORDER BY COUNT(*) ASC;


-- 정답:
-- 3번 : not a GROUP BY expression

--------------------------------------------------------
-- 데이터 생성
CREATE TABLE 지역별매출 (
    지역 VARCHAR2(6) NOT NULL,
    매출금액 NUMBER(10) NOT NULL,
    년 VARCHAR2(4) NOT NULL
);

INSERT ALL
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('서울', 110000, '2021')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('서울', 100000, '2020')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('서울', 140000, '2019')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('서울', 130000, '2018')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('서울', 120000, '2017')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대전', 60000, '2021')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대전', 50000, '2020')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대전', 90000, '2019')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대전', 80000, '2018')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대전', 70000, '2017')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대구', 70000, '2021')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대구', 80000, '2020')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대구', 100000, '2019')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대구', 90000, '2018')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('대구', 80000, '2017')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('부산', 40000, '2021')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('부산', 40000, '2020')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('부산', 150000, '2019')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('부산', 130000, '2018')
    INTO 지역별매출 (지역, 매출금액, 년) VALUES ('부산', 110000, '2017')
SELECT * FROM DUAL;
