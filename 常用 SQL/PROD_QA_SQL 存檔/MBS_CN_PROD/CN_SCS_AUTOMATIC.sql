SELECT * FROM RPMMT WHERE COMPANYCODE='SH'AND  MTNO='MT3Q940783' 

SELECT * FROM SYS_AUTOMATIC_CHECK WHERE 1=1 AND CHECK_NAME='管理庫R-R+單10分鐘未出庫'

select msno, mscompanycode,so_transmit_flag,so_transflag_date from rpmmshead where so_transmit_flag='O' and so_transflag_date > sysdate - 1 / 144
union 
select msno, mscompanycode,si_transmit_flag,si_transflag_date from rpmmshead where si_transmit_flag='O' and si_transflag_date > sysdate - 1 / 144


SELECT * FROM RPM_RT WHERE 1=1 AND ORI_SLIP_NO='GGS1920981'

SELECT * FROM SYSVOUCHERNO

SELECT * FROM SYSVOUCHERID
SELECT * FROM TBS_MAJ.FIX_DEF_EMP

SELECT * FROM SOMSOHEAD WHERE 1=1AND SONO='GGS1920981'

SELECT * FROM MST_TABLE_MAPPING WHERE TABLE_NAME='TPNO' AND TABLE_FIELD='NEW_PROCESS'


---- app

