-- 換出序號
517026671KDL4091

--機器序號(查詢)
select SERIALNO from DBS_MAJ.RPMMT where 1=1 and companycode='20' and mtno='MT7H450339';
--機器序號(調整或清空)
update DBS_MAJ.RPMMT set SERIALNO='FA324PN05975' where 1=1 and companycode='20' and mtno='MT7H450339';
--機器序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SERIAL_NO='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';
--機器序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SERIAL_NO='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';

--機器序號2
--機器序號2(查詢SN_1)
select SERIALNO from DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SN' and LINENO='1' and companycode='20' and mtno='MT4F414645';
--機器序號2(調整SN_1)
update DBS_MAJ.RPM_SERIALNO set SERIALNO='FA2BMMJ00978', STATUS_CODE='O' where 1=1 and TYPE='SN' and LINENO='1' and companycode='20' and mtno='MT4F414645';
--機器序號2(刪除.清空SN_1)
delete DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SN' and LINENO='1' and companycode='20' and mtno='MT4F414645';
--機器序號2(新增SN_1)
insert into DBS_MAJ.rpm_serialno (COMPANYCODE, MTNO, ITEMNO, SERIALNO, TYPE, LINENO, STATUS_CODE, CREATE_DATE, CREATE_EMP_NO, UPDATE_DATE, UPDATE_EMP_NO) values ('20', 'MT964M1259', 'Y0915', 'SCGLMC4B1700084', 'SN', 1, 'O', sysdate, 'SYS', sysdate, 'SYS');
--機器序號2(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SERIAL_NO_2='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';
--機器序號2(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SERIAL_NO_2='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';

換出序號1
--換出序號(查詢SO_1)
select SERIALNO from DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='1' and companycode='20' and mtno='MT4F414645';
--換出序號(調整SO_1)
update DBS_MAJ.RPM_SERIALNO set SERIALNO='A1000032CDC64B', STATUS_CODE='O',REMARK_INHERIT_FLAG='O' where 1=1 and TYPE='SO' and LINENO='1' and companycode='20' and mtno='MT4F414645';
--換出序號(刪除.清空SO_1)
delete DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='1' and companycode='20' and mtno='MT4F414645';
--換出序號(新增SO_1)
insert into DBS_MAJ.rpm_serialno (COMPANYCODE, MTNO, ITEMNO, SERIALNO, TYPE, LINENO, STATUS_CODE, REMARK_INHERIT_FLAG, CREATE_DATE, CREATE_EMP_NO, UPDATE_DATE, UPDATE_EMP_NO) values ('20', 'MT964M1259', 'Y0915', 'SCGLMC4B1700084', 'SO', 1, 'O', 'O', sysdate, 'SYS', sysdate, 'SYS');
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SWAP_OUT_SERIAL_NO='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SWAP_OUT_SERIAL_NO='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';
--如欲更改的換出序號已存在於 ivcplserialno 或 ivcplserialno_all ，需一起更改(非換貨類:MT#/換貨類:R-#)
UPDATE DBS_MAJ.ivcplserialno_all SET SERIALNO = 'CN52C4G09P',UPPERSERIALNO = 'CN52C4G09P' WHERE VOUCHERNO = 'MTAE546130' AND SERIALNO='CN52C4G03P';
UPDATE DBS_MAJ.ivcplserialno SET SERIALNO = 'CN52C4G09P',UPPERSERIALNO = 'CN52C4G09P' WHERE VOUCHERNO = 'MTAE546130' AND SERIALNO='CN52C4G03P';

換出序號2
--換出序號2(查詢SO_2)
select SERIALNO from DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='2' and companycode='20' and mtno='MT4F414645';
--換出序號2(調整SO_2)
update DBS_MAJ.RPM_SERIALNO set SERIALNO='FA2BMMJ00978', STATUS_CODE='O' where 1=1 and TYPE='SO' and LINENO='2' and companycode='20' and mtno='MT4F414645';
--換出序號2(刪除.清空SO_2)
delete DBS_MAJ.RPM_SERIALNO where 1=1 and TYPE='SO' and LINENO='2' and companycode='20' and mtno='MT4F414645';
--換出序號2(新增SO_2)
insert into DBS_MAJ.rpm_serialno (COMPANYCODE, MTNO, ITEMNO, SERIALNO, TYPE, LINENO, STATUS_CODE, CREATE_DATE, CREATE_EMP_NO, UPDATE_DATE, UPDATE_EMP_NO) values ('20', 'MT964M1259', 'Y0915', 'SCGLMC4B1700084', 'SO', 2, 'O', sysdate, 'SYS', sysdate, 'SYS');
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair set SWAP_OUT_SERIAL_NO_2='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339';
--換出序號(萬用報表調整或清空)
update DBS_MAJ.rpm_fact_repair_now set SWAP_OUT_SERIAL_NO_2='FA324PN05975' where 1=1 and company_code='20' and mt_no='MT7H450339'; 



