insert into TBS_MAJ.FIX_PART_TIME_WORK (BU_CODE, EMP_DEPT, EMP_NO, SYS_SUB_CODE, SHIFT_ID, SHIFT_START_TIME, SHIFT_END_TIME, START_TIME, END_TIME, SYSTEM_START_TIME, SYSTEM_END_TIME, SYSTEM_HOURS, SYSTEM_DED_HOURS, APPROVED_STATUS, APPROVED_TIME, APPROVED_EMP_NO, APPROVED_HOURS, APPROVED_NORM_HOURS, APPROVED_NORM_OVER_HOURS, APPROVED_REST_OVER_HOURS, APPROVED_HOLIDAY_HOURS, APPROVED_ALW_HOURS, CREATE_COMPANY_CODE, CREATE_DATE, CREATE_EMP_NO, UPDATE_COMPANY_CODE, UPDATE_DATE, UPDATE_EMP_NO, BATCH_NO, REST_DAY)
values ('TW', '330', 'P4908', '62', 'LD', to_date('25-05-2021 15:30:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 00:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-05-2021 15:14:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 00:02:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-05-2021 15:30:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 00:00:00', 'dd-mm-yyyy hh24:mi:ss'), 8.50, 0.00, 'O', null, '', null, null, null, null, null, null, '00', SYSDATE, 'SYS', '00', SYSDATE, 'SYS', 'P210500468', 'N');

insert into TBS_MAJ.FIX_PART_TIME_WORK (BU_CODE, EMP_DEPT, EMP_NO, SYS_SUB_CODE, SHIFT_ID, SHIFT_START_TIME, SHIFT_END_TIME, START_TIME, END_TIME, SYSTEM_START_TIME, SYSTEM_END_TIME, SYSTEM_HOURS, SYSTEM_DED_HOURS, APPROVED_STATUS, APPROVED_TIME, APPROVED_EMP_NO, APPROVED_HOURS, APPROVED_NORM_HOURS, APPROVED_NORM_OVER_HOURS, APPROVED_REST_OVER_HOURS, APPROVED_HOLIDAY_HOURS, APPROVED_ALW_HOURS, CREATE_COMPANY_CODE, CREATE_DATE, CREATE_EMP_NO, UPDATE_COMPANY_CODE, UPDATE_DATE, UPDATE_EMP_NO, BATCH_NO, REST_DAY)
values ('TW', '330', 'P4908', '62', 'LD', to_date('26-05-2021 15:30:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-05-2021 00:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 15:22:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 22:39:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 15:30:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-05-2021 22:30:00', 'dd-mm-yyyy hh24:mi:ss'), 7.0, 0.00, 'O', null, '', null, null, null, null, null, null, '00', SYSDATE, 'SYS', '00', SYSDATE, 'SYS', 'P210500469', 'N');
-- TPNONEW 給號
SELECT * FROM SYS_SLIP_SEQ_NO SE WHERE SE.VOUCHER_ID ='P' AND SE.YY ='21' AND SE.MM ='05'

UPDATE TBS_MAJ.SYS_SLIP_SEQ_NO SE SET SE.VOUCHER_NO = SE.VOUCHER_NO+2 WHERE SE.VOUCHER_ID ='P' AND SE.YY ='21' AND SE.MM ='05'

SELECT * FROM TBS_MAJ.FIX_PART_TIME_WORK PT WHERE PT.BATCH_NO LIKE '%21050046%'



-- 查詢SQl

SELECT AP.EMP_NO, --//0-人員
       FE.SYS_SUB_CODE, --//1-職類
       SH.SHIFT_ID, --//2-班別
       TO_DATE(AP.PRESENCE_DATE || SHT.START_TIME, 'YYYYMMDDHH24MI') AS SHIFT_START_TIME, --//3-班別開始時間
       AP.START_TIME,
       AP.END_TIME,
       SHT.START_TIME,
       SHT.END_TIME,
       CASE                                                                           -- 
       WHEN NVL(TO_NUMBER(SHT.START_TIME), 0) >                                  --
            NVL(TO_NUMBER(SHT.END_TIME), 0) THEN                                 --
        TO_DATE(AP.PRESENCE_DATE || SHT.END_TIME, 'YYYYMMDDHH24MI') + 1          --
       ELSE                                                                      --
        TO_DATE(AP.PRESENCE_DATE || SHT.END_TIME, 'YYYYMMDDHH24MI')              --
     END AS SHIFT_END_TIME,                                                      --//4-班別結束時間
     NVL2(AP.START_TIME,                                                         --
          TO_DATE(AP.PRESENCE_DATE || AP.START_TIME, 'YYYYMMDDHH24MI'),          --
          '') AS AP_START_TIME,                                                  --//5-出勤開始時間
     CASE                                                                        --
       WHEN NVL(TO_NUMBER(AP.START_TIME), 0) >                                   --
            NVL(TO_NUMBER(AP.END_TIME), 0) THEN                                  --
        NVL2(AP.END_TIME,                                                        --
             TO_DATE(AP.PRESENCE_DATE || AP.END_TIME, 'YYYYMMDDHH24MI'),         --
             '') + 1                                                             --
       ELSE                                                                      --
        NVL2(AP.END_TIME,                                                        --
             TO_DATE(AP.PRESENCE_DATE || AP.END_TIME, 'YYYYMMDDHH24MI'),         --
             '')                                                                 --
     END AS AP_END_TIME                                                          --  //6-出勤結束時間  
       
  FROM HRM_AMS_PRESENCE AP, --
       FIX_EMPDATA      FE, --
       ATT_SHIFT        SH, --
       ATT_SHIFT_TYPE   SHT --
 WHERE 1 = 1 --
   AND AP.EMP_NO = FE.EMP_NO --
   AND AP.EMP_NO = SH.EMP_NO(+) --
   AND TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD') = SH.SHIFT_DATE(+) --
   AND SH.BU_ID = SHT.BU_ID(+) --
   AND SH.SHIFT_ID = SHT.SHIFT_ID(+) --
   AND AP.START_TIME IS NOT NULL --
   AND FE.EMP_TYPE IN ('5') --
   AND TO_DATE(AP.PRESENCE_DATE, 'YYYYMMDD') > TRUNC(SYSDATE - 26) --
      
   AND NOT EXISTS --
 (SELECT 1 --
          FROM FIX_PART_TIME_WORK PT --
         WHERE 1 = 1 --
           AND PT.EMP_NO = AP.EMP_NO --
           AND TO_CHAR(PT.START_TIME, 'YYYYMMDD') = AP.PRESENCE_DATE --
           AND TRUNC(PT.START_TIME) > TRUNC(SYSDATE - 26) --
        ) --
   AND EXISTS (SELECT 1 --
          FROM FIX_DUTY_DEPT DD, FIX_ORG_RELATION_GRP ORG --
         WHERE DD.DEPT_CODE IN
               ('LA', 'L2', '48', 'L1', '68', 'RC', '7T', '34') --
           AND DD.DUTY_DEPT_ORG_OID = ORG.ORG_OID --
           AND DD.BU_CODE = ORG.BU_ID --
           AND ORG.EMP_NO = FE.EMP_NO) --
 ORDER BY AP.EMP_NO, AP.PRESENCE_DATE --
   
