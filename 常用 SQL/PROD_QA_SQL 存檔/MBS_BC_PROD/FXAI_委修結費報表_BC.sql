SELECT A.slipNo,                                                                            --//[0]維修單號
       (SELECT LISTAGG(NVL(FS.LABEL,FAT.WORK_TYPE), ',') WITHIN GROUP(ORDER BY FAT.WORK_TYPE)
                FROM FIX_ASSIGN_TYPE FAT , fix_setting fs
                WHERE 1 = 1 
                AND FS.BU_CODE(+) = 'TW'
                AND FS.KEY(+) = 'WORK_TYPE'
                AND FS.VALUE(+) = FAT.WORK_TYPE 
                AND FAT.COMPANY_CODE = A.companyCode
                AND FAT.SLIP_NO = A.slipNo
                AND (FAT.DELETE_FLAG <> 'Y' or FAT.DELETE_FLAG is null )) AS WORK_TYPE ,  
       A.userName,                                                                          --//[1]客戶名稱
       A.userDept,                                                                          --//[2]單位名稱分行別
       A.userContact,                                                                       --//[3]客戶聯絡人
       A.fixType,                                                                           --//[4]案件來源
       A.serviceType,                                                                       --//[5]服務類型
       A.userProvince,                                                                      --//[6]客戶縣市
       A.userCity,                                                                          --//[7]客戶行政區
       A.userAddress,                                                                       --//[8]客戶地址
       A.userTel,                                                                           --//[9]客戶聯絡人電話
       A.userMobile,                                                                        --//[10]客戶聯絡人手機
       A.userEmail,                                                                         --//[11]客戶聯絡人EMAILL
       A.custName,                                                                          --//[12]經銷商
       A.custContact,                                                                       --//[13]經銷商聯絡人
       A.custTel,                                                                           --//[14]經銷商聯絡人電話
       A.custMobile,                                                                        --//[15]經銷商聯絡人手機
       A.custEmail,                                                                         --//[16]經銷商聯絡人EMAIL
       A.kindType,                                                                          --//[17]類別屬性
       A.repairType,                                                                        --//[18]維修屬性
       A.processDesc,                                                                       --//[19]狀態
       A.cancelFlag,                                                                        --//[20]取消
       A.pendingFlag,                                                                       --//[21]Pending狀態
       A.vendorNo,                                                                          --//[22]其他編號
       A.brand,                                                                             --//[23]品牌
       A.csCode,                                                                            --//[24]產品分類
       A.productionNo,                                                                      --//[25]原廠料號
       A.articleNo,                                                                         --//[26]主機型號(Model)
       A.sn,                                                                                --//[27]主機序號
       A.requestDept,                                                                       --//[28]需求單位
       A.requestEmpNo,                                                                      --//[29]需求人
       A.deptCode,                                                                          --//[30]施工單位
       A.engineer,                                                                          --//[31]工程師
       A.chargeDeptCode,                                                                    --//[32]費用歸屬單位名稱
       A.standardWorkTime,                                                                  --//[33]標準工時
       A.freightFee,                                                                        --//[34]外包交通費
       A.leadTime,                                                                          --//[35]外包前置工時
       A.workTime,                                                                          --//[36]外包施工工時
       A.driveTime,                                                                         --//[37]外包交通時間
       NVL(A.leadTime,0)+                                                                   --
       NVL(A.workTime,0)+                                                                   --
       NVL(A.driveTime,0) AS totalWorkTime,                                                 --//[38]外包合計工時
       ROUND((SELECT SUM(                                                                   --
       NVL(ROUND(((S.LEAD_END_DATE - S.LEAD_START_DATE) * 24), 2),0) +                      --
       NVL(ROUND(((S.WORK_END_DATE - S.WORK_START_DATE) * 24), 2),0) +                      --
       NVL(ROUND(((S.DRIVE_T_END_DATE - S.DRIVE_T_START_DATE) * 24), 2),0) +                --
       NVL(ROUND(((S.DRIVE_B_END_DATE - S.DRIVE_B_START_DATE) * 24), 2),0)                  --
       )                                                                                    --
                  FROM TBS_MAJ.FIX_SERVICE S                                                --
                  WHERE 1=1                                                                 --
                  AND S.SLIP_NO = A.slipNo                                                  --
                 ),2) AS totalTime,                                                         --//[39]合計工時
                                                                                            --
       A.approvedAmount,                                                                    --//[40]核定金額
       A.approvedNote,                                                                      --//[41]核定金額
       A.problemDesc,                                                                       --//[42]問題說明
       A.remark,                                                                            --//[43]處理內容
       A.registerDate,                                                                      --//[44]填單日期
       A.stockArriveDate,                                                                   --//[45]到貨日期
       A.appointmentDate,                                                                   --//[46]約定日期
       A.approvedDate,                                                                      --//[47]簽核日期
       A.assignDate,                                                                        --//[48]派工日期
       A.responDate,                                                                        --//[49]回應時間
       A.responTime,                                                                        --//[50]回應時效
       A.responseAgingDesc,                                                                 --//[51]回應時效天數
       A.completeDate,                                                                      --//[52]完修日期
       A.completeTimeRange,                                                                 --//[53]完修時效
       A.completeAgingDesc,                                                                 --//[54]完修時效天數
       A.finishDate,                                                                        --//[55]完工時間
       A.closeDate,                                                                         --//[56]結案時間
       A.outMaint,                                                                          --//[57]維修外點單位
       A.contractNo,                                                                        --//[58]合約專案編號
       A.warrantyDesc                                                                       --//[59]保固類別
       FROM (                                                                               --
 SELECT MT.SLIP_NO AS slipNo,                                                                    --//[0]維修單號 
        MT.COMPANY_CODE AS companyCode,      
        RG1.NAME AS userName,                                                                    --//[1]客戶名稱
        RG1.DEPT AS userDept,                                                                    --//[2]單位名稱分行別
        RG1.CONTACT AS userContact,                                                              --//[3]客戶聯絡人
        MT.FIX_TYPE AS fixType,                                                                  --//[4]案件來源
        MT.SERVICE_TYPE AS serviceType,                                                          --//[5]服務類型
        RG1.ADDR_PROVINCE AS userProvince,                                                       --//[6]客戶縣市
        RG1.ADDR_CITY AS userCity,                                                               --//[7]客戶行政區
        RG1.ADDR_ZIP || RG1.ADDR_PROVINCE || RG1.ADDR_CITY || RG1.ADDR_OTHER ||                  --
        RG1.ADDR_NOTE AS userAddress,                                                            --//[8]客戶地址
        RG1.TEL || case                                                                          --//[9]客戶聯絡人電話
          when RG1.TEL_EXT is not null then                                                      --
           '#' || RG1.TEL_EXT                                                                    --
          else                                                                                   --
           ''                                                                                    --
        end AS userTel,                                                                          --
        RG1.MOBILE AS userMobile,                                                                --//[10]客戶聯絡人手機
        RG1.EMAIL AS userEmail,                                                                  --//[11]客戶聯絡人EMAILL
        RG2.NAME AS custName,                                                                    --//[12]經銷商
        RG2.CONTACT AS custContact,                                                              --//[13]經銷商聯絡人
        RG2.TEL || case                                                                          --//[14]經銷商聯絡人電話
          when RG2.TEL_EXT is not null then                                                      --
           '#' || RG2.TEL_EXT                                                                    --
          else                                                                                   --
           ''                                                                                    --
        end AS custTel,                                                                          --
        RG2.MOBILE AS custMobile,                                                                --//[15]經銷商聯絡人手機
        RG2.EMAIL AS custEmail,                                                                  --//[16]經銷商聯絡人EMAIL
        S1.LABEL AS kindType,                                                                    --//[17]類別屬性
        V1.LABEL || V2.LABEL || V3.LABEL AS repairType,                                          --//[18]維修屬性
        PS.PROCESS_DESC AS processDesc,                                                          --//[19]狀態
        DECODE(MT.CANCEL_FLAG, 'N', '否', '') AS cancelFlag,                                      --//[20]取消
        DECODE(MT.PENDING_FLAG, 'Y', 'PENDING中', '') AS pendingFlag,                             --//[21]Pending狀態
        MT.VENDOR_NO AS vendorNo,                                                                --//[22]其他編號
        AR.BRAND AS brand,                                                                       --//[23]品牌
        AR.CS AS csCode,                                                                         --//[24]產品分類
        AR.PRODUCTION_NO AS productionNo,                                                        --//[25]原廠料號
        AR.ARTICLENO AS articleNo,                                                               --//[26]主機型號(Model)
        AR.SN AS sn,                                                                             --//[27]主機序號
        MT.SALES_DEPT_CODE AS requestDept,                                                       --//[28]需求單位
        MT.SALES_EMP_NO AS requestEmpNo,                                                         --//[29]需求人
        FS.DEPT_CODE AS deptCode,                                                                --//[30]施工單位
        OEMP.EMP_NO AS engineer,                                                                 --//[31]工程師
        MT.CHARGE_DEPT_CODE AS chargeDeptCode,                                                   --//[32]費用歸屬單位名稱
        '' as standardWorkTime,                                                                  --//[33]標準工時
        SUM(FS.FREIGHT_FEE) AS freightFee,                                                       --//[34]外包交通費
        SUM(NVL(ROUND(((FS.LEAD_END_DATE - FS.LEAD_START_DATE) * 24), 2), 0)) AS leadTime,       --//[35]外包前置工時
        SUM(NVL(ROUND(((FS.WORK_END_DATE - FS.WORK_START_DATE) * 24), 2), 0)) AS workTime,       --//[36]外包施工工時
        SUM(NVL(ROUND(((FS.DRIVE_T_END_DATE - FS.DRIVE_T_START_DATE) * 24),                      --//[37]外包交通時間
                      2),                                                                        --
                0) + NVL(ROUND(((FS.DRIVE_B_END_DATE - FS.DRIVE_B_START_DATE) * 24),             --
                               2),                                                               --
                         0)) AS driveTime,                                                       --
        ROUND(SUM(FS.TOTAL_TIME) / 60, 2) AS totalWorkTime,                                      --//[38]外包合計工時
        '' AS approvedAmount,                                                                    --//[39]核定金額
        '' AS approvedNote,                                                                      --//[40]核定金額
        MT.SERVICE_DESC AS problemDesc,                                                          --//[41]問題說明
        dbms_lob.substr(RK.remark) AS remark,                                                    --//[42]處理內容
        TO_CHAR(MT.REGISTER_DATE,'YYYY/MM/DD HH24:MI') AS registerDate,                          --//[43]填單日期
        '' AS stockArriveDate,                                                                   --//[44]到貨日期
        TO_CHAR(MT.APPOINTED_DATE,'YYYY/MM/DD HH24:MI') AS appointmentDate,                      --//[45]約定日期
        '' AS approvedDate,                                                                      --//[46]簽核日期
        TO_CHAR(MT.ASSIGN_DATE,'YYYY/MM/DD HH24:MI') AS assignDate,                              --//[47]派工日期
        TO_CHAR(RES.RESPONTIME,'YYYY/MM/DD HH24:MI') AS responDate,                              --//[48]回應時間
        ROUND((RES.RESPONTIME - MT.REGISTER_DATE) * 24, 2) AS responTime,                        --//[49]回應時效
        M.RESPONSE_AGING_DESC AS responseAgingDesc,                                              --//[50]回應時效天數
        TO_CHAR(MT.COMPLETED_DATE,'YYYY/MM/DD HH24:MI') AS completeDate,                         --//[51]完修日期
        ROUND((MT.COMPLETED_DATE - MT.REGISTER_DATE) * 24, 2) AS completeTimeRange,              --//[52]完修時效
        M.COMPLETED_AGING_DESC AS completeAgingDesc,                                             --//[53]完修時效天數
        TO_CHAR(MT.FINISH_DATE,'YYYY/MM/DD HH24:MI') AS finishDate,                              --//[54]完工時間
        TO_CHAR(MT.CLOSE_DATE,'YYYY/MM/DD HH24:MI') AS closeDate,                                --//[55]結案時間
        MT.OUT_MAINT AS outMaint,                                                                --//[56]維修外點單位
        ML.CONTRACT_NO AS contractNo,                                                            --//[57]合約專案編號
        W.LABEL AS warrantyDesc                                                                  --//[58]保固類別
   FROM TBS_MAJ.BI_FIX_MT M,                                                                     --
        TBS_MAJ.FIX_RG RG2,                                                                      --
        TBS_MAJ.FIX_RG RG1,                                                                      --
        TBS_MAJ.FIX_MT MT,                                                                       --
        TBS_MAJ.FIX_ARTICLE AR,                                                                  --
        TBS_MAJ.SOM_CONTRACT_MT_LIST ML,                                                         --
        TBS_MAJ.FIX_SETTING S1,                                                                  --
        TBS_MAJ.FIX_SETTING V1,                                                                  --
        TBS_MAJ.FIX_SETTING V2,                                                                  --
        TBS_MAJ.FIX_SETTING V3,                                                                  --
        TBS_MAJ.FIX_SETTING W,                                                                   --
        TBS_MAJ.FIX_SERVICE FS,                                                                  --
        TBS_MAJ.FIX_PROCESS_CODE PS,                                                             --
        TBS_MAJ.FIX_EMPDATA EMP1,                                                                --
        (SELECT S.COMPANY_CODE,                                                                  --
                S.SLIP_NO,                                                                       --
                XMLAGG(XMLELEMENT(e, REPLACE('[' || '項次' || s.seq || ']' || '[' || FSS.LABEL || ']' || '[' || TO_CHAR(NVL(S.WORK_START_DATE, S.LEAD_START_DATE), 'YYYY/MM/DD HH24:mm') || ']' || s.remark, chr(8), ''), chr(13)).extract('//text()') ORDER BY s.seq)  --
                .getClobVal() remark                                                             --
           FROM TBS_MAJ.FIX_SERVICE S,                                                           --
                TBS_MAJ.FIX_MT      MT,                                                          --
                TBS_MAJ.FIX_SETTING FSS                                                          --
          where S.REMARK IS NOT NULL                                                             --
            AND S.COMPANY_CODE = MT.COMPANY_CODE                                                 --
            AND S.SLIP_NO = MT.SLIP_NO                                                           --
            AND S.SOLUTIONS_CODE = FSS.VALUE                                                     --
            AND FSS.BU_CODE(+) ='TW'                                                          --
            AND FSS.KEY(+) = 'SOLUTION'  
            AND MT.PROCESS_CODE IN ('9','C')                                                         --
AND MT.completed_date >= TO_DATE( '071622','MMDDYY') --
AND MT.completed_date < TO_DATE( '081522','MMDDYY')+1 --
            AND EXISTS (SELECT 1                                                                 --
                   FROM TBS_MAJ.FIX_ORG_RELATION_GRP GG                                          --
                  WHERE 1 = 1                                                                    --
                    AND GG.BU_ID ='TW'                                                          --
                    AND GG.EMP_NO = S.EMP_NO                                                     --
                    AND GG.RESORCE_FLAG = '3')                                                   --
          GROUP BY S.COMPANY_CODE, S.SLIP_NO) RK,                                                --
        (SELECT FS.COMPANY_CODE, FS.SLIP_NO, FS.CREATE_DATE AS RESPONTIME                        --
           FROM (SELECT S.COMPANY_CODE, S.SLIP_NO, S.CREATE_DATE                                 --
                   FROM TBS_MAJ.FIX_SERVICE S                                                    --
                  WHERE S.SEQ = 1) FS) RES,                                                      --
        (SELECT SE.COMPANY_CODE, SE.SLIP_NO, SE.EMP_NO                                           --
           FROM (SELECT S.SLIP_NO,                                                               --
                        S.COMPANY_CODE,                                                          --
                        S.EMP_NO,                                                                --
                        ROW_NUMBER() OVER(PARTITION BY S.SLIP_NO ORDER BY S.WORK_END_DATE DESC) AS FS_ROW --
                   FROM TBS_MAJ.FIX_SERVICE S                                                    --
                                                                                                 --
  WHERE EXISTS (SELECT 1                                                                         --
         FROM FIX_ORG_RELATION_GRP GG                                                            --
        WHERE 1 = 1                                                                              --
          AND GG.BU_ID = 'TW'                                                                    --
          AND GG.EMP_NO = S.EMP_NO                                                               --
         AND GG.RESORCE_FLAG = '3')                                                              --
                 ) SE                                                                            --
          WHERE 1 = 1                                                                            --
            AND SE.FS_ROW = 1) OEMP                                                              --
  WHERE 1 = 1                                                                                    --
    AND MT.COMPANY_CODE = OEMP.COMPANY_CODE(+)                                                   --
    AND MT.SLIP_NO = OEMP.SLIP_NO(+)                                                             --
    AND MT.COMPANY_CODE = RES.COMPANY_CODE(+)                                                    --
    AND MT.SLIP_NO = RES.SLIP_NO(+)                                                              --
    AND MT.COMPANY_CODE = RK.COMPANY_CODE(+)                                                     --
    AND MT.SLIP_NO = RK.SLIP_NO(+)                                                               --
    AND MT.COMPANY_CODE = RG2.COMPANY_CODE                                                       --
    AND MT.SLIP_NO = RG2.SLIP_NO                                                                 --
    AND MT.COMPANY_CODE = RG1.COMPANY_CODE                                                       --
    AND MT.SLIP_NO = RG1.SLIP_NO                                                                 --
    AND RG2.TYPE = 'CUST'                                                                        --
    AND RG1.TYPE = 'USER'                                                                        --
    AND MT.COMPANY_CODE = AR.COMPANY_CODE(+)                                                     --
    AND MT.SLIP_NO = AR.SLIP_NO(+)                                                               --
    AND M.COMPANY_CODE(+) = MT.COMPANY_CODE                                                      --
    AND M.SLIP_NO(+) = MT.SLIP_NO                                                                --
    AND MT.SLIP_NO = ML.SLIP_NO(+)                                                               --
    AND MT.COMPANY_CODE = FS.COMPANY_CODE                                                        --
    AND MT.SLIP_NO = FS.SLIP_NO                                                                  --

    AND EXISTS (SELECT 1                                                                         --
           FROM FIX_ORG_RELATION_GRP GG                                                          --
          WHERE 1 = 1                                                                            --
            AND GG.BU_ID = 'TW'                                                               --
            AND GG.EMP_NO = FS.EMP_NO                                                            --
            AND GG.RESORCE_FLAG = '3')                                                           --
    AND NOT EXISTS                                                                               --
  (SELECT 1                                                                                      --
           FROM FIX_ORG_RELATION_GRP GG                                                          --
          WHERE 1 = 1                                                                            --
            AND GG.BU_ID = 'TW'                                                               --
            AND GG.EMP_NO = FS.EMP_NO                                                            --
            AND GG.RESORCE_FLAG IN ('1', '2'))                                                   --
    AND MT.KIND_TYPE = S1.VALUE                                                                  --
    AND S1.KEY = 'KIND_TYPE'                                                                     --
    AND MT.REPAIR_TYPE_1 = V1.VALUE(+)                                                           --
    AND MT.REPAIR_TYPE_2 = V2.VALUE(+)                                                           --
    AND MT.REPAIR_TYPE_3 = V3.VALUE(+)                                                           --
    AND AR.WARRANTY_CODE = W.VALUE(+)                                                            --
    AND W.KEY(+) = 'WARRANTY_CODE'                                                               --
    AND V1.KEY(+) = 'REPAIR_TYPE'                                                                --
    AND V2.KEY(+) = 'REPAIR_TYPE_LV2'                                                            --
    AND V3.KEY(+) = 'REPAIR_TYPE_LV3'                                                            --
    AND V1.BU_CODE(+) = 'TW'                                                                  --
    AND V2.BU_CODE(+) = 'TW'                                                                  --
    AND V3.BU_CODE(+) = 'TW'                                                                  --
    AND S1.BU_CODE = 'TW'                                                                     --
    AND W.BU_CODE(+) = 'TW'                                                                   --
    AND MT.PROCESS_CODE = PS.PROCESS_CODE                                                        --
    AND PS.DISPLAY = 'Y'                                                                         --
    AND PS.BU_CODE = 'TW'                                                                     --
    AND MT.SALES_EMP_NO = EMP1.EMP_NO(+)                                                         --
    AND EMP1.BU_ID(+) = 'TW'                                                                  --
    AND MT.completed_date >= TO_DATE( '071622','MMDDYY') --
   AND MT.completed_date < TO_DATE( '081522','MMDDYY')+1 --           
   AND MT.PROCESS_CODE IN ('9','C')                                                                                   --
  GROUP BY MT.SLIP_NO,                                                                           --
           MT.COMPANY_CODE,
           WORK_TYPE,
           RG1.NAME,                                                                             --
           RG1.DEPT,                                                                             --
           RG1.CONTACT,                                                                          --
           MT.FIX_TYPE,                                                                          --
           MT.SERVICE_TYPE,                                                                      --
           RG1.ADDR_PROVINCE,                                                                    --
           RG1.ADDR_CITY,                                                                        --
           RG1.ADDR_ZIP || RG1.ADDR_PROVINCE || RG1.ADDR_CITY ||                                 --
           RG1.ADDR_OTHER || RG1.ADDR_NOTE,                                                      --
           RG1.TEL || case                                                                       --
             when RG1.TEL_EXT is not null then                                                   --
              '#' || RG1.TEL_EXT                                                                 --
             else                                                                                --
              ''                                                                                 --
           end,                                                                                  --
           RG1.MOBILE,                                                                           --
           RG1.EMAIL,                                                                            --
           RG2.NAME,                                                                             --
           RG2.CONTACT,                                                                          --
           RG2.TEL || case                                                                       --
             when RG2.TEL_EXT is not null then                                                   --
              '#' || RG2.TEL_EXT                                                                 --
             else                                                                                --
              ''                                                                                 --
           end,                                                                                  --
           RG2.MOBILE,                                                                           --
           RG2.EMAIL,                                                                            --
           S1.LABEL,                                                                             --
           V1.LABEL || V2.LABEL || V3.LABEL,                                                     --
           PS.PROCESS_DESC,                                                                      --
           DECODE(MT.CANCEL_FLAG, 'N', '否', ''),                                                 --
           DECODE(MT.PENDING_FLAG, 'Y', 'PENDING中', ''),                                         --
           MT.VENDOR_NO,                                                                         --
           AR.BRAND,                                                                             --
           AR.CS,                                                                                --
           AR.PRODUCTION_NO,                                                                     --
           AR.ARTICLENO,                                                                         --
           AR.SN,                                                                                --
           MT.SALES_DEPT_CODE,                                                                   --
           MT.SALES_EMP_NO,                                                                      --
           FS.DEPT_CODE,                                                                         --
           OEMP.EMP_NO,                                                                          --
           MT.CHARGE_DEPT_CODE,                                                                  --
           MT.SERVICE_DESC,                                                                      --
           dbms_lob.substr(RK.remark),                                                           --
           MT.REGISTER_DATE,                                                                     --
           MT.APPOINTED_DATE,                                                                    --
           MT.ASSIGN_DATE,                                                                       --
           RES.RESPONTIME,                                                                       --
           ROUND((RES.RESPONTIME - MT.REGISTER_DATE) * 24, 2),                                   --
           M.RESPONSE_AGING_DESC,                                                                --
           MT.COMPLETED_DATE,                                                                    --
           ROUND((MT.COMPLETED_DATE - MT.REGISTER_DATE) * 24, 2),                                --
           M.COMPLETED_AGING_DESC,                                                               --
           MT.FINISH_DATE,                                                                       --
           MT.CLOSE_DATE,                                                                        --
           MT.OUT_MAINT,                                                                         --
           ML.CONTRACT_NO,                                                                       --
           W.LABEL  ) A                                                                           --
           WHERE 1=1
          -- AND A.slipNo = 'S220713030'
           ORDER BY TRUNC(TO_DATE(completeDate,'YYYY/MM/DD HH24:MI'), 'MONTH') ,deptCode, registerDate        --
