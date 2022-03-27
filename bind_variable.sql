CREATE TABLE COVID_COPY
AS 
SELECT * FROM COVID;
/* Table COVID_COPY이(가) 생성되었습니다. */

ALTER TABLE COVID_COPY ADD(row_id int);
/* Table COVID_COPY이(가) 변경되었습니다. */

UPDATE COVID_COPY SET row_id = rownum;
/* 163,240개 행 이(가) 업데이트되었습니다. */

CREATE UNIQUE INDEX c_idx on COVID_COPY(row_id);
/* INDEX C_IDX이(가) 생성되었습니다. */

ANALYZE TABLE COVID_COPY COMPUTE STATISTICS;
/* Table COVID_COPY이(가) 분석되었습니다. */ 

SET AUTOTRACE TRACEONLY EXPLAIN
SELECT row_id FROM COVID_COPY WHERE row_id = 3120;
/*
Table COVID_COPY이(가) 분석되었습니다.

Autotrace TraceOnly
 자동 질의 출력과 함께 성능 통계를 표시합니다.
>>Query Run In:吏덉쓽 寃곌낵

PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                           
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL_ID  dj7q8cbubv4pf, child number 0
-------------------------------------
SELECT row_id FROM COVID_COPY WHERE row_id = 3120
 
Plan hash value: 779968979
 
--------------------------------------------
| Id  | Operation         | Name  | E-Rows |
--------------------------------------------
|   0 | SELECT STATEMENT  |       |        |
|*  1 |  INDEX UNIQUE SCAN| C_IDX |      1 |

PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                           
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("ROW_ID"=3120)
 
Note
-----
   - Warning: basic plan statistics not available. These are only collected when:
       * hint 'gather_plan_statistics' is used for the statement or

PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                           
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
       * parameter 'statistics_level' is set to 'ALL', at session or system level
 

Statistics
-----------------------------------------------------------
               1  CPU used when call started
               2  DB time
               3  Requests to/from client
               3  non-idle wait count
               1  opened cursors cumulative
               1  pinned cursors current
               4  user calls
*/
SET AUTOTRACE OFF
ALTER SYSTEM FLUSH shared_pool;

SET TIMING ON
declare
    type rc is ref cursor;
    l_rc rc;
    l_iso_code covid_copy.iso_code%type;
begin
    for i in 1..100000
    loop
        open l_rc for
            'select /* test1 */ iso_code
            from covid_copy
            where row_id = :x' using i;
        fetch l_rc into l_iso_code;
        close l_rc;
    end loop;
end;
/
/* 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
경과 시간: 00:00:02.642 
*/

SELECT sql_text, loads, parse_calls, executions, fetches
FROM v$sql
WHERE sql_text LIKE '%test1%'
AND sql_text NOT LIKE '%v$sql%'
AND sql_text NOT LIKE 'declare%';
--                    SQL_TEXT                                         LOADS          PARSE_CALLS      EXECUTIONS         FETCHES
-- -------------------------------------------------------------   ---------------  --------------   ---------------    ------------
-- select /* test1 */ iso_code from covid_copy where row_id = :x         1               100000         100000           100000
 
 
 
 declare
    type rc is ref cursor;
    l_rc rc;
    l_iso_code covid_copy.iso_code%type;
begin
    for i in 1..100000
    loop
        open l_rc for
            'select /* test2 */ iso_code
            from covid_copy
            where row_id = ' || i;
        fetch l_rc into l_iso_code;
        close l_rc;
    end loop;
end;
/
/*
PL/SQL 프로시저가 성공적으로 완료되었습니다.
경과 시간: 00:00:36.691
*/

SELECT substr(sql_text, 61), loads, parse_calls, executions, fetches
FROM v$sql
WHERE sql_text LIKE '%test2%'
AND sql_text NOT LIKE '%v$sql%'
AND sql_text NOT LIKE 'declare%'
ORDER BY 1;
/* 인출된 모든 행: 1570*/

/*
SUBSTR(SQL_TEXT,61)      LOADS     PARSE_CALLS    EXECULTIONS    FETCHES
---------------------  ---------   ------------  ------------   --------
where row_id = 100000      1             1           1             1
where row_id = 98432       1             1           1             1
where row_id = 98433       1             1           1             1
...
*/