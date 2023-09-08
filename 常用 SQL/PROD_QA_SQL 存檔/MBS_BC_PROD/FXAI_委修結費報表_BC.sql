SELECT A.slipNo,                                                                            --//[0]���׳渹
       (SELECT LISTAGG(NVL(FS.LABEL,FAT.WORK_TYPE), ',') WITHIN GROUP(ORDER BY FAT.WORK_TYPE)
                FROM FIX_ASSIGN_TYPE FAT , fix_setting fs
                WHERE 1 = 1 
                AND FS.BU_CODE(+) = 'TW'
                AND FS.KEY(+) = 'WORK_TYPE'
                AND FS.VALUE(+) = FAT.WORK_TYPE 
                AND FAT.COMPANY_CODE = A.companyCode
                AND FAT.SLIP_NO = A.slipNo
                AND (FAT.DELETE_FLAG <> 'Y' or FAT.DELETE_FLAG is null )) AS WORK_TYPE ,  
       A.userName,                                                                          --//[1]�Ȥ�W��
       A.userDept,                                                                          --//[2]���W�٤���O
       A.userContact,                                                                       --//[3]�Ȥ��p���H
       A.fixType,                                                                           --//[4]�ץ�ӷ�
       A.serviceType,                                                                       --//[5]�A������
       A.userProvince,                                                                      --//[6]�Ȥῤ��
       A.userCity,                                                                          --//[7]�Ȥ��F��
       A.userAddress,                                                                       --//[8]�Ȥ�a�}
       A.userTel,                                                                           --//[9]�Ȥ��p���H�q��
       A.userMobile,                                                                        --//[10]�Ȥ��p���H���
       A.userEmail,                                                                         --//[11]�Ȥ��p���HEMAILL
       A.custName,                                                                          --//[12]�g�P��
       A.custContact,                                                                       --//[13]�g�P���p���H
       A.custTel,                                                                           --//[14]�g�P���p���H�q��
       A.custMobile,                                                                        --//[15]�g�P���p���H���
       A.custEmail,                                                                         --//[16]�g�P���p���HEMAIL
       A.kindType,                                                                          --//[17]���O�ݩ�
       A.repairType,                                                                        --//[18]�����ݩ�
       A.processDesc,                                                                       --//[19]���A
       A.cancelFlag,                                                                        --//[20]����
       A.pendingFlag,                                                                       --//[21]Pending���A
       A.vendorNo,                                                                          --//[22]��L�s��
       A.brand,                                                                             --//[23]�~�P
       A.csCode,                                                                            --//[24]���~����
       A.productionNo,                                                                      --//[25]��t�Ƹ�
       A.articleNo,                                                                         --//[26]�D������(Model)
       A.sn,                                                                                --//[27]�D���Ǹ�
       A.requestDept,                                                                       --//[28]�ݨD���
       A.requestEmpNo,                                                                      --//[29]�ݨD�H
       A.deptCode,                                                                          --//[30]�I�u���
       A.engineer,                                                                          --//[31]�u�{�v
       A.chargeDeptCode,                                                                    --//[32]�O���k�ݳ��W��
       A.standardWorkTime,                                                                  --//[33]�зǤu��
       A.freightFee,                                                                        --//[34]�~�]��q�O
       A.leadTime,                                                                          --//[35]�~�]�e�m�u��
       A.workTime,                                                                          --//[36]�~�]�I�u�u��
       A.driveTime,                                                                         --//[37]�~�]��q�ɶ�
       NVL(A.leadTime,0)+                                                                   --
       NVL(A.workTime,0)+                                                                   --
       NVL(A.driveTime,0) AS totalWorkTime,                                                 --//[38]�~�]�X�p�u��
       ROUND((SELECT SUM(                                                                   --
       NVL(ROUND(((S.LEAD_END_DATE - S.LEAD_START_DATE) * 24), 2),0) +                      --
       NVL(ROUND(((S.WORK_END_DATE - S.WORK_START_DATE) * 24), 2),0) +                      --
       NVL(ROUND(((S.DRIVE_T_END_DATE - S.DRIVE_T_START_DATE) * 24), 2),0) +                --
       NVL(ROUND(((S.DRIVE_B_END_DATE - S.DRIVE_B_START_DATE) * 24), 2),0)                  --
       )                                                                                    --
                  FROM TBS_MAJ.FIX_SERVICE S                                                --
                  WHERE 1=1                                                                 --
                  AND S.SLIP_NO = A.slipNo                                                  --
                 ),2) AS totalTime,                                                         --//[39]�X�p�u��
                                                                                            --
       A.approvedAmount,                                                                    --//[40]�֩w���B
       A.approvedNote,                                                                      --//[41]�֩w���B
       A.problemDesc,                                                                       --//[42]���D����
       A.remark,                                                                            --//[43]�B�z���e
       A.registerDate,                                                                      --//[44]�����
       A.stockArriveDate,                                                                   --//[45]��f���
       A.appointmentDate,                                                                   --//[46]���w���
       A.approvedDate,                                                                      --//[47]ñ�֤��
       A.assignDate,                                                                        --//[48]���u���
       A.responDate,                                                                        --//[49]�^���ɶ�
       A.responTime,                                                                        --//[50]�^���ɮ�
       A.responseAgingDesc,                                                                 --//[51]�^���ɮĤѼ�
       A.completeDate,                                                                      --//[52]���פ��
       A.completeTimeRange,                                                                 --//[53]���׮ɮ�
       A.completeAgingDesc,                                                                 --//[54]���׮ɮĤѼ�
       A.finishDate,                                                                        --//[55]���u�ɶ�
       A.closeDate,                                                                         --//[56]���׮ɶ�
       A.outMaint,                                                                          --//[57]���ץ~�I���
       A.contractNo,                                                                        --//[58]�X���M�׽s��
       A.warrantyDesc                                                                       --//[59]�O�T���O
       FROM (                                                                               --
 SELECT MT.SLIP_NO AS slipNo,                                                                    --//[0]���׳渹 
        MT.COMPANY_CODE AS companyCode,      
        RG1.NAME AS userName,                                                                    --//[1]�Ȥ�W��
        RG1.DEPT AS userDept,                                                                    --//[2]���W�٤���O
        RG1.CONTACT AS userContact,                                                              --//[3]�Ȥ��p���H
        MT.FIX_TYPE AS fixType,                                                                  --//[4]�ץ�ӷ�
        MT.SERVICE_TYPE AS serviceType,                                                          --//[5]�A������
        RG1.ADDR_PROVINCE AS userProvince,                                                       --//[6]�Ȥῤ��
        RG1.ADDR_CITY AS userCity,                                                               --//[7]�Ȥ��F��
        RG1.ADDR_ZIP || RG1.ADDR_PROVINCE || RG1.ADDR_CITY || RG1.ADDR_OTHER ||                  --
        RG1.ADDR_NOTE AS userAddress,                                                            --//[8]�Ȥ�a�}
        RG1.TEL || case                                                                          --//[9]�Ȥ��p���H�q��
          when RG1.TEL_EXT is not null then                                                      --
           '#' || RG1.TEL_EXT                                                                    --
          else                                                                                   --
           ''                                                                                    --
        end AS userTel,                                                                          --
        RG1.MOBILE AS userMobile,                                                                --//[10]�Ȥ��p���H���
        RG1.EMAIL AS userEmail,                                                                  --//[11]�Ȥ��p���HEMAILL
        RG2.NAME AS custName,                                                                    --//[12]�g�P��
        RG2.CONTACT AS custContact,                                                              --//[13]�g�P���p���H
        RG2.TEL || case                                                                          --//[14]�g�P���p���H�q��
          when RG2.TEL_EXT is not null then                                                      --
           '#' || RG2.TEL_EXT                                                                    --
          else                                                                                   --
           ''                                                                                    --
        end AS custTel,                                                                          --
        RG2.MOBILE AS custMobile,                                                                --//[15]�g�P���p���H���
        RG2.EMAIL AS custEmail,                                                                  --//[16]�g�P���p���HEMAIL
        S1.LABEL AS kindType,                                                                    --//[17]���O�ݩ�
        V1.LABEL || V2.LABEL || V3.LABEL AS repairType,                                          --//[18]�����ݩ�
        PS.PROCESS_DESC AS processDesc,                                                          --//[19]���A
        DECODE(MT.CANCEL_FLAG, 'N', '�_', '') AS cancelFlag,                                      --//[20]����
        DECODE(MT.PENDING_FLAG, 'Y', 'PENDING��', '') AS pendingFlag,                             --//[21]Pending���A
        MT.VENDOR_NO AS vendorNo,                                                                --//[22]��L�s��
        AR.BRAND AS brand,                                                                       --//[23]�~�P
        AR.CS AS csCode,                                                                         --//[24]���~����
        AR.PRODUCTION_NO AS productionNo,                                                        --//[25]��t�Ƹ�
        AR.ARTICLENO AS articleNo,                                                               --//[26]�D������(Model)
        AR.SN AS sn,                                                                             --//[27]�D���Ǹ�
        MT.SALES_DEPT_CODE AS requestDept,                                                       --//[28]�ݨD���
        MT.SALES_EMP_NO AS requestEmpNo,                                                         --//[29]�ݨD�H
        FS.DEPT_CODE AS deptCode,                                                                --//[30]�I�u���
        OEMP.EMP_NO AS engineer,                                                                 --//[31]�u�{�v
        MT.CHARGE_DEPT_CODE AS chargeDeptCode,                                                   --//[32]�O���k�ݳ��W��
        '' as standardWorkTime,                                                                  --//[33]�зǤu��
        SUM(FS.FREIGHT_FEE) AS freightFee,                                                       --//[34]�~�]��q�O
        SUM(NVL(ROUND(((FS.LEAD_END_DATE - FS.LEAD_START_DATE) * 24), 2), 0)) AS leadTime,       --//[35]�~�]�e�m�u��
        SUM(NVL(ROUND(((FS.WORK_END_DATE - FS.WORK_START_DATE) * 24), 2), 0)) AS workTime,       --//[36]�~�]�I�u�u��
        SUM(NVL(ROUND(((FS.DRIVE_T_END_DATE - FS.DRIVE_T_START_DATE) * 24),                      --//[37]�~�]��q�ɶ�
                      2),                                                                        --
                0) + NVL(ROUND(((FS.DRIVE_B_END_DATE - FS.DRIVE_B_START_DATE) * 24),             --
                               2),                                                               --
                         0)) AS driveTime,                                                       --
        ROUND(SUM(FS.TOTAL_TIME) / 60, 2) AS totalWorkTime,                                      --//[38]�~�]�X�p�u��
        '' AS approvedAmount,                                                                    --//[39]�֩w���B
        '' AS approvedNote,                                                                      --//[40]�֩w���B
        MT.SERVICE_DESC AS problemDesc,                                                          --//[41]���D����
        dbms_lob.substr(RK.remark) AS remark,                                                    --//[42]�B�z���e
        TO_CHAR(MT.REGISTER_DATE,'YYYY/MM/DD HH24:MI') AS registerDate,                          --//[43]�����
        '' AS stockArriveDate,                                                                   --//[44]��f���
        TO_CHAR(MT.APPOINTED_DATE,'YYYY/MM/DD HH24:MI') AS appointmentDate,                      --//[45]���w���
        '' AS approvedDate,                                                                      --//[46]ñ�֤��
        TO_CHAR(MT.ASSIGN_DATE,'YYYY/MM/DD HH24:MI') AS assignDate,                              --//[47]���u���
        TO_CHAR(RES.RESPONTIME,'YYYY/MM/DD HH24:MI') AS responDate,                              --//[48]�^���ɶ�
        ROUND((RES.RESPONTIME - MT.REGISTER_DATE) * 24, 2) AS responTime,                        --//[49]�^���ɮ�
        M.RESPONSE_AGING_DESC AS responseAgingDesc,                                              --//[50]�^���ɮĤѼ�
        TO_CHAR(MT.COMPLETED_DATE,'YYYY/MM/DD HH24:MI') AS completeDate,                         --//[51]���פ��
        ROUND((MT.COMPLETED_DATE - MT.REGISTER_DATE) * 24, 2) AS completeTimeRange,              --//[52]���׮ɮ�
        M.COMPLETED_AGING_DESC AS completeAgingDesc,                                             --//[53]���׮ɮĤѼ�
        TO_CHAR(MT.FINISH_DATE,'YYYY/MM/DD HH24:MI') AS finishDate,                              --//[54]���u�ɶ�
        TO_CHAR(MT.CLOSE_DATE,'YYYY/MM/DD HH24:MI') AS closeDate,                                --//[55]���׮ɶ�
        MT.OUT_MAINT AS outMaint,                                                                --//[56]���ץ~�I���
        ML.CONTRACT_NO AS contractNo,                                                            --//[57]�X���M�׽s��
        W.LABEL AS warrantyDesc                                                                  --//[58]�O�T���O
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
                XMLAGG(XMLELEMENT(e, REPLACE('[' || '����' || s.seq || ']' || '[' || FSS.LABEL || ']' || '[' || TO_CHAR(NVL(S.WORK_START_DATE, S.LEAD_START_DATE), 'YYYY/MM/DD HH24:mm') || ']' || s.remark, chr(8), ''), chr(13)).extract('//text()') ORDER BY s.seq)  --
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
           DECODE(MT.CANCEL_FLAG, 'N', '�_', ''),                                                 --
           DECODE(MT.PENDING_FLAG, 'Y', 'PENDING��', ''),                                         --
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
