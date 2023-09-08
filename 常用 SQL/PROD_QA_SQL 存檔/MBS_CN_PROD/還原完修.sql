-- 還原完修


-- 判斷是否產生  

條件1: 送返單號(RETURNNO) 為掛號單號
條件2: 發票號碼(CHARGENO) 為空 (還沒產生帳務)
條件3: 退款明細(PAYBACKDEATIL)沒產生 

select RETURNNO,A.CHARGENO,A.TOTALAMOUNT,REPAIRCODE,PROCESSCODE,COMPLETETIME,COMPLETENO,a.registerno from DBS_MAJ.RPMMT A where 1=1 and companycode='SH' and mtno ='MT3Q929839';
select * from rpmMT MMT where 1=1  and MMT.MTNO='MT3Q929839' AND MMT.COMPANYCODE='SH';
select * from rpmrg rg where 1=1 and rg.registerno='90029839' and rg.companycode='SH';

-- 多查 避免為退款類 產生JT單號
-- 補充 
產生MBS會產生PAYBACKDETAIL ， 排程會抓 RA_TRANSMIT_FLAG 為O 的傳入FIS ，FIS在產生JT單
故處理修復為本地退款或者總部退款時，會產生RAYBACKDETAIL 這時要先處理PAYBACKDEATIL
-- 
條件: 維修退款主檔編號(SLIPNO) 為空 
SELECT a.PAYBACKPRICE,A.RA_TRANSMIT_FLAG,A.slipno,A.*  FROM RPMPAYBACKDETAIL A WHERE MTNO='MT3Q929839' AND MTCOMPANYCODE='SH';

select * from rpmpaybackhead  where 1=1 and slipno='JT00900289';


select * from 


select sum(CT) AS 總筆數 from (
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

若有產生R+單據，則請他們自行處理

--回話:
您好，該筆單據 MT3Q929839 已產生R+單 R+3Q900410，MIS只能做還原完修部分，至於R+單的部份沒辦法做處理，若同意我們則幫你還原完修，謝謝。


-- UPDATE 

update DBS_MAJ.RPMMT set RETURNNO='',so_transmit_flag='',so_transflag_date=null,paybackamount=null,paybackcurrencycode='',finishtime=null,finishempno='',
processcode='3',repaircode='',CLOSETIME=null,RETURN_TIME=null,COMPLETETIME=null  where 1=1 and companycode='SH' and mtno ='MT3Q929839';


-- 退款類
DELETE DBS_MAJ.RPMPAYBACKDETAIL RBD WHERE RBD.MTNO='MT3Q929839' AND RBD.MTCOMPANYCODE='SH';
DELETE DBS_MAJ.RPMPAYBACKHEAD RBH WHERE RBH.SLIPNO='JT00900289' AND RBH.COMPANYCODE='SH';

																				

