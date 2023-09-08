-- 新增拜訪工單紀錄

   
  SELECT EMP_NO,
         OPERATION_TYPE,
         APP_TIME,
         WORK_START_TIME,
         LOCATION,
         MT_COMPANY_CODE,
         MT_SLIP_NO,
         LOCATION_REMARK,
         REMARK,
         B.COMPANY_CODE,
         B.SLIP_NO,
         B.FIX_TYPE,
         C.FIX_TYPE,
         A.ROW_NO ,
      A.ROW_NO_2
    FROM (SELECT GR.CREATE_EMP_NO AS EMP_NO,
                 '04' AS OPERATION_TYPE, --到達
                 GR.RECORD_DATE AS APP_TIME,
                 GR.RECORD_DATE AS WORK_START_TIME,
                 GR.LATITUDE || ',' || GR.LONGITUDE AS LOCATION,
                 (SELECT DISTINCT MT.COMPANY_CODE
                    FROM TBS_MAJ.FIX_MT MT
                   WHERE 1 = 1
                     AND VM.REF_NO = MT.SLIP_NO) AS MT_COMPANY_CODE,
                 VM.REF_NO AS MT_SLIP_NO,
                 VM.VISIT_NO AS LOCATION_REMARK,
                 ROW_NUMBER() OVER(PARTITION BY GR.CREATE_EMP_NO, GR.RECORD_DATE ORDER BY GR.REF_NO) AS ROW_NO,
                 1 AS ROW_NO_2,
                 NULL AS REMARK,
                 VM.REF_NO AS REF_NO
            FROM DBS_MAJ.SYS_GPS_RECORD GR, DBS_MAJ.SOM_VISIT_MASTER VM
           WHERE 1 = 1
             AND GR.REF_NO = VM.VISIT_NO
             AND GR.RECORD_TYPE = '1' --到達
             AND VM.FUNC_TYPE = 'SE_APP'
             AND GR.CREATE_DATE >= TRUNC(SYSDATE-10)    
             AND NOT EXISTS (SELECT 1
                    FROM TBS_MAJ.FIX_APP_EMP_LOCATION EL
                   WHERE 1 = 1
                     AND EL.EMP_NO = GR.CREATE_EMP_NO
                     AND EL.APP_TIME = GR.RECORD_DATE
                     AND EL.OPERATION_TYPE = '04' --到達
                  )
          union
          SELECT GR.CREATE_EMP_NO AS EMP_NO,
                 '06' AS OPERATION_TYPE, --完成
                 GR.RECORD_DATE AS APP_TIME,
                 GR2.RECORD_DATE AS WORK_START_TIME,
                 GR.LATITUDE || ',' || GR.LONGITUDE AS LOCATION,
                 (SELECT DISTINCT MT.COMPANY_CODE
                    FROM TBS_MAJ.FIX_MT MT
                   WHERE 1 = 1
                     AND VM.REF_NO = MT.SLIP_NO) AS MT_COMPANY_CODE,
                 VM.REF_NO AS MT_SLIP_NO,
                 VM.VISIT_NO AS LOCATION_REMARK,
                 ROW_NUMBER() OVER(PARTITION BY GR.CREATE_EMP_NO, GR.RECORD_DATE ORDER BY GR.REF_NO) AS ROW_NO,
                 ROW_NUMBER() OVER(PARTITION BY GR2.CREATE_EMP_NO, GR2.RECORD_DATE ORDER BY GR2.REF_NO) AS ROW_NO_2,
                 NULL AS REMARK,
                 VM.REF_NO AS REF_NO
            FROM DBS_MAJ.SYS_GPS_RECORD   GR,
                 DBS_MAJ.SOM_VISIT_MASTER VM,
                 DBS_MAJ.SYS_GPS_RECORD   GR2
           WHERE 1 = 1
             AND GR.REF_NO = VM.VISIT_NO
             AND GR.RECORD_TYPE = '2' --完成
             AND NOT EXISTS (SELECT 1
                    FROM TBS_MAJ.FIX_APP_EMP_LOCATION EL
                   WHERE 1 = 1
                     AND EL.EMP_NO = GR.CREATE_EMP_NO
                     AND EL.APP_TIME = GR.RECORD_DATE
                     AND EL.OPERATION_TYPE = '06' --完成
                  )
             AND GR.CREATE_DATE >= TRUNC(SYSDATE-10)     
             AND GR2.RECORD_TYPE = '1' --到達 
             AND GR.REF_NO = GR2.REF_NO
             AND VM.FUNC_TYPE = 'SE_APP'
          union
          SELECT VR.CREATE_EMP_NO AS EMP_NO,
                 '05' AS OPERATION_TYPE, --處理紀錄
                 VR.CREATE_DATE AS APP_TIME,
                 GR.RECORD_DATE AS WORK_START_TIME,
                 NULL AS LOCATION,
                 (SELECT DISTINCT MT.COMPANY_CODE
                    FROM TBS_MAJ.FIX_MT MT
                   WHERE 1 = 1
                     AND VM.REF_NO = MT.SLIP_NO) AS MT_COMPANY_CODE,
                 VM.REF_NO AS MT_SLIP_NO,
                 VM.VISIT_NO AS LOCATION_REMARK,
                 ROW_NUMBER() OVER(PARTITION BY VR.CREATE_EMP_NO, VR.CREATE_DATE ORDER BY VR.CREATE_DATE DESC) AS ROW_NO,
                 ROW_NUMBER() OVER(PARTITION BY GR.CREATE_EMP_NO, GR.RECORD_DATE ORDER BY GR.REF_NO) AS ROW_NO_2,
                 VR.CONTENT AS REMARK,
                 VM.REF_NO AS REF_NO
            FROM DBS_MAJ.SOM_VISIT_RECORD VR,
                 DBS_MAJ.SOM_VISIT_MASTER VM,
                 DBS_MAJ.SYS_GPS_RECORD   GR
           WHERE 1 = 1
             AND VR.VISIT_NO = VM.VISIT_NO
             AND GR.REF_NO = VM.VISIT_NO
             AND GR.RECORD_TYPE = '1' --到達 
             AND VM.FUNC_TYPE = 'SE_APP'
             AND VR.CREATE_DATE >= TRUNC(SYSDATE-10)
             AND NOT EXISTS (SELECT 1
                    FROM TBS_MAJ.FIX_APP_EMP_LOCATION EL
                   WHERE 1 = 1
                     AND EL.EMP_NO = VR.CREATE_EMP_NO
                     AND EL.APP_TIME = VR.CREATE_DATE
                     AND EL.OPERATION_TYPE = '05' --處理紀錄
                  )
            ) A , FIX_MT B , FIX_MT C
   WHERE 1 = 1
     AND A.ROW_NO = '1'
     AND A.ROW_NO_2 = '1'
     AND A.LOCATION_REMARK = B.SOURCE_NO(+)
      AND A.REF_NO = C.SLIP_NO(+)
     AND (A.MT_SLIP_NO IS NOT NULL OR B.SLIP_NO IS NOT NULL)
    
    
     
     
