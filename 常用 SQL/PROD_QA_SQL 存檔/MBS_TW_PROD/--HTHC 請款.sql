--HTHC 請款
select mt.finishtime,
       mt.mtno,
       mt.maint_place,
       mt.serialno,
       rs0.serialno SERIALNO1,
       to_char(mt.registertime, 'yyyy-mm-ddhh24:mi:ss') registertime,
       to_char(mt.receivetime, 'yyyy-mm-ddhh24:mi:ss') receivetime,
       to_char(mt.arrivetime, 'yyyy-mm-ddhh24:mi:ss') arrivetime,
       to_char(mt.quotationtime, 'yyyy-mm-ddhh24:mi:ss') quotationtime,
       to_char(mt.completetime, 'yyyy-mm-ddhh24:mi:ss') completetime,
       to_char(mt.finishtime, 'yyyy-mm-ddhh24:mi:ss') finishtime,
       mt.damagedescriptioncode,
       mt.itemno,
       ma.scscode,
       mt.repaircode,
       mt.engineerempno,
       CASE
         WHEN rg.enduser_contact is not null THEN
          rg.enduser_contact
         WHEN rg.contactperson is not null THEN
          rg.contactperson
         ELSE
          rg.customerabbname
       END AS endusername,
       rg.enduser_mobile,
       DECODE(rg.enduser_phone,
              NULL,
              rg.PHONEAREANUMBER,
              rg.enduser_phone_area_num) enduser_phone_area_num,
       DECODE(rg.enduser_phone, NULL, rg.PHONENUMBER, rg.enduser_phone) enduser_phone,
       to_char(mt.quotationconfirmtime, 'yyyy-mm-ddhh24:mi:ss') quotationconfirmtime,
       rs1.serialno swapserialno,
       rs2.serialno swapserialno1,
       to_char(mt.registertime, 'yymm') registertimeYYMM,
       mt.datecode,
       mt.totalamount,
       mt.discountamount,
       mt.servicetypecode,
       to_char(mt.applypartstime, 'yyyy-mm-ddhh24:mi:ss') applypartstime,
       mt.quotationconfirmflag,
       ma.articleno,
       re.processcode,
       re.status_1,
       rg.register_place,
       rg.customerabbname,
       sm.customercode TPNO,
       mt.registerno,
       mt.companycode,
       rr.vendor_no,
       RPM_PROCESS_DAYS(mt.Companycode, mt.Receivetime, mt.Finishtime, mt.Closetime),
       rr.remark_service
  from rpmrg          rg,
       mstarticle     ma,
       rpmmt          mt,
       rpm_rr      rr,
       somcustomer    sm,
       RMA_EDI_MASTER re,
       RPM_SERIALNO   rs0,
       RPM_SERIALNO   rs1,
       RPM_SERIALNO   rs2
 where 1 = 1
   AND mt.companycode = rs0.companycode(+)
   AND mt.mtno = rs0.mtno(+)
   AND rs0.TYPE(+) = 'SN'
   AND rs0.LINENO(+) = '1'
      ---------------------------------------
   AND mt.companycode = rs1.companycode(+)
   AND mt.mtno = rs1.mtno(+)
   AND rs1.TYPE(+) = 'SO'
   AND rs1.lineno(+) = '1'
      ---------------------------------------
   AND mt.companycode = rs2.companycode(+)
   AND mt.mtno = rs2.mtno(+)
   AND rs2.TYPE(+) = 'SO'
   AND rs2.lineno(+) = '2'
      ---------------------------------------
   and re.prop_code = 'HTCEDX'
   and mt.companycode = re.companycode
   and mt.mtno = re.mt_no
   and re.status_1 is not null
   --and re.status_2 is null --未請款資料
      ---------------------------------------
   and rg.customerabbname = sm.customerabbname(+)
   and rg.registerno = mt.registerno
   and rg.yyyymm = mt.yyyymm
   and rg.companycode = mt.companycode
   and mt.companycode = rr.company_code(+)
   and mt.mtno = rr.mtno(+)
   and mt.itemno = ma.itemno
   and mt.registertime >= TRUNC(sysdate - 90)
   --and mt.finishtime >= to_date('060501' ,'MMddyy')
   --and mt.finishtime < to_date('060614' ,'MMddyy') +1
   --AND MT.MTNO IN ('MT1H903168','MT1H903343')
   
  -- and mt.mtno IN ('MT66930518',
--'MT1H903378','MT1H903343','MT1H903168');

SELECT * FROM RMA_EDI_MASTER  EEE 
WHERE 1=1 
AND EEE.MT_NO IN ('MT1H903168','MT1H903343')
--AND EEE.MT_NO IN ('MT66930518','MT1H903378','MT1H903343','MT1H903168')
AND EEE.CREATE_DATE > TRUNC(SYSDATE - 5)
AND EEE.PROP_CODE='HTCEDX';

SELECT * FROM RMA_BARRIER_CODE_MAPPING WHERE 1=1 AND PROP_CODE='HTC' AND ARTICLE_NO ='U11PLUS透黑128G'


SELECT * FROM RPMDAMAGECODE  CCD  WHERE 1=1 AND CCD.DAMAGEKINDCODE='1' AND CCD.DAMAGETYPECODE='1'
