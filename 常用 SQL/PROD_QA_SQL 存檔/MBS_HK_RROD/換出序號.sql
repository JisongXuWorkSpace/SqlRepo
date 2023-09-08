-- 換出序號

MTNO:MT3Q939325
序號:SY6V2I9000109




select SERIAL_NO,SERIAL_NO_2,SWAP_OUT_SERIAL_NO,SWAP_OUT_SERIAL_NO_2 from rpm_fact_repair where mt_no='MT3Q939325' AND TO_DATE(YYYY_MM,'YYYY_MM') > TO_DATE('2010_01','YYYY_MM');
select SERIAL_NO,SERIAL_NO_2,SWAP_OUT_SERIAL_NO,SWAP_OUT_SERIAL_NO_2 from rpm_fact_repair_now where mt_no='MT3Q939325';

SELECT * FROM RPMMT WHERE  MTNO='MT3Q939325';
SELECT * FROM rpm_fact_repair WHERE MT_NO='MT3Q939325'AND item_no='8E517';
SELECT * FROM rpm_fact_repair_NOW WHERE MT_NO='MT3Q939325';
SELECT* FROM RPM_SERIALNO WHERE MTNO='MT3Q939325';
 
--機器序號(查詢)
select SERIALNO from DBS_MAJ.RPMMT where 1=1 and companycode='HK' and mtno='MT3Q939325';
--機器序號(調整或清空)
update DBS_MAJ.RPMMT set SERIALNO='SY6V2I9000109' where 1=1 and companycode='HK' and mtno='MT3Q939325' ;
--機器序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SERIAL_NO='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325' AND item_no='8E517';
--機器序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SERIAL_NO='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325' AND item_no='8E517';

--機器序號2
--機器序號2(查詢SN_1)
select SERIALNO from DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SN' and LINENO='1' and companycode='HK' and mtno='MT3Q939325';
--機器序號2(調整SN_1)
update DBS_MAJ.RPM_SERIALNO set SERIALNO='FA2BMMJ00978', STATUS_CODE='O' where 1=1 and TYPE='SN' and LINENO='1' and companycode='HK' and mtno='MT4F414645';
--機器序號2(刪除.清空SN_1)
delete DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SN' and LINENO='1' and companycode='HK' and mtno='MT4F414645';
--機器序號2(新增SN_1)
insert into DBS_MAJ.rpm_serialno (COMPANYCODE, MTNO, ITEMNO, SERIALNO, TYPE, LINENO, STATUS_CODE, CREATE_DATE, CREATE_EMP_NO, UPDATE_DATE, UPDATE_EMP_NO) values ('HK', 'MT964M1259', 'Y0915', 'SCGLMC4B1700084', 'SN', 1, 'O', sysdate, 'SYS', sysdate, 'SYS');
--機器序號2(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SERIAL_NO_2='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325';
--機器序號2(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SERIAL_NO_2='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325';

換出序號1
--換出序號(查詢SO_1)
select SERIALNO from DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='1' and companycode='HK' and mtno='MT3Q939325';
--換出序號(調整SO_1)
update DBS_MAJ.RPM_SERIALNO set SERIALNO='A1000032CDC64B', STATUS_CODE='O',REMARK_INHERIT_FLAG='O' where 1=1 and TYPE='SO' and LINENO='1' and companycode='HK' and mtno='MT4F414645';
--換出序號(刪除.清空SO_1)
delete DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='1' and companycode='HK' and mtno='MT4F414645';
--換出序號(新增SO_1)
insert into DBS_MAJ.rpm_serialno (COMPANYCODE, MTNO, ITEMNO, SERIALNO, TYPE, LINENO, STATUS_CODE, REMARK_INHERIT_FLAG, CREATE_DATE, CREATE_EMP_NO, UPDATE_DATE, UPDATE_EMP_NO) values ('HK', 'MT964M1259', 'Y0915', 'SCGLMC4B1700084', 'SO', 1, 'O', 'O', sysdate, 'SYS', sysdate, 'SYS');
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SWAP_OUT_SERIAL_NO='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325';
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SWAP_OUT_SERIAL_NO='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325';
--如欲更改的換出序號已存在於 ivcplserialno 或 ivcplserialno_all ，需一起更改(非換貨類:MT#/換貨類:R-#)
UPDATE DBS_MAJ.ivcplserialno_all SET SERIALNO = 'CN52C4G09P',UPPERSERIALNO = 'CN52C4G09P' WHERE VOUCHERNO = 'MTAE546130' AND SERIALNO='CN52C4G03P';
UPDATE DBS_MAJ.ivcplserialno SET SERIALNO = 'CN52C4G09P',UPPERSERIALNO = 'CN52C4G09P' WHERE VOUCHERNO = 'MTAE546130' AND SERIALNO='CN52C4G03P';

換出序號2
--換出序號2(查詢SO_2)
select SERIALNO from DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='2' and companycode='HK' and mtno='MT3Q939325';
--換出序號2(調整SO_2)
update DBS_MAJ.RPM_SERIALNO set SERIALNO='FA2BMMJ00978', STATUS_CODE='O' where 1=1 and TYPE='SO' and LINENO='2' and companycode='HK' and mtno='MT4F414645';
--換出序號2(刪除.清空SO_2)
delete DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='2' and companycode='HK' and mtno='MT4F414645';
--換出序號2(新增SO_2)
insert into DBS_MAJ.rpm_serialno (COMPANYCODE, MTNO, ITEMNO, SERIALNO, TYPE, LINENO, STATUS_CODE, CREATE_DATE, CREATE_EMP_NO, UPDATE_DATE, UPDATE_EMP_NO) values ('HK', 'MT964M1259', 'Y0915', 'SCGLMC4B1700084', 'SO', 2, 'O', sysdate, 'SYS', sysdate, 'SYS');
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SWAP_OUT_SERIAL_NO_2='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325';
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SWAP_OUT_SERIAL_NO_2='SY6V2I9000109' where 1=1 and company_code='HK' and mt_no='MT3Q939325'; 



