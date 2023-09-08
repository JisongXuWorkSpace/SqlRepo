--HTHS 進度
SELECT *
  from (select mt.mtno,
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
               CASE WHEN rg.enduser_contact is not null THEN rg.enduser_contact
               WHEN rg.contactperson is not null THEN rg.contactperson
               ELSE rg.customerabbname END AS  endusername,
               rg.enduser_mobile,
               DECODE(rg.enduser_phone , NULL , rg.PHONEAREANUMBER, rg.enduser_phone_area_num) enduser_phone_area_num,
               DECODE(rg.enduser_phone , NULL , rg.PHONENUMBER, rg.enduser_phone) enduser_phone,
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
               decode(mt.processcode, '9', '9', decode(mt.processcode, 'C', 'C', decode(mt.processcode, 'X', 'X', '3'))) as processcode,
               re.status_1,
               rg.register_place,
               rg.customerabbname,
               sm.customercode TPNO,
　　　         mt.registerno,
　　　         mt.companycode,
           mt.fault_desc,
           rg.vendorno,
           rg.register_func_code,
           to_char(mt.closetime, 'yyyy-mm-ddhh24:mi:ss') closetime,
           rr.remark_service
          from rpmrg rg,
               mstarticle ma,
               rpmmt mt,
               somcustomer sm,
               RMA_EDI_MASTER re,
               RPM_SERIALNO rs0,
               RPM_SERIALNO rs1,
               RPM_SERIALNO rs2,
               rpm_rr rr
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
           and re.prop_code(+) = 'HTCEDX'
           and mt.companycode = re.companycode(+)
           and mt.mtno = re.mt_no(+)
           ---------------------------------------
           and rg.customerabbname = sm.customerabbname(+)
           AND mt.companycode = rr.company_code(+)
           AND mt.mtno = rr.mtno(+)
           and rg.registerno = mt.registerno
           and rg.yyyymm = mt.yyyymm
           and rg.companycode = mt.companycode
           and (mt.damagedescriptioncode is not null
           or (rg.REGISTER_FUNC_CODE = 'HTHR' and mt.processcode = 'X' and mt.damagedescriptioncode is null))
           and mt.itemno = ma.itemno
           and ma.brandcode in ('HTC')
           and ma.scscode in ('AC','CJ','CM','CW','HN','TB','TC','TT','YC')
           and mt.servicetypecode not in ('5')
           and mt.processcode >= '3'
           and ma.articleno not in (select table_field_value from MST_BUSINESS_RULE where table_name = 'HTCEDX' and table_field = 'NO_DATATRANS')
           and mt.REGISTERTIME >= TRUNC(sysdate -90)
           --and mt.processcode >= 'X'
           --and mt.mtno in ('MT1H903168','MT1H903343')
           ) gg
where 1 = 1
   and ((gg.status_1 is null and gg.processcode in ('9', 'C'))
    or ((gg.register_place in ('1H','2H','4H','6H','7H') or gg.customerabbname in ('HTC_RC'))
    and (((gg.status_1 is null and processcode not in ('X') and gg.register_func_code not in ('HTHR'))
    or (gg.status_1 is null and gg.register_func_code = 'HTHR'))
  or (gg.processcode in ('9', 'C', 'X') and gg.status_1 not in ('9', 'C', 'X')))))
  --覆修註記=Y&報價註記=Y(人損)&非HTC_RC或掛號地點非店中店的案件(2H,4H,6H,7H) 降低覆修率
  and not exists(select * from rpmmt mt, rpmrg rg, rma_edi_master re
            where 1=1 and mt.companycode = gg.companycode
            and mt.mtno = gg.mtno and mt.companycode = rg.companycode and mt.registerno = rg.registerno
            and mt.repeatmark='Y' and mt.quotationmark='Y' and re.status_1 is null
            and mt.companycode = re.companycode(+)
            and mt.mtno = re.mt_no(+)
            and rg.register_place not  in ('1H','2H','4H','6H','7H')
        and rg.customerabbname not  in ('HTC_RC')
			);
