-- 安儷還原完修

-- 1.向USER確認CH是否已傳安麗 
    還請協助確認 此6筆單號 90142706、90141874、90139859、90165191、90144331、90141957，
    是否尚未傳給安麗，謝謝。
    
    MT66961593 MT66961169 MT66961161 MT66960238
    
SELECT MT.CHARGENO,mt.SO_TRANSMIT_FLAG,MT.EDI_FLAG,MT.* FROM RPMMT MT WHERE MT.MTNO in(
'MT96921980'
)
    
2. rpmmtcharge 傳輸註記需為'S'
select ch.SO_TRANSMIT_FLAG,ch.* from rpmmtcharge ch where COMPANYCODE='20' and voucherno in(
'CH7W901482'
);

3. rpmmt 傳輸註記需為'S'
select mt.SO_TRANSMIT_FLAG,mt.* from rpmmt mt where COMPANYCODE='20' and registerno in('90166322');

4. 備份資料，下DCM
select mt.CHARGENO,mt.BELONGEMPNO,mt.* from rpmmt mt where COMPANYCODE='20' and MTNO in(
'MT96921980'
);
select * from rpmmtcharge ch where COMPANYCODE='20' and voucherno in(
'CH7W901482'
);
select * from rpm_charge_detail chd where COMPANYCODE='20' and voucherno in(
'CH7W901482'
);

update DBS_MAJ.rpmmt set CHARGENO=null, BELONGEMPNO=null where COMPANYCODE='20' and MTNO in(
'MT96921980'
);
delete DBS_MAJ.rpmmtcharge where COMPANYCODE='20' and voucherno in(
'CH7W901482'
);
delete DBS_MAJ.rpm_charge_detail where COMPANYCODE='20' and voucherno in(
'CH7W901482'
);

5.執行 還原完修
