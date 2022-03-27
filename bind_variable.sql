CREATE TABLE COVID_COPY
AS 
SELECT * FROM COVID;
/* Table COVID_COPY��(��) �����Ǿ����ϴ�. */

ALTER TABLE COVID_COPY ADD(row_id int);
/* Table COVID_COPY��(��) ����Ǿ����ϴ�. */

UPDATE COVID_COPY SET row_id = rownum;
/* 163,240�� �� ��(��) ������Ʈ�Ǿ����ϴ�. */

CREATE UNIQUE INDEX c_idx on COVID_COPY(row_id);
/* INDEX C_IDX��(��) �����Ǿ����ϴ�. */

ANALYZE TABLE COVID_COPY COMPUTE STATISTICS;
/* Table COVID_COPY��(��) �м��Ǿ����ϴ�. */ 

SET AUTOTRACE TRACEONLY EXPLAIN
SELECT row_id FROM COVID_COPY WHERE row_id = 3120;
/*
Table COVID_COPY��(��) �м��Ǿ����ϴ�.

Autotrace TraceOnly
 �ڵ� ���� ��°� �Բ� ���� ��踦 ǥ���մϴ�.
>>Query Run In:질의 결과

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
PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
��� �ð�: 00:00:02.642 
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
PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
��� �ð�: 00:00:36.691
*/

SELECT substr(sql_text, 61), loads, parse_calls, executions, fetches
FROM v$sql
WHERE sql_text LIKE '%test2%'
AND sql_text NOT LIKE '%v$sql%'
AND sql_text NOT LIKE 'declare%'
ORDER BY 1;
/* ����� ��� ��: 1570*/

/*
SUBSTR(SQL_TEXT,61)      LOADS     PARSE_CALLS    EXECULTIONS    FETCHES
---------------------  ---------   ------------  ------------   --------
where row_id = 100000      1             1           1             1
where row_id = 98432       1             1           1             1
where row_id = 98433       1             1           1             1
...
*/