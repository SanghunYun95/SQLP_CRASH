CREATE TABLE PRODUCT
(PROD_ID VARCHAR2(10) NOT NULL
,PROD_NM VARCHAR2(100) NOT NULL
,REG_DT DATE NOT NULL
,REGR_NO NUMBER(10) NULL
,CONSTRAINT PRODUCT_PK PRIMARY KEY (PROD_ID)
);

CREATE TABLE PRODUCT
(PROD_ID VARCHAR2(10) NOT NULL
,PROD_NM VARCHAR2(100) NOT NULL
,REG_DT DATE NOT NULL
,REGR_NO NUMBER(10) NULL
);

ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PK
PRIMARY KEY (PROD_ID);