-- �٭짹��


-- �P�_�O�_����  

����1: �e��渹(RETURNNO) �������渹
����2: �o�����X(CHARGENO) ���� (�٨S���ͱb��)
����3: �h�ک���(PAYBACKDEATIL)�S���� 

select RETURNNO,A.CHARGENO,A.TOTALAMOUNT,REPAIRCODE,PROCESSCODE,COMPLETETIME,COMPLETENO,a.registerno from DBS_MAJ.RPMMT A where 1=1 and companycode='SH' and mtno ='MT3Q929839';
select * from rpmMT MMT where 1=1  and MMT.MTNO='MT3Q929839' AND MMT.COMPANYCODE='SH';
select * from rpmrg rg where 1=1 and rg.registerno='90029839' and rg.companycode='SH';

-- �h�d �קK���h���� ����JT�渹
-- �ɥR 
����MBS�|����PAYBACKDETAIL �A �Ƶ{�|�� RA_TRANSMIT_FLAG ��O ���ǤJFIS �AFIS�b����JT��
�G�B�z�״_�����a�h�کΪ��`���h�ڮɡA�|����RAYBACKDETAIL �o�ɭn���B�zPAYBACKDEATIL
-- 
����: ���װh�ڥD�ɽs��(SLIPNO) ���� 
SELECT a.PAYBACKPRICE,A.RA_TRANSMIT_FLAG,A.slipno,A.*  FROM RPMPAYBACKDETAIL A WHERE MTNO='MT3Q929839' AND MTCOMPANYCODE='SH';

select * from rpmpaybackhead  where 1=1 and slipno='JT00900289';


select * from 


select sum(CT) AS �`���� from (
  select count(*) AS CT,'RES_M' from DBS_MAJ.EAI_RESERVE_MASTER where slip_no ='90029839' and COMPANY_CODE='SH'
  union
  select count(*) AS CT,'RES_D' from DBS_MAJ.EAI_RESERVE_DETAIL where slip_no ='90029839' and COMPANY_CODE='SH'
  union
  select count(*) AS CT,'QUE_M' from DBS_MAJ.EAI_UNRTRV_QUEUE_MASTER where slip_no ='90029839' and COMPANY_CODE='SH'
  union
  select count(*) AS CT,'QUE_D' from DBS_MAJ.EAI_UNRTRV_QUEUE_DETAIL where slip_no ='90029839' and COMPANY_CODE='SH'
union
  select count(*) AS CT,'QUE_R' from DBS_MAJ.EAI_UNRTRV_QUEUE_REMARK where slip_no ='90029839' and COMPANY_CODE='SH'
  UNION 
  select count(*) AS CT,'QUE_ER' from DBS_MAJ.EAI_UNRTRV_QUEUE_EXTEND_REMARK where slip_no ='90029839' and COMPANY_CODE='SH'
);

�Y������R+��ڡA�h�ХL�̦ۦ�B�z

--�^��:
�z�n�A�ӵ���� MT3Q929839 �w����R+�� R+3Q900410�AMIS�u�వ�٭짹�׳����A�ܩ�R+�檺�����S��k���B�z�A�Y�P�N�ڭ̫h���A�٭짹�סA���¡C


-- UPDATE 

update DBS_MAJ.RPMMT set RETURNNO='',so_transmit_flag='',so_transflag_date=null,paybackamount=null,paybackcurrencycode='',finishtime=null,finishempno='',
processcode='3',repaircode='',CLOSETIME=null,RETURN_TIME=null,COMPLETETIME=null  where 1=1 and companycode='SH' and mtno ='MT3Q929839';


-- �h����
DELETE DBS_MAJ.RPMPAYBACKDETAIL RBD WHERE RBD.MTNO='MT3Q929839' AND RBD.MTCOMPANYCODE='SH';
DELETE DBS_MAJ.RPMPAYBACKHEAD RBH WHERE RBH.SLIPNO='JT00900289' AND RBH.COMPANYCODE='SH';

																				

