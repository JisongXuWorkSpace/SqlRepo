-- �w���٭짹��

-- 1.�VUSER�T�{CH�O�_�w�Ǧw�R 
    �ٽШ�U�T�{ ��6���渹 90142706�B90141874�B90139859�B90165191�B90144331�B90141957�A
    �O�_�|���ǵ��w�R�A���¡C
    
    MT66961593 MT66961169 MT66961161 MT66960238
    
SELECT MT.CHARGENO,mt.SO_TRANSMIT_FLAG,MT.EDI_FLAG,MT.* FROM RPMMT MT WHERE MT.MTNO in(
'MT96921980'
)
    
2. rpmmtcharge �ǿ���O�ݬ�'S'
select ch.SO_TRANSMIT_FLAG,ch.* from rpmmtcharge ch where COMPANYCODE='20' and voucherno in(
'CH7W901482'
);

3. rpmmt �ǿ���O�ݬ�'S'
select mt.SO_TRANSMIT_FLAG,mt.* from rpmmt mt where COMPANYCODE='20' and registerno in('90166322');

4. �ƥ���ơA�UDCM
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

5.���� �٭짹��
