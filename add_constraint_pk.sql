-- Table 생성
CREATE TABLE PRODUCT
(PROD_ID VARCHAR2(10) NOT NULL
,PROD_NM VARCHAR2(100) NOT NULL
,REG_DT DATE NOT NULL
,REGR_NO NUMBER(10) NULL
);

-- Table 변경, Primary Key 설정
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PK
PRIMARY KEY (PROD_ID);

-- 위 2개의 쿼리를 아래와 같이 한번에 작성 할 수 있다.


-- Table을 생성함과 동시에 Primary Key 설정
CREATE TABLE PRODUCT
(PROD_ID VARCHAR2(10) NOT NULL
,PROD_NM VARCHAR2(100) NOT NULL
,REG_DT DATE NOT NULL
,REGR_NO NUMBER(10) NULL
,CONSTRAINT PRODUCT_PK PRIMARY KEY (PROD_ID)
);