DECLARE

begin

  FOR R1 IN (SELECT ap.emp_no        as EMP_NO,
                    AP.PRESENCE_DATE AS PRESENCE_DATE,
                    AP.START_TIME    AS START_TIME,
                    AP.END_TIME      AS END_TIME,
                    (TO_DATE(AP.PRESENCE_DATE || AP.END_TIME,
                             'YYYYMMDDHH24MI') -
                    TO_DATE(AP.PRESENCE_DATE || AP.START_TIME,
                             'YYYYMMDDHH24MI')) * 24 * 60 AS EXTEND_TIME 
               FROM HRM_AMS_PRESENCE AP, ATT_SHIFT ASH
              WHERE ASH.SHIFT_ID IN ('O', 'H')
                AND ASH.SHIFT_DATE = TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD')
  /*           
     AND (TO_DATE(AP.PRESENCE_DATE || AP.END_TIME,
                             'YYYYMMDDHH24MI') -
                    TO_DATE(AP.PRESENCE_DATE || AP.START_TIME,
                             'YYYYMMDDHH24MI')) * 24 * 60 >= 30
                             */
                AND TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD') >=
                    TO_DATE('010120', 'MMDDYY')
                AND TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD') <
                    TO_DATE('090820', 'MMDDYY') + 1) LOOP
    Dbms_Output.put_line('Sucess=' || R1.EMP_NO || '-' || '日期:' ||
                         R1.PRESENCE_DATE || '開始:' || R1.START_TIME ||
                         '結束:' || R1.END_TIME||'加班時數:');
  end LOOP;
exception
  when others then
    Dbms_Output.put_line('Fail=' );
end;


SELECT * FROM HRM_AMS_PRESENCE AP WHERE LENGTH(AP.START_TIME)<4 
UPDATE HRM_AMS_PRESENCE AP SET AP.START_TIME='0'||AP.START_TIME WHERE LENGTH(AP.START_TIME)<4 

BJ0210
SELECT DISTINCT AP.START_TIME FROM HRM_AMS_PRESENCE AP  WHERE  1=1 AND TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD') >=
                    TO_DATE('010120', 'MMDDYY')
                AND TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD') <
                    TO_DATE('090820', 'MMDDYY') + 1
